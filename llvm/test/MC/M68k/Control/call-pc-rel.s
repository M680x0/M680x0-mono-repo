	.text
	.file	"call-pc-rel.mir"
	.globl	BACKWARD                        ; -- Begin function BACKWARD
	.type	BACKWARD,@function
BACKWARD:                               ; @BACKWARD
	.cfi_startproc
; %bb.0:
	nop
	rts
.Lfunc_end0:
	.size	BACKWARD, .Lfunc_end0-BACKWARD
	.cfi_endproc
                                        ; -- End function
	.globl	PCI                             ; -- Begin function PCI
	.type	PCI,@function
PCI:                                    ; @PCI
	.cfi_startproc
; %bb.0:
	jsr	(BACKWARD,%pc,%d0)
	jsr	(FORWARD,%pc,%d0)
.Lfunc_end1:
	.size	PCI, .Lfunc_end1-PCI
	.cfi_endproc
                                        ; -- End function
	.globl	PCD                             ; -- Begin function PCD
	.type	PCD,@function
PCD:                                    ; @PCD
	.cfi_startproc
; %bb.0:
	jsr	(BACKWARD,%pc)
	jsr	(FORWARD,%pc)
.Lfunc_end2:
	.size	PCD, .Lfunc_end2-PCD
	.cfi_endproc
                                        ; -- End function
	.globl	FORWARD                         ; -- Begin function FORWARD
	.type	FORWARD,@function
FORWARD:                                ; @FORWARD
	.cfi_startproc
; %bb.0:
	nop
	rts
.Lfunc_end3:
	.size	FORWARD, .Lfunc_end3-FORWARD
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
