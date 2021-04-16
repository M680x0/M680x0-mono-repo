	.text
	.file	"MxBcc.mir"
	.globl	MxBcc8                          ; -- Begin function MxBcc8
	.type	MxBcc8,@function
MxBcc8:                                 ; @MxBcc8
	.cfi_startproc
; %bb.0:
	bhi	#1
	bls	#42
	bcc	#1
	bcs	#1
	bne	#1
	beq	#1
	bvc	#1
	bvs	#1
	bpl	#1
	bmi	#1
	bge	#1
	blt	#1
	bgt	#1
	ble	#1
.Lfunc_end0:
	.size	MxBcc8, .Lfunc_end0-MxBcc8
	.cfi_endproc
                                        ; -- End function
	.globl	MxBcc16                         ; -- Begin function MxBcc16
	.type	MxBcc16,@function
MxBcc16:                                ; @MxBcc16
	.cfi_startproc
; %bb.0:
	bhi	#-1
	bls	#42
	bcc	#0
	bcs	#0
	bne	#0
	beq	#0
	bvc	#0
	bvs	#0
	bpl	#0
	bmi	#0
	bge	#0
	blt	#0
	bgt	#0
	ble	#0
.Lfunc_end1:
	.size	MxBcc16, .Lfunc_end1-MxBcc16
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
