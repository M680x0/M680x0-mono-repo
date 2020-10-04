//===-- M680x0AsmPrinter.cpp - M680x0 LLVM Assembly Printer -----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains a printer that converts from our internal representation
/// of machine-dependent LLVM code to GAS-format M680x0 assembly language.
///
//===----------------------------------------------------------------------===//

// TODO #33 make it print Motorola asm

#include "M680x0AsmPrinter.h"

#include "M680x0.h"
#include "M680x0InstrInfo.h"
#include "M680x0MachineFunction.h"

#include "MCTargetDesc/M680x0BaseInfo.h"
#include "MCTargetDesc/M680x0InstPrinter.h"

#include "llvm/ADT/STLExtras.h"
#include "llvm/ADT/SmallString.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/Twine.h"
#include "llvm/CodeGen/MachineConstantPool.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineInstr.h"
#include "llvm/CodeGen/MachineMemOperand.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Mangler.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCInst.h"
#include "llvm/MC/MCInstBuilder.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCSymbol.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Target/TargetLoweringObjectFile.h"
#include "llvm/Target/TargetOptions.h"
#include <memory>

using namespace llvm;

#define DEBUG_TYPE "m680x0-asm-printer"

bool M680x0AsmPrinter::runOnMachineFunction(MachineFunction &MF) {
  MMFI = MF.getInfo<M680x0MachineFunctionInfo>();
  MCInstLowering = std::make_unique<M680x0MCInstLower>(MF, *this);
  AsmPrinter::runOnMachineFunction(MF);
  return true;
}

void M680x0AsmPrinter::emitInstruction(const MachineInstr *MI) {
  switch (MI->getOpcode()) {
  default: {
    if (MI->isPseudo()) {
      LLVM_DEBUG(dbgs() << "Pseudo opcode(" << MI->getOpcode()
                        << ") found in EmitInstruction()\n");
      llvm_unreachable("Cannot proceed");
    }
    break;
  }
  case M680x0::TAILJMPj:
  case M680x0::TAILJMPq:
    // Lower these as normal, but add some comments.
    OutStreamer->AddComment("TAILCALL");
    break;
  }

  MCInst TmpInst0;
  MCInstLowering->Lower(MI, TmpInst0);
  OutStreamer->emitInstruction(TmpInst0, getSubtargetInfo());
}

void M680x0AsmPrinter::emitFunctionBodyStart() {
  // TODO #33
}

void M680x0AsmPrinter::emitFunctionBodyEnd() {
  // TODO #33
}

void M680x0AsmPrinter::emitStartOfAsmFile(Module &M) {
  OutStreamer->emitSyntaxDirective();
}

void M680x0AsmPrinter::emitEndOfAsmFile(Module &M) {}

extern "C" void LLVMInitializeM680x0AsmPrinter() {
  RegisterAsmPrinter<M680x0AsmPrinter> X(TheM680x0Target);
}
