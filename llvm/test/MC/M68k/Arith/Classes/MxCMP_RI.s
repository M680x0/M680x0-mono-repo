	.text
	.file	"MxCMP_RI.mir"
	.globl	MxCMP_RI                        ; -- Begin function MxCMP_RI
	.type	MxCMP_RI,@function
MxCMP_RI:                               ; @MxCMP_RI
	.cfi_startproc
; %bb.0:
	cmpi.b	#0, %d1
	cmpi.b	#-1, %d0
	cmpi.l	#13, %d7
	cmpi.l	#42, %d1
.Lfunc_end0:
	.size	MxCMP_RI, .Lfunc_end0-MxCMP_RI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
