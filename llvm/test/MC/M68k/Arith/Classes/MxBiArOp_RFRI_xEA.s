; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	MxBiArOp_RFRI_xEA
; CHECK-LABEL: MxBiArOp_RFRI_xEA:
MxBiArOp_RFRI_xEA:
	; CHECK:      add.w  #0, %d0
	; CHECK-SAME: encoding: [0xd0,0x7c,0x00,0x00]
	add.w	#0, %d0
	; CHECK:      add.w  #-1, %d3
	; CHECK-SAME: encoding: [0xd6,0x7c,0xff,0xff]
	add.w	#-1, %d3
	; CHECK:      add.l  #-1, %d0
	; CHECK-SAME: encoding: [0xd0,0xbc,0xff,0xff,0xff,0xff]
	add.l	#-1, %d0
	; CHECK:      add.l  #131071, %d0
	; CHECK-SAME: encoding: [0xd0,0xbc,0x00,0x01,0xff,0xff]
	add.l	#131071, %d0
	; CHECK:      add.l  #458752, %d7
	; CHECK-SAME: encoding: [0xde,0xbc,0x00,0x07,0x00,0x00]
	add.l	#458752, %d7
	; CHECK:      add.l  #0, %a0
	; CHECK-SAME: encoding: [0xd1,0xfc,0x00,0x00,0x00,0x00]
	add.l	#0, %a0

