//===-- M680x0MachineFunctionInfo.cpp - M680x0 private data ----*- C++ -*--===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "M680x0MachineFunction.h"

#include "M680x0InstrInfo.h"
#include "M680x0Subtarget.h"

#include "llvm/CodeGen/MachineInstrBuilder.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/IR/Function.h"

using namespace llvm;

void M680x0MachineFunctionInfo::anchor() {}
