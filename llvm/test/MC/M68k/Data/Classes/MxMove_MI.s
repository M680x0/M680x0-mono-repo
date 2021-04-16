	.text
	.file	"MxMove_MI.mir"
	.globl	MxMove_MI_ARII                  ; -- Begin function MxMove_MI_ARII
	.type	MxMove_MI_ARII,@function
MxMove_MI_ARII:                         ; @MxMove_MI_ARII
	.cfi_startproc
; %bb.0:
	move.b	#-1, (0,%a0,%d1)
	move.b	#42, (-1,%a0,%d1)
	move.l	#-1, (0,%a1,%d1)
	move.l	#0, (0,%a2,%a2)
.Lfunc_end0:
	.size	MxMove_MI_ARII, .Lfunc_end0-MxMove_MI_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_MI_ARID                  ; -- Begin function MxMove_MI_ARID
	.type	MxMove_MI_ARID,@function
MxMove_MI_ARID:                         ; @MxMove_MI_ARID
	.cfi_startproc
; %bb.0:
	move.b	#0, (0,%a0)
	move.l	#0, (-1,%a1)
	move.l	#0, (-1,%a1)
.Lfunc_end1:
	.size	MxMove_MI_ARID, .Lfunc_end1-MxMove_MI_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_MI_ARI                   ; -- Begin function MxMove_MI_ARI
	.type	MxMove_MI_ARI,@function
MxMove_MI_ARI:                          ; @MxMove_MI_ARI
	.cfi_startproc
; %bb.0:
	move.b	#0, (%a0)
	move.l	#0, (%a1)
	move.l	#0, (%a1)
.Lfunc_end2:
	.size	MxMove_MI_ARI, .Lfunc_end2-MxMove_MI_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
