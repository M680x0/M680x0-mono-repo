	.text
	.globl	MxRTS
; CHECK-LABEL: MxRTS:
MxRTS:
	; CHECK:      rts
	; CHECK-SAME: encoding: [0x4e,0x75]
	rts

