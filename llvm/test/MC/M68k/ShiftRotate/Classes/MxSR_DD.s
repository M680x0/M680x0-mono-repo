	.text
	.file	"MxSR_DD.mir"
	.globl	MxSR_DD                         ; -- Begin function MxSR_DD
	.type	MxSR_DD,@function
MxSR_DD:                                ; @MxSR_DD
	.cfi_startproc
; %bb.0:
	lsl.b	%d0, %d1
	lsl.l	%d1, %d2
	lsr.b	%d2, %d3
	lsr.l	%d3, %d4
	asr.b	%d4, %d5
	asr.l	%d5, %d6
	rol.b	%d6, %d7
	rol.l	%d7, %d1
	ror.b	%d0, %d1
	ror.l	%d0, %d1
.Lfunc_end0:
	.size	MxSR_DD, .Lfunc_end0-MxSR_DD
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
