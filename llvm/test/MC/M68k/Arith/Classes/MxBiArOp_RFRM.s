; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
        .text

	.globl	MxBiArOp_RFRM_PCI
        ; CHECK-LABEL: MxBiArOp_RFRM_PCI:
MxBiArOp_RFRM_PCI:
        ; CHECK:      add.b   (0,%pc,%d1), %d0
        ; CHECK-SAME: encoding: [0xd0,0x3b,0x18,0x00]
	add.b	(0,%pc,%d1), %d0
        ; CHECK:      add.b   (-1,%pc,%d1), %d0
        ; CHECK-SAME: encoding: [0xd0,0x3b,0x18,0xff]
	add.b	(-1,%pc,%d1), %d0
        ; CHECK:      add.l   (0,%pc,%d1), %d0
        ; CHECK-SAME: encoding: [0xd0,0xbb,0x18,0x00]
	add.l	(0,%pc,%d1), %d0
        ; CHECK:      add.l   (0,%pc,%a2), %a1
        ; CHECK-SAME: encoding: [0xd3,0xfb,0xa8,0x00]
	add.l	(0,%pc,%a2), %a1

	.globl	MxBiArOp_RFRM_PCD
        ; CHECK-LABEL: MxBiArOp_RFRM_PCD:
MxBiArOp_RFRM_PCD:
        ; CHECK:      add.b   (0,%pc), %d0
        ; CHECK-SAME: encoding: [0xd0,0x3a,0x00,0x00]
	add.b	(0,%pc), %d0
        ; CHECK:      add.l   (-1,%pc), %d0
        ; CHECK-SAME: encoding: [0xd0,0xba,0xff,0xff]
	add.l	(-1,%pc), %d0

	.globl	MxBiArOp_RFRM_ARII
        ; CHECK-LABEL: MxBiArOp_RFRM_ARII:
MxBiArOp_RFRM_ARII:
        ; CHECK:      add.b   (0,%a0,%d1), %d0
        ; CHECK-SAME: encoding: [0xd0,0x30,0x18,0x00]
	add.b	(0,%a0,%d1), %d0
        ; CHECK:      add.b   (-1,%a0,%d1), %d0
        ; CHECK-SAME: encoding: [0xd0,0x30,0x18,0xff]
	add.b	(-1,%a0,%d1), %d0
        ; CHECK:      add.l   (0,%a1,%d1), %d0
        ; CHECK-SAME: encoding: [0xd0,0xb1,0x18,0x00]
	add.l	(0,%a1,%d1), %d0
        ; CHECK:      add.l   (0,%a2,%a2), %a1
        ; CHECK-SAME: encoding: [0xd3,0xf2,0xa8,0x00]
	add.l	(0,%a2,%a2), %a1

	.globl	MxBiArOp_RFRM_ARID
        ; CHECK-LABEL: MxBiArOp_RFRM_ARID:
MxBiArOp_RFRM_ARID:
        ; CHECK:      add.b   (0,%a0), %d0
        ; CHECK-SAME: encoding: [0xd0,0x28,0x00,0x00]
	add.b	(0,%a0), %d0
        ; CHECK:      add.l   (-1,%a1), %d0
        ; CHECK-SAME: encoding: [0xd0,0xa9,0xff,0xff]
	add.l	(-1,%a1), %d0

	.globl	MxBiArOp_RFRM_ARI
        ; CHECK-LABEL: MxBiArOp_RFRM_ARI:
MxBiArOp_RFRM_ARI:
        ; CHECK:      add.b	(%a0), %d0
        ; CHECK-SAME: encoding: [0xd0,0x10]
	add.b	(%a0), %d0
        ; CHECK:      add.l	(%a1), %a3
        ; CHECK-SAME: encoding: [0xd7,0xd1]
	add.l	(%a1), %a3
