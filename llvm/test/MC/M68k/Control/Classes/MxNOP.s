; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	MxNOP
; CHECK-LABEL: MxNOP:
MxNOP:
	; CHECK:      nop
	; CHECK-SAME: encoding: [0x4e,0x71]
	nop

