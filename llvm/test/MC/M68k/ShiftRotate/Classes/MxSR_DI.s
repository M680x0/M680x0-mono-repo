	.text
	.file	"MxSR_DI.mir"
	.globl	MxSR_DI                         ; -- Begin function MxSR_DI
	.type	MxSR_DI,@function
MxSR_DI:                                ; @MxSR_DI
	.cfi_startproc
; %bb.0:
	lsl.b	#1, %d1
	lsl.l	#1, %d1
	lsr.b	#1, %d1
	lsr.l	#1, %d1
	asr.b	#1, %d1
	asr.l	#1, %d1
	rol.b	#1, %d1
	rol.l	#1, %d1
	ror.b	#1, %d1
	ror.l	#1, %d1
	ror.l	#2, %d1
	ror.l	#3, %d1
	ror.l	#4, %d1
	ror.l	#5, %d1
	ror.l	#6, %d1
	ror.l	#7, %d1
	ror.l	#8, %d1
.Lfunc_end0:
	.size	MxSR_DI, .Lfunc_end0-MxSR_DI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
