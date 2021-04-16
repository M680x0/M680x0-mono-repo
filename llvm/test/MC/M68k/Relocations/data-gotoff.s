	.text
	.file	"data-gotoff.mir"
	.globl	DATA                            ; -- Begin function DATA
	.type	DATA,@function
DATA:                                   ; @DATA
	.cfi_startproc
; %bb.0:
	lea	(_GLOBAL_OFFSET_TABLE_@GOTPCREL,%pc), %a5
	move.l	(dst@GOTOFF,%a5,%d0), %d0
	move.l	(dst@GOTOFF,%a5), %d0
.Lfunc_end0:
	.size	DATA, .Lfunc_end0-DATA
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
