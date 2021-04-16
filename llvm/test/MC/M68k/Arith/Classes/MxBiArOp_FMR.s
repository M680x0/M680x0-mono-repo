	.text
	.file	"MxBiArOp_FMR.mir"
	.globl	MxBiArOp_FMR_ARII               ; -- Begin function MxBiArOp_FMR_ARII
	.type	MxBiArOp_FMR_ARII,@function
MxBiArOp_FMR_ARII:                      ; @MxBiArOp_FMR_ARII
	.cfi_startproc
; %bb.0:
	add.b	%d0, (0,%a0,%d1)
	add.b	%d0, (-1,%a0,%d1)
	add.l	%d0, (0,%a1,%d1)
	add.l	%d1, (0,%a2,%a2)
.Lfunc_end0:
	.size	MxBiArOp_FMR_ARII, .Lfunc_end0-MxBiArOp_FMR_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxBiArOp_FMR_ARID               ; -- Begin function MxBiArOp_FMR_ARID
	.type	MxBiArOp_FMR_ARID,@function
MxBiArOp_FMR_ARID:                      ; @MxBiArOp_FMR_ARID
	.cfi_startproc
; %bb.0:
	add.b	%d0, (0,%a0)
	add.l	%d0, (-1,%a1)
.Lfunc_end1:
	.size	MxBiArOp_FMR_ARID, .Lfunc_end1-MxBiArOp_FMR_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxBiArOp_FMR_ARI                ; -- Begin function MxBiArOp_FMR_ARI
	.type	MxBiArOp_FMR_ARI,@function
MxBiArOp_FMR_ARI:                       ; @MxBiArOp_FMR_ARI
	.cfi_startproc
; %bb.0:
	add.b	%d0, (%a0)
	add.l	%d3, (%a1)
.Lfunc_end2:
	.size	MxBiArOp_FMR_ARI, .Lfunc_end2-MxBiArOp_FMR_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
