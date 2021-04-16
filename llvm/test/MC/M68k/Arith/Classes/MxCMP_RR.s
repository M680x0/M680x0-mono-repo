	.text
	.file	"MxCMP_RR.mir"
	.globl	MxCMP_RR                        ; -- Begin function MxCMP_RR
	.type	MxCMP_RR,@function
MxCMP_RR:                               ; @MxCMP_RR
	.cfi_startproc
; %bb.0:
	cmp.b	%d0, %d1
	cmp.b	%d3, %d2
	cmp.l	%d0, %d1
	cmp.l	%d7, %d1
.Lfunc_end0:
	.size	MxCMP_RR, .Lfunc_end0-MxCMP_RR
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
