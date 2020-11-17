//===-- M68k.td - Motorola 680x0 target definitions ------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
///
/// \file
/// This is a target description file for the Motorola 680x0 family, referred
/// to here as the "M68k" architecture.
///
//===----------------------------------------------------------------------===//

include "llvm/Target/Target.td"

//===----------------------------------------------------------------------===//
// M68k Subtarget features
//===----------------------------------------------------------------------===//

def FeatureISAx00
  : SubtargetFeature<"x00", "SubtargetKind", "M00", "Is M68000 ISA supported">;

def FeatureISAx10
  : SubtargetFeature<"x10", "SubtargetKind", "M10", "Is M68010 ISA supported",
    [ FeatureISAx00 ]>;

def FeatureISAx20
  : SubtargetFeature<"x20", "SubtargetKind", "M20", "Is M68020 ISA supported",
    [ FeatureISAx10 ]>;

def FeatureISAx30
  : SubtargetFeature<"x30", "SubtargetKind", "M30", "Is M68030 ISA supported",
    [ FeatureISAx20 ]>;

def FeatureISAx40
  : SubtargetFeature<"x40", "SubtargetKind", "M40", "Is M68040 ISA supported",
    [ FeatureISAx30 ]>;

//===----------------------------------------------------------------------===//
// M68k processors supported.
//===----------------------------------------------------------------------===//

include "M68kSchedule.td"

class Proc<string Name, list<SubtargetFeature> Features>
    : ProcessorModel<Name, GenericM68kModel, Features>;

def : Proc<"generic", [ FeatureISAx00 ]>;
def : Proc<"M68000",  [ FeatureISAx00 ]>;
def : Proc<"M68010",  [ FeatureISAx10 ]>;
def : Proc<"M68020",  [ FeatureISAx20 ]>;
def : Proc<"M68030",  [ FeatureISAx30 ]>;
def : Proc<"M68040",  [ FeatureISAx40 ]>;

//===----------------------------------------------------------------------===//
// Register File Description
//===----------------------------------------------------------------------===//

include "M68kRegisterInfo.td"

//===----------------------------------------------------------------------===//
// Instruction Descriptions
//===----------------------------------------------------------------------===//

include "M68kInstrInfo.td"

def M68kInstrInfo : InstrInfo;

//===----------------------------------------------------------------------===//
// Calling Conventions
//===----------------------------------------------------------------------===//

include "M68kCallingConv.td"

//===----------------------------------------------------------------------===//
// Target
//===----------------------------------------------------------------------===//

def M68k : Target {
  let InstructionSet = M68kInstrInfo;
  // let AssemblyParserVariants = [ATTAsmParserVariant, IntelAsmParserVariant];
  // let AssemblyWriters = [ATTAsmWriter, IntelAsmWriter];
}
