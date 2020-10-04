//===--- M680x0.cpp - M680x0 Helpers for Tools -------------------*- C++-*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "M680x0.h"
#include "ToolChains/CommonArgs.h"
#include "clang/Driver/Driver.h"
#include "clang/Driver/DriverDiagnostic.h"
#include "clang/Driver/Options.h"
#include "llvm/ADT/StringSwitch.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/Option/ArgList.h"
#include "llvm/Support/Host.h"
#include "llvm/Support/Regex.h"
#include <sstream>

using namespace clang::driver;
using namespace clang::driver::tools;
using namespace clang;
using namespace llvm::opt;

/// getM680x0TargetCPU - Get the (LLVM) name of the 68000 cpu we are targeting.
std::string m680x0::getM680x0TargetCPU(const ArgList &Args) {
  if (Arg *A = Args.getLastArg(clang::driver::options::OPT_mcpu_EQ)) {
    // The canonical CPU name is captalize. However, we allow
    // starting with lower case or numbers only
    StringRef CPUName = A->getValue();

    if (CPUName == "native") {
      std::string CPU = std::string(llvm::sys::getHostCPUName());
      if (!CPU.empty() && CPU != "generic")
        return CPU;
      else
        return "";
    }

    if (CPUName == "common") return "generic";

    llvm::Regex CPUPattern("m?680([01234]{1})0");
    llvm::SmallVector<StringRef, 2> Matches;
    if (CPUPattern.match(CPUName, &Matches) && Matches.size() == 2U) {
      std::stringstream SS;
      SS << "M680" << Matches[1].str() << "0";
      return SS.str();
    }
    return CPUName.str();
  }
  // FIXME: Throw error when multiple sub-architecture flag exist
  else if (Args.hasArg(clang::driver::options::OPT_m68000)) {
    return "M68000";
  } else if (Args.hasArg(clang::driver::options::OPT_m68010)) {
    return "M68010";
  } else if (Args.hasArg(clang::driver::options::OPT_m68020)) {
    return "M68020";
  } else if (Args.hasArg(clang::driver::options::OPT_m68030)) {
    return "M68030";
  } else if (Args.hasArg(clang::driver::options::OPT_m68040)) {
    return "M68040";
  }

  return "";
}

void m680x0::getM680x0TargetFeatures(const Driver &D,
                                     const llvm::Triple &Triple,
                                     const ArgList &Args,
                                     std::vector<StringRef> &Features) {

  m680x0::FloatABI FloatABI = m680x0::getM680x0FloatABI(D, Args);
  if (FloatABI == m680x0::FloatABI::Soft)
    Features.push_back("-hard-float");
}

m680x0::FloatABI m680x0::getM680x0FloatABI(const Driver &D,
                                           const ArgList &Args) {
  m680x0::FloatABI ABI = m680x0::FloatABI::Invalid;
  if (Arg *A =
          Args.getLastArg(options::OPT_msoft_float, options::OPT_mhard_float)) {

    if (A->getOption().matches(options::OPT_msoft_float))
      ABI = m680x0::FloatABI::Soft;
    else if (A->getOption().matches(options::OPT_mhard_float))
      ABI = m680x0::FloatABI::Hard;
  }

  // If unspecified, choose the default based on the platform.
  if (ABI == m680x0::FloatABI::Invalid) {
    ABI = m680x0::FloatABI::Hard;
  }

  return ABI;
}
