	.text
	.file	"MxBiArOp_RFRR_EAd.mir"
	.globl	MxBiArOp_RFRR_EAd               ; -- Begin function MxBiArOp_RFRR_EAd
	.type	MxBiArOp_RFRR_EAd,@function
MxBiArOp_RFRR_EAd:                      ; @MxBiArOp_RFRR_EAd
	.cfi_startproc
; %bb.0:
	eor.w	%d1, %d0
	eor.w	%d2, %d3
	eor.l	%d1, %d0
	eor.l	%d1, %d7
.Lfunc_end0:
	.size	MxBiArOp_RFRR_EAd, .Lfunc_end0-MxBiArOp_RFRR_EAd
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
