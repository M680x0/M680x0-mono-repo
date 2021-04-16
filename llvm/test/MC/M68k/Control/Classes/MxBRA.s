	.text
	.file	"MxBRA.mir"
	.globl	MxBRA8                          ; -- Begin function MxBRA8
	.type	MxBRA8,@function
MxBRA8:                                 ; @MxBRA8
	.cfi_startproc
; %bb.0:
	bra	#1
	bra	#42
.Lfunc_end0:
	.size	MxBRA8, .Lfunc_end0-MxBRA8
	.cfi_endproc
                                        ; -- End function
	.globl	MxBRA16                         ; -- Begin function MxBRA16
	.type	MxBRA16,@function
MxBRA16:                                ; @MxBRA16
	.cfi_startproc
; %bb.0:
	bra	#0
	bra	#-1
	bra	#42
.Lfunc_end1:
	.size	MxBRA16, .Lfunc_end1-MxBRA16
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
