	.text
	.file	"MxCALL.mir"
	.globl	MxCALL_PCI                      ; -- Begin function MxCALL_PCI
	.type	MxCALL_PCI,@function
MxCALL_PCI:                             ; @MxCALL_PCI
	.cfi_startproc
; %bb.0:
	jsr	(0,%pc,%a0)
	jsr	(-1,%pc,%a0)
	jsr	(42,%pc,%a0)
.Lfunc_end0:
	.size	MxCALL_PCI, .Lfunc_end0-MxCALL_PCI
	.cfi_endproc
                                        ; -- End function
	.globl	MxCALL_PCD                      ; -- Begin function MxCALL_PCD
	.type	MxCALL_PCD,@function
MxCALL_PCD:                             ; @MxCALL_PCD
	.cfi_startproc
; %bb.0:
	jsr	(0,%pc)
	jsr	(32767,%pc)
.Lfunc_end1:
	.size	MxCALL_PCD, .Lfunc_end1-MxCALL_PCD
	.cfi_endproc
                                        ; -- End function
	.globl	MxCALL_ABS                      ; -- Begin function MxCALL_ABS
	.type	MxCALL_ABS,@function
MxCALL_ABS:                             ; @MxCALL_ABS
	.cfi_startproc
; %bb.0:
	jsr	42
	jsr	4294967295
.Lfunc_end2:
	.size	MxCALL_ABS, .Lfunc_end2-MxCALL_ABS
	.cfi_endproc
                                        ; -- End function
	.globl	MxCALL_ARI                      ; -- Begin function MxCALL_ARI
	.type	MxCALL_ARI,@function
MxCALL_ARI:                             ; @MxCALL_ARI
	.cfi_startproc
; %bb.0:
	jsr	(%a0)
	jsr	(%a1)
	jsr	(%a2)
.Lfunc_end3:
	.size	MxCALL_ARI, .Lfunc_end3-MxCALL_ARI
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
