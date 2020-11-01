add_llvm_component_group(M68k)

set(LLVM_TARGET_DEFINITIONS M68k.td)

tablegen(LLVM M68kGenRegisterInfo.inc     -gen-register-info)
tablegen(LLVM M68kGenInstrInfo.inc        -gen-instr-info)
tablegen(LLVM M68kGenSubtargetInfo.inc    -gen-subtarget)
tablegen(LLVM M68kGenMCCodeBeads.inc      -gen-code-beads)
tablegen(LLVM M68kGenMCPseudoLowering.inc -gen-pseudo-lowering)
tablegen(LLVM M68kGenDAGISel.inc          -gen-dag-isel)
tablegen(LLVM M68kGenCallingConv.inc      -gen-callingconv)
tablegen(LLVM M68kGenAsmWriter.inc        -gen-asm-writer)

# M68kCommonTableGen must be defined
add_public_tablegen_target(M68kCommonTableGen)

# M68kCodeGen should match with LLVMBuild.txt M68kCodeGen
add_llvm_target(M68kCodeGen
  M68kTargetMachine.cpp

  LINK_COMPONENTS
  Analysis
  AsmPrinter
  CodeGen
  Core
  MC
  SelectionDAG
  Support
  Target
  M68kDesc
  M68kInfo

  ADD_TO_COMPONENT
  M68k
)

# Should match with "subdirectories =  MCTargetDesc TargetInfo" in LLVMBuild.txt
add_subdirectory(TargetInfo)
add_subdirectory(MCTargetDesc)
