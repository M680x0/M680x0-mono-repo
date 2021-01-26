//===---- M68kAsmParser.cpp - Parse M68k assembly to MCInst instructions --===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#include "M68k.h"
#include "M68kRegisterInfo.h"
#include "M68kInstrInfo.h"
#include "TargetInfo/M68kTargetInfo.h"

#include "llvm/Support/TargetRegistry.h"
#include "llvm/MC/MCContext.h"
#include "llvm/MC/MCStreamer.h"
#include "llvm/MC/MCParser/MCParsedAsmOperand.h"
#include "llvm/MC/MCParser/MCTargetAsmParser.h"

#include <sstream>

#define DEBUG_TYPE "m68k-asm-parser"

using namespace llvm;

namespace {
/// Parses M68k assembly from a stream.
class M68kAsmParser : public MCTargetAsmParser {
  const MCSubtargetInfo &STI;
  MCAsmParser &Parser;
  const MCRegisterInfo *MRI;

#define GET_ASSEMBLER_HEADER
#include "M68kGenAsmMatcher.inc"

public:
  M68kAsmParser(const MCSubtargetInfo &STI, MCAsmParser &Parser,
               const MCInstrInfo &MII, const MCTargetOptions &Options)
      : MCTargetAsmParser(Options, STI, MII), STI(STI), Parser(Parser) {
    MCAsmParserExtension::Initialize(Parser);
    MRI = getContext().getRegisterInfo();

    setAvailableFeatures(ComputeAvailableFeatures(STI.getFeatureBits()));
  }

  // Parser functions.
  void eatComma();

  OperandMatchResultTy parseMxImm(OperandVector &Operands);
  OperandMatchResultTy parseAddr(OperandVector &Operands);
  OperandMatchResultTy parseARI(OperandVector &Operands);
  OperandMatchResultTy parseARID(OperandVector &Operands);
  OperandMatchResultTy parseARII(OperandVector &Operands);
  OperandMatchResultTy parseARIPD(OperandVector &Operands);
  OperandMatchResultTy parseARIPI(OperandVector &Operands);
  OperandMatchResultTy parsePCD(OperandVector &Operands);
  OperandMatchResultTy parsePCI(OperandVector &Operands);
  OperandMatchResultTy parseMemOp(OperandVector &Operands);

  unsigned validateTargetOperandClass(
      MCParsedAsmOperand &Op, unsigned Kind) override;
  bool ParseRegister(unsigned &RegNo, SMLoc &StartLoc, SMLoc &EndLoc) override;
  OperandMatchResultTy tryParseRegister(unsigned &RegNo, SMLoc &StartLoc,
                                        SMLoc &EndLoc) override;
  bool ParseInstruction(ParseInstructionInfo &Info, StringRef Name,
                        SMLoc NameLoc, OperandVector &Operands) override;
  bool ParseDirective(AsmToken DirectiveID) override;
  bool MatchAndEmitInstruction(SMLoc IDLoc, unsigned &Opcode,
                                       OperandVector &Operands, MCStreamer &Out,
                                       uint64_t &ErrorInfo,
                                       bool MatchingInlineAsm) override;

  // Helpers for Match&Emit.
  bool invalidOperand(const SMLoc &Loc, const OperandVector &Operands,
                      const uint64_t &ErrorInfo);
  bool missingFeature(const SMLoc &Loc, const uint64_t &ErrorInfo);
  bool emit(MCInst &Inst, SMLoc const &Loc, MCStreamer &Out) const;
  bool parseRegisterName(unsigned int &RegNo, SMLoc Loc,
                         StringRef RegisterName);
  OperandMatchResultTy parseRegister(unsigned int &RegNo);
};

/// An parsed M68k assembly operand.
class M68kOperand : public MCParsedAsmOperand {
  typedef MCParsedAsmOperand Base;

  enum Kind {
    Kind_Invalid,
    Kind_Token,
    Kind_Reg,
    Kind_Imm,

    // Complex operands
    Kind_ARI,
    Kind_ARID,
    Kind_ARII,
    Kind_ARIPD,
    Kind_ARIPI,
    Kind_PCD,
    Kind_PCI,
  };

  struct MemOp {
    unsigned RegNo;
    int64_t Displacement;
    unsigned Index;
  };

  Kind Kind;
  SMLoc Start, End;
  union {
    StringRef Token;
    unsigned RegNo;
    uint64_t Imm;
    MemOp Mem;
  };

public:
  M68kOperand(enum Kind Kind, SMLoc Start, SMLoc End)
      : Base(), Kind(Kind), Start(Start), End(End) {}

  bool isToken() const override { return Kind == Kind_Token; }
  bool isImm() const override { return Kind == Kind_Imm; }
  bool isReg() const override { return Kind == Kind_Reg; }
  bool isMem() const override { return false; }

  unsigned getReg() const override {
    assert(Kind == Kind_Reg);
    return RegNo;
  }

  SMLoc getStartLoc() const override { return Start; }
  SMLoc getEndLoc() const override { return End; }

  void print(raw_ostream &OS) const override;

  StringRef getToken() const {
    assert(isToken());
    return Token;
  }

  void addRegOperands(MCInst &Inst, unsigned N) const {
    assert(isReg() && "wrong operand kind");
    assert((N == 1) && "can only handle one register operand");

    Inst.addOperand(MCOperand::createReg(getReg()));
  }

  void addImmOperands(MCInst &Inst, unsigned N) const {
    assert(isImm() && "wrong oeprand kind");
    assert((N == 1) && "can only handle one register operand");

    Inst.addOperand(MCOperand::createImm(Imm));
  }

  static std::unique_ptr<M68kOperand> createToken(
      StringRef Token, SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_Token, Start, End);
    Op->Token = Token;
    return Op;
  }

  static std::unique_ptr<M68kOperand> createRegister(
      unsigned RegNo, SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_Reg, Start, End);
    Op->RegNo = RegNo;
    return Op;
  }

  // MxImm
  void addMxImmOperands(MCInst &Inst, unsigned N) const {
    Inst.addOperand(MCOperand::createImm(Imm));
  }
  bool isMxImm() const { return Kind == Kind_Imm; }
  static std::unique_ptr<M68kOperand> createImm(
      int64_t Imm, SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_Imm, Start, End);
    Op->Imm = Imm;
    return Op;
  }

  // Addr
  void addAddrOperands(MCInst &Inst, unsigned N) const {
    Inst.addOperand(MCOperand::createImm(Imm));
  }
  bool isAddr() const { return Kind == Kind_Imm; }
  static std::unique_ptr<M68kOperand> createAddr(
      int64_t Imm, SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_Imm, Start, End);
    Op->Imm = Imm;
    return Op;
  }

  // ARI
  void addARIOperands(MCInst &Inst, unsigned N) const {
    Inst.addOperand(MCOperand::createReg(Mem.RegNo));
  }
  bool isARI() const { return Kind == Kind_ARI; }
  static std::unique_ptr<M68kOperand> createARI(
      unsigned RegNo, SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_ARI, Start, End);
    Op->Mem.RegNo = RegNo;
    return Op;
  }

  // ARID
  void addARIDOperands(MCInst &Inst, unsigned N) const {
    Inst.addOperand(MCOperand::createImm(Mem.Displacement));
    Inst.addOperand(MCOperand::createReg(Mem.RegNo));
  }
  bool isARID() const { return Kind == Kind_ARID; }
  static std::unique_ptr<M68kOperand> createARID(
      unsigned RegNo, int64_t Displacement,
      SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_ARID, Start, End);
    Op->Mem.RegNo = RegNo;
    Op->Mem.Displacement = Displacement;
    return Op;
  }

  // ARII
  void addARIIOperands(MCInst &Inst, unsigned N) const {
    Inst.addOperand(MCOperand::createImm(Mem.Displacement));
    Inst.addOperand(MCOperand::createReg(Mem.RegNo));
    Inst.addOperand(MCOperand::createReg(Mem.Index));
  }
  bool isARII() const { return Kind == Kind_ARII; }
  static std::unique_ptr<M68kOperand> createARII(
      unsigned RegNo, int64_t Displacement, unsigned IndexReg,
      SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_ARII, Start, End);
    Op->Mem.RegNo = RegNo;
    Op->Mem.Displacement = Displacement;
    Op->Mem.Index = IndexReg;
    return Op;
  }

  // ARIPD
  void addARIPDOperands(MCInst &Inst, unsigned N) const {
    Inst.addOperand(MCOperand::createReg(Mem.RegNo));
  }
  bool isARIPD() const { return Kind == Kind_ARIPD; }
  static std::unique_ptr<M68kOperand> createARIPD(
      unsigned RegNo, SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_ARIPD, Start, End);
    Op->Mem.RegNo = RegNo;
    return Op;
  }

  // ARIPI
  void addARIPIOperands(MCInst &Inst, unsigned N) const {
    Inst.addOperand(MCOperand::createReg(Mem.RegNo));
  }
  bool isARIPI() const { return Kind == Kind_ARIPI; }
  static std::unique_ptr<M68kOperand> createARIPI(
      unsigned RegNo, SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_ARIPI, Start, End);
    Op->Mem.RegNo = RegNo;
    return Op;
  }

  // PCD
  void addPCDOperands(MCInst &Inst, unsigned N) const {
    Inst.addOperand(MCOperand::createImm(Mem.Displacement));
  }
  bool isPCD() const { return Kind == Kind_PCD; }
  static std::unique_ptr<M68kOperand> createPCD(
      int64_t Displacement, SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_PCD, Start, End);
    Op->Mem.Displacement = Displacement;
    return Op;
  }

  // PCI
  void addPCIOperands(MCInst &Inst, unsigned N) const {
    Inst.addOperand(MCOperand::createImm(Mem.Displacement));
    Inst.addOperand(MCOperand::createReg(Mem.RegNo));
  }
  bool isPCI() const { return Kind == Kind_PCI; }
  static std::unique_ptr<M68kOperand> createPCI(
      unsigned RegNo, int64_t Displacement, SMLoc Start, SMLoc End) {
    auto Op = std::make_unique<M68kOperand>(Kind_PCI, Start, End);
    Op->Mem.RegNo = RegNo;
    Op->Mem.Displacement = Displacement;
    return Op;
  }
};

} // end anonymous namespace.

extern "C" LLVM_EXTERNAL_VISIBILITY void LLVMInitializeM68kAsmParser() {
  RegisterMCAsmParser<M68kAsmParser> X(getTheM68kTarget());
}

#define GET_MATCHER_IMPLEMENTATION
#include "M68kGenAsmMatcher.inc"


unsigned M68kAsmParser::validateTargetOperandClass(
    MCParsedAsmOperand &Op, unsigned Kind) {
  M68kOperand &Operand = (M68kOperand &)Op;

  switch (Kind) {
  case MCK_XR16:
  case MCK_SPILL:
    if (Operand.isReg()) {
      return Match_Success;
    }
    break;

  case MCK_AR16:
  case MCK_AR32:
    if (Operand.isReg() &&
        (Operand.getReg() >= M68k::A0) &&
        (Operand.getReg() <= M68k::A7)) {
      return Match_Success;
    }
    break;

  case MCK_AR32_NOSP:
    if (Operand.isReg() &&
        (Operand.getReg() >= M68k::A0) &&
        (Operand.getReg() <= M68k::A6)) {
      return Match_Success;
    }
    break;

  case MCK_DR8:
  case MCK_DR16:
  case MCK_DR32:
    if (Operand.isReg() &&
        (Operand.getReg() >= M68k::D0) &&
        (Operand.getReg() <= M68k::D7)) {
      return Match_Success;
    }
    break;

  case MCK_AR16_TC:
    if (Operand.isReg() &&
        (Operand.getReg() >= M68k::A0) &&
        (Operand.getReg() <= M68k::A1)) {
      return Match_Success;
    }
    break;

  case MCK_DR16_TC:
    if (Operand.isReg() &&
        (Operand.getReg() >= M68k::D0) &&
        (Operand.getReg() <= M68k::D1)) {
      return Match_Success;
    }
    break;

  case MCK_XR16_TC:
    if (Operand.isReg() &&
        (((Operand.getReg() >= M68k::D0) &&
            (Operand.getReg() <= M68k::D1)) ||
        ((Operand.getReg() >= M68k::A0) &&
            (Operand.getReg() <= M68k::A1)))) {
      return Match_Success;
    }
    break;
  }

  return Match_InvalidOperand;
}

bool M68kAsmParser::parseRegisterName(unsigned &RegNo, SMLoc Loc, StringRef RegisterName) {
  auto RegisterNameLower = RegisterName.lower();

  // Parse simple general-purpose registgers.
  if ((RegisterNameLower.size() == 2) && isdigit(RegisterNameLower[1])) {
    unsigned RegOffset = (unsigned)(RegisterNameLower[1] - '0');

    switch (RegisterNameLower[0]) {
    case 'd':
      RegNo = M68k::D0 + RegOffset;
      return false;

    case 'a':
      RegNo = M68k::A0 + RegOffset;
      return false;
    }
  }

  return Error(Loc, "invalid register name");
}

OperandMatchResultTy M68kAsmParser::parseRegister(unsigned &RegNo) {
  if (!Parser.getTok().is(AsmToken::Identifier)) {
    return MatchOperand_NoMatch;
  }

  auto RegisterName = Parser.getTok().getString();
  if(parseRegisterName(RegNo, Parser.getLexer().getLoc(), RegisterName)) {
    return MatchOperand_NoMatch;
  }

  Parser.Lex();
  return MatchOperand_Success;
}

bool M68kAsmParser::ParseRegister(unsigned &RegNo, SMLoc &StartLoc, SMLoc &EndLoc) {
  auto Result = tryParseRegister(RegNo, StartLoc, EndLoc);
  if (Result != MatchOperand_Success) {
    return Error(StartLoc, "expected register");
  }

  return false;
}

OperandMatchResultTy M68kAsmParser::tryParseRegister(unsigned &RegNo, SMLoc &StartLoc,
                                      SMLoc &EndLoc) {
  StartLoc = getLexer().getLoc();
  auto Result = parseRegister(RegNo);
  EndLoc = getLexer().getLoc();
  return Result;
}

OperandMatchResultTy M68kAsmParser::parseMxImm(OperandVector &Operands) {
  if (getLexer().isNot(AsmToken::Hash)) {
    return MatchOperand_NoMatch;
  }
  SMLoc Start = getLexer().getLoc();
  Parser.Lex();

  if (getLexer().isNot(AsmToken::Integer)) {
    Error(getLexer().getLoc(), "unexpected token parsing immediate");
    return MatchOperand_ParseFail;
  }

  int64_t Imm;
  if (Parser.parseIntToken(Imm, "unexpected character parsing Immediate")) {
    return MatchOperand_ParseFail;
  }

  Parser.Lex();
  Operands.push_back(M68kOperand::createImm(Imm, Start, getLexer().getLoc()));
  return MatchOperand_Success;
}

OperandMatchResultTy M68kAsmParser::parseAddr(OperandVector &Operands) {
  if (getLexer().isNot(AsmToken::Integer)) {
    return MatchOperand_NoMatch;
  }
  SMLoc Start = getLexer().getLoc();
  Parser.Lex();

  int64_t Imm;
  if (Parser.parseIntToken(Imm, "unexpected character parsing Immediate")) {
    return MatchOperand_ParseFail;
  }

  Parser.Lex();
  Operands.push_back(M68kOperand::createAddr(Imm, Start, getLexer().getLoc()));
  return MatchOperand_Success;
}

OperandMatchResultTy M68kAsmParser::parseARI(OperandVector &Operands) {
  return parseMemOp(Operands);
}

OperandMatchResultTy M68kAsmParser::parseARID(OperandVector &Operands) {
  return parseMemOp(Operands);
}

OperandMatchResultTy M68kAsmParser::parseARII(OperandVector &Operands) {
  return parseMemOp(Operands);
}

OperandMatchResultTy M68kAsmParser::parseARIPD(OperandVector &Operands) {
  return parseMemOp(Operands);
}

OperandMatchResultTy M68kAsmParser::parseARIPI(OperandVector &Operands) {
  return parseMemOp(Operands);
}

OperandMatchResultTy M68kAsmParser::parsePCD(OperandVector &Operands) {
  return parseMemOp(Operands);
}

OperandMatchResultTy M68kAsmParser::parsePCI(OperandVector &Operands) {
  return parseMemOp(Operands);
}

OperandMatchResultTy M68kAsmParser::parseMemOp(OperandVector &Operands) {
  SMLoc Start = getLexer().getLoc();
  bool IsPD = false;
  unsigned RegNo;

  // Try plain register, eg. D0.
  auto Result = parseRegister(RegNo);
  if (Result == MatchOperand_Success) {
    Operands.push_back(M68kOperand::createRegister(RegNo, Start, getLexer().getLoc()));
    return MatchOperand_Success;
  }

  if (Result == MatchOperand_ParseFail) {
    return Result;
  }

  // Check for pre-decrement.
  if (getLexer().is(AsmToken::Minus)) {
    Parser.Lex();
    IsPD = true;
  }

  if (getLexer().isNot(AsmToken::LParen)) {
    if (IsPD) {
      Error(getLexer().getLoc(), "unexpected token parsing expression");
      return MatchOperand_ParseFail;
    }

    return MatchOperand_NoMatch;
  }
  Parser.Lex();

  // Check for Displacement
  bool HasDisplacement = false;
  int64_t Displacement = 0;
  if (getLexer().is(AsmToken::Integer)) {
    if (Parser.parseIntToken(Displacement, "unexpected token in displacement")) {
      return MatchOperand_ParseFail;
    }
    Parser.Lex();

    if (getLexer().isNot(AsmToken::Comma)) {
      Error(getLexer().getLoc(), "expected comma");
      return MatchOperand_ParseFail;
    }

    HasDisplacement = true;
  }

  Result = parseRegister(RegNo);
  if (Result == MatchOperand_ParseFail) {
    return MatchOperand_ParseFail;
  }

  if (Result != MatchOperand_Success) {
    Error(getLexer().getLoc(), "expected register");
    return MatchOperand_ParseFail;
  }

  // Check for Index.
  bool HasIndex = false;
  unsigned IndexRegNo;
  if (Parser.getTok().is(AsmToken::Comma)) {
    Parser.Lex();

    Result = parseRegister(IndexRegNo);
    if (Result == MatchOperand_ParseFail) {
      return Result;
    }

    if (Result == MatchOperand_NoMatch) {
      Error(getLexer().getLoc(), "expected register");
      return MatchOperand_ParseFail;
    }

    HasIndex = true;
  }

  if (Parser.getTok().isNot(AsmToken::RParen)) {
    Error(getLexer().getLoc(), "expected )");
    return MatchOperand_ParseFail;
  }
  Parser.Lex();

  bool IsPI = false;
  if (Parser.getTok().is(AsmToken::Plus)) {
    Parser.Lex();
    IsPI = true;
  }

  SMLoc End = getLexer().getLoc();

  if (RegNo == M68k::PC) {
    if (HasIndex) {
      Operands.push_back(M68kOperand::createPCD(Displacement, Start, End));
    } else {
      Operands.push_back(M68kOperand::createPCI(IndexRegNo, Displacement, Start, End));
    }
    return MatchOperand_Success;
  }

  unsigned OpCount = IsPD + IsPI + (HasIndex || HasDisplacement);
  if (OpCount > 1) {
    Error(Start, "only one of post-increment, pre-decrement or displacement can be used");
    return MatchOperand_ParseFail;
  }

  if (IsPD) {
    Operands.push_back(M68kOperand::createARIPD(RegNo, Start, End));
  } else if (IsPI) {
    Operands.push_back(M68kOperand::createARIPI(RegNo, Start, End));
  } else if (HasIndex) {
    Operands.push_back(M68kOperand::createARII(RegNo, Displacement, IndexRegNo, Start, End));
  } else if (HasDisplacement) {
    Operands.push_back(M68kOperand::createARID(RegNo, Displacement, Start, End));
  } else {
    Operands.push_back(M68kOperand::createARI(RegNo, Start, End));
  }
  return MatchOperand_Success;
}

void M68kAsmParser::eatComma() {
    if (Parser.getTok().is(AsmToken::Comma)) {
      Parser.Lex();
    }
}

bool M68kAsmParser::ParseInstruction(ParseInstructionInfo &Info, StringRef Name,
                      SMLoc NameLoc, OperandVector &Operands) {
  SMLoc Start = getLexer().getLoc();
  Operands.push_back(M68kOperand::createToken(Name, Start, Start));

  bool First = true;
  while (Parser.getTok().isNot(AsmToken::EndOfStatement)) {
    if (!First) {
      eatComma();
    } else {
      First = false;
    }

    auto MatchResult = MatchOperandParserImpl(Operands, Name);
    if  (MatchResult == MatchOperand_Success) {
      continue;
    }

    // Add custom operand formats here...

    SMLoc Loc = getLexer().getLoc();
    Parser.eatToEndOfStatement();
    return Error(Loc, "unexpected token parsing operands");
  }

  // Eat EndOfStatement.
  Parser.Lex();
  return false;
}

bool M68kAsmParser::ParseDirective(AsmToken DirectiveID) {
  return true;
}

bool M68kAsmParser::invalidOperand(SMLoc const &Loc,
                                  OperandVector const &Operands,
                                  uint64_t const &ErrorInfo) {
  SMLoc ErrorLoc = Loc;
  char const *Diag = 0;

  if (ErrorInfo != ~0U) {
    if (ErrorInfo >= Operands.size()) {
      Diag = "too few operands for instruction.";
    } else {
      auto const &Op = (M68kOperand const &)*Operands[ErrorInfo];
      if (Op.getStartLoc() != SMLoc()) {
        ErrorLoc = Op.getStartLoc();
      }
    }
  }

  if (!Diag) {
    Diag = "invalid operand for instruction";
  }

  return Error(ErrorLoc, Diag);
}

bool M68kAsmParser::missingFeature(llvm::SMLoc const &Loc,
                                  uint64_t const &ErrorInfo) {
  return Error(Loc, "instruction requires a CPU feature not currently enabled");
}

bool M68kAsmParser::emit(MCInst &Inst, SMLoc const &Loc, MCStreamer &Out) const {
  Inst.setLoc(Loc);
  Out.emitInstruction(Inst, STI);

  return false;
}

bool M68kAsmParser::MatchAndEmitInstruction(SMLoc Loc, unsigned &Opcode,
                             OperandVector &Operands, MCStreamer &Out,
                             uint64_t &ErrorInfo,
                             bool MatchingInlineAsm) {
  MCInst Inst;
  unsigned MatchResult =
      MatchInstructionImpl(Operands, Inst, ErrorInfo, MatchingInlineAsm);

  switch (MatchResult) {
  case Match_Success:        return emit(Inst, Loc, Out);
  case Match_MissingFeature: return missingFeature(Loc, ErrorInfo);
  case Match_InvalidOperand: return invalidOperand(Loc, Operands, ErrorInfo);
  case Match_MnemonicFail:   return Error(Loc, "invalid instruction");
  default:                   return true;
  }
}

void M68kOperand::print(raw_ostream &OS) const {
  switch (Kind) {
  case Kind_Invalid:
    OS << "invalid";
    break;

  case Kind_Token:
    OS << "token '" << Token << "'";
    break;

  case Kind_Reg:
    OS << "register " << RegNo;
    break;

  case Kind_ARI:
    OS << "(" << Mem.RegNo << ")";
    break;

  case Kind_ARID:
    OS << "(" << Mem.Displacement << "," << Mem.RegNo << ")";
    break;

  case Kind_ARII:
    OS << "(" << Mem.Displacement << "," << Mem.RegNo << "," << Mem.Index << ")";
    break;

  case Kind_ARIPD:
    OS << "-(" << Mem.RegNo << ")";
    break;

  case Kind_ARIPI:
    OS << "(" << Mem.RegNo << ")+";
    break;

  case Kind_PCD:
    OS << "(" << Mem.Displacement << ",pc)";
    break;

  case Kind_PCI:
    OS << "(" << Mem.Displacement << ",pc," << Mem.Index << ")";
    break;

  default:
    llvm_unreachable("unhandled operand kind");
  }
}
