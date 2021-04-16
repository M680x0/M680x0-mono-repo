	.text
	.file	"MxScc.mir"
	.globl	MxScc_D                         ; -- Begin function MxScc_D
	.type	MxScc_D,@function
MxScc_D:                                ; @MxScc_D
	.cfi_startproc
; %bb.0:
	st	%d0
	sf	%d1
	shi	%d2
	sls	%d3
	scc	%d4
	scs	%d5
	sne	%d6
	seq	%d7
	svc	%d0
	svs	%d0
	spl	%d0
	smi	%d0
	sge	%d0
	slt	%d0
	sgt	%d0
	sle	%d0
.Lfunc_end0:
	.size	MxScc_D, .Lfunc_end0-MxScc_D
	.cfi_endproc
                                        ; -- End function
	.globl	MxScc_ARID                      ; -- Begin function MxScc_ARID
	.type	MxScc_ARID,@function
MxScc_ARID:                             ; @MxScc_ARID
	.cfi_startproc
; %bb.0:
	st	(-1,%a0)
	sf	(42,%a1)
	shi	(0,%a2)
	sls	(0,%a3)
	scc	(0,%a4)
	scs	(0,%a5)
	sne	(0,%a6)
	seq	(0,%a0)
	svc	(0,%a0)
	svs	(0,%a0)
	spl	(0,%a0)
	smi	(0,%a0)
	sge	(0,%a0)
	slt	(0,%a0)
	sgt	(0,%a0)
	sle	(0,%a0)
.Lfunc_end1:
	.size	MxScc_ARID, .Lfunc_end1-MxScc_ARID
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
