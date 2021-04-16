	.text
	.file	"MxMoveCCR.mir"
	.globl	MxMoveToCCR                     ; -- Begin function MxMoveToCCR
	.type	MxMoveToCCR,@function
MxMoveToCCR:                            ; @MxMoveToCCR
	.cfi_startproc
; %bb.0:
	move.w	%d1, %ccr
.Lfunc_end0:
	.size	MxMoveToCCR, .Lfunc_end0-MxMoveToCCR
	.cfi_endproc
                                        ; -- End function
	.globl	MxMoveFromCCR                   ; -- Begin function MxMoveFromCCR
	.type	MxMoveFromCCR,@function
MxMoveFromCCR:                          ; @MxMoveFromCCR
	.cfi_startproc
; %bb.0:
	move.w	%ccr, %d1
.Lfunc_end1:
	.size	MxMoveFromCCR, .Lfunc_end1-MxMoveFromCCR
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
