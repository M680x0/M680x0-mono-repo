; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	MxBiArOp_RFRM_PCI
; CHECK-LABEL: MxBiArOp_RFRM_PCI:
MxBiArOp_RFRM_PCI:
	; CHECK:      cmp.b  (0,%pc,%d1), %d0
	; CHECK-SAME: encoding: [0xb0,0x3b,0x18,0x00]
	cmp.b	(0,%pc,%d1), %d0
	; CHECK:      cmp.b  (-1,%pc,%d1), %d0
	; CHECK-SAME: encoding: [0xb0,0x3b,0x18,0x00]
	cmp.b	(-1,%pc,%d1), %d0
	; CHECK:      cmp.l  (0,%pc,%d1), %d0
	; CHECK-SAME: encoding: [0xb0,0xbb,0x18,0x00]
	cmp.l	(0,%pc,%d1), %d0

	.globl	MxBiArOp_RFRM_PCD
; CHECK-LABEL: MxBiArOp_RFRM_PCD:
MxBiArOp_RFRM_PCD:
	; CHECK:      cmp.b  (0,%pc), %d0
	; CHECK-SAME: encoding: [0xb0,0x3a,0x00,0x00]
	cmp.b	(0,%pc), %d0
	; CHECK:      cmp.l  (-1,%pc), %d0
	; CHECK-SAME: encoding: [0xb0,0xba,0x00,0x00]
	cmp.l	(-1,%pc), %d0

	.globl	MxCMP_RM_ARII
; CHECK-LABEL: MxCMP_RM_ARII:
MxCMP_RM_ARII:
	; CHECK:      cmp.b  (0,%a0,%d1), %d0
	; CHECK-SAME: encoding: [0xb0,0x30,0x18,0x00]
	cmp.b	(0,%a0,%d1), %d0
	; CHECK:      cmp.b  (-1,%a0,%d1), %d0
	; CHECK-SAME: encoding: [0xb0,0x30,0x18,0xff]
	cmp.b	(-1,%a0,%d1), %d0
	; CHECK:      cmp.l  (0,%a1,%d1), %d0
	; CHECK-SAME: encoding: [0xb0,0xb1,0x18,0x00]
	cmp.l	(0,%a1,%d1), %d0
	; CHECK:      cmp.l  (0,%a2,%a2), %d1
	; CHECK-SAME: encoding: [0xb2,0xb2,0xa8,0x00]
	cmp.l	(0,%a2,%a2), %d1

	.globl	MxCMP_RM_ARID
; CHECK-LABEL: MxCMP_RM_ARID:
MxCMP_RM_ARID:
	; CHECK:      cmp.b  (0,%a0), %d0
	; CHECK-SAME: encoding: [0xb0,0x28,0x00,0x00]
	cmp.b	(0,%a0), %d0
	; CHECK:      cmp.l  (-1,%a1), %d0
	; CHECK-SAME: encoding: [0xb0,0xa9,0xff,0xff]
	cmp.l	(-1,%a1), %d0

	.globl	MxCMP_RM_ARI
; CHECK-LABEL: MxCMP_RM_ARI:
MxCMP_RM_ARI:
	; CHECK:      cmp.b  (%a0), %d0
	; CHECK-SAME: encoding: [0xb0,0x10]
	cmp.b	(%a0), %d0
	; CHECK:      cmp.l  (%a1), %d3
	; CHECK-SAME: encoding: [0xb6,0x91]
	cmp.l	(%a1), %d3

