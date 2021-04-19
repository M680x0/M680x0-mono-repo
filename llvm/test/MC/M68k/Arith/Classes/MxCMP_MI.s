; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	MxCMP_MI_PCI
; CHECK-LABEL: MxCMP_MI_PCI:
MxCMP_MI_PCI:
	; CHECK:      cmpi.b  #0, (-1,%pc,%d1)
	; CHECK-SAME: encoding: [0x0c,0x3b,0x00,0x00,0x18,0xff]
	cmpi.b	#0, (-1,%pc,%d1)
	; CHECK:      cmpi.b  #-1, (0,%pc,%d0)
	; CHECK-SAME: encoding: [0x0c,0x3b,0x00,0xff,0x08,0x00]
	cmpi.b	#-1, (0,%pc,%d0)
	; CHECK:      cmpi.l  #-1, (0,%pc,%d7)
	; CHECK-SAME: encoding: [0x0c,0xbb,0xff,0xff,0xff,0xff,0x78,0x00]
	cmpi.l	#-1, (0,%pc,%d7)
	; CHECK:      cmpi.l  #42, (-1,%pc,%d1)
	; CHECK-SAME: encoding: [0x0c,0xbb,0x00,0x00,0x00,0x2a,0x18,0xff]
	cmpi.l	#42, (-1,%pc,%d1)

	.globl	MxCMP_MI_PCD
; CHECK-LABEL: MxCMP_MI_PCD:
MxCMP_MI_PCD:
	; CHECK:      cmpi.b  #0, (0,%pc)
	; CHECK-SAME: encoding: [0x0c,0x3a,0x00,0x00,0x00,0x00]
	cmpi.b	#0, (0,%pc)
	; CHECK:      cmpi.b  #-1, (-1,%pc)
	; CHECK-SAME: encoding: [0x0c,0x3a,0x00,0xff,0xff,0xff]
	cmpi.b	#-1, (-1,%pc)
	; CHECK:      cmpi.l  #-1, (0,%pc)
	; CHECK-SAME: encoding: [0x0c,0xba,0xff,0xff,0xff,0xff,0x00,0x00]
	cmpi.l	#-1, (0,%pc)
	; CHECK:      cmpi.l  #42, (0,%pc)
	; CHECK-SAME: encoding: [0x0c,0xba,0x00,0x00,0x00,0x2a,0x00,0x00]
	cmpi.l	#42, (0,%pc)

	.globl	MxCMP_MI_ARII
; CHECK-LABEL: MxCMP_MI_ARII:
MxCMP_MI_ARII:
	; CHECK:      cmpi.b  #0, (-1,%a1,%a0)
	; CHECK-SAME: encoding: [0x0c,0x31,0x00,0x00,0x88,0xff]
	cmpi.b	#0, (-1,%a1,%a0)
	; CHECK:      cmpi.b  #-1, (0,%a0,%a0)
	; CHECK-SAME: encoding: [0x0c,0x30,0x00,0xff,0x88,0x00]
	cmpi.b	#-1, (0,%a0,%a0)
	; CHECK:      cmpi.l  #-1, (0,%a6,%a0)
	; CHECK-SAME: encoding: [0x0c,0xb6,0xff,0xff,0xff,0xff,0x88,0x00]
	cmpi.l	#-1, (0,%a6,%a0)
	; CHECK:      cmpi.l  #42, (-1,%a1,%a0)
	; CHECK-SAME: encoding: [0x0c,0xb1,0x00,0x00,0x00,0x2a,0x88,0xff]
	cmpi.l	#42, (-1,%a1,%a0)

	.globl	MxCMP_MI_ARID
; CHECK-LABEL: MxCMP_MI_ARID:
MxCMP_MI_ARID:
	; CHECK:      cmpi.b  #0, (-1,%a1)
	; CHECK-SAME: encoding: [0x0c,0x29,0x00,0x00,0xff,0xff]
	cmpi.b	#0, (-1,%a1)
	; CHECK:      cmpi.b  #-1, (0,%a0)
	; CHECK-SAME: encoding: [0x0c,0x28,0x00,0xff,0x00,0x00]
	cmpi.b	#-1, (0,%a0)
	; CHECK:      cmpi.l  #-1, (0,%a6)
	; CHECK-SAME: encoding: [0x0c,0xae,0xff,0xff,0xff,0xff,0x00,0x00]
	cmpi.l	#-1, (0,%a6)
	; CHECK:      cmpi.l  #42, (-1,%a1)
	; CHECK-SAME: encoding: [0x0c,0xa9,0x00,0x00,0x00,0x2a,0xff,0xff]
	cmpi.l	#42, (-1,%a1)

	.globl	MxCMP_MI_ARI
; CHECK-LABEL: MxCMP_MI_ARI:
MxCMP_MI_ARI:
	; CHECK:      cmpi.b  #0, (%a1)
	; CHECK-SAME: encoding: [0x0c,0x11,0x00,0x00]
	cmpi.b	#0, (%a1)
	; CHECK:      cmpi.b  #-1, (%a0)
	; CHECK-SAME: encoding: [0x0c,0x10,0x00,0xff]
	cmpi.b	#-1, (%a0)
	; CHECK:      cmpi.l  #-1, (%a6)
	; CHECK-SAME: encoding: [0x0c,0x96,0xff,0xff]
	cmpi.l	#-1, (%a6)
	; CHECK:      cmpi.l  #42, (%a1)
	; CHECK-SAME: encoding: [0x0c,0x91,0x00,0x2a]
	cmpi.l	#42, (%a1)

