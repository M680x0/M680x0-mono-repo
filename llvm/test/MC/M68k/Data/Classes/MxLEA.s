	.text
	.file	"MxLEA.mir"
	.globl	MxLEA_PCD                       ; -- Begin function MxLEA_PCD
	.type	MxLEA_PCD,@function
MxLEA_PCD:                              ; @MxLEA_PCD
	.cfi_startproc
; %bb.0:
	lea	(0,%pc), %a0
	lea	(-1,%pc), %a0
.Lfunc_end0:
	.size	MxLEA_PCD, .Lfunc_end0-MxLEA_PCD
	.cfi_endproc
                                        ; -- End function
	.globl	MxLEA_ARII                      ; -- Begin function MxLEA_ARII
	.type	MxLEA_ARII,@function
MxLEA_ARII:                             ; @MxLEA_ARII
	.cfi_startproc
; %bb.0:
	lea	(0,%a1,%d1), %a0
	lea	(0,%a2,%a2), %a1
.Lfunc_end1:
	.size	MxLEA_ARII, .Lfunc_end1-MxLEA_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxLEA_ARID                      ; -- Begin function MxLEA_ARID
	.type	MxLEA_ARID,@function
MxLEA_ARID:                             ; @MxLEA_ARID
	.cfi_startproc
; %bb.0:
	lea	(-1,%a1), %a0
	lea	(-1,%a1), %a0
.Lfunc_end2:
	.size	MxLEA_ARID, .Lfunc_end2-MxLEA_ARID
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
