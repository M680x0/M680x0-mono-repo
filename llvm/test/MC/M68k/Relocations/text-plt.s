; RUN: llvm-mc -triple m68k -filetype=obj %s -o - \
; RUN:   | llvm-readobj -r -elf-output-style=GNU - | FileCheck %s

	.text
	.globl	TEXT                            ; -- Begin function TEXT
	.type	TEXT,@function
#        Offset    Info           Type            Sym. Value  Sym     S  Addend
# CHECK: 00000002  {{[0-9a-f]+}}  R_68K_PLT16  {{[0-9]*}}  TARGET  +  0
TEXT:                                   ; @TEXT
; %bb.0:
	jsr	(TARGET@PLT,%pc)
.Lfunc_end0:
	.size	TEXT, .Lfunc_end0-TEXT
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
