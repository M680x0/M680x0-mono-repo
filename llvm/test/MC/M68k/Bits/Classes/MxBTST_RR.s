	.text
	.file	"MxBTST_RR.mir"
	.globl	MxBTST_RR                       ; -- Begin function MxBTST_RR
	.type	MxBTST_RR,@function
MxBTST_RR:                              ; @MxBTST_RR
	.cfi_startproc
; %bb.0:
	btst	%d1, %d0
	btst	%d0, %d3
.Lfunc_end0:
	.size	MxBTST_RR, .Lfunc_end0-MxBTST_RR
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
