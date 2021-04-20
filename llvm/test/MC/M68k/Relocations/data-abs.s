; RUN: llvm-mc -triple m68k -filetype=obj %s -o - \
; RUN:   | llvm-readobj -r -elf-output-style=GNU - | FileCheck %s

        .text
	.globl	DATA                            ; -- Begin function DATA
	.type	DATA,@function
#        Offset    Info           Type         Sym. Value  Sym S Addend
# CHECK: 00000002  {{[0-9a-f]+}}  R_68K_32  {{[0-9]*}}  dst + 0
DATA:                                   ; @DATA
; %bb.0:
	move.l	dst, %d0
.Lfunc_end0:
	.size	DATA, .Lfunc_end0-DATA
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
