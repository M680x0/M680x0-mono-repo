//===-- M680x0TargetInfo.cpp - M680x0 Target Implementation -----*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains M680x0 target initializer.
///
//===----------------------------------------------------------------------===//

#include "M680x0.h"

#include "MCTargetDesc/M680x0MCTargetDesc.h"

#include "llvm/Support/TargetRegistry.h"

using namespace llvm;

Target llvm::TheM680x0Target;

extern "C" void LLVMInitializeM680x0TargetInfo() {
  RegisterTarget<Triple::m680x0, /*HasJIT=*/true> X(
      TheM680x0Target, "m680x0", "Motorola 68000 family", "M680x0");
}
