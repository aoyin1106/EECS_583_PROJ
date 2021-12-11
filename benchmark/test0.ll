; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  %in.addr = alloca i32*, align 8
  %out.addr = alloca i32*, align 8
  %cnt.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %in, i32** %in.addr, align 8
  store i32* %out, i32** %out.addr, align 8
  store i32 %cnt, i32* %cnt.addr, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %cnt.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32*, i32** %out.addr, align 8
  %3 = load i32, i32* %2, align 4
  %4 = load i32*, i32** %in.addr, align 8
  store i32 %3, i32* %4, align 4
  %5 = load i32*, i32** %in.addr, align 8
  %incdec.ptr = getelementptr inbounds i32, i32* %5, i32 1
  store i32* %incdec.ptr, i32** %in.addr, align 8
  %6 = load i32*, i32** %out.addr, align 8
  %incdec.ptr1 = getelementptr inbounds i32, i32* %6, i32 1
  store i32* %incdec.ptr1, i32** %out.addr, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !4

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{i32 7, !"frame-pointer", i32 2}
!3 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.mustprogress"}
!6 = !{!"llvm.loop.unroll.disable"}
