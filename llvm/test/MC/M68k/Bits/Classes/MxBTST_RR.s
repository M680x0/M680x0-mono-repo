	.text
	.globl	MxBTST_RR
; CHECK-LABEL: MxBTST_RR:
MxBTST_RR:
	; CHECK:      btst  %d1, %d0
	; CHECK-SAME: encoding: [0x03,0x00]
	btst	%d1, %d0
	; CHECK:      btst  %d0, %d3
	; CHECK-SAME: encoding: [0x01,0x03]
	btst	%d0, %d3

