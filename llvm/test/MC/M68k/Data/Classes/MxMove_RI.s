	.text
	.file	"MxMove_RI.mir"
	.globl	MxMove_RI                       ; -- Begin function MxMove_RI
	.type	MxMove_RI,@function
MxMove_RI:                              ; @MxMove_RI
	.cfi_startproc
; %bb.0:
	move.b	#-1, %d0
	move.l	#42, %a1
	move.l	#-1, %a1
.Lfunc_end0:
	.size	MxMove_RI, .Lfunc_end0-MxMove_RI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
