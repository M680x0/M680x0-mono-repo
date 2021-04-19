; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	MxMove_RM_PCI
; CHECK-LABEL: MxMove_RM_PCI:
MxMove_RM_PCI:
	; CHECK:      move.b  (0,%pc,%d1), %d0
	; CHECK-SAME: encoding: [0x10,0x3b,0x18,0x00]
	move.b	(0,%pc,%d1), %d0
	; CHECK:      move.b  (-1,%pc,%d1), %d0
	; CHECK-SAME: encoding: [0x10,0x3b,0x18,0xff]
	move.b	(-1,%pc,%d1), %d0
	; CHECK:      move.l  (0,%pc,%d1), %d0
	; CHECK-SAME: encoding: [0x20,0x3b,0x18,0x00]
	move.l	(0,%pc,%d1), %d0
	; CHECK:      move.l  (0,%pc,%a2), %d1
	; CHECK-SAME: encoding: [0x22,0x3b,0xa8,0x00]
	move.l	(0,%pc,%a2), %d1

	.globl	MxMove_RM_PCD
; CHECK-LABEL: MxMove_RM_PCD:
MxMove_RM_PCD:
	; CHECK:      move.b  (0,%pc), %d0
	; CHECK-SAME: encoding: [0x10,0x3a,0x00,0x00]
	move.b	(0,%pc), %d0
	; CHECK:      move.l  (-1,%pc), %d0
	; CHECK-SAME: encoding: [0x20,0x3a,0xff,0xff]
	move.l	(-1,%pc), %d0
	; CHECK:      move.l  (-1,%pc), %a0
	; CHECK-SAME: encoding: [0x20,0x7a,0xff,0xff]
	move.l	(-1,%pc), %a0

	.globl	MxMove_RM_ARII
; CHECK-LABEL: MxMove_RM_ARII:
MxMove_RM_ARII:
	; CHECK:      move.b  (0,%a0,%d1), %d0
	; CHECK-SAME: encoding: [0x10,0x30,0x18,0x00]
	move.b	(0,%a0,%d1), %d0
	; CHECK:      move.b  (-1,%a0,%d1), %d0
	; CHECK-SAME: encoding: [0x10,0x30,0x18,0xff]
	move.b	(-1,%a0,%d1), %d0
	; CHECK:      move.l  (0,%a1,%d1), %d0
	; CHECK-SAME: encoding: [0x20,0x31,0x18,0x00]
	move.l	(0,%a1,%d1), %d0
	; CHECK:      move.l  (0,%a2,%a2), %d1
	; CHECK-SAME: encoding: [0x22,0x32,0xa8,0x00]
	move.l	(0,%a2,%a2), %d1

	.globl	MxMove_RM_ARID
; CHECK-LABEL: MxMove_RM_ARID:
MxMove_RM_ARID:
	; CHECK:      move.b  (0,%a0), %d0
	; CHECK-SAME: encoding: [0x10,0x28,0x00,0x00]
	move.b	(0,%a0), %d0
	; CHECK:      move.l  (-1,%a1), %d0
	; CHECK-SAME: encoding: [0x20,0x29,0xff,0xff]
	move.l	(-1,%a1), %d0
	; CHECK:      move.l  (-1,%a1), %a0
	; CHECK-SAME: encoding: [0x20,0x69,0xff,0xff]
	move.l	(-1,%a1), %a0

	.globl	MxMove_RM_ARIPD
; CHECK-LABEL: MxMove_RM_ARIPD:
MxMove_RM_ARIPD:
	; CHECK:      move.b  -(%a0), %d0
	; CHECK-SAME: encoding: [0x10,0x20]
	move.b	-(%a0), %d0
	; CHECK:      move.l  -(%a1), %d3
	; CHECK-SAME: encoding: [0x26,0x21]
	move.l	-(%a1), %d3
	; CHECK:      move.l  -(%a1), %a4
	; CHECK-SAME: encoding: [0x28,0x61]
	move.l	-(%a1), %a4

	.globl	MxMove_RM_ARIPI
; CHECK-LABEL: MxMove_RM_ARIPI:
MxMove_RM_ARIPI:
	; CHECK:      move.b  (%a0)+, %d0
	; CHECK-SAME: encoding: [0x10,0x18]
	move.b	(%a0)+, %d0
	; CHECK:      move.l  (%a1)+, %d3
	; CHECK-SAME: encoding: [0x26,0x19]
	move.l	(%a1)+, %d3
	; CHECK:      move.l  (%a1)+, %a4
	; CHECK-SAME: encoding: [0x28,0x59]
	move.l	(%a1)+, %a4

	.globl	MxMove_RM_ARI
; CHECK-LABEL: MxMove_RM_ARI:
MxMove_RM_ARI:
	; CHECK:      move.b  (%a0), %d0
	; CHECK-SAME: encoding: [0x10,0x10]
	move.b	(%a0), %d0
	; CHECK:      move.l  (%a1), %d3
	; CHECK-SAME: encoding: [0x26,0x11]
	move.l	(%a1), %d3
	; CHECK:      move.l  (%a1), %a4
	; CHECK-SAME: encoding: [0x28,0x51]
	move.l	(%a1), %a4

	.globl	MxMove_RM_ABS
; CHECK-LABEL: MxMove_RM_ABS:
MxMove_RM_ABS:
	; CHECK:      move.b  $0, %d0
	; CHECK-SAME: encoding: [0x10,0x39,0x00,0x00]
	move.b	$0, %d0
	; CHECK:      move.l  $0, %d3
	; CHECK-SAME: encoding: [0x26,0x39,0x00,0x00,0x00,0x00]
	move.l	$0, %d3
	; CHECK:      move.l  $0, %a4
	; CHECK-SAME: encoding: [0x28,0x79,0x00,0x00,0x00,0x00]
	move.l	$0, %a4

