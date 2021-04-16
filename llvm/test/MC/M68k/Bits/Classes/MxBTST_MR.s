	.text
	.file	"MxBTST_MR.mir"
	.globl	MxBTST_MR_PCI                   ; -- Begin function MxBTST_MR_PCI
	.type	MxBTST_MR_PCI,@function
MxBTST_MR_PCI:                          ; @MxBTST_MR_PCI
	.cfi_startproc
; %bb.0:
	btst	%d0, (-1,%pc,%d1)
	btst	%d1, (0,%pc,%d0)
.Lfunc_end0:
	.size	MxBTST_MR_PCI, .Lfunc_end0-MxBTST_MR_PCI
	.cfi_endproc
                                        ; -- End function
	.globl	MxBTST_MR_PCD                   ; -- Begin function MxBTST_MR_PCD
	.type	MxBTST_MR_PCD,@function
MxBTST_MR_PCD:                          ; @MxBTST_MR_PCD
	.cfi_startproc
; %bb.0:
	btst	%d0, (0,%pc)
	btst	%d1, (-1,%pc)
.Lfunc_end1:
	.size	MxBTST_MR_PCD, .Lfunc_end1-MxBTST_MR_PCD
	.cfi_endproc
                                        ; -- End function
	.globl	MxBTST_MR_ARII                  ; -- Begin function MxBTST_MR_ARII
	.type	MxBTST_MR_ARII,@function
MxBTST_MR_ARII:                         ; @MxBTST_MR_ARII
	.cfi_startproc
; %bb.0:
	btst	%d0, (-1,%a1,%a0)
	btst	%d1, (0,%a0,%a0)
.Lfunc_end2:
	.size	MxBTST_MR_ARII, .Lfunc_end2-MxBTST_MR_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxBTST_MR_ARID                  ; -- Begin function MxBTST_MR_ARID
	.type	MxBTST_MR_ARID,@function
MxBTST_MR_ARID:                         ; @MxBTST_MR_ARID
	.cfi_startproc
; %bb.0:
	btst	%d0, (-1,%a1)
	btst	%d1, (0,%a0)
.Lfunc_end3:
	.size	MxBTST_MR_ARID, .Lfunc_end3-MxBTST_MR_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxBTST_MR_ARI                   ; -- Begin function MxBTST_MR_ARI
	.type	MxBTST_MR_ARI,@function
MxBTST_MR_ARI:                          ; @MxBTST_MR_ARI
	.cfi_startproc
; %bb.0:
	btst	%d0, (%a1)
	btst	%d1, (%a0)
.Lfunc_end4:
	.size	MxBTST_MR_ARI, .Lfunc_end4-MxBTST_MR_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
