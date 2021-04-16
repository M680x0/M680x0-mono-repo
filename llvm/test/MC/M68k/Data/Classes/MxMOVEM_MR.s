	.text
	.file	"MxMOVEM_MR.mir"
	.globl	MxMOVEM_MR_ARID                 ; -- Begin function MxMOVEM_MR_ARID
	.type	MxMOVEM_MR_ARID,@function
MxMOVEM_MR_ARID:                        ; @MxMOVEM_MR_ARID
	.cfi_startproc
; %bb.0:
	movem.l	%d0, (0,%a1)
	movem.l	%d0-%d1, (-1,%a1)
.Lfunc_end0:
	.size	MxMOVEM_MR_ARID, .Lfunc_end0-MxMOVEM_MR_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxMOVEM_MR_ARI                  ; -- Begin function MxMOVEM_MR_ARI
	.type	MxMOVEM_MR_ARI,@function
MxMOVEM_MR_ARI:                         ; @MxMOVEM_MR_ARI
	.cfi_startproc
; %bb.0:
	movem.l	%d0, (%a1)
	movem.l	%d0-%d1, (%a1)
.Lfunc_end1:
	.size	MxMOVEM_MR_ARI, .Lfunc_end1-MxMOVEM_MR_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
