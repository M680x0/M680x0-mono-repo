	.text
	.file	"branch.mir"
	.globl	TIGHT                           ; -- Begin function TIGHT
	.type	TIGHT,@function
TIGHT:                                  ; @TIGHT
	.cfi_startproc
; %bb.0:
	bra	.LBB0_2
; %bb.1:
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
.LBB0_2:
	add.l	#0, %d0
	rts
.Lfunc_end0:
	.size	TIGHT, .Lfunc_end0-TIGHT
	.cfi_endproc
                                        ; -- End function
	.globl	RELAXED                         ; -- Begin function RELAXED
	.type	RELAXED,@function
RELAXED:                                ; @RELAXED
	.cfi_startproc
; %bb.0:
	bra	.LBB1_2
; %bb.1:
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
	move.l	0, 0
.LBB1_2:
	add.l	#0, %d0
	rts
.Lfunc_end1:
	.size	RELAXED, .Lfunc_end1-RELAXED
	.cfi_endproc
                                        ; -- End function
	.globl	ZERO                            ; -- Begin function ZERO
	.type	ZERO,@function
ZERO:                                   ; @ZERO
	.cfi_startproc
; %bb.0:
	bra	.LBB2_1
.LBB2_1:
	add.l	#0, %d0
	rts
.Lfunc_end2:
	.size	ZERO, .Lfunc_end2-ZERO
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
