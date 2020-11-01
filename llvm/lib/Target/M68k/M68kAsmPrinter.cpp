//===----- M68kAsmPrinter.cpp - M68k LLVM Assembly Printer -----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains a printer that converts from our internal representation
/// of machine-dependent LLVM code to GAS-format M68k assembly language.
///
//===----------------------------------------------------------------------===//

// TODO #33 make it print Motorola asm

#include "M68kAsmPrinter.h"

#include "M68k.h"
#include "M68kInstrInfo.h"
#include "M68kMachineFunction.h"

#include "MCTargetDesc/M68kBaseInfo.h"
#include "MCTargetDesc/M68kInstPrinter.h"

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

#define DEBUG_TYPE "m68k-asm-printer"

bool M68kAsmPrinter::runOnMachineFunction(MachineFunction &MF) {
  MMFI = MF.getInfo<M68kMachineFunctionInfo>();
  MCInstLowering = std::make_unique<M68kMCInstLower>(MF, *this);
  AsmPrinter::runOnMachineFunction(MF);
  return true;
}

void M68kAsmPrinter::emitInstruction(const MachineInstr *MI) {
  switch (MI->getOpcode()) {
  default: {
    if (MI->isPseudo()) {
      LLVM_DEBUG(dbgs() << "Pseudo opcode(" << MI->getOpcode()
                        << ") found in EmitInstruction()\n");
      llvm_unreachable("Cannot proceed");
    }
    break;
  }
  case M68k::TAILJMPj:
  case M68k::TAILJMPq:
    // Lower these as normal, but add some comments.
    OutStreamer->AddComment("TAILCALL");
    break;
  }

  MCInst TmpInst0;
  MCInstLowering->Lower(MI, TmpInst0);
  OutStreamer->emitInstruction(TmpInst0, getSubtargetInfo());
}

void M68kAsmPrinter::emitFunctionBodyStart() {
  // TODO #33
}

void M68kAsmPrinter::emitFunctionBodyEnd() {
  // TODO #33
}

void M68kAsmPrinter::emitStartOfAsmFile(Module &M) {
  OutStreamer->emitSyntaxDirective();
}

void M68kAsmPrinter::emitEndOfAsmFile(Module &M) {}

extern "C" void LLVMInitializeM68kAsmPrinter() {
  RegisterAsmPrinter<M68kAsmPrinter> X(TheM68kTarget);
}
