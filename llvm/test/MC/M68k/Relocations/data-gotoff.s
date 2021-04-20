; RUN: llvm-mc -triple m68k -filetype=obj %s -o - \
; RUN:   | llvm-readobj -r -elf-output-style=GNU - | FileCheck %s

        .text
	.globl	DATA                            ; -- Begin function DATA
	.type	DATA,@function
#        Offset    Info           Type                 Sym. Value  Sym                    S  Addend
# CHECK: 00000002  {{[0-9a-f]+}}  R_68K_GOTPCREL16  {{[0-9]*}}  _GLOBAL_OFFSET_TABLE_  +  0
# CHECK: 00000007  {{[0-9a-f]+}}  R_68K_GOTOFF8     {{[0-9]*}}  dst                    +  0
# CHECK: 0000000a  {{[0-9a-f]+}}  R_68K_GOTOFF16    {{[0-9]*}}  dst                    +  0
DATA:                                   ; @DATA
; %bb.0:
	lea	(_GLOBAL_OFFSET_TABLE_@GOTPCREL,%pc), %a5
	move.l	(dst@GOTOFF,%a5,%d0), %d0
	move.l	(dst@GOTOFF,%a5), %d0
.Lfunc_end0:
	.size	DATA, .Lfunc_end0-DATA
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
