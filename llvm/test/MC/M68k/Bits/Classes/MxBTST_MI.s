	.text
	.file	"MxBTST_MI.mir"
	.globl	MxBTST_MI_PCI                   ; -- Begin function MxBTST_MI_PCI
	.type	MxBTST_MI_PCI,@function
MxBTST_MI_PCI:                          ; @MxBTST_MI_PCI
	.cfi_startproc
; %bb.0:
	btst	#0, (-1,%pc,%d1)
	btst	#1, (0,%pc,%d0)
.Lfunc_end0:
	.size	MxBTST_MI_PCI, .Lfunc_end0-MxBTST_MI_PCI
	.cfi_endproc
                                        ; -- End function
	.globl	MxBTST_MI_PCD                   ; -- Begin function MxBTST_MI_PCD
	.type	MxBTST_MI_PCD,@function
MxBTST_MI_PCD:                          ; @MxBTST_MI_PCD
	.cfi_startproc
; %bb.0:
	btst	#0, (0,%pc)
	btst	#-1, (-1,%pc)
.Lfunc_end1:
	.size	MxBTST_MI_PCD, .Lfunc_end1-MxBTST_MI_PCD
	.cfi_endproc
                                        ; -- End function
	.globl	MxBTST_MI_ARII                  ; -- Begin function MxBTST_MI_ARII
	.type	MxBTST_MI_ARII,@function
MxBTST_MI_ARII:                         ; @MxBTST_MI_ARII
	.cfi_startproc
; %bb.0:
	btst	#0, (-1,%a1,%a0)
	btst	#-1, (0,%a0,%a0)
.Lfunc_end2:
	.size	MxBTST_MI_ARII, .Lfunc_end2-MxBTST_MI_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxBTST_MI_ARID                  ; -- Begin function MxBTST_MI_ARID
	.type	MxBTST_MI_ARID,@function
MxBTST_MI_ARID:                         ; @MxBTST_MI_ARID
	.cfi_startproc
; %bb.0:
	btst	#0, (-1,%a1)
	btst	#-1, (0,%a0)
.Lfunc_end3:
	.size	MxBTST_MI_ARID, .Lfunc_end3-MxBTST_MI_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxBTST_MI_ARI                   ; -- Begin function MxBTST_MI_ARI
	.type	MxBTST_MI_ARI,@function
MxBTST_MI_ARI:                          ; @MxBTST_MI_ARI
	.cfi_startproc
; %bb.0:
	btst	#0, (%a1)
	btst	#-1, (%a0)
.Lfunc_end4:
	.size	MxBTST_MI_ARI, .Lfunc_end4-MxBTST_MI_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
