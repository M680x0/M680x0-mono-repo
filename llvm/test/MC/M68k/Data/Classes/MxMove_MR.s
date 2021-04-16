	.text
	.file	"MxMove_MR.mir"
	.globl	MxMove_MR_ARII                  ; -- Begin function MxMove_MR_ARII
	.type	MxMove_MR_ARII,@function
MxMove_MR_ARII:                         ; @MxMove_MR_ARII
	.cfi_startproc
; %bb.0:
	move.b	%d0, (0,%a0,%d1)
	move.b	%d0, (-1,%a0,%d1)
	move.l	%d0, (0,%a1,%d1)
	move.l	%d1, (0,%a2,%a2)
.Lfunc_end0:
	.size	MxMove_MR_ARII, .Lfunc_end0-MxMove_MR_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_MR_ARID                  ; -- Begin function MxMove_MR_ARID
	.type	MxMove_MR_ARID,@function
MxMove_MR_ARID:                         ; @MxMove_MR_ARID
	.cfi_startproc
; %bb.0:
	move.b	%d0, (0,%a0)
	move.l	%d0, (-1,%a1)
	move.l	%a0, (-1,%a1)
.Lfunc_end1:
	.size	MxMove_MR_ARID, .Lfunc_end1-MxMove_MR_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_MR_ARI                   ; -- Begin function MxMove_MR_ARI
	.type	MxMove_MR_ARI,@function
MxMove_MR_ARI:                          ; @MxMove_MR_ARI
	.cfi_startproc
; %bb.0:
	move.b	%d0, (%a0)
	move.l	%d3, (%a1)
	move.l	%a4, (%a1)
.Lfunc_end2:
	.size	MxMove_MR_ARI, .Lfunc_end2-MxMove_MR_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
