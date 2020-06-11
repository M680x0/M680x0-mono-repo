//===--- M680x0.h - Declare M680x0 target feature support -------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This file declares M680x0 TargetInfo objects.
//
//===----------------------------------------------------------------------===//

#ifndef M680X0_H_LTNCIPAD
#define M680X0_H_LTNCIPAD

#include "OSTargets.h"
#include "clang/Basic/TargetInfo.h"
#include "clang/Basic/TargetOptions.h"
#include "llvm/ADT/Triple.h"
#include "llvm/Support/Compiler.h"

namespace clang {
namespace targets {

class LLVM_LIBRARY_VISIBILITY M680x0TargetInfo : public TargetInfo {
  static const char *const GCCRegNames[];

public:
  M680x0TargetInfo(const llvm::Triple &Triple, const TargetOptions &);

  void getTargetDefines(const LangOptions &Opts,
                        MacroBuilder &Builder) const override;
  ArrayRef<Builtin::Info> getTargetBuiltins() const override;
  bool hasFeature(StringRef Feature) const override;
  ArrayRef<const char *> getGCCRegNames() const override;
  ArrayRef<TargetInfo::GCCRegAlias> getGCCRegAliases() const override;
  bool validateAsmConstraint(const char *&Name,
                             TargetInfo::ConstraintInfo &info) const override;
  const char *getClobbers() const override;
  BuiltinVaListKind getBuiltinVaListKind() const override;
};

} // namespace targets
} // namespace clang

#endif /* end of include guard: M680X0_H_LTNCIPAD */
