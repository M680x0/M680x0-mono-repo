//===--- M680x0.cpp - Implement M680x0 targets feature support-------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file implements M680x0 TargetInfo objects.
//
//===----------------------------------------------------------------------===//

#include "M680x0.h"
#include "clang/Basic/Builtins.h"
#include "clang/Basic/Diagnostic.h"
#include "clang/Basic/TargetBuiltins.h"
#include "llvm/ADT/StringExtras.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/ADT/StringSwitch.h"
#include "llvm/Support/TargetParser.h"
#include <cstring>

namespace clang {
namespace targets {

M680x0TargetInfo::M680x0TargetInfo(const llvm::Triple &Triple,
                                   const TargetOptions &)
    : TargetInfo(Triple) {

  std::string Layout = "";

  // M680x0 is Big Endian
  Layout += "E";

  // FIXME how to wire it with the used object format?
  Layout += "-m:e";

  // M680x0 pointers are always 32 bit wide even for 16 bit cpus
  Layout += "-p:32:32";

  // M680x0 integer data types
  Layout += "-i8:8:8-i16:16:16-i32:32:32";

  // FIXME no floats at the moment

  // The registers can hold 8, 16, 32 bits
  Layout += "-n8:16:32";

  // Aggregates are 32 bit aligned and stack is 16 bit aligned
  Layout += "-a:0:32-S16";

  resetDataLayout(Layout);

  SizeType = UnsignedInt;
  PtrDiffType = SignedInt;
  IntPtrType = SignedInt;
}

bool M680x0TargetInfo::setCPU(const std::string &Name) {
  StringRef N = Name;
  CPU = llvm::StringSwitch<CPUKind>(N.lower())
            .Case("generic", CK_68000)
            .Case("68000", CK_68000)
            .Case("68010", CK_68010)
            .Case("68020", CK_68020)
            .Case("68030", CK_68030)
            .Case("68040", CK_68040)
            .Case("68060", CK_68060)
            .Default(CK_Unknown);
  return CPU != CK_Unknown;
}

void M680x0TargetInfo::getTargetDefines(const LangOptions &Opts,
                                        MacroBuilder &Builder) const {
  using llvm::Twine;

  Builder.defineMacro("M680x0");
  Builder.defineMacro("__M680x0__");
  Builder.defineMacro("__M68K__");
  Builder.defineMacro("__m68k__");

  Builder.defineMacro("mc68000");
  Builder.defineMacro("__mc68000");
  Builder.defineMacro("__mc68000__");

  // For sub-architecture
  const char *RawDef = "";
  switch (CPU) {
  case CK_68010:
    RawDef = "mc68010";
    break;
  case CK_68020:
    RawDef = "mc68020";
    break;
  case CK_68030:
    RawDef = "mc68030";
    break;
  case CK_68040:
    RawDef = "mc68040";
    break;
  case CK_68060:
    RawDef = "mc68060";
    break;
  default:
    RawDef = "";
  }
  if (::strlen(RawDef) > 0) {
    Builder.defineMacro(RawDef);
    Twine Def = Twine("__") + RawDef;
    Builder.defineMacro(Def);
    Builder.defineMacro(Def + "__");
  }
}

ArrayRef<Builtin::Info> M680x0TargetInfo::getTargetBuiltins() const {
  // FIXME: Implement.
  return None;
}

bool M680x0TargetInfo::hasFeature(StringRef Feature) const {
  // FIXME elaborate moar
  return Feature == "M68000";
}

const char *const M680x0TargetInfo::GCCRegNames[] = {
    "d0", "d1", "d2", "d3", "d4", "d5", "d6", "d7",
    "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7"};

ArrayRef<const char *> M680x0TargetInfo::getGCCRegNames() const {
  return llvm::makeArrayRef(GCCRegNames);
}

ArrayRef<TargetInfo::GCCRegAlias> M680x0TargetInfo::getGCCRegAliases() const {
  // No aliases.
  return None;
}

bool M680x0TargetInfo::validateAsmConstraint(
    const char *&Name, TargetInfo::ConstraintInfo &info) const {
  // FIXME: implement
  switch (*Name) {
  case 'K': // the constant 1
  case 'L': // constant -1^20 .. 1^19
  case 'M': // constant 1-4:
    return true;
  }
  // No targets constraints for now.
  return false;
}

const char *M680x0TargetInfo::getClobbers() const {
  // FIXME: Is this really right?
  return "";
}

M680x0TargetInfo::BuiltinVaListKind
M680x0TargetInfo::getBuiltinVaListKind() const {
  // FIXME: implement
  return TargetInfo::CharPtrBuiltinVaList;
}

} // namespace targets
} // namespace clang
