//===-- M680x0ELFTargetObjectFile.h - M680x0 Object Info ---------*- C++ -====//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains declarations for M680x0 ELF object file lowering.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_M680X0_M680X0TARGETOBJECTFILE_H
#define LLVM_LIB_TARGET_M680X0_M680X0TARGETOBJECTFILE_H

#include "M680x0TargetMachine.h"

#include "llvm/CodeGen/TargetLoweringObjectFileImpl.h"

namespace llvm {
class M680x0TargetMachine;
class M680x0ELFTargetObjectFile : public TargetLoweringObjectFileELF {
  const M680x0TargetMachine *TM;
  MCSection *SmallDataSection;
  MCSection *SmallBSSSection;

public:
  void Initialize(MCContext &Ctx, const TargetMachine &TM) override;
};
} // end namespace llvm

#endif
