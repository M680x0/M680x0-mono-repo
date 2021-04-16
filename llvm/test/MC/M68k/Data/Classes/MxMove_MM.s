	.text
	.file	"MxMove_MM.mir"
	.globl	MxMove_RM_ARI_PCI               ; -- Begin function MxMove_RM_ARI_PCI
	.type	MxMove_RM_ARI_PCI,@function
MxMove_RM_ARI_PCI:                      ; @MxMove_RM_ARI_PCI
	.cfi_startproc
; %bb.0:
	move.b	(0,%pc,%d1), (%a0)
	move.b	(-1,%pc,%d1), (%a0)
	move.l	(0,%pc,%d1), (%a0)
	move.l	(0,%pc,%a2), (%a1)
.Lfunc_end0:
	.size	MxMove_RM_ARI_PCI, .Lfunc_end0-MxMove_RM_ARI_PCI
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_RM_PCD                   ; -- Begin function MxMove_RM_PCD
	.type	MxMove_RM_PCD,@function
MxMove_RM_PCD:                          ; @MxMove_RM_PCD
	.cfi_startproc
; %bb.0:
	move.b	(0,%pc), (%a0)
	move.l	(-1,%pc), (%a0)
	move.l	(-1,%pc), (%a0)
.Lfunc_end1:
	.size	MxMove_RM_PCD, .Lfunc_end1-MxMove_RM_PCD
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_RM_ARII_ARII             ; -- Begin function MxMove_RM_ARII_ARII
	.type	MxMove_RM_ARII_ARII,@function
MxMove_RM_ARII_ARII:                    ; @MxMove_RM_ARII_ARII
	.cfi_startproc
; %bb.0:
	move.b	(0,%a0,%d1), (-1,%a0,%d1)
	move.b	(-1,%a0,%d1), (-1,%a0,%d1)
	move.l	(0,%a1,%d1), (0,%a1,%d1)
	move.l	(42,%a2,%a2), (0,%a2,%a2)
.Lfunc_end2:
	.size	MxMove_RM_ARII_ARII, .Lfunc_end2-MxMove_RM_ARII_ARII
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_RM_ARID                  ; -- Begin function MxMove_RM_ARID
	.type	MxMove_RM_ARID,@function
MxMove_RM_ARID:                         ; @MxMove_RM_ARID
	.cfi_startproc
; %bb.0:
	move.b	(0,%a0), (0,%a0)
	move.l	(-1,%a1), (0,%a1)
	move.l	(42,%a1), (-1,%a1)
.Lfunc_end3:
	.size	MxMove_RM_ARID, .Lfunc_end3-MxMove_RM_ARID
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_RM_ARIPD                 ; -- Begin function MxMove_RM_ARIPD
	.type	MxMove_RM_ARIPD,@function
MxMove_RM_ARIPD:                        ; @MxMove_RM_ARIPD
	.cfi_startproc
; %bb.0:
	move.b	-(%a0), -(%a0)
	move.l	-(%a1), -(%a1)
	move.l	-(%a1), -(%a1)
.Lfunc_end4:
	.size	MxMove_RM_ARIPD, .Lfunc_end4-MxMove_RM_ARIPD
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_RM_ARIPI                 ; -- Begin function MxMove_RM_ARIPI
	.type	MxMove_RM_ARIPI,@function
MxMove_RM_ARIPI:                        ; @MxMove_RM_ARIPI
	.cfi_startproc
; %bb.0:
	move.b	(%a0)+, (%a0)+
	move.l	(%a1)+, (%a1)+
	move.l	(%a1)+, (%a1)+
.Lfunc_end5:
	.size	MxMove_RM_ARIPI, .Lfunc_end5-MxMove_RM_ARIPI
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_RM_ARI                   ; -- Begin function MxMove_RM_ARI
	.type	MxMove_RM_ARI,@function
MxMove_RM_ARI:                          ; @MxMove_RM_ARI
	.cfi_startproc
; %bb.0:
	move.b	(%a0), (%a0)
	move.l	(%a1), (%a1)
	move.l	(%a1), (%a1)
.Lfunc_end6:
	.size	MxMove_RM_ARI, .Lfunc_end6-MxMove_RM_ARI
	.cfi_endproc
                                        ; -- End function
	.globl	MxMove_RM_ABS                   ; -- Begin function MxMove_RM_ABS
	.type	MxMove_RM_ABS,@function
MxMove_RM_ABS:                          ; @MxMove_RM_ABS
	.cfi_startproc
; %bb.0:
	move.b	4294967295, 0
	move.l	0, 4294967295
	move.l	2147483647, 0
.Lfunc_end7:
	.size	MxMove_RM_ABS, .Lfunc_end7-MxMove_RM_ABS
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
