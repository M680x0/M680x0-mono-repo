; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	MxBRA8
; CHECK-LABEL: MxBRA8:
MxBRA8:
	; CHECK:      bra  $1
	; CHECK-SAME: encoding: [0x60,0x01]
	bra	$1
	; CHECK:      bra  $2a
	; CHECK-SAME: encoding: [0x60,0x2a]
	bra	$2a

	.globl	MxBRA16
; CHECK-LABEL: MxBRA16:
MxBRA16:
	; CHECK:      bra  $0
	; CHECK-SAME: encoding: [0x60,0x00,0x00,0x00]
	bra	$0
	; CHECK:      bra  $ffffffffffffffff
	; CHECK-SAME: encoding: [0x60,0x00,0xff,0xff]
	bra	$ffffffffffffffff
	; CHECK:      bra  $2a
	; CHECK-SAME: encoding: [0x60,0x00,0x00,0x2a]
	bra	$2a

