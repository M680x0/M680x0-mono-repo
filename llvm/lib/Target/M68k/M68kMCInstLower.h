//===-- M68kMCInstLower.h - Lower MachineInstr to MCInst -----*- C++ -*--===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains code to lower M68k MachineInstrs to their
/// corresponding MCInst records.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_M680X0_M680X0MCINSTLOWER_H
#define LLVM_LIB_TARGET_M680X0_M680X0MCINSTLOWER_H

#include "llvm/ADT/SmallVector.h"
#include "llvm/CodeGen/MachineOperand.h"
#include "llvm/MC/MCAsmInfo.h"
#include "llvm/Support/Compiler.h"

namespace llvm {
class MCContext;
class MCInst;
class MCOperand;
class MachineInstr;
class MachineFunction;
class M68kAsmPrinter;

/// This class is used to lower an MachineInstr into an MCInst.
class M68kMCInstLower {
  typedef MachineOperand::MachineOperandType MachineOperandType;
  MCContext &Ctx;
  MachineFunction &MF;
  const TargetMachine &TM;
  const MCAsmInfo &MAI;
  M68kAsmPrinter &AsmPrinter;

public:
  M68kMCInstLower(MachineFunction &MF, M68kAsmPrinter &AP);

  /// Lower an MO_GlobalAddress or MO_ExternalSymbol operand to an MCSymbol.
  MCSymbol *GetSymbolFromOperand(const MachineOperand &MO) const;

  MCOperand LowerSymbolOperand(const MachineOperand &MO, MCSymbol *Sym) const;

  Optional<MCOperand> LowerOperand(const MachineInstr *MI,
                                   const MachineOperand &MO) const;

  void Lower(const MachineInstr *MI, MCInst &OutMI) const;
};
} // namespace llvm

#endif
