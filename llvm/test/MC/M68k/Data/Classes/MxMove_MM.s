; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	MxMove_RM_ARI_PCI
; CHECK-LABEL: MxMove_RM_ARI_PCI:
MxMove_RM_ARI_PCI:
	; CHECK:      move.b  (0,%pc,%d1), (%a0)
	; CHECK-SAME: encoding: [0x10,0xbb,0x18,0x00]
	move.b	(0,%pc,%d1), (%a0)
	; CHECK:      move.b  (-1,%pc,%d1), (%a0)
	; CHECK-SAME: encoding: [0x10,0xbb,0x18,0xff]
	move.b	(-1,%pc,%d1), (%a0)
	; CHECK:      move.l  (0,%pc,%d1), (%a0)
	; CHECK-SAME: encoding: [0x20,0xbb,0x18,0x00]
	move.l	(0,%pc,%d1), (%a0)
	; CHECK:      move.l  (0,%pc,%a2), (%a1)
	; CHECK-SAME: encoding: [0x22,0xbb,0xa8,0x00]
	move.l	(0,%pc,%a2), (%a1)

	.globl	MxMove_RM_PCD
; CHECK-LABEL: MxMove_RM_PCD:
MxMove_RM_PCD:
	; CHECK:      move.b  (0,%pc), (%a0)
	; CHECK-SAME: encoding: [0x10,0xba,0x00,0x00]
	move.b	(0,%pc), (%a0)
	; CHECK:      move.l  (-1,%pc), (%a0)
	; CHECK-SAME: encoding: [0x20,0xba,0xff,0xff]
	move.l	(-1,%pc), (%a0)
	; CHECK:      move.l  (-1,%pc), (%a0)
	; CHECK-SAME: encoding: [0x20,0xba,0xff,0xff]
	move.l	(-1,%pc), (%a0)

	.globl	MxMove_RM_ARII_ARII
; CHECK-LABEL: MxMove_RM_ARII_ARII:
MxMove_RM_ARII_ARII:
	; CHECK:      move.b  (0,%a0,%d1), (-1,%a0,%d1)
	; CHECK-SAME: encoding: [0x11,0xb0,0x18,0x00,0x18,0xff]
	move.b	(0,%a0,%d1), (-1,%a0,%d1)
	; CHECK:      move.b  (-1,%a0,%d1), (-1,%a0,%d1)
	; CHECK-SAME: encoding: [0x11,0xb0,0x18,0xff,0x18,0xff]
	move.b	(-1,%a0,%d1), (-1,%a0,%d1)
	; CHECK:      move.l  (0,%a1,%d1), (0,%a1,%d1)
	; CHECK-SAME: encoding: [0x23,0xb1,0x18,0x00,0x18,0x00]
	move.l	(0,%a1,%d1), (0,%a1,%d1)
	; CHECK:      move.l  (42,%a2,%a2), (0,%a2,%a2)
	; CHECK-SAME: encoding: [0x25,0xb2,0xa8,0x2a,0xa8,0x00]
	move.l	(42,%a2,%a2), (0,%a2,%a2)

	.globl	MxMove_RM_ARID
; CHECK-LABEL: MxMove_RM_ARID:
MxMove_RM_ARID:
	; CHECK:      move.b  (0,%a0), (0,%a0)
	; CHECK-SAME: encoding: [0x11,0x68,0x00,0x00,0x00,0x00]
	move.b	(0,%a0), (0,%a0)
	; CHECK:      move.l  (-1,%a1), (0,%a1)
	; CHECK-SAME: encoding: [0x23,0x69,0xff,0xff,0x00,0x00]
	move.l	(-1,%a1), (0,%a1)
	; CHECK:      move.l  (42,%a1), (-1,%a1)
	; CHECK-SAME: encoding: [0x23,0x69,0x00,0x2a,0xff,0xff]
	move.l	(42,%a1), (-1,%a1)

	.globl	MxMove_RM_ARIPD
; CHECK-LABEL: MxMove_RM_ARIPD:
MxMove_RM_ARIPD:
	; CHECK:      move.b  -(%a0), -(%a0)
	; CHECK-SAME: encoding: [0x11,0x20]
	move.b	-(%a0), -(%a0)
	; CHECK:      move.l  -(%a1), -(%a1)
	; CHECK-SAME: encoding: [0x23,0x21]
	move.l	-(%a1), -(%a1)
	; CHECK:      move.l  -(%a1), -(%a1)
	; CHECK-SAME: encoding: [0x23,0x21]
	move.l	-(%a1), -(%a1)

	.globl	MxMove_RM_ARIPI
; CHECK-LABEL: MxMove_RM_ARIPI:
MxMove_RM_ARIPI:
	; CHECK:      move.b  (%a0)+, (%a0)+
	; CHECK-SAME: encoding: [0x10,0xd8]
	move.b	(%a0)+, (%a0)+
	; CHECK:      move.l  (%a1)+, (%a1)+
	; CHECK-SAME: encoding: [0x22,0xd9]
	move.l	(%a1)+, (%a1)+
	; CHECK:      move.l  (%a1)+, (%a1)+
	; CHECK-SAME: encoding: [0x22,0xd9]
	move.l	(%a1)+, (%a1)+

	.globl	MxMove_RM_ARI
; CHECK-LABEL: MxMove_RM_ARI:
MxMove_RM_ARI:
	; CHECK:      move.b  (%a0), (%a0)
	; CHECK-SAME: encoding: [0x10,0x90]
	move.b	(%a0), (%a0)
	; CHECK:      move.l  (%a1), (%a1)
	; CHECK-SAME: encoding: [0x22,0x91]
	move.l	(%a1), (%a1)
	; CHECK:      move.l  (%a1), (%a1)
	; CHECK-SAME: encoding: [0x22,0x91]
	move.l	(%a1), (%a1)

	.globl	MxMove_RM_ABS
; CHECK-LABEL: MxMove_RM_ABS:
MxMove_RM_ABS:
	; CHECK:      move.b  $ffffffffffffffff, $0
	; CHECK-SAME: encoding: [0x13,0xf9,0xff,0xff,0x00,0x00]
	move.b	$ffffffffffffffff, $0
	; CHECK:      move.l  $0, $ffffffffffffffff
	; CHECK-SAME: encoding: [0x23,0xf9,0x00,0x00,0x00,0x00,0xff,0xff,0xff,0xff]
	move.l	$0, $ffffffffffffffff
	; CHECK:      move.l  $7fffffff, $0
	; CHECK-SAME: encoding: [0x23,0xf9,0x7f,0xff,0xff,0xff,0x00,0x00,0x00,0x00]
	move.l	$7fffffff, $0

