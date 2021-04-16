	.text
	.file	"branch-pc-rel.mir"
	.globl	TEXT                            ; -- Begin function TEXT
	.type	TEXT,@function
TEXT:                                   ; @TEXT
	.cfi_startproc
; %bb.0:
	beq	.LBB0_1
	bra	.LBB0_2
.LBB0_1:
	add.l	#0, %d0
	rts
.LBB0_2:
	add.l	#1, %d0
	rts
.Lfunc_end0:
	.size	TEXT, .Lfunc_end0-TEXT
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
