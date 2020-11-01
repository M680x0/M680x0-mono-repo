//===-- M68kInstPrinter.cpp - Convert M68k MCInst to asm ----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains definitions for an M68k MCInst printer.
///
//===----------------------------------------------------------------------===//

// TODO #33 finish printer, it does not conform to Motorola asm at all

#include "M68kInstPrinter.h"
#include "M68kBaseInfo.h"

#include "llvm/ADT/StringExtras.h"
#include "llvm/MC/MCExpr.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstrInfo.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/ErrorHandling.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define DEBUG_TYPE "asm-printer"

#define PRINT_ALIAS_INSTR
#include "M68kGenAsmWriter.inc"

void M68kInstPrinter::printRegName(raw_ostream &OS, unsigned RegNo) const {
  OS << "%" << getRegisterName(RegNo);
}

void M68kInstPrinter::printInst(const MCInst *MI, uint64_t Address,
                                  StringRef Annot, const MCSubtargetInfo &STI,
                                  raw_ostream &O) {
  if (!printAliasInstr(MI, Address, O)) {
    printInstruction(MI, Address, O);
  }
  printAnnotation(O, Annot);
}

void M68kInstPrinter::printOperand(const MCInst *MI, unsigned OpNo,
                                     raw_ostream &O) {
  const MCOperand &MO = MI->getOperand(OpNo);
  if (MO.isReg()) {
    printRegName(O, MO.getReg());
    return;
  }

  if (MO.isImm()) {
    printImmediate(MI, OpNo, O);
    return;
  }

  assert(MO.isExpr() && "Unknown operand kind in printOperand");
  MO.getExpr()->print(O, &MAI);
}

void M68kInstPrinter::printImmediate(const MCInst *MI, int opNum,
                                       raw_ostream &O) {
  const MCOperand &MO = MI->getOperand(opNum);
  if (MO.isImm()) {
    O << '#' << MO.getImm();
  } else if (MO.isExpr()) {
    O << '#';
    MO.getExpr()->print(O, &MAI);
  } else {
    llvm_unreachable("Unknown immediate kind");
  }
}

//
void M68kInstPrinter::printMoveMask(const MCInst *MI, int opNum,
                                      raw_ostream &O) {
  unsigned Mask = MI->getOperand(opNum).getImm();
  assert((Mask & 0xFFFF) == Mask);

  unsigned HalfMask, Reg;
  for (int s = 0; s < 8; s += 8) {
    HalfMask = Mask >> s;
    if (HalfMask && s != 0) {
      O << ',';
    }

    for (int i = 0; HalfMask; ++i) {
      if ((HalfMask >> i) & 0x01) {
        HalfMask ^= 1 << i;
        Reg = M68kII::getMaskedSpillRegister(i + s);
        printRegName(O, Reg);

        int j = i;
        while ((HalfMask >> (j + 1)) & 0x01) {
          HalfMask ^= 1 << ++j;
        }

        if (j != i) {
          O << '-';
          Reg = M68kII::getMaskedSpillRegister(j + s);
          printRegName(O, Reg);
        }

        i = j;

        if (HalfMask) {
          O << ',';
        }
      } else {
      }
    }
  }
}

void M68kInstPrinter::printDisp(const MCInst *MI, int opNum, raw_ostream &O) {
  const MCOperand &Op = MI->getOperand(opNum);
  if (Op.isImm()) {
    O << Op.getImm();
    return;
  }
  assert(Op.isExpr() && "Unknown operand kind in printOperand");
  Op.getExpr()->print(O, &MAI);
}

void M68kInstPrinter::printARIMem(const MCInst *MI, int opNum,
                                    raw_ostream &O) {
  O << '(';
  printOperand(MI, opNum, O);
  O << ')';
}

void M68kInstPrinter::printARIPIMem(const MCInst *MI, int opNum,
                                      raw_ostream &O) {
  O << "(";
  printOperand(MI, opNum, O);
  O << ")+";
}

void M68kInstPrinter::printARIPDMem(const MCInst *MI, int opNum,
                                      raw_ostream &O) {
  O << "-(";
  printOperand(MI, opNum, O);
  O << ")";
}

void M68kInstPrinter::printARIDMem(const MCInst *MI, int opNum,
                                     raw_ostream &O) {
  O << '(';
  printDisp(MI, opNum + M68k::MemDisp, O);
  O << ',';
  printOperand(MI, opNum + M68k::MemBase, O);
  O << ')';
}

void M68kInstPrinter::printARIIMem(const MCInst *MI, int opNum,
                                     raw_ostream &O) {
  O << '(';
  printDisp(MI, opNum + M68k::MemDisp, O);
  O << ',';
  printOperand(MI, opNum + M68k::MemBase, O);
  O << ',';
  printOperand(MI, opNum + M68k::MemIndex, O);
  O << ')';
}

// NOTE forcing (W,L) size available since M68020 only
void M68kInstPrinter::printAbsMem(const MCInst *MI, int opNum,
                                    raw_ostream &O) {
  const MCOperand &MO = MI->getOperand(opNum);
  if (MO.isImm()) {
    // ??? Print it in hex?
    O << (unsigned int)MO.getImm();
  } else {
    printOperand(MI, opNum, O);
  }
}

void M68kInstPrinter::printPCDMem(const MCInst *MI, uint64_t Address,
                                    int opNum, raw_ostream &O) {
  O << '(';
  printDisp(MI, opNum + M68k::PCRelDisp, O);
  O << ",%pc)";
}

void M68kInstPrinter::printPCIMem(const MCInst *MI, uint64_t Address,
                                    int opNum, raw_ostream &O) {
  O << '(';
  printDisp(MI, opNum + M68k::PCRelDisp, O);
  O << ",%pc,";
  printOperand(MI, opNum + M68k::PCRelIndex, O);
  O << ')';
}
