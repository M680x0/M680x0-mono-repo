//===---------- CodeBeadsGen.cpp - Code Beads Generator -------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
// CodeBeads are annotations that can be used to represent non-trivial
// instruction variants. More specifically, complex addressing modes appear in
// many CISC architectures. Without the help of CodeBeads to embed addressing
// modes information into Instructions' TG definitions, MC layer might have a
// hard time finding the right binary encoding for an instruction.
//===----------------------------------------------------------------------===//

#include "CodeGenTarget.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/Support/Debug.h"
#include "llvm/TableGen/Error.h"
#include "llvm/TableGen/Record.h"
#include "llvm/TableGen/TableGenBackend.h"
#include <map>
#include <string>
#include <vector>
using namespace llvm;

namespace {

class CodeBeadsGen {
  RecordKeeper &Records;

public:
  CodeBeadsGen(RecordKeeper &R) : Records(R) {}
  void run(raw_ostream &o);
};

void CodeBeadsGen::run(raw_ostream &o) {
  CodeGenTarget Target(Records);
  std::vector<Record *> Insts = Records.getAllDerivedDefinitions("Instruction");

  // For little-endian instruction bit encodings, reverse the bit order
  Target.reverseBitsForLittleEndianEncoding();

  ArrayRef<const CodeGenInstruction *> NumberedInstructions =
      Target.getInstructionsByEnumValue();

  // Emit function declaration
  o << "const uint8_t * llvm::" << Target.getInstNamespace();
  o << "::getMCInstrBeads(unsigned Opcode) {\n";

  unsigned Length = 192;
  unsigned Size = 8;
  unsigned Parts = Length / Size;

  // Emit instruction base values
  // TODO Make it auto-detect size
  o << "  static const uint" << Size << "_t InstBits[][" << Parts << "] = {\n";
  for (const CodeGenInstruction *CGI : NumberedInstructions) {
    Record *R = CGI->TheDef;

    if (R->getValueAsString("Namespace") == "TargetOpcode" ||
        R->getValueAsBit("isPseudo")) {
      o << "\t{ 0x0 },";
      o << '\t' << "// (Pseudo) " << R->getName() << "\n";
      continue;
    }

    BitsInit *BI = R->getValueAsBitsInit("Beads");

    if (!BI->isComplete()) {
      PrintFatalError(R->getLoc(), "Record `" + R->getName() +
                                       "', bit field 'Beads' is not complete");
    }

    if (BI->getNumBits() > Length) {
      PrintFatalError(R->getLoc(),
                      "Record `" + R->getName() +
                          "', bit field 'Beads' is too long(maximum: " +
                          std::to_string(Length) + ")");
    }

    /// Convert to byte array:
    /// [dcba] -> [a][b][c][d]
    o << "\t{";
    for (unsigned p = 0; p < Parts; ++p) {
      unsigned Right = Size * p;
      unsigned Left = Right + Size;

      uint64_t Value = 0;
      for (unsigned i = Right; i != Left; ++i) {
        unsigned Shift = i % Size;
        if (auto *B = dyn_cast<BitInit>(BI->getBit(i))) {
          Value |= (uint64_t)B->getValue() << (Shift);
        } else {
          PrintFatalError(R->getLoc(), "Record `" + R->getName() +
                                           "', bit 'Beads[" + Twine(i) +
                                           "]' is not defined");
        }
      }

      if (p)
        o << ',';
      o << " 0x";
      o.write_hex(Value);
      o << "";
    }
    o << " }," << '\t' << "// " << R->getName() << "\n";
  }
  o << "\t{ 0x0 }\n  };\n";

  // Emit initial function code
  o << "  return (const uint8_t *)InstBits[Opcode];\n"
    << "}\n\n";
}

} // End anonymous namespace

namespace llvm {

void EmitCodeBeads(RecordKeeper &RK, raw_ostream &OS) {
  emitSourceFileHeader("Machine Code Beads", OS);
  CodeBeadsGen(RK).run(OS);
}

} // namespace llvm
