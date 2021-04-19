; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	MxCALL_PCI
; CHECK-LABEL: MxCALL_PCI:
MxCALL_PCI:
	; CHECK:      jsr  (0,%pc,%a0)
	; CHECK-SAME: encoding: [0x4e,0xbb,0x88,0x00]
	jsr	(0,%pc,%a0)
	; CHECK:      jsr  (-1,%pc,%a0)
	; CHECK-SAME: encoding: [0x4e,0xbb,0x88,0xff]
	jsr	(-1,%pc,%a0)
	; CHECK:      jsr  (42,%pc,%a0)
	; CHECK-SAME: encoding: [0x4e,0xbb,0x88,0x2a]
	jsr	(42,%pc,%a0)

	.globl	MxCALL_PCD
; CHECK-LABEL: MxCALL_PCD:
MxCALL_PCD:
	; CHECK:      jsr  (0,%pc)
	; CHECK-SAME: encoding: [0x4e,0xba,0x00,0x00]
	jsr	(0,%pc)
	; CHECK:      jsr  (32767,%pc)
	; CHECK-SAME: encoding: [0x4e,0xba,0x7f,0xff]
	jsr	(32767,%pc)

	.globl	MxCALL_ABS
; CHECK-LABEL: MxCALL_ABS:
MxCALL_ABS:
	; CHECK:      jsr  42
	; CHECK-SAME: encoding: [0x4e,0xb9,0x00,0x00,0x00,0x2a]
	jsr	42
	; CHECK:      jsr  4294967295
	; CHECK-SAME: encoding: [0x4e,0xb9,0xff,0xff,0xff,0xff]
	jsr	4294967295

	.globl	MxCALL_ARI
; CHECK-LABEL: MxCALL_ARI:
MxCALL_ARI:
	; CHECK:      jsr  (%a0)
	; CHECK-SAME: encoding: [0x4e,0x90]
	jsr	(%a0)
	; CHECK:      jsr  (%a1)
	; CHECK-SAME: encoding: [0x4e,0x91]
	jsr	(%a1)
	; CHECK:      jsr  (%a2)
	; CHECK-SAME: encoding: [0x4e,0x92]
	jsr	(%a2)

