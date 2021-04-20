; RUN: llvm-mc -triple m68k -filetype=obj %s -o - \
; RUN:   | llvm-readobj -r -elf-output-style=GNU - | FileCheck %s

        .text
	.globl	DATA                            ; -- Begin function DATA
	.type	DATA,@function
#            Offset    Info        Type           Sym. Value  Sym  S  Addend
# CHECK:     00000003  {{[0-9]+}}  R_68K_PC8   {{[0-9]*}}  dst  +  1
# CHECK:     00000006  {{[0-9]+}}  R_68K_PC16  {{[0-9]*}}  dst  +  0
# No need for relocation here
# CHECK-NOT: 0000000a  {{[0-9]+}}  R_68K_PC16              0
DATA:                                   ; @DATA
; %bb.0:
	move.l	(dst,%pc,%a0), %a0
	move.l	(dst,%pc), %a0
	move.l	(0,%pc), %a0
.Lfunc_end0:
	.size	DATA, .Lfunc_end0-DATA
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
