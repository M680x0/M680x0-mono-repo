	.text
	.file	"text-plt.mir"
	.globl	TEXT                            ; -- Begin function TEXT
	.type	TEXT,@function
TEXT:                                   ; @TEXT
	.cfi_startproc
; %bb.0:
	jsr	(TARGET@PLT,%pc)
.Lfunc_end0:
	.size	TEXT, .Lfunc_end0-TEXT
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
