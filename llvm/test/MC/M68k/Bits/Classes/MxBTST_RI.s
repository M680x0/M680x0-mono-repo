	.text
	.file	"MxBTST_RI.mir"
	.globl	MxBTST_RI                       ; -- Begin function MxBTST_RI
	.type	MxBTST_RI,@function
MxBTST_RI:                              ; @MxBTST_RI
	.cfi_startproc
; %bb.0:
	btst	#1, %d0
	btst	#0, %d3
.Lfunc_end0:
	.size	MxBTST_RI, .Lfunc_end0-MxBTST_RI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
