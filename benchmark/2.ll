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
*** IR Dump After HexagonLoopIdiomRecognitionPass on Parallel Loop at depth 1 containing: %for.body<header><latch><exiting> ***

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
*** IR Dump After LoopDeletionPass on Parallel Loop at depth 1 containing: %for.body<header><latch><exiting> (invalidated) ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %in10 = bitcast i32* %in to i8*
  %out11 = bitcast i32* %out to i8*
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.preheader
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After SROAPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %in10 = bitcast i32* %in to i8*
  %out11 = bitcast i32* %out to i8*
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.preheader
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}
*** IR Dump After MergedLoadStoreMotionPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %in10 = bitcast i32* %in to i8*
  %out11 = bitcast i32* %out to i8*
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.preheader
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}
*** IR Dump After GVNPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %in10 = bitcast i32* %in to i8*
  %out11 = bitcast i32* %out to i8*
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After SCCPPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %in10 = bitcast i32* %in to i8*
  %out11 = bitcast i32* %out to i8*
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After BDCEPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %in10 = bitcast i32* %in to i8*
  %out11 = bitcast i32* %out to i8*
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After InstCombinePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After JumpThreadingPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After CorrelatedValuePropagationPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After ADCEPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After MemCpyOptPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After DSEPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LoopSimplifyPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LCSSAPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After CoroElidePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After SimplifyCFGPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After InstCombinePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After CoroSplitPass on (test) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After GlobalOptPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After GlobalDCEPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After EliminateAvailableExternallyPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After ReversePostOrderFunctionAttrsPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After RequireAnalysisPass<llvm::GlobalsAA, llvm::Module> on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After Float2IntPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LowerConstantIntrinsicsPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LoopSimplifyPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LCSSAPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LoopDistributePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After InjectTLIMappings on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LoopVectorizePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LoopLoadEliminationPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After InstCombinePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After SimplifyCFGPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After SLPVectorizerPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After VectorCombinePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After InstCombinePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LoopUnrollPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After WarnMissedTransformationsPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After InstCombinePass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After RequireAnalysisPass<llvm::OptimizationRemarkEmitterAnalysis, llvm::Function> on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LoopSimplifyPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LCSSAPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After AlignmentFromAssumptionsPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After LoopSinkPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After InstSimplifyPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After DivRemPairsPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After SimplifyCFGPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After CoroCleanupPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After CGProfilePass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After GlobalDCEPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After ConstantMergePass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After RelLookupTableConverterPass on [module] ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After AnnotationRemarksPass on test ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After ObjC ARC contraction (objc-arc-contract) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Pre-ISel Intrinsic Lowering (pre-isel-intrinsic-lowering) ***
; ModuleID = 'test0.c'
source_filename = "test0.c"
target datalayout = "e-m:e-p:32:32:32-a:0-n16:32-i64:64:64-i32:32:32-i16:16:16-i1:8:8-f32:32:32-f64:64:64-v32:32:32-v64:64:64-v512:512:512-v1024:1024:1024-v2048:2048:2048"
target triple = "hexagon"

; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i32, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="hexagonv60" "target-features"="+v60,-long-calls" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"frame-pointer", i32 2}
!2 = !{!"clang version 14.0.0 (https://github.com/llvm/llvm-project.git afa3c14e2ff95c6b4e1a2db4e197a7297c7f73ec)"}
*** IR Dump After Module Verifier (verify) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Canonicalize natural loops (loop-simplify) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Merge contiguous icmps into a memcmp (mergeicmps) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Expand memcmp() to load/stores (expandmemcmp) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Lower Garbage Collection Instructions (gc-lowering) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Shadow Stack GC Lowering (shadow-stack-gc-lowering) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Lower constant intrinsics (lower-constant-intrinsics) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Remove unreachable blocks from the CFG (unreachableblockelim) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Constant Hoisting (consthoist) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Replace intrinsics with calls to vector library (replace-with-veclib) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Partially inline calls to library functions (partially-inline-libcalls) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Expand vector predication intrinsics (expandvp) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Scalarize Masked Memory Intrinsics (scalarize-masked-mem-intrin) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Expand reduction intrinsics (expand-reductions) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Remove redundant instructions (instsimplify) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Dead Code Elimination (dce) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Expand Atomic instructions (atomic-expand) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Simplify the CFG (simplifycfg) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Hexagon Vector Combine (hexagon-vc) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Hexagon Common GEP (hcommgep) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Hexagon generate "extract" instructions (hextract) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After CodeGen Prepare (codegenprepare) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Exception handling preparation (dwarfehprepare) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Safe Stack instrumentation pass (safe-stack) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Module Verifier (verify) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
*** IR Dump After Remove sign extends (reargs) ***
; Function Attrs: nofree norecurse nosync nounwind
define dso_local void @test(i32* noalias nocapture writeonly %in, i32* noalias nocapture readonly %out, i32 %cnt) local_unnamed_addr #0 {
entry:
  %cmp6 = icmp sgt i32 %cnt, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %out11 = bitcast i32* %out to i8*
  %in10 = bitcast i32* %in to i8*
  %0 = shl nuw i32 %cnt, 2
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* align 4 %in10, i8* align 4 %out11, i32 %0, i1 false)
  br label %for.end

for.end:                                          ; preds = %for.body.preheader, %entry
  ret void
}
# *** IR Dump After Hexagon DAG->DAG Pattern Instruction Selection (amdgpu-isel) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  %4:predregs = C2_not killed %3:predregs
  J2_jumpt killed %4:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29
  %6:intregs = COPY $r0

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon optimize vextract (hexagon-vextract) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  %4:predregs = C2_not killed %3:predregs
  J2_jumpt killed %4:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29
  %6:intregs = COPY $r0

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon generate predicate operations (hexagon-gen-pred) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  %4:predregs = C2_not killed %3:predregs
  J2_jumpt killed %4:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29
  %6:intregs = COPY $r0

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Loop Rescheduling (hexagon-loop-resched) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  %4:predregs = C2_not killed %3:predregs
  J2_jumpt killed %4:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29
  %6:intregs = COPY $r0

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Split Double Registers (hexagon-split-double) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  %4:predregs = C2_not killed %3:predregs
  J2_jumpt killed %4:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29
  %6:intregs = COPY $r0

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon bit simplification (hexagon-bit-simplify) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  %4:predregs = C2_not %3:predregs
  J2_jumpt %4:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon optimize redundant zero and size extends (hexagon-peephole) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  %4:predregs = C2_not %3:predregs
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Constant Propagation (hexagon-constp) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  %4:predregs = C2_not %3:predregs
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Remove unreachable machine basic blocks (unreachable-mbb-elimination) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  %4:predregs = C2_not %3:predregs
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon generate "insert" instructions (hexinsert) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon early if conversion (hexagon-early-if) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Finalize ISel and expand pseudo-instructions (finalize-isel) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Early Tail Duplication (early-tailduplication) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Optimize machine instruction PHIs (opt-phis) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Slot index numbering (slotindexes) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
64B	  %3:predregs = C2_cmpgti %2:intregs, 0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
192B	  $r2 = COPY %5:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Merge disjoint stack slots (stack-coloring) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Local Stack Slot Allocation (localstackalloc) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Remove dead machine instructions (dead-mi-elimination) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Early Machine Loop Invariant Code Motion (early-machinelicm) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Machine Common Subexpression Elimination (machine-cse) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Machine code sinking (machine-sink) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Peephole Optimizations (peephole-opt) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Remove dead machine instructions (dead-mi-elimination) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon constant-extender optimization (hexagon-cext-opt) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Store Widening (hexagon-widen-stores) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Hardware Loops (hwloops) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Slot index numbering (slotindexes) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
64B	  %3:predregs = C2_cmpgti %2:intregs, 0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
192B	  $r2 = COPY %5:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Live Interval Analysis (liveintervals) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
64B	  %3:predregs = C2_cmpgti %2:intregs, 0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
192B	  $r2 = COPY %5:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Modulo Software Pipelining (pipeliner) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Detect Dead Lanes (detect-dead-lanes) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Process Implicit Definitions (processimpdefs) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Remove unreachable machine basic blocks (unreachable-mbb-elimination) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY $r2
  %1:intregs = COPY $r1
  %0:intregs = COPY $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY %0:intregs
  $r1 = COPY %1:intregs
  $r2 = COPY %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Live Variable Analysis (livevars) ***:
# Machine code for function test: IsSSA, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY killed $r2
  %1:intregs = COPY killed $r1
  %0:intregs = COPY killed $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf killed %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r killed %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY killed %0:intregs
  $r1 = COPY killed %1:intregs
  $r2 = COPY killed %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Eliminate PHI nodes for register allocation (phi-node-elimination) ***:
# Machine code for function test: NoPHIs, TracksLiveness
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY killed $r2
  %1:intregs = COPY killed $r1
  %0:intregs = COPY killed $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf killed %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r killed %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY killed %0:intregs
  $r1 = COPY killed %1:intregs
  $r2 = COPY killed %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Two-Address instruction pass (twoaddressinstruction) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  %2:intregs = COPY killed $r2
  %1:intregs = COPY killed $r1
  %0:intregs = COPY killed $r0
  %3:predregs = C2_cmpgti %2:intregs, 0
  J2_jumpf killed %3:predregs, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)

  %5:intregs = nuw S2_asl_i_r killed %2:intregs, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  $r0 = COPY killed %0:intregs
  $r1 = COPY killed %1:intregs
  $r2 = COPY killed %5:intregs
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Slot index numbering (slotindexes) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY killed $r2
32B	  %1:intregs = COPY killed $r1
48B	  %0:intregs = COPY killed $r0
64B	  %3:predregs = C2_cmpgti %2:intregs, 0
80B	  J2_jumpf killed %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r killed %2:intregs, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY killed %0:intregs
176B	  $r1 = COPY killed %1:intregs
192B	  $r2 = COPY killed %5:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Live Interval Analysis (liveintervals) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
64B	  %3:predregs = C2_cmpgti %2:intregs, 0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
192B	  $r2 = COPY %5:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Simple Register Coalescing (simple-register-coalescing) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
64B	  %3:predregs = C2_cmpgti %2:intregs, 0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
192B	  $r2 = COPY %5:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Expand Condsets (expand-condsets) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
64B	  %3:predregs = C2_cmpgti %2:intregs, 0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
192B	  $r2 = COPY %5:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Rename Disconnected Subregister Components (rename-independent-subregs) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
64B	  %3:predregs = C2_cmpgti %2:intregs, 0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
192B	  $r2 = COPY %5:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Machine Instruction Scheduler (machine-scheduler) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
24B	  %3:predregs = C2_cmpgti %2:intregs, 0
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
136B	  $r2 = COPY %5:intregs
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Debug Variable Analysis (livedebugvars) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
24B	  %3:predregs = C2_cmpgti %2:intregs, 0
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
136B	  $r2 = COPY %5:intregs
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Live Stack Slot Analysis (livestacks) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
24B	  %3:predregs = C2_cmpgti %2:intregs, 0
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
136B	  $r2 = COPY %5:intregs
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Virtual Register Map (virtregmap) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
24B	  %3:predregs = C2_cmpgti %2:intregs, 0
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
136B	  $r2 = COPY %5:intregs
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Live Register Matrix (liveregmatrix) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
24B	  %3:predregs = C2_cmpgti %2:intregs, 0
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
136B	  $r2 = COPY %5:intregs
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Greedy Register Allocator (greedy) ***:
# Machine code for function test: NoPHIs, TracksLiveness, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0 in %0, $r1 in %1, $r2 in %2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
16B	  %2:intregs = COPY $r2
24B	  %3:predregs = C2_cmpgti %2:intregs, 0
32B	  %1:intregs = COPY $r1
48B	  %0:intregs = COPY $r0
80B	  J2_jumpf %3:predregs, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)

128B	  %5:intregs = nuw S2_asl_i_r %2:intregs, 2
136B	  $r2 = COPY %5:intregs
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
160B	  $r0 = COPY %0:intregs
176B	  $r1 = COPY %1:intregs
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Virtual Register Rewriter (virtregrewriter) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
24B	  renamable $p0 = C2_cmpgti renamable $r2, 0
80B	  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)
	  liveins: $r0, $r1, $r2
128B	  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Stack Slot Coloring (stack-slot-coloring) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

0B	bb.0.entry:
	  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
	  liveins: $r0, $r1, $r2
24B	  renamable $p0 = C2_cmpgti renamable $r2, 0
80B	  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
96B	  J2_jump %bb.1, implicit-def dead $pc

112B	bb.1.for.body.preheader:
	; predecessors: %bb.0
	  successors: %bb.2(0x80000000); %bb.2(100.00%)
	  liveins: $r0, $r1, $r2
128B	  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
144B	  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
208B	  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
224B	  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

240B	bb.2.for.end:
	; predecessors: %bb.0, %bb.1

256B	  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Machine Copy Propagation Pass (machine-cp) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Machine Loop Invariant Code Motion (machinelicm) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon RDF optimizations (hexagon-rdf-opt) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon CFG Optimizer (hexagon-cfg) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Optimize addressing mode of load/store (amode-opt) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Remove Redundant DEBUG_VALUE analysis (removeredundantdebugvalues) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Fixup Statepoint Caller Saved (fixup-statepoint-caller-saved) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After PostRA Machine Sink (postra-machine-sink) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Shrink Wrapping analysis (shrink-wrap) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  ADJCALLSTACKDOWN 0, 0, implicit-def $r29, implicit-def dead $r30, implicit $r31, implicit $r30, implicit $r29
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  ADJCALLSTACKUP 0, 0, implicit-def dead $r29, implicit-def dead $r30, implicit-def dead $r31, implicit $r29

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Prologue/Epilogue Insertion & Frame Finalization (prologepilog) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf killed renamable $p0, %bb.2, implicit-def dead $pc
  J2_jump %bb.1, implicit-def dead $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Control Flow Optimizer (branch-folder) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf $p0, %bb.2, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Tail Duplication (tailduplication) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf $p0, %bb.2, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Machine Copy Propagation Pass (machine-cp) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf $p0, %bb.2, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Post-RA pseudo instruction expansion pass (postrapseudos) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf $p0, %bb.2, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Copy-To-Combine Pass (hexagon-copy-combine) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x50000000), %bb.2(0x30000000); %bb.1(62.50%), %bb.2(37.50%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  J2_jumpf $p0, %bb.2, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  successors: %bb.2(0x80000000); %bb.2(100.00%)
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey

bb.2.for.end:
; predecessors: %bb.0, %bb.1

  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After If Converter (if-converter) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Split Const32s and Const64s (split-const-for-sdata) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit $r0, implicit $r1, implicit $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Post RA top-down list latency scheduler (post-RA-sched) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Analyze Machine Code For Garbage Collection (gc-analysis) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Branch Probability Basic Block Placement (block-placement) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Insert fentry calls (fentry-insert) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Insert XRay ops (xray-instrumentation) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Implement the 'patchable-function' attribute (patchable-function) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon NewValueJump (hexagon-nvj) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Branch Relaxation (hexagon-brelax) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Hardware Loop Fixup (hwloopsfixup) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit $framekey, implicit $framelimit, implicit $r30, implicit $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r killed renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe $r30, implicit-def $r29, implicit $framekey
  PS_jmpret $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon generate mux instructions (hexagon-gen-mux) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  renamable $p0 = C2_cmpgti renamable $r2, 0
  PS_jmpretf killed $p0, killed $r31, implicit-def $pc, implicit-def $pc

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31 :: (store (s32) into stack)
  renamable $r2 = nuw S2_asl_i_r renamable $r2, 2
  J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit killed $r29, implicit killed $r0, implicit killed $r1, implicit killed $r2, implicit-def $r29, implicit-def dead $r0
  $d15 = L2_deallocframe killed $r30, implicit-def $r29, implicit killed $framekey
  PS_jmpret killed $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon Packetizer (hexagon-packetizer) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, FailsVerification, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def dead $p0, implicit-def $pc, implicit $r2, implicit killed $r31 {
    renamable $p0 = C2_cmpgti renamable $r2, 0
    PS_jmpretfnew internal killed $p0, killed $r31, implicit-def $pc, implicit-def $pc
  }

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def $r29, implicit-def $r30, implicit-def dead $r2, implicit-def dead $pc, implicit-def dead $r31, implicit-def dead $r0, implicit $r29, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31, implicit $r2, implicit killed $r0, implicit killed $r1 {
    $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31 :: (store (s32) into stack)
    renamable $r2 = nuw S2_asl_i_r renamable $r2, 2
    J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit internal killed $r29, implicit killed $r0, implicit killed $r1, implicit internal killed $r2, implicit-def $r29, implicit-def dead $r0
  }
  $d15 = L2_deallocframe killed $r30, implicit-def $r29, implicit killed $framekey
  PS_jmpret killed $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Hexagon call frame information (hexagon-cfi) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, FailsVerification, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def dead $p0, implicit-def $pc, implicit $r2, implicit killed $r31 {
    renamable $p0 = C2_cmpgti renamable $r2, 0
    PS_jmpretfnew internal killed $p0, killed $r31, implicit-def $pc, implicit-def $pc
  }

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def $r29, implicit-def $r30, implicit-def dead $r2, implicit-def dead $pc, implicit-def dead $r31, implicit-def dead $r0, implicit $r29, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31, implicit $r2, implicit killed $r0, implicit killed $r1 {
    $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31 :: (store (s32) into stack)
    renamable $r2 = nuw S2_asl_i_r renamable $r2, 2
    J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit internal killed $r29, implicit killed $r0, implicit killed $r1, implicit internal killed $r2, implicit-def $r29, implicit-def dead $r0
  }
  $d15 = L2_deallocframe killed $r30, implicit-def $r29, implicit killed $framekey
  PS_jmpret killed $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Contiguously Lay Out Funclets (funclet-layout) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, FailsVerification, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def dead $p0, implicit-def $pc, implicit $r2, implicit killed $r31 {
    renamable $p0 = C2_cmpgti renamable $r2, 0
    PS_jmpretfnew internal killed $p0, killed $r31, implicit-def $pc, implicit-def $pc
  }

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def $r29, implicit-def $r30, implicit-def dead $r2, implicit-def dead $pc, implicit-def dead $r31, implicit-def dead $r0, implicit $r29, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31, implicit $r2, implicit killed $r0, implicit killed $r1 {
    $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31 :: (store (s32) into stack)
    renamable $r2 = nuw S2_asl_i_r renamable $r2, 2
    J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit internal killed $r29, implicit killed $r0, implicit killed $r1, implicit internal killed $r2, implicit-def $r29, implicit-def dead $r0
  }
  $d15 = L2_deallocframe killed $r30, implicit-def $r29, implicit killed $framekey
  PS_jmpret killed $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After StackMap Liveness Analysis (stackmap-liveness) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, FailsVerification, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def dead $p0, implicit-def $pc, implicit $r2, implicit killed $r31 {
    renamable $p0 = C2_cmpgti renamable $r2, 0
    PS_jmpretfnew internal killed $p0, killed $r31, implicit-def $pc, implicit-def $pc
  }

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def $r29, implicit-def $r30, implicit-def dead $r2, implicit-def dead $pc, implicit-def dead $r31, implicit-def dead $r0, implicit $r29, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31, implicit $r2, implicit killed $r0, implicit killed $r1 {
    $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31 :: (store (s32) into stack)
    renamable $r2 = nuw S2_asl_i_r renamable $r2, 2
    J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit internal killed $r29, implicit killed $r0, implicit killed $r1, implicit internal killed $r2, implicit-def $r29, implicit-def dead $r0
  }
  $d15 = L2_deallocframe killed $r30, implicit-def $r29, implicit killed $framekey
  PS_jmpret killed $r31, implicit-def dead $pc

# End machine code for function test.

# *** IR Dump After Live DEBUG_VALUE analysis (livedebugvalues) ***:
# Machine code for function test: NoPHIs, TracksLiveness, NoVRegs, TiedOpsRewritten, FailsVerification, TracksDebugUserValues
Function Live Ins: $r0, $r1, $r2

bb.0.entry:
  successors: %bb.1(0x80000000); %bb.1(100.00%)
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def dead $p0, implicit-def $pc, implicit $r2, implicit killed $r31 {
    renamable $p0 = C2_cmpgti renamable $r2, 0
    PS_jmpretfnew internal killed $p0, killed $r31, implicit-def $pc, implicit-def $pc
  }

bb.1.for.body.preheader:
; predecessors: %bb.0
  liveins: $r0, $r1, $r2
  BUNDLE implicit-def $r29, implicit-def $r30, implicit-def dead $r2, implicit-def dead $pc, implicit-def dead $r31, implicit-def dead $r0, implicit $r29, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31, implicit $r2, implicit killed $r0, implicit killed $r1 {
    $r29 = S2_allocframe $r29(tied-def 0), 0, implicit-def $r30, implicit killed $framekey, implicit killed $framelimit, implicit killed $r30, implicit killed $r31 :: (store (s32) into stack)
    renamable $r2 = nuw S2_asl_i_r renamable $r2, 2
    J2_call &memcpy, <regmask $d8 $d9 $d10 $d11 $d12 $d13 $r16 $r17 $r18 $r19 $r20 $r21 $r22 $r23 $r24 $r25 $r26 $r27>, implicit-def dead $pc, implicit-def dead $r31, implicit internal killed $r29, implicit killed $r0, implicit killed $r1, implicit internal killed $r2, implicit-def $r29, implicit-def dead $r0
  }
  $d15 = L2_deallocframe killed $r30, implicit-def $r29, implicit killed $framekey
  PS_jmpret killed $r31, implicit-def dead $pc

# End machine code for function test.

