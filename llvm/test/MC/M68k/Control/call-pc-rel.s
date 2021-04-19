; RUN: llvm-mc -triple=m68k -show-encoding %s | FileCheck %s
	.text
	.globl	BACKWARD
; CHECK-LABEL: BACKWARD:
BACKWARD:
	; CHECK:      nop
	; CHECK-SAME: encoding: [0x4e,0x71]
	nop
	; CHECK:      rts
	; CHECK-SAME: encoding: [0x4e,0x75]
	rts

	.globl	PCI
; CHECK-LABEL: PCI:
PCI:
	; CHECK:      jsr  (BACKWARD,%pc,%d0)
	; CHECK-SAME: encoding: [0x4e,0xbb,0x08,0xfa]
	jsr	(BACKWARD,%pc,%d0)
	; CHECK:      jsr  (FORWARD,%pc,%d0)
	; CHECK-SAME: encoding: [0x4e,0xbb,0x08,0x0a]
	jsr	(FORWARD,%pc,%d0)

	.globl	PCD
; CHECK-LABEL: PCD:
PCD:
	; CHECK:      jsr  (BACKWARD,%pc)
	; CHECK-SAME: encoding: [0x4e,0xba,0xff,0xf2]
	jsr	(BACKWARD,%pc)
	; CHECK:      jsr  (FORWARD,%pc)
	; CHECK-SAME: encoding: [0x4e,0xba,0x00,0x02]
	jsr	(FORWARD,%pc)

	.globl	FORWARD
; CHECK-LABEL: FORWARD:
FORWARD:
	; CHECK:      nop
	; CHECK-SAME: encoding: [0x4e,0x71]
	nop
	; CHECK:      rts
	; CHECK-SAME: encoding: [0x4e,0x75]
	rts

