	.text
	.file	"MxDiMu.mir"
	.globl	MxDiMu                          ; -- Begin function MxDiMu
	.type	MxDiMu,@function
MxDiMu:                                 ; @MxDiMu
	.cfi_startproc
; %bb.0:
	divs	%d1, %d0
	divu	%d1, %d0
	divs	#0, %d0
	divu	#-1, %d0
	muls	%d1, %d0
	mulu	%d1, %d0
	muls	#0, %d0
	mulu	#-1, %d0
.Lfunc_end0:
	.size	MxDiMu, .Lfunc_end0-MxDiMu
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
