// WARNING: This file is created only for patch review
// In order to build this patch w/o errors, some libraris like
// LLVM<Target>CodeGen need to be present and some APIs
// like `LLVMInitializeM68kTarget` need to be there

extern "C" void LLVMInitializeM68kTargetMC() {}
