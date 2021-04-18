	.text
	.globl	MxJMP_ARI
; CHECK-LABEL: MxJMP_ARI:
MxJMP_ARI:
	; CHECK:      jmp  (%a0)
	; CHECK-SAME: encoding: [0x4e,0xd0]
	jmp	(%a0)

