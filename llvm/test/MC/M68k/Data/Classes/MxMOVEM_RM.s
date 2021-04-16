	.text
	.file	"MxMOVEM_RM.mir"
	.globl	MxMOVEM_RM_ARID                 ; -- Begin function MxMOVEM_RM_ARID
	.type	MxMOVEM_RM_ARID,@function
MxMOVEM_RM_ARID:                        ; @MxMOVEM_RM_ARID
	.cfi_startproc
; %bb.0:
	movem.l	(0,%a1), %d0
	movem.l	(-1,%a1), %d0-%d1
.Lfunc_end0:
	.size	MxMOVEM_RM_ARID, .Lfunc_end0-MxMOVEM_RM_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxMOVEM_RM_ARI                  ; -- Begin function MxMOVEM_RM_ARI
	.type	MxMOVEM_RM_ARI,@function
MxMOVEM_RM_ARI:                         ; @MxMOVEM_RM_ARI
	.cfi_startproc
; %bb.0:
	movem.l	(%a1), %d0
	movem.l	(%a1), %d0-%d1
.Lfunc_end1:
	.size	MxMOVEM_RM_ARI, .Lfunc_end1-MxMOVEM_RM_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
