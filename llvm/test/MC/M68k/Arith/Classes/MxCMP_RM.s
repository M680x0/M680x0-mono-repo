	.text
	.file	"MxCMP_RM.mir"
	.globl	MxBiArOp_RFRM_PCI               ; -- Begin function MxBiArOp_RFRM_PCI
	.type	MxBiArOp_RFRM_PCI,@function
MxBiArOp_RFRM_PCI:                      ; @MxBiArOp_RFRM_PCI
	.cfi_startproc
; %bb.0:
	cmp.b	(0,%pc,%d1), %d0
	cmp.b	(-1,%pc,%d1), %d0
	cmp.l	(0,%pc,%d1), %d0
.Lfunc_end0:
	.size	MxBiArOp_RFRM_PCI, .Lfunc_end0-MxBiArOp_RFRM_PCI
	.cfi_endproc
                                        ; -- End function
	.globl	MxBiArOp_RFRM_PCD               ; -- Begin function MxBiArOp_RFRM_PCD
	.type	MxBiArOp_RFRM_PCD,@function
MxBiArOp_RFRM_PCD:                      ; @MxBiArOp_RFRM_PCD
	.cfi_startproc
; %bb.0:
	cmp.b	(0,%pc), %d0
	cmp.l	(-1,%pc), %d0
.Lfunc_end1:
	.size	MxBiArOp_RFRM_PCD, .Lfunc_end1-MxBiArOp_RFRM_PCD
	.cfi_endproc
                                        ; -- End function
	.globl	MxCMP_RM_ARII                   ; -- Begin function MxCMP_RM_ARII
	.type	MxCMP_RM_ARII,@function
MxCMP_RM_ARII:                          ; @MxCMP_RM_ARII
	.cfi_startproc
; %bb.0:
	cmp.b	(0,%a0,%d1), %d0
	cmp.b	(-1,%a0,%d1), %d0
	cmp.l	(0,%a1,%d1), %d0
	cmp.l	(0,%a2,%a2), %d1
.Lfunc_end2:
	.size	MxCMP_RM_ARII, .Lfunc_end2-MxCMP_RM_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxCMP_RM_ARID                   ; -- Begin function MxCMP_RM_ARID
	.type	MxCMP_RM_ARID,@function
MxCMP_RM_ARID:                          ; @MxCMP_RM_ARID
	.cfi_startproc
; %bb.0:
	cmp.b	(0,%a0), %d0
	cmp.l	(-1,%a1), %d0
.Lfunc_end3:
	.size	MxCMP_RM_ARID, .Lfunc_end3-MxCMP_RM_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxCMP_RM_ARI                    ; -- Begin function MxCMP_RM_ARI
	.type	MxCMP_RM_ARI,@function
MxCMP_RM_ARI:                           ; @MxCMP_RM_ARI
	.cfi_startproc
; %bb.0:
	cmp.b	(%a0), %d0
	cmp.l	(%a1), %d3
.Lfunc_end4:
	.size	MxCMP_RM_ARI, .Lfunc_end4-MxCMP_RM_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
