	.text
	.file	"MxCMP_MI.mir"
	.globl	MxCMP_MI_PCI                    ; -- Begin function MxCMP_MI_PCI
	.type	MxCMP_MI_PCI,@function
MxCMP_MI_PCI:                           ; @MxCMP_MI_PCI
	.cfi_startproc
; %bb.0:
	cmpi.b	#0, (-1,%pc,%d1)
	cmpi.b	#-1, (0,%pc,%d0)
	cmpi.l	#-1, (0,%pc,%d7)
	cmpi.l	#42, (-1,%pc,%d1)
.Lfunc_end0:
	.size	MxCMP_MI_PCI, .Lfunc_end0-MxCMP_MI_PCI
	.cfi_endproc
                                        ; -- End function
	.globl	MxCMP_MI_PCD                    ; -- Begin function MxCMP_MI_PCD
	.type	MxCMP_MI_PCD,@function
MxCMP_MI_PCD:                           ; @MxCMP_MI_PCD
	.cfi_startproc
; %bb.0:
	cmpi.b	#0, (0,%pc)
	cmpi.b	#-1, (-1,%pc)
	cmpi.l	#-1, (0,%pc)
	cmpi.l	#42, (0,%pc)
.Lfunc_end1:
	.size	MxCMP_MI_PCD, .Lfunc_end1-MxCMP_MI_PCD
	.cfi_endproc
                                        ; -- End function
	.globl	MxCMP_MI_ARII                   ; -- Begin function MxCMP_MI_ARII
	.type	MxCMP_MI_ARII,@function
MxCMP_MI_ARII:                          ; @MxCMP_MI_ARII
	.cfi_startproc
; %bb.0:
	cmpi.b	#0, (-1,%a1,%a0)
	cmpi.b	#-1, (0,%a0,%a0)
	cmpi.l	#-1, (0,%a6,%a0)
	cmpi.l	#42, (-1,%a1,%a0)
.Lfunc_end2:
	.size	MxCMP_MI_ARII, .Lfunc_end2-MxCMP_MI_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxCMP_MI_ARID                   ; -- Begin function MxCMP_MI_ARID
	.type	MxCMP_MI_ARID,@function
MxCMP_MI_ARID:                          ; @MxCMP_MI_ARID
	.cfi_startproc
; %bb.0:
	cmpi.b	#0, (-1,%a1)
	cmpi.b	#-1, (0,%a0)
	cmpi.l	#-1, (0,%a6)
	cmpi.l	#42, (-1,%a1)
.Lfunc_end3:
	.size	MxCMP_MI_ARID, .Lfunc_end3-MxCMP_MI_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxCMP_MI_ARI                    ; -- Begin function MxCMP_MI_ARI
	.type	MxCMP_MI_ARI,@function
MxCMP_MI_ARI:                           ; @MxCMP_MI_ARI
	.cfi_startproc
; %bb.0:
	cmpi.b	#0, (%a1)
	cmpi.b	#-1, (%a0)
	cmpi.l	#-1, (%a6)
	cmpi.l	#42, (%a1)
.Lfunc_end4:
	.size	MxCMP_MI_ARI, .Lfunc_end4-MxCMP_MI_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
