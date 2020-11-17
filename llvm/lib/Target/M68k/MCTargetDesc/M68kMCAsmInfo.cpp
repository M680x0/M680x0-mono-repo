//===-- M68kMCAsmInfo.cpp - M68k Asm Properties -------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This file contains the definitions of the M68k MCAsmInfo properties.
///
//===----------------------------------------------------------------------===//

#include "M68kMCAsmInfo.h"

#include "llvm/ADT/Triple.h"

using namespace llvm;

void M68kELFMCAsmInfo::anchor() {}

// TODO get back to it when it comes to printing
M68kELFMCAsmInfo::M68kELFMCAsmInfo(const Triple &T) {
  CodePointerSize = 4;
  CalleeSaveStackSlotSize = 4;

  IsLittleEndian = false;

  // 0b0100_1110_0111_0001
  TextAlignFillValue = 0x4e71;

  // Debug Information
  SupportsDebugInformation = true;

  // Exceptions handling
  ExceptionsType = ExceptionHandling::DwarfCFI;

  // Always enable the integrated assembler by default.
  // Clang also enabled it when the OS is Solaris but that is redundant here.
  UseIntegratedAssembler = true;

  CommentString = ";";
}
