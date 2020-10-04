//===--- M680x0.h - M680x0-specific Tool Helpers -----------------*- C++-*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_CLANG_LIB_DRIVER_TOOLCHAINS_ARCH_M680X0_H
#define LLVM_CLANG_LIB_DRIVER_TOOLCHAINS_ARCH_M680X0_H

#include "clang/Driver/Driver.h"
#include "llvm/ADT/StringRef.h"
#include "llvm/Option/Option.h"
#include <string>
#include <vector>

namespace clang {
namespace driver {
namespace tools {
namespace m680x0 {

enum class FloatABI {
  Invalid,
  Soft,
  Hard,
};

FloatABI getM680x0FloatABI(const Driver &D, const llvm::opt::ArgList &Args);

std::string getM680x0TargetCPU(const llvm::opt::ArgList &Args);

void getM680x0TargetFeatures(const Driver &D, const llvm::Triple &Triple,
                             const llvm::opt::ArgList &Args,
                             std::vector<llvm::StringRef> &Features);

} // end namespace m680x0
} // namespace tools
} // end namespace driver
} // end namespace clang

#endif // LLVM_CLANG_LIB_DRIVER_TOOLCHAINS_ARCH_M680X0_H
