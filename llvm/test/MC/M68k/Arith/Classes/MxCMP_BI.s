	.text
	.file	"MxCMP_BI.mir"
	.globl	MxCMP_BI                        ; -- Begin function MxCMP_BI
	.type	MxCMP_BI,@function
MxCMP_BI:                               ; @MxCMP_BI
	.cfi_startproc
; %bb.0:
	cmpi.b	#0, 4294967295
	cmpi.b	#-1, 0
	cmpi.l	#-1, 0
	cmpi.l	#42, 4294967295
.Lfunc_end0:
	.size	MxCMP_BI, .Lfunc_end0-MxCMP_BI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
