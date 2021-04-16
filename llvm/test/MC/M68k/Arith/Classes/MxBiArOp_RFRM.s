	.text
	.file	"MxBiArOp_RFRM.mir"
	.globl	MxBiArOp_RFRM_PCI               ; -- Begin function MxBiArOp_RFRM_PCI
	.type	MxBiArOp_RFRM_PCI,@function
MxBiArOp_RFRM_PCI:                      ; @MxBiArOp_RFRM_PCI
	.cfi_startproc
; %bb.0:
	add.b	(0,%pc,%d1), %d0
	add.b	(-1,%pc,%d1), %d0
	add.l	(0,%pc,%d1), %d0
	add.l	(0,%pc,%a2), %a1
.Lfunc_end0:
	.size	MxBiArOp_RFRM_PCI, .Lfunc_end0-MxBiArOp_RFRM_PCI
	.cfi_endproc
                                        ; -- End function
	.globl	MxBiArOp_RFRM_PCD               ; -- Begin function MxBiArOp_RFRM_PCD
	.type	MxBiArOp_RFRM_PCD,@function
MxBiArOp_RFRM_PCD:                      ; @MxBiArOp_RFRM_PCD
	.cfi_startproc
; %bb.0:
	add.b	(0,%pc), %d0
	add.l	(-1,%pc), %d0
.Lfunc_end1:
	.size	MxBiArOp_RFRM_PCD, .Lfunc_end1-MxBiArOp_RFRM_PCD
	.cfi_endproc
                                        ; -- End function
	.globl	MxBiArOp_RFRM_ARII              ; -- Begin function MxBiArOp_RFRM_ARII
	.type	MxBiArOp_RFRM_ARII,@function
MxBiArOp_RFRM_ARII:                     ; @MxBiArOp_RFRM_ARII
	.cfi_startproc
; %bb.0:
	add.b	(0,%a0,%d1), %d0
	add.b	(-1,%a0,%d1), %d0
	add.l	(0,%a1,%d1), %d0
	add.l	(0,%a2,%a2), %a1
.Lfunc_end2:
	.size	MxBiArOp_RFRM_ARII, .Lfunc_end2-MxBiArOp_RFRM_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxBiArOp_RFRM_ARID              ; -- Begin function MxBiArOp_RFRM_ARID
	.type	MxBiArOp_RFRM_ARID,@function
MxBiArOp_RFRM_ARID:                     ; @MxBiArOp_RFRM_ARID
	.cfi_startproc
; %bb.0:
	add.b	(0,%a0), %d0
	add.l	(-1,%a1), %d0
.Lfunc_end3:
	.size	MxBiArOp_RFRM_ARID, .Lfunc_end3-MxBiArOp_RFRM_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxBiArOp_RFRM_ARI               ; -- Begin function MxBiArOp_RFRM_ARI
	.type	MxBiArOp_RFRM_ARI,@function
MxBiArOp_RFRM_ARI:                      ; @MxBiArOp_RFRM_ARI
	.cfi_startproc
; %bb.0:
	add.b	(%a0), %d0
	add.l	(%a1), %a3
.Lfunc_end4:
	.size	MxBiArOp_RFRM_ARI, .Lfunc_end4-MxBiArOp_RFRM_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
