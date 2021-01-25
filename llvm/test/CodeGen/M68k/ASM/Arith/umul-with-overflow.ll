; RUN: llc < %s -mtriple=m68k-linux-gnu -verify-machineinstrs| FileCheck %s -check-prefix=x00

declare {i32, i1} @llvm.umul.with.overflow.i32(i32 %a, i32 %b)

; x00-LABEL: a:
; x00-NOT:   asr
; x00:       jsr __muldi3
; x00-NEXT   cmpi.l #0, %d1
; x00-NEXT   sne
define i1 @a(i32 %x)  nounwind {
  %res = call {i32, i1} @llvm.umul.with.overflow.i32(i32 %x, i32 3)
  %obil = extractvalue {i32, i1} %res, 1
  ret i1 %obil
}

; x00-LABEL: test2:
; x00:       add.l
; x00-NEXT:  add.l
; x00-NEXT:  rts
define i32 @test2(i32 %a, i32 %b) nounwind readnone {
entry:
	%tmp0 = add i32 %b, %a
	%tmp1 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %tmp0, i32 2)
	%tmp2 = extractvalue { i32, i1 } %tmp1, 0
	ret i32 %tmp2
}

; It shouldn't fallback to builtin in this scenario
; Since we don't need the overflow bit here
; x00-LABEL: test3:
; x00:       add.l
; x00-NOT:   jsr __muldi3
; x00:       lsl.l
define i32 @test3(i32 %a, i32 %b) nounwind readnone {
entry:
	%tmp0 = add i32 %b, %a
	%tmp1 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %tmp0, i32 4)
	%tmp2 = extractvalue { i32, i1 } %tmp1, 0
	ret i32 %tmp2
}
