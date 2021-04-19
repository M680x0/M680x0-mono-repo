; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	MxBcc8
; CHECK-LABEL: MxBcc8:
MxBcc8:
	; CHECK:      bhi  #1
	; CHECK-SAME: encoding: [0x62,0x01]
	bhi	#1
	; CHECK:      bls  #42
	; CHECK-SAME: encoding: [0x63,0x2a]
	bls	#42
	; CHECK:      bcc  #1
	; CHECK-SAME: encoding: [0x64,0x01]
	bcc	#1
	; CHECK:      bcs  #1
	; CHECK-SAME: encoding: [0x65,0x01]
	bcs	#1
	; CHECK:      bne  #1
	; CHECK-SAME: encoding: [0x66,0x01]
	bne	#1
	; CHECK:      beq  #1
	; CHECK-SAME: encoding: [0x67,0x01]
	beq	#1
	; CHECK:      bvc  #1
	; CHECK-SAME: encoding: [0x68,0x01]
	bvc	#1
	; CHECK:      bvs  #1
	; CHECK-SAME: encoding: [0x69,0x01]
	bvs	#1
	; CHECK:      bpl  #1
	; CHECK-SAME: encoding: [0x6a,0x01]
	bpl	#1
	; CHECK:      bmi  #1
	; CHECK-SAME: encoding: [0x6b,0x01]
	bmi	#1
	; CHECK:      bge  #1
	; CHECK-SAME: encoding: [0x6c,0x01]
	bge	#1
	; CHECK:      blt  #1
	; CHECK-SAME: encoding: [0x6d,0x01]
	blt	#1
	; CHECK:      bgt  #1
	; CHECK-SAME: encoding: [0x6e,0x01]
	bgt	#1
	; CHECK:      ble  #1
	; CHECK-SAME: encoding: [0x6f,0x01]
	ble	#1

	.globl	MxBcc16
; CHECK-LABEL: MxBcc16:
MxBcc16:
	; CHECK:      bhi  #-1
	; CHECK-SAME: encoding: [0x62,0x00,0xff,0xff]
	bhi	#-1
	; CHECK:      bls  #42
	; CHECK-SAME: encoding: [0x63,0x00,0x00,0x2a]
	bls	#42
	; CHECK:      bcc  #0
	; CHECK-SAME: encoding: [0x64,0x00,0x00,0x00]
	bcc	#0
	; CHECK:      bcs  #0
	; CHECK-SAME: encoding: [0x65,0x00,0x00,0x00]
	bcs	#0
	; CHECK:      bne  #0
	; CHECK-SAME: encoding: [0x66,0x00,0x00,0x00]
	bne	#0
	; CHECK:      beq  #0
	; CHECK-SAME: encoding: [0x67,0x00,0x00,0x00]
	beq	#0
	; CHECK:      bvc  #0
	; CHECK-SAME: encoding: [0x68,0x00,0x00,0x00]
	bvc	#0
	; CHECK:      bvs  #0
	; CHECK-SAME: encoding: [0x69,0x00,0x00,0x00]
	bvs	#0
	; CHECK:      bpl  #0
	; CHECK-SAME: encoding: [0x6a,0x00,0x00,0x00]
	bpl	#0
	; CHECK:      bmi  #0
	; CHECK-SAME: encoding: [0x6b,0x00,0x00,0x00]
	bmi	#0
	; CHECK:      bge  #0
	; CHECK-SAME: encoding: [0x6c,0x00,0x00,0x00]
	bge	#0
	; CHECK:      blt  #0
	; CHECK-SAME: encoding: [0x6d,0x00,0x00,0x00]
	blt	#0
	; CHECK:      bgt  #0
	; CHECK-SAME: encoding: [0x6e,0x00,0x00,0x00]
	bgt	#0
	; CHECK:      ble  #0
	; CHECK-SAME: encoding: [0x6f,0x00,0x00,0x00]
	ble	#0

