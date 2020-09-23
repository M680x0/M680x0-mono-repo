//===--- M680x0.cpp - M680x0 Helpers for Tools ------------------------*- C++ -*-===//
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
#include "llvm/Option/ArgList.h"
#include "llvm/Support/Host.h"

using namespace clang::driver;
using namespace clang::driver::tools;
using namespace clang;
using namespace llvm::opt;

/// getM680x0TargetCPU - Get the (LLVM) name of the 68000 cpu we are targeting.
std::string m680x0::getM680x0TargetCPU(const ArgList &Args) {
  if (Arg *A = Args.getLastArg(clang::driver::options::OPT_mcpu_EQ)) {
    StringRef CPUName = A->getValue();

    if (CPUName == "native") {
      std::string CPU = std::string(llvm::sys::getHostCPUName());
      if (!CPU.empty() && CPU != "generic")
        return CPU;
      else
        return "";
    }

    return llvm::StringSwitch<const char *>(CPUName)
        .Case("common", "generic")
        .Case("68000", "68000")
        .Case("68010", "68010")
        .Case("68020", "68020")
        .Case("68030", "68030")
        .Case("68040", "68040")
        .Case("68060", "68060")
        .Default("");
  }
  // FIXME: Throw error when multiple sub-architecture flag exist
  else if(Args.hasArg(clang::driver::options::OPT_m68000)) {
    return "68000";
  } else if(Args.hasArg(clang::driver::options::OPT_m68010)) {
    return "68010";
  } else if(Args.hasArg(clang::driver::options::OPT_m68020)) {
    return "68020";
  } else if(Args.hasArg(clang::driver::options::OPT_m68030)) {
    return "68030";
  } else if(Args.hasArg(clang::driver::options::OPT_m68040)) {
    return "68040";
  } else if(Args.hasArg(clang::driver::options::OPT_m68060)) {
    return "68060";
  }

  return "";
}

const char *m680x0::getM680x0AsmModeForCPU(StringRef Name) {
  return llvm::StringSwitch<const char *>(Name)
        .Case("68000", "-m68000")
        .Case("68010", "-m68010")
        .Case("68020", "-m68020")
        .Case("68030", "-m68030")
        .Case("68040", "-m68040")
        .Case("68060", "-m68060")
        .Default("-many");
}

void m680x0::getM680x0TargetFeatures(const Driver &D, const llvm::Triple &Triple,
                               const ArgList &Args,
                               std::vector<StringRef> &Features) {

  m680x0::FloatABI FloatABI = m680x0::getM680x0FloatABI(D, Args);
  if (FloatABI == m680x0::FloatABI::Soft)
    Features.push_back("-hard-float");

}

m680x0::FloatABI m680x0::getM680x0FloatABI(const Driver &D, const ArgList &Args) {
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
