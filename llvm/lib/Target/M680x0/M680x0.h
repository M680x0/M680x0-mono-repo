
//===-- M680x0.h - Top-level interface for M680x0 representation ------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file contains the entry points for global functions defined in the x86
// target library, as used by the LLVM JIT.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_M680x0_M680x0_H
#define LLVM_LIB_TARGET_M680x0_M680x0_H

#include "llvm/Support/CodeGen.h"

namespace llvm {

class FunctionPass;
class M680x0TargetMachine;

/// Return a Machine IR pass that expands M680x0-specific pseudo
/// instructions into a sequence of actual instructions. This pass
/// must run after prologue/epilogue insertion and before lowering
/// the MachineInstr to MC.
FunctionPass * createM680x0ExpandPseudoPass();

} // End llvm namespace

#endif
