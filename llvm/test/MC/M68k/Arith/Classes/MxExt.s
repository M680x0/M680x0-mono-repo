	.text
	.file	"MxExt.mir"
	.globl	MxEXT                           ; -- Begin function MxEXT
	.type	MxEXT,@function
MxEXT:                                  ; @MxEXT
	.cfi_startproc
; %bb.0:
	ext.w	%d0
	ext.w	%d3
	ext.l	%d0
	ext.l	%d7
.Lfunc_end0:
	.size	MxEXT, .Lfunc_end0-MxEXT
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
