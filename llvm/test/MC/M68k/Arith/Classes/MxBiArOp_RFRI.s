	.text
	.file	"MxBiArOp_RFRI.mir"
	.globl	MxBiArOp_RFRI                   ; -- Begin function MxBiArOp_RFRI
	.type	MxBiArOp_RFRI,@function
MxBiArOp_RFRI:                          ; @MxBiArOp_RFRI
	.cfi_startproc
; %bb.0:
	eori.w	#0, %d0
	eori.w	#-1, %d3
	eori.l	#-1, %d0
	eori.l	#131071, %d0
	eori.l	#458752, %d7
.Lfunc_end0:
	.size	MxBiArOp_RFRI, .Lfunc_end0-MxBiArOp_RFRI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
