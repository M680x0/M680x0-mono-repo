//===-- M680x0FixupKinds.h - M680x0 Specific Fixup Entries ------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains M680x0 specific fixup entries.
///
//===----------------------------------------------------------------------===//

#ifndef LLVM_LIB_TARGET_M680x0_MCTARGETDESC_M680x0FIXUPKINDS_H
#define LLVM_LIB_TARGET_M680x0_MCTARGETDESC_M680x0FIXUPKINDS_H

#include "llvm/MC/MCFixup.h"

namespace llvm {
namespace M680x0 {
enum Fixups {
  // Marker
  LastTargetFixupKind,
  NumTargetFixupKinds = LastTargetFixupKind - FirstTargetFixupKind
};
}

static inline unsigned getFixupKindLog2Size(unsigned Kind) {
  switch (Kind) {
  default:
    llvm_unreachable("invalid fixup kind!");
  case FK_PCRel_1:
  case FK_SecRel_1:
  case FK_Data_1:
    return 0;
  case FK_PCRel_2:
  case FK_SecRel_2:
  case FK_Data_2:
    return 1;
  case FK_PCRel_4:
  case FK_SecRel_4:
  case FK_Data_4:
    return 2;
  }
}

static inline MCFixupKind getFixupForSize(unsigned Size, bool isPCRel) {
  switch (Size) {
  default:
    llvm_unreachable("Invalid generic fixup size!");
  case 8:
    return isPCRel ? FK_PCRel_1 : FK_Data_1;
  case 16:
    return isPCRel ? FK_PCRel_2 : FK_Data_2;
  case 32:
    return isPCRel ? FK_PCRel_4 : FK_Data_4;
  case 64:
    return isPCRel ? FK_PCRel_8 : FK_Data_8;
  }
}

} // namespace llvm

#endif
