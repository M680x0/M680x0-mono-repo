	.text
	.file	"MxNEG.mir"
	.globl	MxNEG                           ; -- Begin function MxNEG
	.type	MxNEG,@function
MxNEG:                                  ; @MxNEG
	.cfi_startproc
; %bb.0:
	neg.b	%d0
	neg.l	%d0
.Lfunc_end0:
	.size	MxNEG, .Lfunc_end0-MxNEG
	.cfi_endproc
                                        ; -- End function
	.globl	MxNEGX                          ; -- Begin function MxNEGX
	.type	MxNEGX,@function
MxNEGX:                                 ; @MxNEGX
	.cfi_startproc
; %bb.0:
	negx.b	%d0
	negx.l	%d0
.Lfunc_end1:
	.size	MxNEGX, .Lfunc_end1-MxNEGX
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
