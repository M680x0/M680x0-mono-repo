	.text
	.file	"MxJMP.mir"
	.globl	MxJMP_ARI                       ; -- Begin function MxJMP_ARI
	.type	MxJMP_ARI,@function
MxJMP_ARI:                              ; @MxJMP_ARI
	.cfi_startproc
; %bb.0:
	jmp	(%a0)
.Lfunc_end0:
	.size	MxJMP_ARI, .Lfunc_end0-MxJMP_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
