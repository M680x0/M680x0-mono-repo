//===-- M680x0MCAsmInfo.h - M680x0 Asm Info --------------------*- C++ -*--===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the declarations of the M680x0 MCAsmInfo properties.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_M680X0_MCTARGETDESC_M680X0MCASMINFO_H
#define LLVM_LIB_TARGET_M680X0_MCTARGETDESC_M680X0MCASMINFO_H

#include "llvm/MC/MCAsmInfoELF.h"

namespace llvm {
class Triple;

class M680x0ELFMCAsmInfo : public MCAsmInfoELF {
  void anchor() override;

public:
  explicit M680x0ELFMCAsmInfo(const Triple &Triple);
};

} // namespace llvm

#endif
