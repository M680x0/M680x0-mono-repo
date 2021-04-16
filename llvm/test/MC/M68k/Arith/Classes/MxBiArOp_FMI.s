	.text
	.file	"MxBiArOp_FMI.mir"
	.globl	MxBiArOp_FMI_ARII               ; -- Begin function MxBiArOp_FMI_ARII
	.type	MxBiArOp_FMI_ARII,@function
MxBiArOp_FMI_ARII:                      ; @MxBiArOp_FMI_ARII
	.cfi_startproc
; %bb.0:
	add.b	#-1, (0,%a0,%d0)
	add.b	#0, (-1,%a3,%a1)
	add.l	#-1, (13,%a2,%d1)
.Lfunc_end0:
	.size	MxBiArOp_FMI_ARII, .Lfunc_end0-MxBiArOp_FMI_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxBiArOp_FMI_ARID               ; -- Begin function MxBiArOp_FMI_ARID
	.type	MxBiArOp_FMI_ARID,@function
MxBiArOp_FMI_ARID:                      ; @MxBiArOp_FMI_ARID
	.cfi_startproc
; %bb.0:
	add.b	#-1, (0,%a0)
	add.b	#0, (-1,%a3)
	add.l	#-1, (13,%a2)
.Lfunc_end1:
	.size	MxBiArOp_FMI_ARID, .Lfunc_end1-MxBiArOp_FMI_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxBiArOp_FMI_ARI                ; -- Begin function MxBiArOp_FMI_ARI
	.type	MxBiArOp_FMI_ARI,@function
MxBiArOp_FMI_ARI:                       ; @MxBiArOp_FMI_ARI
	.cfi_startproc
; %bb.0:
	add.b	#-1, (%a0)
	add.b	#0, (%a3)
	add.l	#-1, (%a2)
.Lfunc_end2:
	.size	MxBiArOp_FMI_ARI, .Lfunc_end2-MxBiArOp_FMI_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
