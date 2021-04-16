	.text
	.file	"data-gotpcrel.mir"
	.globl	DATA                            ; -- Begin function DATA
	.type	DATA,@function
DATA:                                   ; @DATA
	.cfi_startproc
; %bb.0:
	move.l	(dst@GOTPCREL,%pc,%d0), %a0
	move.l	(dst@GOTPCREL,%pc), %a0
.Lfunc_end0:
	.size	DATA, .Lfunc_end0-DATA
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
