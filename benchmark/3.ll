Args: clang (LLVM option parsing) -machine-sink-split=0 -treat-scalable-fixed-error-as-warning -debug -print-after-all 
Clearing AST...
*** IR Dump After Annotation2MetadataPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  %in.addr = alloca i32*, align 4
  %out.addr = alloca i32*, align 4
  %cnt.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %in, i32** %in.addr, align 4, !tbaa !3
  store i32* %out, i32** %out.addr, align 4, !tbaa !3
  store i32 %cnt, i32* %cnt.addr, align 4, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #2
  store i32 0, i32* %i, align 4, !tbaa !7
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !tbaa !7
  %2 = load i32, i32* %cnt.addr, align 4, !tbaa !7
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %4 = load i32, i32* %3, align 4, !tbaa !7
  %5 = load i32*, i32** %in.addr, align 4, !tbaa !3
  store i32 %4, i32* %5, align 4, !tbaa !7
  %6 = load i32*, i32** %in.addr, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %6, i32 1
  store i32* %incdec.ptr, i32** %in.addr, align 4, !tbaa !3
  %7 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %incdec.ptr1 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr1, i32** %out.addr, align 4, !tbaa !3
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !tbaa !7
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4, !tbaa !7
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %9 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #2
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
*** IR Dump After ForceFunctionAttrsPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  %in.addr = alloca i32*, align 4
  %out.addr = alloca i32*, align 4
  %cnt.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %in, i32** %in.addr, align 4, !tbaa !3
  store i32* %out, i32** %out.addr, align 4, !tbaa !3
  store i32 %cnt, i32* %cnt.addr, align 4, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #2
  store i32 0, i32* %i, align 4, !tbaa !7
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !tbaa !7
  %2 = load i32, i32* %cnt.addr, align 4, !tbaa !7
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %4 = load i32, i32* %3, align 4, !tbaa !7
  %5 = load i32*, i32** %in.addr, align 4, !tbaa !3
  store i32 %4, i32* %5, align 4, !tbaa !7
  %6 = load i32*, i32** %in.addr, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %6, i32 1
  store i32* %incdec.ptr, i32** %in.addr, align 4, !tbaa !3
  %7 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %incdec.ptr1 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr1, i32** %out.addr, align 4, !tbaa !3
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !tbaa !7
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4, !tbaa !7
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %9 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #2
  ret void
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
*** IR Dump After InferFunctionAttrsPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  %in.addr = alloca i32*, align 4
  %out.addr = alloca i32*, align 4
  %cnt.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %in, i32** %in.addr, align 4, !tbaa !3
  store i32* %out, i32** %out.addr, align 4, !tbaa !3
  store i32 %cnt, i32* %cnt.addr, align 4, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #2
  store i32 0, i32* %i, align 4, !tbaa !7
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !tbaa !7
  %2 = load i32, i32* %cnt.addr, align 4, !tbaa !7
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %4 = load i32, i32* %3, align 4, !tbaa !7
  %5 = load i32*, i32** %in.addr, align 4, !tbaa !3
  store i32 %4, i32* %5, align 4, !tbaa !7
  %6 = load i32*, i32** %in.addr, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %6, i32 1
  store i32* %incdec.ptr, i32** %in.addr, align 4, !tbaa !3
  %7 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %incdec.ptr1 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr1, i32** %out.addr, align 4, !tbaa !3
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !tbaa !7
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4, !tbaa !7
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %9 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #2
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
*** IR Dump After LowerExpectIntrinsicPass on test ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  %in.addr = alloca i32*, align 4
  %out.addr = alloca i32*, align 4
  %cnt.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %in, i32** %in.addr, align 4, !tbaa !3
  store i32* %out, i32** %out.addr, align 4, !tbaa !3
  store i32 %cnt, i32* %cnt.addr, align 4, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #2
  store i32 0, i32* %i, align 4, !tbaa !7
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, i32* %i, align 4, !tbaa !7
  %2 = load i32, i32* %cnt.addr, align 4, !tbaa !7
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %4 = load i32, i32* %3, align 4, !tbaa !7
  %5 = load i32*, i32** %in.addr, align 4, !tbaa !3
  store i32 %4, i32* %5, align 4, !tbaa !7
  %6 = load i32*, i32** %in.addr, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %6, i32 1
  store i32* %incdec.ptr, i32** %in.addr, align 4, !tbaa !3
  %7 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %incdec.ptr1 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr1, i32** %out.addr, align 4, !tbaa !3
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %8 = load i32, i32* %i, align 4, !tbaa !7
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4, !tbaa !7
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %9 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #2
  ret void
}

Features:+v60,-long-calls
CPU:hexagonv60
TuneCPU:hexagonv60

Merging: for.inc into for.body
*** IR Dump After SimplifyCFGPass on test ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  %in.addr = alloca i32*, align 4
  %out.addr = alloca i32*, align 4
  %cnt.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store i32* %in, i32** %in.addr, align 4, !tbaa !3
  store i32* %out, i32** %out.addr, align 4, !tbaa !3
  store i32 %cnt, i32* %cnt.addr, align 4, !tbaa !7
  %0 = bitcast i32* %i to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #2
  store i32 0, i32* %i, align 4, !tbaa !7
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %1 = load i32, i32* %i, align 4, !tbaa !7
  %2 = load i32, i32* %cnt.addr, align 4, !tbaa !7
  %cmp = icmp slt i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %4 = load i32, i32* %3, align 4, !tbaa !7
  %5 = load i32*, i32** %in.addr, align 4, !tbaa !3
  store i32 %4, i32* %5, align 4, !tbaa !7
  %6 = load i32*, i32** %in.addr, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %6, i32 1
  store i32* %incdec.ptr, i32** %in.addr, align 4, !tbaa !3
  %7 = load i32*, i32** %out.addr, align 4, !tbaa !3
  %incdec.ptr1 = getelementptr inbounds i32, i32* %7, i32 1
  store i32* %incdec.ptr1, i32** %out.addr, align 4, !tbaa !3
  %8 = load i32, i32* %i, align 4, !tbaa !7
  %inc = add nsw i32 %8, 1
  store i32 %inc, i32* %i, align 4, !tbaa !7
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  %9 = bitcast i32* %i to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #2
  ret void
}
SROA function: test
SROA alloca:   %i = alloca i32, align 4
  Rewriting FCA loads and stores...
Slices of alloca:   %i = alloca i32, align 4
  [0,4) slice #0 (splittable)
    used by:   call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #2
  [0,4) slice #1 (splittable)
    used by:   store i32 0, i32* %i, align 4, !tbaa !7
  [0,4) slice #2 (splittable)
    used by:   %1 = load i32, i32* %i, align 4, !tbaa !7
  [0,4) slice #3 (splittable)
    used by:   %8 = load i32, i32* %i, align 4, !tbaa !7
  [0,4) slice #4 (splittable)
    used by:   store i32 %inc, i32* %i, align 4, !tbaa !7
  [0,4) slice #5 (splittable)
    used by:   call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #2
Pre-splitting loads and stores
  Searching for candidate loads and stores
Rewriting alloca partition [0,4) to:   %i = alloca i32, align 4
  rewriting [0,4) slice #0 (splittable)
    original:   call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #2
          to:   call void @llvm.lifetime.start.p0i8(i64 4, i8* %i.0..sroa_cast)
  rewriting [0,4) slice #1 (splittable)
    original:   store i32 0, i32* %i, align 4, !tbaa !7
          to:   store i32 0, i32* %i, align 4, !tbaa !7
  rewriting [0,4) slice #2 (splittable)
    original:   %1 = load i32, i32* %i, align 4, !tbaa !7
          to:   %i.0.load = load i32, i32* %i, align 4
  rewriting [0,4) slice #3 (splittable)
    original:   %8 = load i32, i32* %i, align 4, !tbaa !7
          to:   %i.0.load2 = load i32, i32* %i, align 4
  rewriting [0,4) slice #4 (splittable)
    original:   store i32 %inc, i32* %i, align 4, !tbaa !7
          to:   store i32 %inc, i32* %i, align 4, !tbaa !7
  rewriting [0,4) slice #5 (splittable)
    original:   call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #2
          to:   call void @llvm.lifetime.end.p0i8(i64 4, i8* %i.0..sroa_cast3)
  Speculating PHIs
  Speculating Selects
Deleting dead instruction:   call void @llvm.lifetime.end.p0i8(i64 4, i8* %9) #2
Deleting dead instruction:   %9 = bitcast i32* %i to i8*
Deleting dead instruction:   store i32 %inc, i32* %i, align 4, !tbaa !7
Deleting dead instruction:   %8 = load i32, i32* %i, align 4, !tbaa !7
Deleting dead instruction:   %1 = load i32, i32* %i, align 4, !tbaa !7
Deleting dead instruction:   store i32 0, i32* %i, align 4, !tbaa !7
Deleting dead instruction:   call void @llvm.lifetime.start.p0i8(i64 4, i8* %0) #2
Deleting dead instruction:   %0 = bitcast i32* %i to i8*
SROA alloca:   %cnt.addr = alloca i32, align 4
  Rewriting FCA loads and stores...
Slices of alloca:   %cnt.addr = alloca i32, align 4
  [0,4) slice #0 (splittable)
    used by:   store i32 %cnt, i32* %cnt.addr, align 4, !tbaa !7
  [0,4) slice #1 (splittable)
    used by:   %0 = load i32, i32* %cnt.addr, align 4, !tbaa !7
Pre-splitting loads and stores
  Searching for candidate loads and stores
Rewriting alloca partition [0,4) to:   %cnt.addr = alloca i32, align 4
  rewriting [0,4) slice #0 (splittable)
    original:   store i32 %cnt, i32* %cnt.addr, align 4, !tbaa !7
          to:   store i32 %cnt, i32* %cnt.addr, align 4, !tbaa !7
  rewriting [0,4) slice #1 (splittable)
    original:   %0 = load i32, i32* %cnt.addr, align 4, !tbaa !7
          to:   %cnt.addr.0.load = load i32, i32* %cnt.addr, align 4
  Speculating PHIs
  Speculating Selects
Deleting dead instruction:   %0 = load i32, i32* %cnt.addr, align 4, !tbaa !7
Deleting dead instruction:   store i32 %cnt, i32* %cnt.addr, align 4, !tbaa !7
SROA alloca:   %out.addr = alloca i32*, align 4
  Rewriting FCA loads and stores...
Slices of alloca:   %out.addr = alloca i32*, align 4
  [0,4) slice #0
    used by:   store i32* %out, i32** %out.addr, align 4, !tbaa !3
  [0,4) slice #1
    used by:   %0 = load i32*, i32** %out.addr, align 4, !tbaa !3
  [0,4) slice #2
    used by:   %4 = load i32*, i32** %out.addr, align 4, !tbaa !3
  [0,4) slice #3
    used by:   store i32* %incdec.ptr1, i32** %out.addr, align 4, !tbaa !3
Pre-splitting loads and stores
  Searching for candidate loads and stores
Rewriting alloca partition [0,4) to:   %out.addr = alloca i32*, align 4
  rewriting [0,4) slice #0
    original:   store i32* %out, i32** %out.addr, align 4, !tbaa !3
          to:   store i32* %out, i32** %out.addr, align 4, !tbaa !3
  rewriting [0,4) slice #1
    original:   %0 = load i32*, i32** %out.addr, align 4, !tbaa !3
          to:   %out.addr.0. = load i32*, i32** %out.addr, align 4, !tbaa !3
  rewriting [0,4) slice #2
    original:   %4 = load i32*, i32** %out.addr, align 4, !tbaa !3
          to:   %out.addr.0.4 = load i32*, i32** %out.addr, align 4, !tbaa !3
  rewriting [0,4) slice #3
    original:   store i32* %incdec.ptr1, i32** %out.addr, align 4, !tbaa !3
          to:   store i32* %incdec.ptr1, i32** %out.addr, align 4, !tbaa !3
  Speculating PHIs
  Speculating Selects
Deleting dead instruction:   store i32* %incdec.ptr1, i32** %out.addr, align 4, !tbaa !3
Deleting dead instruction:   %4 = load i32*, i32** %out.addr, align 4, !tbaa !3
Deleting dead instruction:   %0 = load i32*, i32** %out.addr, align 4, !tbaa !3
Deleting dead instruction:   store i32* %out, i32** %out.addr, align 4, !tbaa !3
SROA alloca:   %in.addr = alloca i32*, align 4
  Rewriting FCA loads and stores...
Slices of alloca:   %in.addr = alloca i32*, align 4
  [0,4) slice #0
    used by:   store i32* %in, i32** %in.addr, align 4, !tbaa !3
  [0,4) slice #1
    used by:   %1 = load i32*, i32** %in.addr, align 4, !tbaa !3
  [0,4) slice #2
    used by:   %2 = load i32*, i32** %in.addr, align 4, !tbaa !3
  [0,4) slice #3
    used by:   store i32* %incdec.ptr, i32** %in.addr, align 4, !tbaa !3
Pre-splitting loads and stores
  Searching for candidate loads and stores
Rewriting alloca partition [0,4) to:   %in.addr = alloca i32*, align 4
  rewriting [0,4) slice #0
    original:   store i32* %in, i32** %in.addr, align 4, !tbaa !3
          to:   store i32* %in, i32** %in.addr, align 4, !tbaa !3
  rewriting [0,4) slice #1
    original:   %1 = load i32*, i32** %in.addr, align 4, !tbaa !3
          to:   %in.addr.0. = load i32*, i32** %in.addr, align 4, !tbaa !3
  rewriting [0,4) slice #2
    original:   %2 = load i32*, i32** %in.addr, align 4, !tbaa !3
          to:   %in.addr.0.5 = load i32*, i32** %in.addr, align 4, !tbaa !3
  rewriting [0,4) slice #3
    original:   store i32* %incdec.ptr, i32** %in.addr, align 4, !tbaa !3
          to:   store i32* %incdec.ptr, i32** %in.addr, align 4, !tbaa !3
  Speculating PHIs
  Speculating Selects
Deleting dead instruction:   store i32* %incdec.ptr, i32** %in.addr, align 4, !tbaa !3
Deleting dead instruction:   %2 = load i32*, i32** %in.addr, align 4, !tbaa !3
Deleting dead instruction:   %1 = load i32*, i32** %in.addr, align 4, !tbaa !3
Deleting dead instruction:   store i32* %in, i32** %in.addr, align 4, !tbaa !3
Promoting allocas with mem2reg...
*** IR Dump After SROAPass on test ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
EarlyCSE CVP: Add conditional value for 'cmp' as i1 true in for.body
EarlyCSE CVP: Add conditional value for 'cmp' as i1 false in for.end
*** IR Dump After EarlyCSEPass on test ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After CoroEarlyPass on test ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After OpenMPOptPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
Visiting   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
Rename Stack is empty
Current DFS numbers are (1,6)
Rename Stack is empty
Current DFS numbers are (2,3)
Rename Stack Top DFS numbers are (2,3)
Current DFS numbers are (2,3)
Found replacement   %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0) for   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] in   %inc = add nsw i32 %i.0, 1
Rename Stack Top DFS numbers are (2,3)
Current DFS numbers are (4,5)
Marking Block Executable: entry
markOverdefined: i32* %in
markOverdefined: i32* %out
markOverdefined: i32 %cnt

Popped off OI-WL: i32 %cnt

Popped off OI-WL: i32* %out

Popped off OI-WL: i32* %in

Popped off BBWL: 
entry:
  br label %for.cond

Marking Block Executable: for.cond

Popped off BBWL: 
for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0)
  br i1 %cmp, label %for.body, label %for.end

Merged overdefined into   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ] : overdefined
Merged overdefined into   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ] : overdefined
Merged constantrange<0, 1> into   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] : constantrange<0, 1>
markOverdefined:   %cmp = icmp slt i32 %i.0, %cnt
Merged constantrange incl. undef <0, 1> into   %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0) : constantrange incl. undef <0, 1>
Marking Block Executable: for.body
Marking Block Executable: for.end

Popped off BBWL: 
for.end:                                          ; preds = %for.cond
  ret void


Popped off BBWL: 
for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0.0, 1
  br label %for.cond, !llvm.loop !7

Merged overdefined into   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3 : overdefined
markOverdefined:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
markOverdefined:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
Merged constantrange<1, 2> into   %inc = add nsw i32 %i.0.0, 1 : constantrange<1, 2>
Marking Edge Executable: for.body -> for.cond
Merged constantrange<0, 2> into   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] : constantrange<0, 2>

Popped off OI-WL:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1

Popped off OI-WL:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1

Popped off OI-WL:   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3

Popped off OI-WL:   %cmp = icmp slt i32 %i.0, %cnt

Popped off OI-WL:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]

Popped off OI-WL:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]

Popped off I-WL:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
Merged constantrange incl. undef <0, 2> into   %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0) : constantrange incl. undef <0, 2>

Popped off I-WL:   %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0)
Merged constantrange<1, 3> into   %inc = add nsw i32 %i.0.0, 1 : constantrange<1, 3>

Popped off I-WL:   %inc = add nsw i32 %i.0.0, 1
Merged constantrange<0, 3> into   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] : constantrange<0, 3>

Popped off I-WL:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
Merged constantrange incl. undef <0, 3> into   %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0) : constantrange incl. undef <0, 3>

Popped off I-WL:   %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0)
Merged constantrange<1, 4> into   %inc = add nsw i32 %i.0.0, 1 : constantrange<1, 4>

Popped off I-WL:   %inc = add nsw i32 %i.0.0, 1
Merged constantrange<0, 4> into   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] : overdefined

Popped off I-WL:   %inc = add nsw i32 %i.0.0, 1

Popped off I-WL:   %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0)

Popped off I-WL:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]

Popped off OI-WL:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
Merged overdefined into   %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0) : overdefined

Popped off OI-WL:   %i.0.0 = call i32 @llvm.ssa.copy.i32(i32 %i.0)
Merged overdefined into   %inc = add nsw i32 %i.0.0, 1 : overdefined

Popped off OI-WL:   %inc = add nsw i32 %i.0.0, 1
RESOLVING UNDEFS
*** IR Dump After IPSCCPPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
Marking Block Executable: entry

Popped off BBWL: 
entry:
  br label %for.cond
Marking Edge Executable: entry -> for.cond
Marking Block Executable: for.cond

Popped off BBWL: 
for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end
Marking Edge Executable: for.cond -> for.body
Marking Block Executable: for.body
Marking Edge Executable: for.cond -> for.end
Marking Block Executable: for.end

Popped off BBWL: 
for.end:                                          ; preds = %for.cond
  ret void

Popped off BBWL: 
for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7
Marking Edge Executable: for.body -> for.cond

Popped off V-WL:   %inc = add nsw i32 %i.0, 1

Popped off V-WL:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1

Popped off V-WL:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1

Popped off V-WL:   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3

Popped off V-WL:   %cmp = icmp slt i32 %i.0, %cnt

Popped off V-WL:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]

Popped off V-WL:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]

Popped off V-WL:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
*** IR Dump After CalledValuePropagationPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
GLOBAL DEAD: ; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

GLOBAL DEAD: ; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

*** IR Dump After GlobalOptPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
*** IR Dump After PromotePass on test ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
DeadArgumentEliminationPass - Deleting dead varargs
DeadArgumentEliminationPass - Determining liveness
DeadArgumentEliminationPass - Intrinsically live fn: test
*** IR Dump After DeadArgumentEliminationPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}


INSTCOMBINE ITERATION #1 on test
ADD:   br label %for.cond, !llvm.loop !7
ADD:   %inc = add nsw i32 %i.0, 1
ADD:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
ADD:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
ADD:   store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
ADD:   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
ADD:   ret void
ADD:   br i1 %cmp, label %for.body, label %for.end
ADD:   %cmp = icmp slt i32 %i.0, %cnt
ADD:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
ADD:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
ADD:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
ADD:   br label %for.cond
IC: Visiting:   br label %for.cond
IC: Visiting:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
IC: Visiting:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
IC: Visiting:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
IC: Visiting:   %cmp = icmp slt i32 %i.0, %cnt
IC: Visiting:   br i1 %cmp, label %for.body, label %for.end
IC: Visiting:   ret void
IC: Visiting:   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
IC: Visiting:   store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
IC: Visiting:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
IC: Visiting:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
IC: Visiting:   %inc = add nsw i32 %i.0, 1
IC: Mod =   %inc = add nsw i32 %i.0, 1
    New =   %inc = add nuw nsw i32 %i.0, 1
ADD:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
ADD:   %inc = add nuw nsw i32 %i.0, 1
IC: Visiting:   %inc = add nuw nsw i32 %i.0, 1
IC: Visiting:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
IC: Visiting:   br label %for.cond, !llvm.loop !7


INSTCOMBINE ITERATION #2 on test
ADD:   br label %for.cond, !llvm.loop !7
ADD:   %inc = add nuw nsw i32 %i.0, 1
ADD:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
ADD:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
ADD:   store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
ADD:   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
ADD:   ret void
ADD:   br i1 %cmp, label %for.body, label %for.end
ADD:   %cmp = icmp slt i32 %i.0, %cnt
ADD:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
ADD:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
ADD:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
ADD:   br label %for.cond
IC: Visiting:   br label %for.cond
IC: Visiting:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
IC: Visiting:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
IC: Visiting:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
IC: Visiting:   %cmp = icmp slt i32 %i.0, %cnt
IC: Visiting:   br i1 %cmp, label %for.body, label %for.end
IC: Visiting:   ret void
IC: Visiting:   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
IC: Visiting:   store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
IC: Visiting:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
IC: Visiting:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
IC: Visiting:   %inc = add nuw nsw i32 %i.0, 1
IC: Visiting:   br label %for.cond, !llvm.loop !7
*** IR Dump After InstCombinePass on test ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After SimplifyCFGPass on test ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
Using default inliner heuristic.
*** IR Dump After RequireAnalysisPass<llvm::GlobalsAA, llvm::Module> on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
*** IR Dump After InvalidateAnalysisPass<llvm::AAManager> on test ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After RequireAnalysisPass<llvm::ProfileSummaryAnalysis, llvm::Module> on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
Building CG for module: test0.c
  Adding 'test' to entry set of the graph.
    Added callable function: test
  Adding functions referenced by global initializers to the entry set.
  Adding functions called by 'test' to the graph.
Running an SCC pass across the RefSCC: [(test)]
*** IR Dump After InlinerPass on (test) ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After InlinerPass on (test) ***
; Function Attrs: nounwind
define dso_local void @test(i32* noalias %in, i32* noalias %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
Adding nofree attr to fn test
Adding nosync attr to fn test
*** IR Dump After PostOrderFunctionAttrsPass on (test) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After OpenMPOptCGSCCPass on (test) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
Running function passes across an SCC: (test)
SROA function: test
*** IR Dump After SROAPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
Starting Memory SSA clobber for   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3 is MemoryUse(2) MayAlias
Optimized Memory SSA clobber for   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3 is 2 = MemoryPhi({entry,liveOnEntry},{for.body,1})
Result Memory SSA clobber [SkipSelf = 0] for   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3 is 2 = MemoryPhi({entry,liveOnEntry},{for.body,1})
EarlyCSE CVP: Add conditional value for 'cmp' as i1 true in for.body
EarlyCSE CVP: Add conditional value for 'cmp' as i1 false in for.end
*** IR Dump After EarlyCSEPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
Not running SpeculativeExecution because TTI->hasBranchDivergence() is false.
*** IR Dump After SpeculativeExecutionPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
Jump threading on function 'test'
*** IR Dump After JumpThreadingPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
LVI Getting edge value i32* %out from 'entry' to 'for.cond'
PUSH: i32* %out in entry
POP i32* %out in entry = overdefined
  Result = overdefined
LVI Getting edge value   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1 from 'for.body' to 'for.cond'
PUSH:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1 in for.body
POP   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1 in for.body = notconstant<i32* null>
  Result = notconstant<i32* null>
LVI Getting edge value i32* %in from 'entry' to 'for.cond'
PUSH: i32* %in in entry
POP i32* %in in entry = overdefined
  Result = overdefined
LVI Getting edge value   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1 from 'for.body' to 'for.cond'
PUSH:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1 in for.body
POP   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1 in for.body = notconstant<i32* null>
  Result = notconstant<i32* null>
LVI Getting edge value   %inc = add nuw nsw i32 %i.0, 1 from 'for.body' to 'for.cond'
PUSH:   %inc = add nuw nsw i32 %i.0, 1 in for.body
PUSH:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] in for.body
PUSH:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] in for.cond
 compute BB 'for.cond' - overdefined because of pred (local).
POP   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] in for.cond = overdefined
POP   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] in for.body = constantrange<-2147483648, 2147483647>
POP   %inc = add nuw nsw i32 %i.0, 1 in for.body = constantrange<1, 0>
  Result = constantrange<1, 0>
LVI Getting block end value i32 %cnt at 'for.cond'
PUSH: i32 %cnt in for.cond
PUSH: i32 %cnt in for.body
POP i32 %cnt in for.body = constantrange<-2147483647, -2147483648>
PUSH: i32 %cnt in entry
POP i32 %cnt in entry = overdefined
 compute BB 'for.cond' - overdefined because of pred (non local).
POP i32 %cnt in for.cond = overdefined
  Result = overdefined
LVI Getting block end value   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] at 'for.cond'
  Result = overdefined
LVI Getting block end value   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ] at 'for.body'
PUSH:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ] in for.body
PUSH:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ] in for.cond
 compute BB 'for.cond' - overdefined because of pred (local).
POP   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ] in for.cond = overdefined
 compute BB 'for.body' - overdefined because of pred (non local).
POP   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ] in for.body = overdefined
  Result = overdefined
LVI Getting block end value   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ] at 'for.body'
PUSH:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ] in for.body
PUSH:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ] in for.cond
 compute BB 'for.cond' - overdefined because of pred (local).
POP   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ] in for.cond = overdefined
 compute BB 'for.body' - overdefined because of pred (non local).
POP   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ] in for.body = overdefined
  Result = overdefined
*** IR Dump After CorrelatedValuePropagationPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After SimplifyCFGPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}


INSTCOMBINE ITERATION #1 on test
ADD:   br label %for.cond, !llvm.loop !7
ADD:   %inc = add nuw nsw i32 %i.0, 1
ADD:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
ADD:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
ADD:   store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
ADD:   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
ADD:   ret void
ADD:   br i1 %cmp, label %for.body, label %for.end
ADD:   %cmp = icmp slt i32 %i.0, %cnt
ADD:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
ADD:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
ADD:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
ADD:   br label %for.cond
IC: Visiting:   br label %for.cond
IC: Visiting:   %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
IC: Visiting:   %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
IC: Visiting:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
IC: Visiting:   %cmp = icmp slt i32 %i.0, %cnt
IC: Visiting:   br i1 %cmp, label %for.body, label %for.end
IC: Visiting:   ret void
IC: Visiting:   %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
IC: Visiting:   store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
IC: Visiting:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
IC: Visiting:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
IC: Visiting:   %inc = add nuw nsw i32 %i.0, 1
IC: Visiting:   br label %for.cond, !llvm.loop !7
*** IR Dump After InstCombinePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After LibCallsShrinkWrapPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After TailCallElimPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After SimplifyCFGPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
Calculated Rank[in] = 3
Calculated Rank[out] = 4
Calculated Rank[cnt] = 5
Combine negations for:   %inc = add nuw nsw i32 %i.0, 1
LINEARIZE:   %inc = add nuw nsw i32 %i.0, 1
OPERAND:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] (1)
ADD USES LEAF:   %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ] (1)
OPERAND: i32 1 (1)
ADD USES LEAF: i32 1 (1)
RAIn:	add i32	[ %i.0, #458755] [ 1, #0] 
RAOut:	add i32	[ %i.0, #458755] [ 1, #0] 
*** IR Dump After ReassociatePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After RequireAnalysisPass<llvm::OptimizationRemarkEmitterAnalysis, llvm::Function> on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After LoopSimplifyPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After LCSSAPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}
*** IR Dump After LoopInstSimplifyPass on Loop at depth 1 containing: %for.cond<header><exiting>,%for.body<latch> ***

; Preheader:
entry:
  br label %for.cond

; Loop:
for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

; Exit blocks
for.end:                                          ; preds = %for.cond
  ret void
In function test: No constant terminator folding candidates found in loop for.cond
*** IR Dump After LoopSimplifyCFGPass on Loop at depth 1 containing: %for.cond<header><exiting>,%for.body<latch> ***

; Preheader:
entry:
  br label %for.cond

; Loop:
for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

; Exit blocks
for.end:                                          ; preds = %for.cond
  ret void
*** IR Dump After LICMPass on Loop at depth 1 containing: %for.cond<header><exiting>,%for.body<latch> ***

; Preheader:
entry:
  br label %for.cond

; Loop:
for.cond:                                         ; preds = %for.body, %entry
  %out.addr.0 = phi i32* [ %out, %entry ], [ %incdec.ptr1, %for.body ]
  %in.addr.0 = phi i32* [ %in, %entry ], [ %incdec.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %cmp = icmp slt i32 %i.0, %cnt
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %0 = load i32, i32* %out.addr.0, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.0, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.0, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.0, i32 1
  %inc = add nuw nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !7

; Exit blocks
for.end:                                          ; preds = %for.cond
  ret void
LoopRotation: rotating Loop at depth 1 containing: %for.cond<header><exiting>,%for.body<latch>
  Inserted PHI:   %out.addr.07 = phi i32* [ %out, %entry ], [ %out.addr.0, %for.cond ]
  Inserted PHI:   %in.addr.08 = phi i32* [ %in, %entry ], [ %in.addr.0, %for.cond ]
  Inserted PHI:   %i.09 = phi i32 [ 0, %entry ], [ %i.0, %for.cond ]
Inserting edge %entry -> %for.end
	Reachable %entry -> %for.end
		NCA == %entry
Mark %for.endas affected, CurrentLevel 2
Updating NCD = %entry
	IDom(%for.end) = %entry
Inserting edge %entry -> %for.body
	Reachable %entry -> %for.body
		NCA == %entry
Mark %for.bodyas affected, CurrentLevel 2
	Successor %for.cond, level = 1
Updating NCD = %entry
	IDom(%for.body) = %entry
Deleting edge %entry -> %for.cond
	NCD %entry, ToIDom %entry
IsReachableFromIDom %for.cond
	Pred %for.body
	Support %entry
	%for.cond is reachable from support %entry
Deleting reachable %entry -> %for.cond
	Rebuilding subtree
The entire tree needs to be rebuilt
Inserting edge %entry -> %entry.for.body_crit_edge
Inserting %entry -> (unreachable) %entry.for.body_crit_edge
After adding unreachable nodes
Inserted %entry -> (prev unreachable) %entry.for.body_crit_edge
Inserting edge %entry.for.body_crit_edge -> %for.body
	Reachable %entry.for.body_crit_edge -> %for.body
		NCA == %entry
Deleting edge %entry -> %for.body
	NCD %entry, ToIDom %entry
IsReachableFromIDom %for.body
	Pred %entry.for.body_crit_edge
	Support %entry
	%for.body is reachable from support %entry
Deleting reachable %entry -> %for.body
	Rebuilding subtree
The entire tree needs to be rebuilt
DomTree recalculated, skipping future batch updates
Inserting edge %for.cond -> %for.cond.for.end_crit_edge
Inserting %for.cond -> (unreachable) %for.cond.for.end_crit_edge
After adding unreachable nodes
Inserted %for.cond -> (prev unreachable) %for.cond.for.end_crit_edge
Inserting edge %for.cond.for.end_crit_edge -> %for.end
	Reachable %for.cond.for.end_crit_edge -> %for.end
		NCA == %entry
Deleting edge %for.cond -> %for.end
	NCD %entry, ToIDom %entry
Deleting reachable %for.cond -> %for.end
	Rebuilding subtree
The entire tree needs to be rebuilt
DomTree recalculated, skipping future batch updates
Merging: for.cond into for.body
Inserting edge %for.body -> %for.body
	Reachable %for.body -> %for.body
		NCA == %for.body
Inserting edge %for.body -> %for.cond.for.end_crit_edge
	Reachable %for.body -> %for.cond.for.end_crit_edge
		NCA == %for.body
Mark %for.cond.for.end_crit_edgeas affected, CurrentLevel 4
	Successor %for.end, level = 1
Updating NCD = %for.body
	IDom(%for.cond.for.end_crit_edge) = %for.body
Deleting edge %for.cond -> %for.body
Deleting edge %for.cond -> %for.cond.for.end_crit_edge
	NCD %for.body, ToIDom %for.body
Deleting reachable %for.cond -> %for.cond.for.end_crit_edge
	Rebuilding subtree
	Top of subtree: %for.body
	Running Semi-NCA
Deleting edge %for.body -> %for.cond
	NCD %for.body, ToIDom %for.body
IsReachableFromIDom %for.cond
Deleting unreachable subtree %for.cond
Erasing node %for.cond
LoopRotation: into Loop at depth 1 containing: %for.body<header><latch><exiting>
*** IR Dump After LoopRotatePass on Loop at depth 1 containing: %for.cond<header><exiting>,%for.body<latch> ***

; Preheader:
for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

; Loop:
for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.09 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %in.addr.08 = phi i32* [ %in, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %out.addr.07 = phi i32* [ %out, %for.body.lr.ph ], [ %incdec.ptr1, %for.body ]
  %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
  %inc = add nuw nsw i32 %i.09, 1
  %cmp = icmp slt i32 %inc, %cnt
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge, !llvm.loop !7

; Exit blocks
for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end
*** IR Dump After LICMPass on Loop at depth 1 containing: %for.body<header><latch><exiting> ***

; Preheader:
for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

; Loop:
for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.09 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %in.addr.08 = phi i32* [ %in, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %out.addr.07 = phi i32* [ %out, %for.body.lr.ph ], [ %incdec.ptr1, %for.body ]
  %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
  %inc = add nuw nsw i32 %i.09, 1
  %cmp = icmp slt i32 %inc, %cnt
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge, !llvm.loop !7

; Exit blocks
for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end
Unswitching loop in test: Loop at depth 1 containing: %for.body<header><latch><exiting>

*** IR Dump After SimpleLoopUnswitchPass on Loop at depth 1 containing: %for.body<header><latch><exiting> ***

; Preheader:
for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

; Loop:
for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.09 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %in.addr.08 = phi i32* [ %in, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %out.addr.07 = phi i32* [ %out, %for.body.lr.ph ], [ %incdec.ptr1, %for.body ]
  %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
  %inc = add nuw nsw i32 %i.09, 1
  %cmp = icmp slt i32 %inc, %cnt
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge, !llvm.loop !7

; Exit blocks
for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end
Looking to fold for.body.lr.ph into for.body
Killing Trivial BB: 

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body
Looking to fold for.cond.for.end_crit_edge into for.end
Killing Trivial BB: 

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end
*** IR Dump After SimplifyCFGPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp slt i32 0, %cnt
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %i.09 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %in.addr.08 = phi i32* [ %incdec.ptr, %for.body ], [ %in, %entry ]
  %out.addr.07 = phi i32* [ %incdec.ptr1, %for.body ], [ %out, %entry ]
  %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
  %inc = add nuw nsw i32 %i.09, 1
  %cmp = icmp slt i32 %inc, %cnt
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !7

for.end:                                          ; preds = %for.body, %entry
  ret void
}


INSTCOMBINE ITERATION #1 on test
ADD:   br i1 %cmp, label %for.body, label %for.end, !llvm.loop !7
ADD:   %cmp = icmp slt i32 %inc, %cnt
ADD:   %inc = add nuw nsw i32 %i.09, 1
ADD:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
ADD:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
ADD:   store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
ADD:   %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
ADD:   %out.addr.07 = phi i32* [ %incdec.ptr1, %for.body ], [ %out, %entry ]
ADD:   %in.addr.08 = phi i32* [ %incdec.ptr, %for.body ], [ %in, %entry ]
ADD:   %i.09 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
ADD:   ret void
ADD:   br i1 %cmp6, label %for.body, label %for.end
ADD:   %cmp6 = icmp slt i32 0, %cnt
IC: Visiting:   %cmp6 = icmp slt i32 0, %cnt
IC: Mod =   %cmp6 = icmp slt i32 0, %cnt
    New =   %cmp6 = icmp sgt i32 %cnt, 0
ADD:   %cmp6 = icmp sgt i32 %cnt, 0
IC: Visiting:   %cmp6 = icmp sgt i32 %cnt, 0
IC: Visiting:   br i1 %cmp6, label %for.body, label %for.end
IC: Visiting:   ret void
IC: Visiting:   %i.09 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
IC: Visiting:   %in.addr.08 = phi i32* [ %incdec.ptr, %for.body ], [ %in, %entry ]
IC: Visiting:   %out.addr.07 = phi i32* [ %incdec.ptr1, %for.body ], [ %out, %entry ]
IC: Visiting:   %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
IC: Visiting:   store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
IC: Visiting:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
IC: Visiting:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
IC: Visiting:   %inc = add nuw nsw i32 %i.09, 1
IC: Visiting:   %cmp = icmp slt i32 %inc, %cnt
IC: Visiting:   br i1 %cmp, label %for.body, label %for.end, !llvm.loop !7


INSTCOMBINE ITERATION #2 on test
ADD:   br i1 %cmp, label %for.body, label %for.end, !llvm.loop !7
ADD:   %cmp = icmp slt i32 %inc, %cnt
ADD:   %inc = add nuw nsw i32 %i.09, 1
ADD:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
ADD:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
ADD:   store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
ADD:   %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
ADD:   %out.addr.07 = phi i32* [ %incdec.ptr1, %for.body ], [ %out, %entry ]
ADD:   %in.addr.08 = phi i32* [ %incdec.ptr, %for.body ], [ %in, %entry ]
ADD:   %i.09 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
ADD:   ret void
ADD:   br i1 %cmp6, label %for.body, label %for.end
ADD:   %cmp6 = icmp sgt i32 %cnt, 0
IC: Visiting:   %cmp6 = icmp sgt i32 %cnt, 0
IC: Visiting:   br i1 %cmp6, label %for.body, label %for.end
IC: Visiting:   ret void
IC: Visiting:   %i.09 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
IC: Visiting:   %in.addr.08 = phi i32* [ %incdec.ptr, %for.body ], [ %in, %entry ]
IC: Visiting:   %out.addr.07 = phi i32* [ %incdec.ptr1, %for.body ], [ %out, %entry ]
IC: Visiting:   %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
IC: Visiting:   store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
IC: Visiting:   %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
IC: Visiting:   %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
IC: Visiting:   %inc = add nuw nsw i32 %i.09, 1
IC: Visiting:   %cmp = icmp slt i32 %inc, %cnt
IC: Visiting:   br i1 %cmp, label %for.body, label %for.end, !llvm.loop !7
*** IR Dump After InstCombinePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %i.09 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %in.addr.08 = phi i32* [ %incdec.ptr, %for.body ], [ %in, %entry ]
  %out.addr.07 = phi i32* [ %incdec.ptr1, %for.body ], [ %out, %entry ]
  %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
  %inc = add nuw nsw i32 %i.09, 1
  %cmp = icmp slt i32 %inc, %cnt
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !7

for.end:                                          ; preds = %for.body, %entry
  ret void
}
LoopSimplify: Creating pre-header for.body.preheader
LoopSimplify: Creating dedicated exit block for.end.loopexit
*** IR Dump After LoopSimplifyPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.09 = phi i32 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %in.addr.08 = phi i32* [ %incdec.ptr, %for.body ], [ %in, %for.body.preheader ]
  %out.addr.07 = phi i32* [ %incdec.ptr1, %for.body ], [ %out, %for.body.preheader ]
  %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
  %inc = add nuw nsw i32 %i.09, 1
  %cmp = icmp slt i32 %inc, %cnt
  br i1 %cmp, label %for.body, label %for.end.loopexit, !llvm.loop !7

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}
*** IR Dump After LCSSAPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.09 = phi i32 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %in.addr.08 = phi i32* [ %incdec.ptr, %for.body ], [ %in, %for.body.preheader ]
  %out.addr.07 = phi i32* [ %incdec.ptr1, %for.body ], [ %out, %for.body.preheader ]
  %0 = load i32, i32* %out.addr.07, align 4, !tbaa !3
  store i32 %0, i32* %in.addr.08, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
  %inc = add nuw nsw i32 %i.09, 1
  %cmp = icmp slt i32 %inc, %cnt
  br i1 %cmp, label %for.body, label %for.end.loopexit, !llvm.loop !7

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}
loop-idiom Scanning: F[test] Countable Loop %for.body
  Formed new call:   call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
    from load ptr={%out,+,4}<nuw><%for.body> at:   %1 = load i32, i32* %out.addr.07, align 4, !tbaa !3
    from store ptr={%in,+,4}<nuw><%for.body> at:   store i32 %1, i32* %in.addr.08, align 4, !tbaa !3
*** IR Dump After LoopIdiomRecognizePass on Loop at depth 1 containing: %for.body<header><latch><exiting> ***

; Preheader:
for.body.preheader:                               ; preds = %entry
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.body

; Loop:
for.body:                                         ; preds = %for.body.preheader, %for.body
  %i.09 = phi i32 [ %inc, %for.body ], [ 0, %for.body.preheader ]
  %in.addr.08 = phi i32* [ %incdec.ptr, %for.body ], [ %in, %for.body.preheader ]
  %out.addr.07 = phi i32* [ %incdec.ptr1, %for.body ], [ %out, %for.body.preheader ]
  %1 = load i32, i32* %out.addr.07, align 4, !tbaa !3
  %incdec.ptr = getelementptr inbounds i32, i32* %in.addr.08, i32 1
  %incdec.ptr1 = getelementptr inbounds i32, i32* %out.addr.07, i32 1
  %inc = add nuw nsw i32 %i.09, 1
  %cmp = icmp slt i32 %inc, %cnt
  br i1 %cmp, label %for.body, label %for.end.loopexit, !llvm.loop !7

; Exit blocks
for.end.loopexit:                                 ; preds = %for.body
  br label %for.end
*** IR Dump After IndVarSimplifyPass on Loop at depth 1 containing: %for.body<header><latch><exiting> ***

; Preheader:
for.body.preheader:                               ; preds = %entry
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.body

; Loop:
for.body:                                         ; preds = %for.body.preheader, %for.body
  br i1 false, label %for.body, label %for.end.loopexit, !llvm.loop !3

; Exit blocks
for.end.loopexit:                                 ; preds = %for.body
  br label %for.end
Starting PolynomialMultiplyRecognize on loop
Parallel Loop at depth 1 containing: %for.body<header><latch><exiting>

Loop header:

for.body:                                         ; preds = %for.body.preheader, %for.body
  br i1 false, label %for.body, label %for.end.loopexit, !llvm.loop !3
Loop IV: clang: /mnt/f/My_Github/llvm-project/llvm/include/llvm/Support/Casting.h:104: static bool llvm::isa_impl_cl<To, const From*>::doit(const From*) [with To = llvm::Instruction; From = llvm::Value]: Assertion `Val && "isa<> used on a null pointer"' failed.
PLEASE submit a bug report to https://bugs.llvm.org/ and include the crash backtrace, preprocessed source, and associated run script.
Stack dump:
0.	Program arguments: clang test0.c -O2 -S -mllvm -debug --target=hexagon -mllvm -print-after-all
1.	<eof> parser at end of file
2.	Optimizer
 #0 0x0000559c9f705ab6 llvm::sys::PrintStackTrace(llvm::raw_ostream&, int) /mnt/f/My_Github/llvm-project/llvm/lib/Support/Unix/Signals.inc:565:22
 #1 0x0000559c9f705b71 PrintStackTraceSignalHandler(void*) /mnt/f/My_Github/llvm-project/llvm/lib/Support/Unix/Signals.inc:632:1
 #2 0x0000559c9f7037dd llvm::sys::RunSignalHandlers() /mnt/f/My_Github/llvm-project/llvm/lib/Support/Signals.cpp:97:20
 #3 0x0000559c9f7052d7 llvm::sys::CleanupOnSignal(unsigned long) /mnt/f/My_Github/llvm-project/llvm/lib/Support/Unix/Signals.inc:361:31
 #4 0x0000559c9f61f910 (anonymous namespace)::CrashRecoveryContextImpl::HandleCrash(int, unsigned long) /mnt/f/My_Github/llvm-project/llvm/lib/Support/CrashRecoveryContext.cpp:76:5
 #5 0x0000559c9f61fe49 CrashRecoverySignalHandler(int) /mnt/f/My_Github/llvm-project/llvm/lib/Support/CrashRecoveryContext.cpp:390:1
 #6 0x00007fa96ade33c0 __restore_rt (/lib/x86_64-linux-gnu/libpthread.so.0+0x153c0)
 #7 0x00007fa96a8d118b raise /build/glibc-eX1tMB/glibc-2.31/signal/../sysdeps/unix/sysv/linux/raise.c:51:1
 #8 0x00007fa96a8b0859 abort /build/glibc-eX1tMB/glibc-2.31/stdlib/abort.c:81:7
 #9 0x00007fa96a8b0729 get_sysdep_segment_value /build/glibc-eX1tMB/glibc-2.31/intl/loadmsgcat.c:509:8
#10 0x00007fa96a8b0729 _nl_load_domain /build/glibc-eX1tMB/glibc-2.31/intl/loadmsgcat.c:970:34
#11 0x00007fa96a8c1f36 (/lib/x86_64-linux-gnu/libc.so.6+0x36f36)
#12 0x0000559c9c174fba llvm::isa_impl_cl<llvm::Instruction, llvm::Value const*>::doit(llvm::Value const*) /mnt/f/My_Github/llvm-project/llvm/include/llvm/Support/Casting.h:105:36
#13 0x0000559c9c17249f llvm::isa_impl_wrap<llvm::Instruction, llvm::Value const*, llvm::Value const*>::doit(llvm::Value const* const&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/Support/Casting.h:132:3
#14 0x0000559c9c16ec43 llvm::isa_impl_wrap<llvm::Instruction, llvm::Value const* const, llvm::Value const*>::doit(llvm::Value const* const&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/Support/Casting.h:124:3
#15 0x0000559c9c16acba bool llvm::isa<llvm::Instruction, llvm::Value const*>(llvm::Value const* const&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/Support/Casting.h:144:1
#16 0x0000559c9c16bd2c llvm::cast_retty<llvm::Instruction, llvm::Value const*>::ret_type llvm::dyn_cast<llvm::Instruction, llvm::Value const>(llvm::Value const*) /mnt/f/My_Github/llvm-project/llvm/include/llvm/Support/Casting.h:345:22
#17 0x0000559c9e8b3715 llvm::Value::print(llvm::raw_ostream&, bool) const /mnt/f/My_Github/llvm-project/llvm/lib/IR/AsmWriter.cpp:4567:38
#18 0x0000559c9c19171c llvm::operator<<(llvm::raw_ostream&, llvm::Value const&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/Value.h:865:10
#19 0x0000559c9d0444e1 (anonymous namespace)::PolynomialMultiplyRecognize::recognize() /mnt/f/My_Github/llvm-project/llvm/lib/Target/Hexagon/HexagonLoopIdiomRecognition.cpp:1810:3
#20 0x0000559c9d047abe (anonymous namespace)::HexagonLoopIdiomRecognize::runOnCountableLoop(llvm::Loop*) /mnt/f/My_Github/llvm-project/llvm/lib/Target/Hexagon/HexagonLoopIdiomRecognition.cpp:2395:3
#21 0x0000559c9d047f2d (anonymous namespace)::HexagonLoopIdiomRecognize::run(llvm::Loop*) /mnt/f/My_Github/llvm-project/llvm/lib/Target/Hexagon/HexagonLoopIdiomRecognition.cpp:2443:32
#22 0x0000559c9d048157 llvm::HexagonLoopIdiomRecognitionPass::run(llvm::Loop&, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>&, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&) /mnt/f/My_Github/llvm-project/llvm/lib/Target/Hexagon/HexagonLoopIdiomRecognition.cpp:2472:39
#23 0x0000559c9ce9bc15 llvm::detail::PassModel<llvm::Loop, llvm::HexagonLoopIdiomRecognitionPass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&>::run(llvm::Loop&, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>&, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManagerInternal.h:89:3
#24 0x0000559ca4791e4f llvm::Optional<llvm::PreservedAnalyses> llvm::PassManager<llvm::Loop, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&>::runSinglePass<llvm::Loop, std::unique_ptr<llvm::detail::PassConcept<llvm::Loop, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&>, std::default_delete<llvm::detail::PassConcept<llvm::Loop, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&> > > >(llvm::Loop&, std::unique_ptr<llvm::detail::PassConcept<llvm::Loop, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&>, std::default_delete<llvm::detail::PassConcept<llvm::Loop, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&> > >&, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>&, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&, llvm::PassInstrumentation&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/Transforms/Scalar/LoopPassManager.h:399:8
#25 0x0000559ca479086d llvm::PassManager<llvm::Loop, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&>::runWithoutLoopNestPasses(llvm::Loop&, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>&, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&) /mnt/f/My_Github/llvm-project/llvm/lib/Transforms/Scalar/LoopPassManager.cpp:153:78
#26 0x0000559ca47900aa llvm::PassManager<llvm::Loop, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&>::run(llvm::Loop&, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>&, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&) /mnt/f/My_Github/llvm-project/llvm/lib/Transforms/Scalar/LoopPassManager.cpp:43:38
#27 0x0000559ca11bdaa7 llvm::detail::PassModel<llvm::Loop, llvm::PassManager<llvm::Loop, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&>, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&>::run(llvm::Loop&, llvm::AnalysisManager<llvm::Loop, llvm::LoopStandardAnalysisResults&>&, llvm::LoopStandardAnalysisResults&, llvm::LPMUpdater&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManagerInternal.h:89:3
#28 0x0000559ca479120b llvm::FunctionToLoopPassAdaptor::run(llvm::Function&, llvm::AnalysisManager<llvm::Function>&) /mnt/f/My_Github/llvm-project/llvm/lib/Transforms/Scalar/LoopPassManager.cpp:299:47
#29 0x0000559ca11b0635 llvm::detail::PassModel<llvm::Function, llvm::FunctionToLoopPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Function> >::run(llvm::Function&, llvm::AnalysisManager<llvm::Function>&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManagerInternal.h:89:3
#30 0x0000559c9eaf7002 llvm::PassManager<llvm::Function, llvm::AnalysisManager<llvm::Function> >::run(llvm::Function&, llvm::AnalysisManager<llvm::Function>&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManager.h:525:16
#31 0x0000559c9c5dafd1 llvm::detail::PassModel<llvm::Function, llvm::PassManager<llvm::Function, llvm::AnalysisManager<llvm::Function> >, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Function> >::run(llvm::Function&, llvm::AnalysisManager<llvm::Function>&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManagerInternal.h:89:3
#32 0x0000559c9de02b26 llvm::CGSCCToFunctionPassAdaptor::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) /mnt/f/My_Github/llvm-project/llvm/lib/Analysis/CGSCCPassManager.cpp:555:32
#33 0x0000559c9c5dabc1 llvm::detail::PassModel<llvm::LazyCallGraph::SCC, llvm::CGSCCToFunctionPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManagerInternal.h:89:3
#34 0x0000559c9de00e5c llvm::PassManager<llvm::LazyCallGraph::SCC, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) /mnt/f/My_Github/llvm-project/llvm/lib/Analysis/CGSCCPassManager.cpp:90:39
#35 0x0000559c9eccbe1f llvm::detail::PassModel<llvm::LazyCallGraph::SCC, llvm::PassManager<llvm::LazyCallGraph::SCC, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManagerInternal.h:89:3
#36 0x0000559c9de021f6 llvm::DevirtSCCRepeatedPass::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) /mnt/f/My_Github/llvm-project/llvm/lib/Analysis/CGSCCPassManager.cpp:418:12
#37 0x0000559c9eccbc69 llvm::detail::PassModel<llvm::LazyCallGraph::SCC, llvm::DevirtSCCRepeatedPass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&>::run(llvm::LazyCallGraph::SCC&, llvm::AnalysisManager<llvm::LazyCallGraph::SCC, llvm::LazyCallGraph&>&, llvm::LazyCallGraph&, llvm::CGSCCUpdateResult&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManagerInternal.h:89:3
#38 0x0000559c9de01958 llvm::ModuleToPostOrderCGSCCPassAdaptor::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) /mnt/f/My_Github/llvm-project/llvm/lib/Analysis/CGSCCPassManager.cpp:283:48
#39 0x0000559c9eccbd39 llvm::detail::PassModel<llvm::Module, llvm::ModuleToPostOrderCGSCCPassAdaptor, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Module> >::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManagerInternal.h:89:3
#40 0x0000559c9eaf6c16 llvm::PassManager<llvm::Module, llvm::AnalysisManager<llvm::Module> >::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManager.h:525:16
#41 0x0000559c9ecbb358 llvm::ModuleInlinerWrapperPass::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) /mnt/f/My_Github/llvm-project/llvm/lib/Transforms/IPO/Inliner.cpp:1116:10
#42 0x0000559ca11b9009 llvm::detail::PassModel<llvm::Module, llvm::ModuleInlinerWrapperPass, llvm::PreservedAnalyses, llvm::AnalysisManager<llvm::Module> >::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManagerInternal.h:89:3
#43 0x0000559c9eaf6c16 llvm::PassManager<llvm::Module, llvm::AnalysisManager<llvm::Module> >::run(llvm::Module&, llvm::AnalysisManager<llvm::Module>&) /mnt/f/My_Github/llvm-project/llvm/include/llvm/IR/PassManager.h:525:16
#44 0x0000559c9fbb9383 (anonymous namespace)::EmitAssemblyHelper::RunOptimizationPipeline(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream> >&, std::unique_ptr<llvm::ToolOutputFile, std::default_delete<llvm::ToolOutputFile> >&) /mnt/f/My_Github/llvm-project/clang/lib/CodeGen/BackendUtil.cpp:1490:10
#45 0x0000559c9fbb98d9 (anonymous namespace)::EmitAssemblyHelper::EmitAssembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream> >) /mnt/f/My_Github/llvm-project/clang/lib/CodeGen/BackendUtil.cpp:1552:21
#46 0x0000559c9fbba967 clang::EmitBackendOutput(clang::DiagnosticsEngine&, clang::HeaderSearchOptions const&, clang::CodeGenOptions const&, clang::TargetOptions const&, clang::LangOptions const&, llvm::StringRef, llvm::Module*, clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream> >) /mnt/f/My_Github/llvm-project/clang/lib/CodeGen/BackendUtil.cpp:1714:27
#47 0x0000559ca1051e3d clang::BackendConsumer::HandleTranslationUnit(clang::ASTContext&) /mnt/f/My_Github/llvm-project/clang/lib/CodeGen/CodeGenAction.cpp:370:24
#48 0x0000559ca2b89853 clang::ParseAST(clang::Sema&, bool, bool) /mnt/f/My_Github/llvm-project/clang/lib/Parse/ParseAST.cpp:178:14
#49 0x0000559ca05d33b1 clang::ASTFrontendAction::ExecuteAction() /mnt/f/My_Github/llvm-project/clang/lib/Frontend/FrontendAction.cpp:1074:11
#50 0x0000559ca104e432 clang::CodeGenAction::ExecuteAction() /mnt/f/My_Github/llvm-project/clang/lib/CodeGen/CodeGenAction.cpp:1108:5
#51 0x0000559ca05d2c70 clang::FrontendAction::Execute() /mnt/f/My_Github/llvm-project/clang/lib/Frontend/FrontendAction.cpp:971:38
#52 0x0000559ca050bfbc clang::CompilerInstance::ExecuteAction(clang::FrontendAction&) /mnt/f/My_Github/llvm-project/clang/lib/Frontend/CompilerInstance.cpp:1030:42
#53 0x0000559ca0777529 clang::ExecuteCompilerInvocation(clang::CompilerInstance*) /mnt/f/My_Github/llvm-project/clang/lib/FrontendTool/ExecuteCompilerInvocation.cpp:261:38
#54 0x0000559c9c107eb9 cc1_main(llvm::ArrayRef<char const*>, char const*, void*) /mnt/f/My_Github/llvm-project/clang/tools/driver/cc1_main.cpp:246:40
#55 0x0000559c9c0fb6dc ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>&) /mnt/f/My_Github/llvm-project/clang/tools/driver/driver.cpp:317:20
#56 0x0000559ca03e395d clang::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, bool*) const::'lambda'()::operator()() const /mnt/f/My_Github/llvm-project/clang/lib/Driver/Job.cpp:405:32
#57 0x0000559ca03e3f7c void llvm::function_ref<void ()>::callback_fn<clang::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, bool*) const::'lambda'()>(long) /mnt/f/My_Github/llvm-project/llvm/include/llvm/ADT/STLExtras.h:178:40
#58 0x0000559c9f613926 llvm::function_ref<void ()>::operator()() const /mnt/f/My_Github/llvm-project/llvm/include/llvm/ADT/STLExtras.h:200:62
#59 0x0000559c9f62005c llvm::CrashRecoveryContext::RunSafely(llvm::function_ref<void ()>) /mnt/f/My_Github/llvm-project/llvm/lib/Support/CrashRecoveryContext.cpp:426:10
#60 0x0000559ca03e3b6c clang::driver::CC1Command::Execute(llvm::ArrayRef<llvm::Optional<llvm::StringRef> >, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >*, bool*) const /mnt/f/My_Github/llvm-project/clang/lib/Driver/Job.cpp:405:7
#61 0x0000559ca03910ff clang::driver::Compilation::ExecuteCommand(clang::driver::Command const&, clang::driver::Command const*&) const /mnt/f/My_Github/llvm-project/clang/lib/Driver/Compilation.cpp:196:22
#62 0x0000559ca0391486 clang::driver::Compilation::ExecuteJobs(clang::driver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::Command const*> >&) const /mnt/f/My_Github/llvm-project/clang/lib/Driver/Compilation.cpp:249:53
#63 0x0000559ca03a14f6 clang::driver::Driver::ExecuteCompilation(clang::driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::Command const*> >&) /mnt/f/My_Github/llvm-project/clang/lib/Driver/Driver.cpp:1555:28
#64 0x0000559c9c0fc85a main /mnt/f/My_Github/llvm-project/clang/tools/driver/driver.cpp:489:39
#65 0x00007fa96a8b20b3 __libc_start_main /build/glibc-eX1tMB/glibc-2.31/csu/../csu/libc-start.c:342:3
#66 0x0000559c9c0f9e5e _start (/usr/local/bin/clang-14+0x2ff2e5e)
clang-14: error: clang frontend command failed with exit code 134 (use -v to see invocation)
clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)
Target: hexagon
Thread model: posix
InstalledDir: /usr/local/bin
clang-14: note: diagnostic msg: 
********************

PLEASE ATTACH THE FOLLOWING FILES TO THE BUG REPORT:
Preprocessed source(s) and associated run script(s) are located at:
clang-14: note: diagnostic msg: /tmp/test0-4bc378.c
clang-14: note: diagnostic msg: /tmp/test0-4bc378.sh
clang-14: note: diagnostic msg: 

********************
