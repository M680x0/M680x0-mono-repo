	.text
	.file	"MxBiArOp_RFRRF.mir"
	.globl	MxBiArOp_RFRRF                  ; -- Begin function MxBiArOp_RFRRF
	.type	MxBiArOp_RFRRF,@function
MxBiArOp_RFRRF:                         ; @MxBiArOp_RFRRF
	.cfi_startproc
; %bb.0:
	addx.w	%d1, %d0
	addx.w	%d2, %d3
	addx.l	%d1, %d0
	addx.l	%d1, %d7
.Lfunc_end0:
	.size	MxBiArOp_RFRRF, .Lfunc_end0-MxBiArOp_RFRRF
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
