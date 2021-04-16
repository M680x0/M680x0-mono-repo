	.text
	.file	"MxBiArOp_RFRR_xEA.mir"
	.globl	MxBiArOp_RFRR_xEA               ; -- Begin function MxBiArOp_RFRR_xEA
	.type	MxBiArOp_RFRR_xEA,@function
MxBiArOp_RFRR_xEA:                      ; @MxBiArOp_RFRR_xEA
	.cfi_startproc
; %bb.0:
	add.w	%d1, %d0
	add.w	%d2, %d3
	add.l	%d1, %d0
	add.l	%a1, %d0
	add.l	%a1, %d7
	add.l	%d1, %a0
.Lfunc_end0:
	.size	MxBiArOp_RFRR_xEA, .Lfunc_end0-MxBiArOp_RFRR_xEA
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
