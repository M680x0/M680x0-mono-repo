	.text
	.file	"MxMove_RR.mir"
	.globl	MxMove_RR                       ; -- Begin function MxMove_RR
	.type	MxMove_RR,@function
MxMove_RR:                              ; @MxMove_RR
	.cfi_startproc
; %bb.0:
	move.b	%d0, %d1
	move.w	%a2, %d3
	move.w	%a2, %a6
	move.w	%a2, %d1
	move.l	%d2, %d1
	move.l	%a2, %a1
.Lfunc_end0:
	.size	MxMove_RR, .Lfunc_end0-MxMove_RR
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
