; ModuleID = 'clock'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [
%struct.cudaIpcEventHandle_st = type { [64 x i8] }
%struct.CUevent_st = type opaque
%struct.cudaIpcMemHandle_st = type { [64 x i8] }
%struct.cudaChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.cudaExtent = type { i64, i64, i64 }
%struct.cudaArray = type opaque
%struct.cudaPitchedPtr = type { i8*, i64, i64, i64 }
%struct.CUstream_st = type opaque
%struct.cudaMemcpy3DParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaExtent, i32 }
%struct.cudaPos = type { i64, i64, i64 }
%struct.cudaMemcpy3DPeerParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaExtent }

@.str = private unnamed_addr constant [19 x i8] c"CUDA Clock sample\0A\00", align 1
@threadIdx = external global %struct.dim3
@blockIdx = external global %struct.dim3
@shared = external global [0 x float], section "__shared__"
@blockDim = external global %struct.dim3
@gridDim = external global %struct.dim3
@.str1 = private unnamed_addr constant [65 x i8] c"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str12 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str111 = private unnamed_addr constant [11 x i8] c"GPU device\00", align 1

define i32 @main(i32 %argc, i8** %argv) uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %dinput = alloca float*, align 8
  %doutput = alloca float*, align 8
  %dtimer = alloca i64*, align 8
  %timer = alloca [128 x i64], align 16
  %input = alloca [512 x float], align 16
  %i = alloca i32, align 4
  %agg.tmp = alloca %struct.dim3, align 4
  %agg.tmp5 = alloca %struct.dim3, align 4
  %agg.tmp.coerce = alloca { i64, i32 }
  %agg.tmp5.coerce = alloca { i64, i32 }
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0)), !dbg !969
  store float* null, float** %dinput, align 8, !dbg !971
  store float* null, float** %doutput, align 8, !dbg !972
  store i64* null, i64** %dtimer, align 8, !dbg !973
  store i32 0, i32* %i, align 4, !dbg !974
  br label %for.cond, !dbg !974

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32* %i, align 4, !dbg !974
  %cmp = icmp slt i32 %0, 512, !dbg !974
  br i1 %cmp, label %for.body, label %for.end, !dbg !974

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4, !dbg !976
  %conv = sitofp i32 %1 to float, !dbg !976
  %2 = load i32* %i, align 4, !dbg !976
  %idxprom = sext i32 %2 to i64, !dbg !976
  %arrayidx = getelementptr inbounds [512 x float]* %input, i32 0, i64 %idxprom, !dbg !976
  store float %conv, float* %arrayidx, align 4, !dbg !976
  %3 = load i32* %i, align 4, !dbg !974
  %inc = add nsw i32 %3, 1, !dbg !974
  store i32 %inc, i32* %i, align 4, !dbg !974
  br label %for.cond, !dbg !974

for.end:                                          ; preds = %for.cond
  %4 = bitcast float** %dinput to i8**, !dbg !978
  %call1 = call i32 @cudaMalloc(i8** %4, i64 2048), !dbg !978
  %5 = bitcast float** %doutput to i8**, !dbg !979
  %call2 = call i32 @cudaMalloc(i8** %5, i64 256), !dbg !979
  %6 = bitcast i64** %dtimer to i8**, !dbg !980
  %call3 = call i32 @cudaMalloc(i8** %6, i64 1024), !dbg !980
  %7 = load float** %dinput, align 8, !dbg !981
  %8 = bitcast float* %7 to i8*, !dbg !981
  %arraydecay = getelementptr inbounds [512 x float]* %input, i32 0, i32 0, !dbg !981
  %9 = bitcast float* %arraydecay to i8*, !dbg !981
  %call4 = call i32 @cudaMemcpy(i8* %8, i8* %9, i64 2048, i32 1), !dbg !981
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %agg.tmp, i32 64, i32 1, i32 1), !dbg !982
  call void @_ZN4dim3C1Ejjj(%struct.dim3* %agg.tmp5, i32 256, i32 1, i32 1), !dbg !982
  %10 = bitcast { i64, i32 }* %agg.tmp.coerce to i8*, !dbg !982
  %11 = bitcast %struct.dim3* %agg.tmp to i8*, !dbg !982
  %12 = call i8* @memcpy(i8* %10, i8* %11, i64 12)
  %13 = getelementptr { i64, i32 }* %agg.tmp.coerce, i32 0, i32 0, !dbg !982
  %14 = load i64* %13, align 1, !dbg !982
  %15 = getelementptr { i64, i32 }* %agg.tmp.coerce, i32 0, i32 1, !dbg !982
  %16 = load i32* %15, align 1, !dbg !982
  %17 = bitcast { i64, i32 }* %agg.tmp5.coerce to i8*, !dbg !982
  %18 = bitcast %struct.dim3* %agg.tmp5 to i8*, !dbg !982
  %19 = call i8* @memcpy(i8* %17, i8* %18, i64 12)
  %20 = getelementptr { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 0, !dbg !982
  %21 = load i64* %20, align 1, !dbg !982
  %22 = getelementptr { i64, i32 }* %agg.tmp5.coerce, i32 0, i32 1, !dbg !982
  %23 = load i32* %22, align 1, !dbg !982
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %14, i32 %16, i64 %21, i32 %23, i64 2048), !dbg !982
  %24 = load float** %dinput, align 8, !dbg !984
  %25 = load float** %doutput, align 8, !dbg !984
  %26 = load i64** %dtimer, align 8, !dbg !984
  call void @_ZL14timedReductionPKfPfPl(float* %24, float* %25, i64* %26), !dbg !984
  %arraydecay6 = getelementptr inbounds [128 x i64]* %timer, i32 0, i32 0, !dbg !985
  %27 = bitcast i64* %arraydecay6 to i8*, !dbg !985
  %28 = load i64** %dtimer, align 8, !dbg !985
  %29 = bitcast i64* %28 to i8*, !dbg !985
  %call7 = call i32 @cudaMemcpy(i8* %27, i8* %29, i64 1024, i32 2), !dbg !985
  %30 = load float** %dinput, align 8, !dbg !986
  %31 = bitcast float* %30 to i8*, !dbg !986
  %call8 = call i32 @cudaFree(i8* %31), !dbg !986
  %32 = load float** %doutput, align 8, !dbg !987
  %33 = bitcast float* %32 to i8*, !dbg !987
  %call9 = call i32 @cudaFree(i8* %33), !dbg !987
  %34 = load i64** %dtimer, align 8, !dbg !988
  %35 = bitcast i64* %34 to i8*, !dbg !988
  %call10 = call i32 @cudaFree(i8* %35), !dbg !988
  %call11 = call i32 @cudaDeviceReset(), !dbg !989
  ret i32 0, !dbg !990
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @printf(i8*, ...)

declare void @__set_CUDAConfig(i64, i32, i64, i32, ...)

define linkonce_odr void @_ZN4dim3C1Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr uwtable section "__device__" align 2 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  store i32 %vx, i32* %vx.addr, align 4
  store i32 %vy, i32* %vy.addr, align 4
  store i32 %vz, i32* %vz.addr, align 4
  %this1 = load %struct.dim3** %this.addr
  %0 = load i32* %vx.addr, align 4, !dbg !991
  %1 = load i32* %vy.addr, align 4, !dbg !991
  %2 = load i32* %vz.addr, align 4, !dbg !991
  call void @_ZN4dim3C2Ejjj(%struct.dim3* %this1, i32 %0, i32 %1, i32 %2), !dbg !991
  ret void, !dbg !991
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal void @_ZL14timedReductionPKfPfPl(float* %input, float* %output, i64* %timer) uwtable noinline {
entry:
  %input.addr = alloca float*, align 8
  %output.addr = alloca float*, align 8
  %timer.addr = alloca i64*, align 8
  %tid = alloca i32, align 4
  %bid = alloca i32, align 4
  %d = alloca i32, align 4
  %f0 = alloca float, align 4
  %f1 = alloca float, align 4
  store float* %input, float** %input.addr, align 8
  store float* %output, float** %output.addr, align 8
  store i64* %timer, i64** %timer.addr, align 8
  %0 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i32 0, i32 0), align 4, !dbg !992
  store i32 %0, i32* %tid, align 4, !dbg !992
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i32 0, i32 0), align 4, !dbg !994
  store i32 %1, i32* %bid, align 4, !dbg !994
  %2 = load i32* %tid, align 4, !dbg !995
  %cmp = icmp eq i32 %2, 0, !dbg !995
  br i1 %cmp, label %if.then, label %if.end, !dbg !995

if.then:                                          ; preds = %entry
  %call = call i64 @clock() nounwind, !dbg !995
  %3 = load i32* %bid, align 4, !dbg !995
  %idxprom = sext i32 %3 to i64, !dbg !995
  %4 = load i64** %timer.addr, align 8, !dbg !995
  %arrayidx = getelementptr inbounds i64* %4, i64 %idxprom, !dbg !995
  store i64 %call, i64* %arrayidx, align 8, !dbg !995
  br label %if.end, !dbg !995

if.end:                                           ; preds = %if.then, %entry
  %5 = load i32* %tid, align 4, !dbg !996
  %idxprom1 = sext i32 %5 to i64, !dbg !996
  %6 = load float** %input.addr, align 8, !dbg !996
  %arrayidx2 = getelementptr inbounds float* %6, i64 %idxprom1, !dbg !996
  %7 = load float* %arrayidx2, align 4, !dbg !996
  %8 = load i32* %tid, align 4, !dbg !996
  %idxprom3 = sext i32 %8 to i64, !dbg !996
  %arrayidx4 = getelementptr inbounds [0 x float]* @shared, i32 0, i64 %idxprom3, !dbg !996
  store float %7, float* %arrayidx4, align 1, !dbg !996
  %9 = load i32* %tid, align 4, !dbg !997
  %10 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 0), align 4, !dbg !997
  %add = add i32 %9, %10, !dbg !997
  %idxprom5 = zext i32 %add to i64, !dbg !997
  %11 = load float** %input.addr, align 8, !dbg !997
  %arrayidx6 = getelementptr inbounds float* %11, i64 %idxprom5, !dbg !997
  %12 = load float* %arrayidx6, align 4, !dbg !997
  %13 = load i32* %tid, align 4, !dbg !997
  %14 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 0), align 4, !dbg !997
  %add7 = add i32 %13, %14, !dbg !997
  %idxprom8 = zext i32 %add7 to i64, !dbg !997
  %arrayidx9 = getelementptr inbounds [0 x float]* @shared, i32 0, i64 %idxprom8, !dbg !997
  store float %12, float* %arrayidx9, align 1, !dbg !997
  %15 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i32 0, i32 0), align 4, !dbg !998
  store i32 %15, i32* %d, align 4, !dbg !998
  br label %for.cond, !dbg !998

for.cond:                                         ; preds = %for.inc, %if.end
  %16 = load i32* %d, align 4, !dbg !998
  %cmp10 = icmp sgt i32 %16, 0, !dbg !998
  br i1 %cmp10, label %for.body, label %for.end, !dbg !998

for.body:                                         ; preds = %for.cond
  call void @__syncthreads(), !dbg !1000
  %17 = load i32* %tid, align 4, !dbg !1002
  %18 = load i32* %d, align 4, !dbg !1002
  %cmp11 = icmp slt i32 %17, %18, !dbg !1002
  br i1 %cmp11, label %if.then12, label %for.inc, !dbg !1002

if.then12:                                        ; preds = %for.body
  %19 = load i32* %tid, align 4, !dbg !1003
  %idxprom13 = sext i32 %19 to i64, !dbg !1003
  %arrayidx14 = getelementptr inbounds [0 x float]* @shared, i32 0, i64 %idxprom13, !dbg !1003
  %20 = load float* %arrayidx14, align 1, !dbg !1003
  store float %20, float* %f0, align 4, !dbg !1003
  %21 = load i32* %tid, align 4, !dbg !1005
  %22 = load i32* %d, align 4, !dbg !1005
  %add15 = add nsw i32 %21, %22, !dbg !1005
  %idxprom16 = sext i32 %add15 to i64, !dbg !1005
  %arrayidx17 = getelementptr inbounds [0 x float]* @shared, i32 0, i64 %idxprom16, !dbg !1005
  %23 = load float* %arrayidx17, align 1, !dbg !1005
  store float %23, float* %f1, align 4, !dbg !1005
  %24 = load float* %f1, align 4, !dbg !1006
  %25 = load float* %f0, align 4, !dbg !1006
  %cmp18 = fcmp olt float %24, %25, !dbg !1006
  br i1 %cmp18, label %if.then19, label %for.inc, !dbg !1006

if.then19:                                        ; preds = %if.then12
  %26 = load float* %f1, align 4, !dbg !1007
  %27 = load i32* %tid, align 4, !dbg !1007
  %idxprom20 = sext i32 %27 to i64, !dbg !1007
  %arrayidx21 = getelementptr inbounds [0 x float]* @shared, i32 0, i64 %idxprom20, !dbg !1007
  store float %26, float* %arrayidx21, align 1, !dbg !1007
  br label %for.inc, !dbg !1009

for.inc:                                          ; preds = %for.body, %if.then19, %if.then12
  %28 = load i32* %d, align 4, !dbg !998
  %int_cast_to_i64 = zext i32 2 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %div = sdiv i32 %28, 2, !dbg !998
  store i32 %div, i32* %d, align 4, !dbg !998
  br label %for.cond, !dbg !998

for.end:                                          ; preds = %for.cond
  %29 = load i32* %tid, align 4, !dbg !1010
  %cmp24 = icmp eq i32 %29, 0, !dbg !1010
  br i1 %cmp24, label %if.then25, label %if.end28, !dbg !1010

if.then25:                                        ; preds = %for.end
  %30 = load float* getelementptr inbounds ([0 x float]* @shared, i32 0, i64 0), align 1, !dbg !1010
  %31 = load i32* %bid, align 4, !dbg !1010
  %idxprom26 = sext i32 %31 to i64, !dbg !1010
  %32 = load float** %output.addr, align 8, !dbg !1010
  %arrayidx27 = getelementptr inbounds float* %32, i64 %idxprom26, !dbg !1010
  store float %30, float* %arrayidx27, align 4, !dbg !1010
  br label %if.end28, !dbg !1010

if.end28:                                         ; preds = %if.then25, %for.end
  call void @__syncthreads(), !dbg !1011
  %33 = load i32* %tid, align 4, !dbg !1012
  %cmp29 = icmp eq i32 %33, 0, !dbg !1012
  br i1 %cmp29, label %if.then30, label %if.end35, !dbg !1012

if.then30:                                        ; preds = %if.end28
  %call31 = call i64 @clock() nounwind, !dbg !1012
  %34 = load i32* %bid, align 4, !dbg !1012
  %35 = load i32* getelementptr inbounds (%struct.dim3* @gridDim, i32 0, i32 0), align 4, !dbg !1012
  %add32 = add i32 %34, %35, !dbg !1012
  %idxprom33 = zext i32 %add32 to i64, !dbg !1012
  %36 = load i64** %timer.addr, align 8, !dbg !1012
  %arrayidx34 = getelementptr inbounds i64* %36, i64 %idxprom33, !dbg !1012
  store i64 %call31, i64* %arrayidx34, align 8, !dbg !1012
  br label %if.end35, !dbg !1012

if.end35:                                         ; preds = %if.then30, %if.end28
  ret void, !dbg !1013
}

declare i64 @clock() nounwind section "__device__"

declare void @__syncthreads() section "__device__"

define linkonce_odr void @_ZN4dim3C2Ejjj(%struct.dim3* %this, i32 %vx, i32 %vy, i32 %vz) unnamed_addr nounwind uwtable section "__device__" align 2 {
entry:
  %this.addr = alloca %struct.dim3*, align 8
  %vx.addr = alloca i32, align 4
  %vy.addr = alloca i32, align 4
  %vz.addr = alloca i32, align 4
  store %struct.dim3* %this, %struct.dim3** %this.addr, align 8
  store i32 %vx, i32* %vx.addr, align 4
  store i32 %vy, i32* %vy.addr, align 4
  store i32 %vz, i32* %vz.addr, align 4
  %this1 = load %struct.dim3** %this.addr
  %x = getelementptr inbounds %struct.dim3* %this1, i32 0, i32 0, !dbg !1014
  %0 = load i32* %vx.addr, align 4, !dbg !1014
  store i32 %0, i32* %x, align 4, !dbg !1014
  %y = getelementptr inbounds %struct.dim3* %this1, i32 0, i32 1, !dbg !1014
  %1 = load i32* %vy.addr, align 4, !dbg !1014
  store i32 %1, i32* %y, align 4, !dbg !1014
  %z = getelementptr inbounds %struct.dim3* %this1, i32 0, i32 2, !dbg !1014
  %2 = load i32* %vz.addr, align 4, !dbg !1014
  store i32 %2, i32* %z, align 4, !dbg !1014
  ret void, !dbg !1015
}

define void @klee_div_zero_check(i64 %z) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %z, 0, !dbg !1017
  br i1 %cmp, label %if.then, label %if.end, !dbg !1017

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([65 x i8]* @.str1, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str12, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0)) noreturn nounwind, !dbg 
  unreachable, !dbg !1019

if.end:                                           ; preds = %entry
  ret void, !dbg !1020
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !1021
  br i1 %cmp3, label %while.end, label %while.body, !dbg !1021

while.body:                                       ; preds = %while.body, %entry
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %srcaddr, %entry ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %destaddr, %entry ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %len, %entry ]
  %dec = add i64 %len.addr.04, -1, !dbg !1021
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !1022
  %0 = load i8* %src.06, align 1, !dbg !1022, !tbaa !1023
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !1022
  store i8 %0, i8* %dest.05, align 1, !dbg !1022, !tbaa !1023
  %cmp = icmp eq i64 %dec, 0, !dbg !1021
  br i1 %cmp, label %while.end, label %while.body, !dbg !1021

while.end:                                        ; preds = %while.body, %entry
  ret i8* %destaddr, !dbg !1025
}

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
entry:
  %cmp2 = icmp eq i64 %count, 0, !dbg !1026
  br i1 %cmp2, label %while.end, label %while.body.lr.ph, !dbg !1026

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %s to i8, !dbg !1027
  br label %while.body, !dbg !1026

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %a.04 = phi i8* [ %dst, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %count.addr.03 = phi i64 [ %count, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i64 %count.addr.03, -1, !dbg !1026
  %incdec.ptr = getelementptr inbounds i8* %a.04, i64 1, !dbg !1027
  store volatile i8 %conv, i8* %a.04, align 1, !dbg !1027, !tbaa !1023
  %cmp = icmp eq i64 %dec, 0, !dbg !1026
  br i1 %cmp, label %while.end, label %while.body, !dbg !1026

while.end:                                        ; preds = %while.body, %entry
  ret i8* %dst, !dbg !1028
}

define i32 @cudaChooseDevice(i32* nocapture %device, %struct.cudaDeviceProp* nocapture %prop) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !1029, !tbaa !1031
  ret i32 0, !dbg !1032
}

define i32 @cudaDeviceGetByPCIBusId(i32* nocapture %device, i8* nocapture %pciBusId) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !1033, !tbaa !1031
  ret i32 0, !dbg !1035
}

define i32 @cudaDeviceGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1036
}

define i32 @cudaDeviceGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1038
}

define i32 @cudaDeviceGetPCIBusId(i8* nocapture %pciBusId, i32 %len, i32 %device) nounwind uwtable {
entry:
  %0 = bitcast i8* %pciBusId to i32*, !dbg !1040
  store i32 3171433, i32* %0, align 1, !dbg !1040
  ret i32 0, !dbg !1042
}

define i32 @cudaDeviceReset() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1043
}

define i32 @cudaDeviceSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1045
}

define i32 @cudaDeviceSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1047
}

define i32 @cudaDeviceSynchronize() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1049
}

define i32 @cudaGetDevice(i32* nocapture %device) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !1051, !tbaa !1031
  ret i32 0, !dbg !1053
}

define i32 @cudaGetDeviceCount(i32* nocapture %count) nounwind uwtable {
entry:
  store i32 1, i32* %count, align 4, !dbg !1054, !tbaa !1031
  ret i32 0, !dbg !1056
}

define i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nocapture %prop, i32 %device) nounwind uwtable {
entry:
  %arraydecay = getelementptr inbounds %struct.cudaDeviceProp* %prop, i64 0, i32 0, i64 0, !dbg !1057
  %0 = call i8* @memcpy(i8* %arraydecay, i8* getelementptr inbounds ([11 x i8]* @.str111, i64 0, i64 0), i64 11)
  ret i32 0, !dbg !1059
}

define i32 @cudaIpcCloseMemHandle(i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1060
}

define i32 @cudaIpcGetEventHandle(%struct.cudaIpcEventHandle_st* nocapture %handle, %struct.CUevent_st* nocapture %event) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1062
}

define i32 @cudaIpcGetMemHandle(%struct.cudaIpcMemHandle_st* nocapture %handle, i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1064
}

define i32 @cudaIpcOpenEventHandle(%struct.CUevent_st** nocapture %event, %struct.cudaIpcEventHandle_st* nocapture byval align 8 %handle) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1066
}

define i32 @cudaIpcOpenMemHandle(i8** nocapture %devPtr, %struct.cudaIpcMemHandle_st* nocapture byval align 8 %handle, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1068
}

define i32 @cudaSetDevice(i32 %device) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1070
}

define i32 @cudaSetDeviceFlags(i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1072
}

define i32 @cudaSetValidDevices(i32* nocapture %device_arr, i32 %len) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1074
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1076
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
entry:
  tail call void @free(i8* %devPtr) nounwind, !dbg !1078
  ret i32 0, !dbg !1080
}

declare void @free(i8* nocapture) nounwind

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
entry:
  %0 = bitcast %struct.cudaArray* %array to i8*, !dbg !1081
  tail call void @free(i8* %0) nounwind, !dbg !1081
  ret i32 0, !dbg !1083
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
entry:
  tail call void @free(i8* %ptr) nounwind, !dbg !1084
  ret i32 0, !dbg !1086
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1087
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1089
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1091
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1093
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1095
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1097
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1099
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
entry:
  tail call void @__set_device(), !dbg !1101
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1103
  store i8* %call, i8** %devPtr, align 8, !dbg !1103, !tbaa !1104
  tail call void @__clear_device(), !dbg !1105
  ret i32 0, !dbg !1106
}

declare void @__set_device()

declare noalias i8* @malloc(i64) nounwind

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1107
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1109
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1111
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
entry:
  tail call void @__set_host(), !dbg !1113
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1115
  store i8* %call, i8** %ptr, align 8, !dbg !1115, !tbaa !1104
  tail call void @__clear_host(), !dbg !1116
  ret i32 0, !dbg !1117
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1118
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1120
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1122
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1124
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1126
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1128
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1130
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1132
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1134
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1136
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1138
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1140
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1142
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1144
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1146
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1148
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1150
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1152
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1154
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1156
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1158
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1160
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1162
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
entry:
  %add.ptr = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !1164
  %0 = call i8* @memcpy(i8* %add.ptr, i8* %src, i64 %count)
  ret i32 0, !dbg !1166
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1167
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1169
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
entry:
  %0 = trunc i32 %value to i8, !dbg !1171
  %1 = zext i8 %0 to i32
  %2 = call i8* @memset(i8* %devPtr, i32 %1, i64 %count)
  ret i32 0, !dbg !1173
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1174
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1176
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1178
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1180
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1182
}

!llvm.dbg.cu = !{!0, !78, !89, !111, !127, !144, !453}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"clock.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 false, metadata !"", i32 0, metadata !1, metad
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3}
!3 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !4, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock", null} ; [ DW_TAG_file_type ]
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10}
!6 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!7 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!8 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!9 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!10 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!11 = metadata !{metadata !12}
!12 = metadata !{i32 0}
!13 = metadata !{metadata !14}
!14 = metadata !{metadata !15, metadata !23, metadata !34, metadata !77}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 91, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, i32 (i32, i8**)* @main, null, null, metadata !11, i32 92} ; 
!16 = metadata !{i32 786473, metadata !"clock.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19, metadata !20}
!19 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!22 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!23 = metadata !{i32 786478, i32 0, metadata !16, metadata !"timedReduction", metadata !"timedReduction", metadata !"_ZL14timedReductionPKfPfPl", metadata !16, i32 25, metadata !24, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*, f
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!25 = metadata !{null, metadata !26, metadata !29, metadata !30}
!26 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !27} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!27 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !28} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float]
!28 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!29 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !28} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!30 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from clock_t]
!31 = metadata !{i32 786454, null, metadata !"clock_t", metadata !16, i32 59, i64 0, i64 0, i64 0, i32 0, metadata !32} ; [ DW_TAG_typedef ] [clock_t] [line 59, size 0, align 0, offset 0] [from __clock_t]
!32 = metadata !{i32 786454, null, metadata !"__clock_t", metadata !16, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !33} ; [ DW_TAG_typedef ] [__clock_t] [line 135, size 0, align 0, offset 0] [from long int]
!33 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!34 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !35, i32 419, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C1Ejjj,
!35 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock", null} ; [ DW_TAG_file_type ]
!36 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !37, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!37 = metadata !{null, metadata !38, metadata !42, metadata !42, metadata !42}
!38 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !39} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!39 = metadata !{i32 786451, null, metadata !"dim3", metadata !35, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !40, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!40 = metadata !{metadata !41, metadata !43, metadata !44, metadata !45, metadata !48, metadata !66, metadata !69, metadata !74}
!41 = metadata !{i32 786445, metadata !39, metadata !"x", metadata !35, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!42 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!43 = metadata !{i32 786445, metadata !39, metadata !"y", metadata !35, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !42} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!44 = metadata !{i32 786445, metadata !39, metadata !"z", metadata !35, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !42} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!45 = metadata !{i32 786478, i32 0, metadata !39, metadata !"dim3", metadata !"dim3", metadata !"", metadata !35, i32 419, metadata !36, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !46, i32 419} ; [ DW_TAG_subpr
!46 = metadata !{metadata !47}
!47 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!48 = metadata !{i32 786478, i32 0, metadata !39, metadata !"dim3", metadata !"dim3", metadata !"", metadata !35, i32 420, metadata !49, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !46, i32 420} ; [ DW_TAG_subpr
!49 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !50, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!50 = metadata !{null, metadata !38, metadata !51}
!51 = metadata !{i32 786454, null, metadata !"uint3", metadata !35, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!52 = metadata !{i32 786451, null, metadata !"uint3", metadata !35, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !53, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!53 = metadata !{metadata !54, metadata !55, metadata !56, metadata !57, metadata !61}
!54 = metadata !{i32 786445, metadata !52, metadata !"x", metadata !35, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !42} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!55 = metadata !{i32 786445, metadata !52, metadata !"y", metadata !35, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !42} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!56 = metadata !{i32 786445, metadata !52, metadata !"z", metadata !35, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !42} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!57 = metadata !{i32 786478, i32 0, metadata !52, metadata !"uint3", metadata !"uint3", metadata !"", metadata !35, i32 188, metadata !58, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !46, i32 188} ; [ DW_TAG_sub
!58 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!59 = metadata !{null, metadata !60}
!60 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !52} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!61 = metadata !{i32 786478, i32 0, metadata !52, metadata !"uint3", metadata !"uint3", metadata !"", metadata !35, i32 188, metadata !62, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !46, i32 188} ; [ DW_TAG_sub
!62 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!63 = metadata !{null, metadata !60, metadata !64}
!64 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !65} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!65 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!66 = metadata !{i32 786478, i32 0, metadata !39, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !35, i32 421, metadata !67, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, m
!67 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !68, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!68 = metadata !{metadata !51, metadata !38}
!69 = metadata !{i32 786478, i32 0, metadata !39, metadata !"dim3", metadata !"dim3", metadata !"", metadata !35, i32 415, metadata !70, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !46, i32 415} ; [ DW_TAG_subpr
!70 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!71 = metadata !{null, metadata !38, metadata !72}
!72 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!73 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !39} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!74 = metadata !{i32 786478, i32 0, metadata !39, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !35, i32 415, metadata !75, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !46, i32 415} ; [ DW_TAG_sub
!75 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = metadata !{null, metadata !38}
!77 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !35, i32 419, metadata !36, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (%struct.dim3*, i32, i32, i32)* @_ZN4dim3C2Ejjj,
!78 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true
!79 = metadata !{metadata !80}
!80 = metadata !{metadata !81}
!81 = metadata !{i32 786478, i32 0, metadata !82, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", metadata !82, i32 12, metadata !83, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_chec
!82 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!83 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!84 = metadata !{null, metadata !85}
!85 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!86 = metadata !{metadata !87}
!87 = metadata !{metadata !88}
!88 = metadata !{i32 786689, metadata !81, metadata !"z", metadata !82, i32 16777228, metadata !85, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!89 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"
!90 = metadata !{metadata !91}
!91 = metadata !{metadata !92}
!92 = metadata !{i32 786478, i32 0, metadata !93, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !93, i32 12, metadata !94, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !101, 
!93 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!94 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = metadata !{metadata !96, metadata !96, metadata !97, metadata !99}
!96 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!97 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !98} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!98 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!99 = metadata !{i32 786454, null, metadata !"size_t", metadata !93, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!100 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!101 = metadata !{metadata !102}
!102 = metadata !{metadata !103, metadata !104, metadata !105, metadata !106, metadata !108}
!103 = metadata !{i32 786689, metadata !92, metadata !"destaddr", metadata !93, i32 16777228, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!104 = metadata !{i32 786689, metadata !92, metadata !"srcaddr", metadata !93, i32 33554444, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!105 = metadata !{i32 786689, metadata !92, metadata !"len", metadata !93, i32 50331660, metadata !99, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!106 = metadata !{i32 786688, metadata !107, metadata !"dest", metadata !93, i32 13, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!107 = metadata !{i32 786443, metadata !92, i32 12, i32 0, metadata !93, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c]
!108 = metadata !{i32 786688, metadata !107, metadata !"src", metadata !93, i32 14, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!109 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!110 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!111 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata 
!112 = metadata !{metadata !113}
!113 = metadata !{metadata !114}
!114 = metadata !{i32 786478, i32 0, metadata !115, metadata !"memmove", metadata !"memmove", metadata !"", metadata !115, i32 12, metadata !116, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !119, i32 12} ; [ DW_TAG
!115 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!116 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !117, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!117 = metadata !{metadata !96, metadata !96, metadata !97, metadata !118}
!118 = metadata !{i32 786454, null, metadata !"size_t", metadata !115, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!119 = metadata !{metadata !120}
!120 = metadata !{metadata !121, metadata !122, metadata !123, metadata !124, metadata !126}
!121 = metadata !{i32 786689, metadata !114, metadata !"dst", metadata !115, i32 16777228, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!122 = metadata !{i32 786689, metadata !114, metadata !"src", metadata !115, i32 33554444, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!123 = metadata !{i32 786689, metadata !114, metadata !"count", metadata !115, i32 50331660, metadata !118, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!124 = metadata !{i32 786688, metadata !125, metadata !"a", metadata !115, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!125 = metadata !{i32 786443, metadata !114, i32 12, i32 0, metadata !115, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c]
!126 = metadata !{i32 786688, metadata !125, metadata !"b", metadata !115, i32 15, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!127 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!128 = metadata !{metadata !129}
!129 = metadata !{metadata !130}
!130 = metadata !{i32 786478, i32 0, metadata !131, metadata !"memset", metadata !"memset", metadata !"", metadata !131, i32 12, metadata !132, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!131 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!132 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !133, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!133 = metadata !{metadata !96, metadata !96, metadata !19, metadata !134}
!134 = metadata !{i32 786454, null, metadata !"size_t", metadata !131, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!135 = metadata !{metadata !136}
!136 = metadata !{metadata !137, metadata !138, metadata !139, metadata !140}
!137 = metadata !{i32 786689, metadata !130, metadata !"dst", metadata !131, i32 16777228, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!138 = metadata !{i32 786689, metadata !130, metadata !"s", metadata !131, i32 33554444, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!139 = metadata !{i32 786689, metadata !130, metadata !"count", metadata !131, i32 50331660, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!140 = metadata !{i32 786688, metadata !141, metadata !"a", metadata !131, i32 13, metadata !142, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!141 = metadata !{i32 786443, metadata !130, i32 12, i32 0, metadata !131, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c]
!142 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !143} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!143 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!144 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tr
!145 = metadata !{metadata !146}
!146 = metadata !{metadata !147, metadata !222, metadata !228}
!147 = metadata !{i32 786436, null, metadata !"cudaError", metadata !148, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !149, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!148 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!149 = metadata !{metadata !150, metadata !151, metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !157, metadata !158, metadata !159, metadata !160, metadata !161, metadata !162, metadata !163, metadata !164, metadata !1
!150 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!151 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!152 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!153 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!154 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!155 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!156 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!157 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!158 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!159 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!160 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!161 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!162 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!163 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!164 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!165 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!166 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!167 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!168 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!169 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!170 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!171 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!172 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!173 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!174 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!175 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!176 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!177 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!178 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!179 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!180 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!181 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!182 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!183 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!184 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!185 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!186 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!187 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!188 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!189 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!190 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!191 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!192 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!193 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!194 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!195 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!196 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!197 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!198 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!199 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!200 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!201 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!202 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!203 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!204 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!205 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!206 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!207 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!208 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!209 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!210 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!211 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!212 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!213 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!214 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!215 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!216 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!217 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!218 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!219 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!220 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!221 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!222 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !148, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !223, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!223 = metadata !{metadata !224, metadata !225, metadata !226, metadata !227}
!224 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!225 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!226 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!227 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!228 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !148, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !229, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!229 = metadata !{metadata !230, metadata !231, metadata !232, metadata !233, metadata !234}
!230 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!231 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!232 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!233 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!234 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!235 = metadata !{metadata !236}
!236 = metadata !{metadata !237, metadata !316, metadata !323, metadata !330, metadata !338, metadata !346, metadata !349, metadata !355, metadata !362, metadata !363, metadata !369, metadata !373, metadata !381, metadata !387, metadata !405, metadata !4
!237 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaChooseDevice", metadata !"cudaChooseDevice", metadata !"", metadata !238, i32 14, metadata !239, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, %struct.cudaDeviceProp
!238 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!239 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !240, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!240 = metadata !{metadata !241, metadata !242, metadata !243}
!241 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !238, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !147} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!242 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!243 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !244} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!244 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !245} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaDeviceProp]
!245 = metadata !{i32 786451, null, metadata !"cudaDeviceProp", metadata !148, i32 1145, i64 4800, i64 64, i32 0, i32 0, null, metadata !246, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaDeviceProp] [line 1145, size 4800, align 64, offset 0] [fr
!246 = metadata !{metadata !247, metadata !251, metadata !253, metadata !254, metadata !255, metadata !256, metadata !257, metadata !258, metadata !262, metadata !263, metadata !264, metadata !265, metadata !266, metadata !267, metadata !268, metadata !2
!247 = metadata !{i32 786445, metadata !245, metadata !"name", metadata !148, i32 1147, i64 2048, i64 8, i64 0, i32 0, metadata !248} ; [ DW_TAG_member ] [name] [line 1147, size 2048, align 8, offset 0] [from ]
!248 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !22, metadata !249, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!249 = metadata !{metadata !250}
!250 = metadata !{i32 786465, i64 0, i64 255}     ; [ DW_TAG_subrange_type ] [0, 255]
!251 = metadata !{i32 786445, metadata !245, metadata !"totalGlobalMem", metadata !148, i32 1148, i64 64, i64 64, i64 2048, i32 0, metadata !252} ; [ DW_TAG_member ] [totalGlobalMem] [line 1148, size 64, align 64, offset 2048] [from size_t]
!252 = metadata !{i32 786454, null, metadata !"size_t", metadata !148, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !100} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!253 = metadata !{i32 786445, metadata !245, metadata !"sharedMemPerBlock", metadata !148, i32 1149, i64 64, i64 64, i64 2112, i32 0, metadata !252} ; [ DW_TAG_member ] [sharedMemPerBlock] [line 1149, size 64, align 64, offset 2112] [from size_t]
!254 = metadata !{i32 786445, metadata !245, metadata !"regsPerBlock", metadata !148, i32 1150, i64 32, i64 32, i64 2176, i32 0, metadata !19} ; [ DW_TAG_member ] [regsPerBlock] [line 1150, size 32, align 32, offset 2176] [from int]
!255 = metadata !{i32 786445, metadata !245, metadata !"warpSize", metadata !148, i32 1151, i64 32, i64 32, i64 2208, i32 0, metadata !19} ; [ DW_TAG_member ] [warpSize] [line 1151, size 32, align 32, offset 2208] [from int]
!256 = metadata !{i32 786445, metadata !245, metadata !"memPitch", metadata !148, i32 1152, i64 64, i64 64, i64 2240, i32 0, metadata !252} ; [ DW_TAG_member ] [memPitch] [line 1152, size 64, align 64, offset 2240] [from size_t]
!257 = metadata !{i32 786445, metadata !245, metadata !"maxThreadsPerBlock", metadata !148, i32 1153, i64 32, i64 32, i64 2304, i32 0, metadata !19} ; [ DW_TAG_member ] [maxThreadsPerBlock] [line 1153, size 32, align 32, offset 2304] [from int]
!258 = metadata !{i32 786445, metadata !245, metadata !"maxThreadsDim", metadata !148, i32 1154, i64 96, i64 32, i64 2336, i32 0, metadata !259} ; [ DW_TAG_member ] [maxThreadsDim] [line 1154, size 96, align 32, offset 2336] [from ]
!259 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !19, metadata !260, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!260 = metadata !{metadata !261}
!261 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 2]
!262 = metadata !{i32 786445, metadata !245, metadata !"maxGridSize", metadata !148, i32 1155, i64 96, i64 32, i64 2432, i32 0, metadata !259} ; [ DW_TAG_member ] [maxGridSize] [line 1155, size 96, align 32, offset 2432] [from ]
!263 = metadata !{i32 786445, metadata !245, metadata !"clockRate", metadata !148, i32 1156, i64 32, i64 32, i64 2528, i32 0, metadata !19} ; [ DW_TAG_member ] [clockRate] [line 1156, size 32, align 32, offset 2528] [from int]
!264 = metadata !{i32 786445, metadata !245, metadata !"totalConstMem", metadata !148, i32 1157, i64 64, i64 64, i64 2560, i32 0, metadata !252} ; [ DW_TAG_member ] [totalConstMem] [line 1157, size 64, align 64, offset 2560] [from size_t]
!265 = metadata !{i32 786445, metadata !245, metadata !"major", metadata !148, i32 1158, i64 32, i64 32, i64 2624, i32 0, metadata !19} ; [ DW_TAG_member ] [major] [line 1158, size 32, align 32, offset 2624] [from int]
!266 = metadata !{i32 786445, metadata !245, metadata !"minor", metadata !148, i32 1159, i64 32, i64 32, i64 2656, i32 0, metadata !19} ; [ DW_TAG_member ] [minor] [line 1159, size 32, align 32, offset 2656] [from int]
!267 = metadata !{i32 786445, metadata !245, metadata !"textureAlignment", metadata !148, i32 1160, i64 64, i64 64, i64 2688, i32 0, metadata !252} ; [ DW_TAG_member ] [textureAlignment] [line 1160, size 64, align 64, offset 2688] [from size_t]
!268 = metadata !{i32 786445, metadata !245, metadata !"texturePitchAlignment", metadata !148, i32 1161, i64 64, i64 64, i64 2752, i32 0, metadata !252} ; [ DW_TAG_member ] [texturePitchAlignment] [line 1161, size 64, align 64, offset 2752] [from size_t]
!269 = metadata !{i32 786445, metadata !245, metadata !"deviceOverlap", metadata !148, i32 1162, i64 32, i64 32, i64 2816, i32 0, metadata !19} ; [ DW_TAG_member ] [deviceOverlap] [line 1162, size 32, align 32, offset 2816] [from int]
!270 = metadata !{i32 786445, metadata !245, metadata !"multiProcessorCount", metadata !148, i32 1163, i64 32, i64 32, i64 2848, i32 0, metadata !19} ; [ DW_TAG_member ] [multiProcessorCount] [line 1163, size 32, align 32, offset 2848] [from int]
!271 = metadata !{i32 786445, metadata !245, metadata !"kernelExecTimeoutEnabled", metadata !148, i32 1164, i64 32, i64 32, i64 2880, i32 0, metadata !19} ; [ DW_TAG_member ] [kernelExecTimeoutEnabled] [line 1164, size 32, align 32, offset 2880] [from in
!272 = metadata !{i32 786445, metadata !245, metadata !"integrated", metadata !148, i32 1165, i64 32, i64 32, i64 2912, i32 0, metadata !19} ; [ DW_TAG_member ] [integrated] [line 1165, size 32, align 32, offset 2912] [from int]
!273 = metadata !{i32 786445, metadata !245, metadata !"canMapHostMemory", metadata !148, i32 1166, i64 32, i64 32, i64 2944, i32 0, metadata !19} ; [ DW_TAG_member ] [canMapHostMemory] [line 1166, size 32, align 32, offset 2944] [from int]
!274 = metadata !{i32 786445, metadata !245, metadata !"computeMode", metadata !148, i32 1167, i64 32, i64 32, i64 2976, i32 0, metadata !19} ; [ DW_TAG_member ] [computeMode] [line 1167, size 32, align 32, offset 2976] [from int]
!275 = metadata !{i32 786445, metadata !245, metadata !"maxTexture1D", metadata !148, i32 1168, i64 32, i64 32, i64 3008, i32 0, metadata !19} ; [ DW_TAG_member ] [maxTexture1D] [line 1168, size 32, align 32, offset 3008] [from int]
!276 = metadata !{i32 786445, metadata !245, metadata !"maxTexture1DMipmap", metadata !148, i32 1169, i64 32, i64 32, i64 3040, i32 0, metadata !19} ; [ DW_TAG_member ] [maxTexture1DMipmap] [line 1169, size 32, align 32, offset 3040] [from int]
!277 = metadata !{i32 786445, metadata !245, metadata !"maxTexture1DLinear", metadata !148, i32 1170, i64 32, i64 32, i64 3072, i32 0, metadata !19} ; [ DW_TAG_member ] [maxTexture1DLinear] [line 1170, size 32, align 32, offset 3072] [from int]
!278 = metadata !{i32 786445, metadata !245, metadata !"maxTexture2D", metadata !148, i32 1171, i64 64, i64 32, i64 3104, i32 0, metadata !279} ; [ DW_TAG_member ] [maxTexture2D] [line 1171, size 64, align 32, offset 3104] [from ]
!279 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 32, i32 0, i32 0, metadata !19, metadata !280, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!280 = metadata !{metadata !281}
!281 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 1]
!282 = metadata !{i32 786445, metadata !245, metadata !"maxTexture2DMipmap", metadata !148, i32 1172, i64 64, i64 32, i64 3168, i32 0, metadata !279} ; [ DW_TAG_member ] [maxTexture2DMipmap] [line 1172, size 64, align 32, offset 3168] [from ]
!283 = metadata !{i32 786445, metadata !245, metadata !"maxTexture2DLinear", metadata !148, i32 1173, i64 96, i64 32, i64 3232, i32 0, metadata !259} ; [ DW_TAG_member ] [maxTexture2DLinear] [line 1173, size 96, align 32, offset 3232] [from ]
!284 = metadata !{i32 786445, metadata !245, metadata !"maxTexture2DGather", metadata !148, i32 1174, i64 64, i64 32, i64 3328, i32 0, metadata !279} ; [ DW_TAG_member ] [maxTexture2DGather] [line 1174, size 64, align 32, offset 3328] [from ]
!285 = metadata !{i32 786445, metadata !245, metadata !"maxTexture3D", metadata !148, i32 1175, i64 96, i64 32, i64 3392, i32 0, metadata !259} ; [ DW_TAG_member ] [maxTexture3D] [line 1175, size 96, align 32, offset 3392] [from ]
!286 = metadata !{i32 786445, metadata !245, metadata !"maxTexture3DAlt", metadata !148, i32 1176, i64 96, i64 32, i64 3488, i32 0, metadata !259} ; [ DW_TAG_member ] [maxTexture3DAlt] [line 1176, size 96, align 32, offset 3488] [from ]
!287 = metadata !{i32 786445, metadata !245, metadata !"maxTextureCubemap", metadata !148, i32 1177, i64 32, i64 32, i64 3584, i32 0, metadata !19} ; [ DW_TAG_member ] [maxTextureCubemap] [line 1177, size 32, align 32, offset 3584] [from int]
!288 = metadata !{i32 786445, metadata !245, metadata !"maxTexture1DLayered", metadata !148, i32 1178, i64 64, i64 32, i64 3616, i32 0, metadata !279} ; [ DW_TAG_member ] [maxTexture1DLayered] [line 1178, size 64, align 32, offset 3616] [from ]
!289 = metadata !{i32 786445, metadata !245, metadata !"maxTexture2DLayered", metadata !148, i32 1179, i64 96, i64 32, i64 3680, i32 0, metadata !259} ; [ DW_TAG_member ] [maxTexture2DLayered] [line 1179, size 96, align 32, offset 3680] [from ]
!290 = metadata !{i32 786445, metadata !245, metadata !"maxTextureCubemapLayered", metadata !148, i32 1180, i64 64, i64 32, i64 3776, i32 0, metadata !279} ; [ DW_TAG_member ] [maxTextureCubemapLayered] [line 1180, size 64, align 32, offset 3776] [from ]
!291 = metadata !{i32 786445, metadata !245, metadata !"maxSurface1D", metadata !148, i32 1181, i64 32, i64 32, i64 3840, i32 0, metadata !19} ; [ DW_TAG_member ] [maxSurface1D] [line 1181, size 32, align 32, offset 3840] [from int]
!292 = metadata !{i32 786445, metadata !245, metadata !"maxSurface2D", metadata !148, i32 1182, i64 64, i64 32, i64 3872, i32 0, metadata !279} ; [ DW_TAG_member ] [maxSurface2D] [line 1182, size 64, align 32, offset 3872] [from ]
!293 = metadata !{i32 786445, metadata !245, metadata !"maxSurface3D", metadata !148, i32 1183, i64 96, i64 32, i64 3936, i32 0, metadata !259} ; [ DW_TAG_member ] [maxSurface3D] [line 1183, size 96, align 32, offset 3936] [from ]
!294 = metadata !{i32 786445, metadata !245, metadata !"maxSurface1DLayered", metadata !148, i32 1184, i64 64, i64 32, i64 4032, i32 0, metadata !279} ; [ DW_TAG_member ] [maxSurface1DLayered] [line 1184, size 64, align 32, offset 4032] [from ]
!295 = metadata !{i32 786445, metadata !245, metadata !"maxSurface2DLayered", metadata !148, i32 1185, i64 96, i64 32, i64 4096, i32 0, metadata !259} ; [ DW_TAG_member ] [maxSurface2DLayered] [line 1185, size 96, align 32, offset 4096] [from ]
!296 = metadata !{i32 786445, metadata !245, metadata !"maxSurfaceCubemap", metadata !148, i32 1186, i64 32, i64 32, i64 4192, i32 0, metadata !19} ; [ DW_TAG_member ] [maxSurfaceCubemap] [line 1186, size 32, align 32, offset 4192] [from int]
!297 = metadata !{i32 786445, metadata !245, metadata !"maxSurfaceCubemapLayered", metadata !148, i32 1187, i64 64, i64 32, i64 4224, i32 0, metadata !279} ; [ DW_TAG_member ] [maxSurfaceCubemapLayered] [line 1187, size 64, align 32, offset 4224] [from ]
!298 = metadata !{i32 786445, metadata !245, metadata !"surfaceAlignment", metadata !148, i32 1188, i64 64, i64 64, i64 4288, i32 0, metadata !252} ; [ DW_TAG_member ] [surfaceAlignment] [line 1188, size 64, align 64, offset 4288] [from size_t]
!299 = metadata !{i32 786445, metadata !245, metadata !"concurrentKernels", metadata !148, i32 1189, i64 32, i64 32, i64 4352, i32 0, metadata !19} ; [ DW_TAG_member ] [concurrentKernels] [line 1189, size 32, align 32, offset 4352] [from int]
!300 = metadata !{i32 786445, metadata !245, metadata !"ECCEnabled", metadata !148, i32 1190, i64 32, i64 32, i64 4384, i32 0, metadata !19} ; [ DW_TAG_member ] [ECCEnabled] [line 1190, size 32, align 32, offset 4384] [from int]
!301 = metadata !{i32 786445, metadata !245, metadata !"pciBusID", metadata !148, i32 1191, i64 32, i64 32, i64 4416, i32 0, metadata !19} ; [ DW_TAG_member ] [pciBusID] [line 1191, size 32, align 32, offset 4416] [from int]
!302 = metadata !{i32 786445, metadata !245, metadata !"pciDeviceID", metadata !148, i32 1192, i64 32, i64 32, i64 4448, i32 0, metadata !19} ; [ DW_TAG_member ] [pciDeviceID] [line 1192, size 32, align 32, offset 4448] [from int]
!303 = metadata !{i32 786445, metadata !245, metadata !"pciDomainID", metadata !148, i32 1193, i64 32, i64 32, i64 4480, i32 0, metadata !19} ; [ DW_TAG_member ] [pciDomainID] [line 1193, size 32, align 32, offset 4480] [from int]
!304 = metadata !{i32 786445, metadata !245, metadata !"tccDriver", metadata !148, i32 1194, i64 32, i64 32, i64 4512, i32 0, metadata !19} ; [ DW_TAG_member ] [tccDriver] [line 1194, size 32, align 32, offset 4512] [from int]
!305 = metadata !{i32 786445, metadata !245, metadata !"asyncEngineCount", metadata !148, i32 1195, i64 32, i64 32, i64 4544, i32 0, metadata !19} ; [ DW_TAG_member ] [asyncEngineCount] [line 1195, size 32, align 32, offset 4544] [from int]
!306 = metadata !{i32 786445, metadata !245, metadata !"unifiedAddressing", metadata !148, i32 1196, i64 32, i64 32, i64 4576, i32 0, metadata !19} ; [ DW_TAG_member ] [unifiedAddressing] [line 1196, size 32, align 32, offset 4576] [from int]
!307 = metadata !{i32 786445, metadata !245, metadata !"memoryClockRate", metadata !148, i32 1197, i64 32, i64 32, i64 4608, i32 0, metadata !19} ; [ DW_TAG_member ] [memoryClockRate] [line 1197, size 32, align 32, offset 4608] [from int]
!308 = metadata !{i32 786445, metadata !245, metadata !"memoryBusWidth", metadata !148, i32 1198, i64 32, i64 32, i64 4640, i32 0, metadata !19} ; [ DW_TAG_member ] [memoryBusWidth] [line 1198, size 32, align 32, offset 4640] [from int]
!309 = metadata !{i32 786445, metadata !245, metadata !"l2CacheSize", metadata !148, i32 1199, i64 32, i64 32, i64 4672, i32 0, metadata !19} ; [ DW_TAG_member ] [l2CacheSize] [line 1199, size 32, align 32, offset 4672] [from int]
!310 = metadata !{i32 786445, metadata !245, metadata !"maxThreadsPerMultiProcessor", metadata !148, i32 1200, i64 32, i64 32, i64 4704, i32 0, metadata !19} ; [ DW_TAG_member ] [maxThreadsPerMultiProcessor] [line 1200, size 32, align 32, offset 4704] [f
!311 = metadata !{i32 786445, metadata !245, metadata !"streamPrioritiesSupported", metadata !148, i32 1201, i64 32, i64 32, i64 4736, i32 0, metadata !19} ; [ DW_TAG_member ] [streamPrioritiesSupported] [line 1201, size 32, align 32, offset 4736] [from 
!312 = metadata !{metadata !313}
!313 = metadata !{metadata !314, metadata !315}
!314 = metadata !{i32 786689, metadata !237, metadata !"device", metadata !238, i32 16777230, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 14]
!315 = metadata !{i32 786689, metadata !237, metadata !"prop", metadata !238, i32 33554446, metadata !243, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 14]
!316 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaDeviceGetByPCIBusId", metadata !"cudaDeviceGetByPCIBusId", metadata !"", metadata !238, i32 19, metadata !317, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @c
!317 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !318, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!318 = metadata !{metadata !241, metadata !242, metadata !21}
!319 = metadata !{metadata !320}
!320 = metadata !{metadata !321, metadata !322}
!321 = metadata !{i32 786689, metadata !316, metadata !"device", metadata !238, i32 16777235, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 19]
!322 = metadata !{i32 786689, metadata !316, metadata !"pciBusId", metadata !238, i32 33554451, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 19]
!323 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaDeviceGetCacheConfig", metadata !"cudaDeviceGetCacheConfig", metadata !"", metadata !238, i32 24, metadata !324, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cuda
!324 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !325, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!325 = metadata !{metadata !241, metadata !326}
!326 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !222} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!327 = metadata !{metadata !328}
!328 = metadata !{metadata !329}
!329 = metadata !{i32 786689, metadata !323, metadata !"pCacheConfig", metadata !238, i32 16777240, metadata !326, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 24]
!330 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaDeviceGetLimit", metadata !"cudaDeviceGetLimit", metadata !"", metadata !238, i32 28, metadata !331, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaDeviceG
!331 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !332, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!332 = metadata !{metadata !241, metadata !333, metadata !228}
!333 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !252} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!334 = metadata !{metadata !335}
!335 = metadata !{metadata !336, metadata !337}
!336 = metadata !{i32 786689, metadata !330, metadata !"pValue", metadata !238, i32 16777244, metadata !333, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 28]
!337 = metadata !{i32 786689, metadata !330, metadata !"limit", metadata !238, i32 33554460, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 28]
!338 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaDeviceGetPCIBusId", metadata !"cudaDeviceGetPCIBusId", metadata !"", metadata !238, i32 32, metadata !339, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @c
!339 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !340, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!340 = metadata !{metadata !241, metadata !21, metadata !19, metadata !19}
!341 = metadata !{metadata !342}
!342 = metadata !{metadata !343, metadata !344, metadata !345}
!343 = metadata !{i32 786689, metadata !338, metadata !"pciBusId", metadata !238, i32 16777248, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 32]
!344 = metadata !{i32 786689, metadata !338, metadata !"len", metadata !238, i32 33554464, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 32]
!345 = metadata !{i32 786689, metadata !338, metadata !"device", metadata !238, i32 50331680, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 32]
!346 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaDeviceReset", metadata !"cudaDeviceReset", metadata !"", metadata !238, i32 37, metadata !347, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceReset, null, nul
!347 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !348, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!348 = metadata !{metadata !241}
!349 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaDeviceSetCacheConfig", metadata !"cudaDeviceSetCacheConfig", metadata !"", metadata !238, i32 41, metadata !350, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaD
!350 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !351, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!351 = metadata !{metadata !241, metadata !222}
!352 = metadata !{metadata !353}
!353 = metadata !{metadata !354}
!354 = metadata !{i32 786689, metadata !349, metadata !"cacheConfig", metadata !238, i32 16777257, metadata !222, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 41]
!355 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaDeviceSetLimit", metadata !"cudaDeviceSetLimit", metadata !"", metadata !238, i32 45, metadata !356, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaDeviceSe
!356 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !357, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!357 = metadata !{metadata !241, metadata !228, metadata !252}
!358 = metadata !{metadata !359}
!359 = metadata !{metadata !360, metadata !361}
!360 = metadata !{i32 786689, metadata !355, metadata !"limit", metadata !238, i32 16777261, metadata !228, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 45]
!361 = metadata !{i32 786689, metadata !355, metadata !"value", metadata !238, i32 33554477, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 45]
!362 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaDeviceSynchronize", metadata !"cudaDeviceSynchronize", metadata !"", metadata !238, i32 49, metadata !347, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceSync
!363 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaGetDevice", metadata !"cudaGetDevice", metadata !"", metadata !238, i32 53, metadata !364, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDevice, null, null,
!364 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !365, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!365 = metadata !{metadata !241, metadata !242}
!366 = metadata !{metadata !367}
!367 = metadata !{metadata !368}
!368 = metadata !{i32 786689, metadata !363, metadata !"device", metadata !238, i32 16777269, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 53]
!369 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaGetDeviceCount", metadata !"cudaGetDeviceCount", metadata !"", metadata !238, i32 58, metadata !364, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDeviceCou
!370 = metadata !{metadata !371}
!371 = metadata !{metadata !372}
!372 = metadata !{i32 786689, metadata !369, metadata !"count", metadata !238, i32 16777274, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 58]
!373 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaGetDeviceProperties", metadata !"cudaGetDeviceProperties", metadata !"", metadata !238, i32 63, metadata !374, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaDe
!374 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !375, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!375 = metadata !{metadata !241, metadata !376, metadata !19}
!376 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !245} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaDeviceProp]
!377 = metadata !{metadata !378}
!378 = metadata !{metadata !379, metadata !380}
!379 = metadata !{i32 786689, metadata !373, metadata !"prop", metadata !238, i32 16777279, metadata !376, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 63]
!380 = metadata !{i32 786689, metadata !373, metadata !"device", metadata !238, i32 33554495, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 63]
!381 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaIpcCloseMemHandle", metadata !"cudaIpcCloseMemHandle", metadata !"", metadata !238, i32 68, metadata !382, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaIpcClos
!382 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !383, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!383 = metadata !{metadata !241, metadata !96}
!384 = metadata !{metadata !385}
!385 = metadata !{metadata !386}
!386 = metadata !{i32 786689, metadata !381, metadata !"devPtr", metadata !238, i32 16777284, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 68]
!387 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaIpcGetEventHandle", metadata !"cudaIpcGetEventHandle", metadata !"", metadata !238, i32 72, metadata !388, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcEve
!388 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !389, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!389 = metadata !{metadata !241, metadata !390, metadata !398}
!390 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !391} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcEventHandle_t]
!391 = metadata !{i32 786454, null, metadata !"cudaIpcEventHandle_t", metadata !238, i32 1274, i64 0, i64 0, i64 0, i32 0, metadata !392} ; [ DW_TAG_typedef ] [cudaIpcEventHandle_t] [line 1274, size 0, align 0, offset 0] [from cudaIpcEventHandle_st]
!392 = metadata !{i32 786451, null, metadata !"cudaIpcEventHandle_st", metadata !148, i32 1271, i64 512, i64 8, i32 0, i32 0, null, metadata !393, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcEventHandle_st] [line 1271, size 512, align 8, off
!393 = metadata !{metadata !394}
!394 = metadata !{i32 786445, metadata !392, metadata !"reserved", metadata !148, i32 1273, i64 512, i64 8, i64 0, i32 0, metadata !395} ; [ DW_TAG_member ] [reserved] [line 1273, size 512, align 8, offset 0] [from ]
!395 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 8, i32 0, i32 0, metadata !22, metadata !396, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!396 = metadata !{metadata !397}
!397 = metadata !{i32 786465, i64 0, i64 63}      ; [ DW_TAG_subrange_type ] [0, 63]
!398 = metadata !{i32 786454, null, metadata !"cudaEvent_t", metadata !238, i32 1303, i64 0, i64 0, i64 0, i32 0, metadata !399} ; [ DW_TAG_typedef ] [cudaEvent_t] [line 1303, size 0, align 0, offset 0] [from ]
!399 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !400} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUevent_st]
!400 = metadata !{i32 786451, null, metadata !"CUevent_st", metadata !148, i32 1303, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUevent_st] [line 1303, size 0, align 0, offset 0] [fwd] [from ]
!401 = metadata !{metadata !402}
!402 = metadata !{metadata !403, metadata !404}
!403 = metadata !{i32 786689, metadata !387, metadata !"handle", metadata !238, i32 16777288, metadata !390, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 72]
!404 = metadata !{i32 786689, metadata !387, metadata !"event", metadata !238, i32 33554504, metadata !398, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 72]
!405 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaIpcGetMemHandle", metadata !"cudaIpcGetMemHandle", metadata !"", metadata !238, i32 76, metadata !406, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcMemHand
!406 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !407, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!407 = metadata !{metadata !241, metadata !408, metadata !96}
!408 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !409} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcMemHandle_t]
!409 = metadata !{i32 786454, null, metadata !"cudaIpcMemHandle_t", metadata !238, i32 1282, i64 0, i64 0, i64 0, i32 0, metadata !410} ; [ DW_TAG_typedef ] [cudaIpcMemHandle_t] [line 1282, size 0, align 0, offset 0] [from cudaIpcMemHandle_st]
!410 = metadata !{i32 786451, null, metadata !"cudaIpcMemHandle_st", metadata !148, i32 1279, i64 512, i64 8, i32 0, i32 0, null, metadata !411, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcMemHandle_st] [line 1279, size 512, align 8, offset 
!411 = metadata !{metadata !412}
!412 = metadata !{i32 786445, metadata !410, metadata !"reserved", metadata !148, i32 1281, i64 512, i64 8, i64 0, i32 0, metadata !395} ; [ DW_TAG_member ] [reserved] [line 1281, size 512, align 8, offset 0] [from ]
!413 = metadata !{metadata !414}
!414 = metadata !{metadata !415, metadata !416}
!415 = metadata !{i32 786689, metadata !405, metadata !"handle", metadata !238, i32 16777292, metadata !408, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 76]
!416 = metadata !{i32 786689, metadata !405, metadata !"devPtr", metadata !238, i32 33554508, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 76]
!417 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaIpcOpenEventHandle", metadata !"cudaIpcOpenEventHandle", metadata !"", metadata !238, i32 80, metadata !418, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.CUevent_
!418 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !419, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!419 = metadata !{metadata !241, metadata !420, metadata !391}
!420 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !398} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaEvent_t]
!421 = metadata !{metadata !422}
!422 = metadata !{metadata !423, metadata !424}
!423 = metadata !{i32 786689, metadata !417, metadata !"event", metadata !238, i32 16777296, metadata !420, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 80]
!424 = metadata !{i32 786689, metadata !417, metadata !"handle", metadata !238, i32 33554512, metadata !391, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 80]
!425 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaIpcOpenMemHandle", metadata !"cudaIpcOpenMemHandle", metadata !"", metadata !238, i32 84, metadata !426, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, %struct.cudaIp
!426 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !427, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!427 = metadata !{metadata !241, metadata !428, metadata !409, metadata !42}
!428 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !96} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!429 = metadata !{metadata !430}
!430 = metadata !{metadata !431, metadata !432, metadata !433}
!431 = metadata !{i32 786689, metadata !425, metadata !"devPtr", metadata !238, i32 16777300, metadata !428, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 84]
!432 = metadata !{i32 786689, metadata !425, metadata !"handle", metadata !238, i32 33554516, metadata !409, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 84]
!433 = metadata !{i32 786689, metadata !425, metadata !"flags", metadata !238, i32 50331732, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 84]
!434 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaSetDevice", metadata !"cudaSetDevice", metadata !"", metadata !238, i32 88, metadata !435, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDevice, null, null, 
!435 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !436, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!436 = metadata !{metadata !241, metadata !19}
!437 = metadata !{metadata !438}
!438 = metadata !{metadata !439}
!439 = metadata !{i32 786689, metadata !434, metadata !"device", metadata !238, i32 16777304, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 88]
!440 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaSetDeviceFlags", metadata !"cudaSetDeviceFlags", metadata !"", metadata !238, i32 92, metadata !441, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDeviceFlag
!441 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !442, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!442 = metadata !{metadata !241, metadata !42}
!443 = metadata !{metadata !444}
!444 = metadata !{metadata !445}
!445 = metadata !{i32 786689, metadata !440, metadata !"flags", metadata !238, i32 16777308, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 92]
!446 = metadata !{i32 786478, i32 0, metadata !238, metadata !"cudaSetValidDevices", metadata !"cudaSetValidDevices", metadata !"", metadata !238, i32 96, metadata !447, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32)* @cudaSetVa
!447 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !448, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!448 = metadata !{metadata !241, metadata !242, metadata !19}
!449 = metadata !{metadata !450}
!450 = metadata !{metadata !451, metadata !452}
!451 = metadata !{i32 786689, metadata !446, metadata !"device_arr", metadata !238, i32 16777312, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device_arr] [line 96]
!452 = metadata !{i32 786689, metadata !446, metadata !"len", metadata !238, i32 33554528, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 96]
!453 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!454 = metadata !{metadata !455}
!455 = metadata !{metadata !147, metadata !456, metadata !462}
!456 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !148, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !457, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!457 = metadata !{metadata !458, metadata !459, metadata !460, metadata !461}
!458 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!459 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!460 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!461 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!462 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !148, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!463 = metadata !{metadata !464}
!464 = metadata !{metadata !465, metadata !493, metadata !499, metadata !505, metadata !509, metadata !516, metadata !523, metadata !531, metadata !539, metadata !546, metadata !554, metadata !558, metadata !565, metadata !579, metadata !589, metadata !5
!465 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !466, i32 24, metadata !467, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!466 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!467 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !468, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!468 = metadata !{metadata !469, metadata !470, metadata !478, metadata !484, metadata !485}
!469 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !466, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !147} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!470 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !471} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!471 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !148, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !472, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!472 = metadata !{metadata !473, metadata !474, metadata !475, metadata !476, metadata !477}
!473 = metadata !{i32 786445, metadata !471, metadata !"x", metadata !148, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!474 = metadata !{i32 786445, metadata !471, metadata !"y", metadata !148, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !19} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!475 = metadata !{i32 786445, metadata !471, metadata !"z", metadata !148, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !19} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!476 = metadata !{i32 786445, metadata !471, metadata !"w", metadata !148, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !19} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!477 = metadata !{i32 786445, metadata !471, metadata !"f", metadata !148, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !456} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!478 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !479} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!479 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !148, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !480, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!480 = metadata !{metadata !481, metadata !482, metadata !483}
!481 = metadata !{i32 786445, metadata !479, metadata !"width", metadata !148, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !252} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!482 = metadata !{i32 786445, metadata !479, metadata !"height", metadata !148, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !252} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!483 = metadata !{i32 786445, metadata !479, metadata !"depth", metadata !148, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !252} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!484 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !42} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!485 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !486} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!486 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !148, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!487 = metadata !{metadata !488}
!488 = metadata !{metadata !489, metadata !490, metadata !491, metadata !492}
!489 = metadata !{i32 786689, metadata !465, metadata !"desc", metadata !466, i32 16777240, metadata !470, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!490 = metadata !{i32 786689, metadata !465, metadata !"extent", metadata !466, i32 33554456, metadata !478, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!491 = metadata !{i32 786689, metadata !465, metadata !"flags", metadata !466, i32 50331673, metadata !484, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!492 = metadata !{i32 786689, metadata !465, metadata !"array", metadata !466, i32 67108889, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!493 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !466, i32 29, metadata !494, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !496, 
!494 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !495, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!495 = metadata !{metadata !469, metadata !96}
!496 = metadata !{metadata !497}
!497 = metadata !{metadata !498}
!498 = metadata !{i32 786689, metadata !493, metadata !"devPtr", metadata !466, i32 16777245, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!499 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !466, i32 34, metadata !500, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!500 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !501, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!501 = metadata !{metadata !469, metadata !485}
!502 = metadata !{metadata !503}
!503 = metadata !{metadata !504}
!504 = metadata !{i32 786689, metadata !499, metadata !"array", metadata !466, i32 16777250, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!505 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !466, i32 39, metadata !494, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!506 = metadata !{metadata !507}
!507 = metadata !{metadata !508}
!508 = metadata !{i32 786689, metadata !505, metadata !"ptr", metadata !466, i32 16777255, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!509 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !466, i32 44, metadata !510, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!510 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !511, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!511 = metadata !{metadata !469, metadata !428, metadata !109}
!512 = metadata !{metadata !513}
!513 = metadata !{metadata !514, metadata !515}
!514 = metadata !{i32 786689, metadata !509, metadata !"devPtr", metadata !466, i32 16777260, metadata !428, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!515 = metadata !{i32 786689, metadata !509, metadata !"symbol", metadata !466, i32 33554476, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!516 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !466, i32 48, metadata !517, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!517 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !518, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!518 = metadata !{metadata !469, metadata !333, metadata !109}
!519 = metadata !{metadata !520}
!520 = metadata !{metadata !521, metadata !522}
!521 = metadata !{i32 786689, metadata !516, metadata !"size", metadata !466, i32 16777264, metadata !333, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!522 = metadata !{i32 786689, metadata !516, metadata !"symbol", metadata !466, i32 33554480, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!523 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !466, i32 52, metadata !524, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!524 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !525, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!525 = metadata !{metadata !469, metadata !428, metadata !252, metadata !42}
!526 = metadata !{metadata !527}
!527 = metadata !{metadata !528, metadata !529, metadata !530}
!528 = metadata !{i32 786689, metadata !523, metadata !"pHost", metadata !466, i32 16777268, metadata !428, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!529 = metadata !{i32 786689, metadata !523, metadata !"size", metadata !466, i32 33554484, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!530 = metadata !{i32 786689, metadata !523, metadata !"flags", metadata !466, i32 50331700, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!531 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !466, i32 56, metadata !532, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!532 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !533, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!533 = metadata !{metadata !469, metadata !428, metadata !96, metadata !42}
!534 = metadata !{metadata !535}
!535 = metadata !{metadata !536, metadata !537, metadata !538}
!536 = metadata !{i32 786689, metadata !531, metadata !"pDevice", metadata !466, i32 16777272, metadata !428, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!537 = metadata !{i32 786689, metadata !531, metadata !"pHost", metadata !466, i32 33554488, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!538 = metadata !{i32 786689, metadata !531, metadata !"flags", metadata !466, i32 50331704, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!539 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !466, i32 60, metadata !540, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!540 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !541, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!541 = metadata !{metadata !469, metadata !484, metadata !96}
!542 = metadata !{metadata !543}
!543 = metadata !{metadata !544, metadata !545}
!544 = metadata !{i32 786689, metadata !539, metadata !"pFlags", metadata !466, i32 16777276, metadata !484, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!545 = metadata !{i32 786689, metadata !539, metadata !"pHost", metadata !466, i32 33554492, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!546 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !466, i32 64, metadata !547, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!547 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !548, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!548 = metadata !{metadata !469, metadata !96, metadata !252, metadata !42}
!549 = metadata !{metadata !550}
!550 = metadata !{metadata !551, metadata !552, metadata !553}
!551 = metadata !{i32 786689, metadata !546, metadata !"ptr", metadata !466, i32 16777280, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!552 = metadata !{i32 786689, metadata !546, metadata !"size", metadata !466, i32 33554496, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!553 = metadata !{i32 786689, metadata !546, metadata !"flags", metadata !466, i32 50331712, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!554 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !466, i32 68, metadata !494, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!555 = metadata !{metadata !556}
!556 = metadata !{metadata !557}
!557 = metadata !{i32 786689, metadata !554, metadata !"ptr", metadata !466, i32 16777284, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!558 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !466, i32 72, metadata !559, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!559 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !560, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!560 = metadata !{metadata !469, metadata !428, metadata !252}
!561 = metadata !{metadata !562}
!562 = metadata !{metadata !563, metadata !564}
!563 = metadata !{i32 786689, metadata !558, metadata !"devPtr", metadata !466, i32 16777288, metadata !428, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!564 = metadata !{i32 786689, metadata !558, metadata !"size", metadata !466, i32 33554504, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!565 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !466, i32 80, metadata !566, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!566 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !567, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!567 = metadata !{metadata !469, metadata !568, metadata !479}
!568 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !569} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!569 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !148, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !570, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!570 = metadata !{metadata !571, metadata !572, metadata !573, metadata !574}
!571 = metadata !{i32 786445, metadata !569, metadata !"ptr", metadata !148, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !96} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!572 = metadata !{i32 786445, metadata !569, metadata !"pitch", metadata !148, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !252} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!573 = metadata !{i32 786445, metadata !569, metadata !"xsize", metadata !148, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !252} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!574 = metadata !{i32 786445, metadata !569, metadata !"ysize", metadata !148, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !252} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!575 = metadata !{metadata !576}
!576 = metadata !{metadata !577, metadata !578}
!577 = metadata !{i32 786689, metadata !565, metadata !"pitchedDevPtr", metadata !466, i32 16777296, metadata !568, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!578 = metadata !{i32 786689, metadata !565, metadata !"extent", metadata !466, i32 33554512, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!579 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !466, i32 84, metadata !580, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!580 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !581, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!581 = metadata !{metadata !469, metadata !582, metadata !470, metadata !479, metadata !42}
!582 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !485} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!583 = metadata !{metadata !584}
!584 = metadata !{metadata !585, metadata !586, metadata !587, metadata !588}
!585 = metadata !{i32 786689, metadata !579, metadata !"array", metadata !466, i32 16777300, metadata !582, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!586 = metadata !{i32 786689, metadata !579, metadata !"desc", metadata !466, i32 33554516, metadata !470, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!587 = metadata !{i32 786689, metadata !579, metadata !"extent", metadata !466, i32 50331733, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!588 = metadata !{i32 786689, metadata !579, metadata !"flags", metadata !466, i32 67108949, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!589 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !466, i32 89, metadata !590, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!590 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !591, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!591 = metadata !{metadata !469, metadata !582, metadata !470, metadata !252, metadata !252, metadata !42}
!592 = metadata !{metadata !593}
!593 = metadata !{metadata !594, metadata !595, metadata !596, metadata !597, metadata !598}
!594 = metadata !{i32 786689, metadata !589, metadata !"array", metadata !466, i32 16777305, metadata !582, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!595 = metadata !{i32 786689, metadata !589, metadata !"desc", metadata !466, i32 33554521, metadata !470, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!596 = metadata !{i32 786689, metadata !589, metadata !"width", metadata !466, i32 50331738, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!597 = metadata !{i32 786689, metadata !589, metadata !"height", metadata !466, i32 67108954, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!598 = metadata !{i32 786689, metadata !589, metadata !"flags", metadata !466, i32 83886170, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!599 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !466, i32 94, metadata !559, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!600 = metadata !{metadata !601}
!601 = metadata !{metadata !602, metadata !603}
!602 = metadata !{i32 786689, metadata !599, metadata !"ptr", metadata !466, i32 16777310, metadata !428, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!603 = metadata !{i32 786689, metadata !599, metadata !"size", metadata !466, i32 33554526, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!604 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !466, i32 102, metadata !605, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!605 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !606, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!606 = metadata !{metadata !469, metadata !428, metadata !333, metadata !252, metadata !252}
!607 = metadata !{metadata !608}
!608 = metadata !{metadata !609, metadata !610, metadata !611, metadata !612}
!609 = metadata !{i32 786689, metadata !604, metadata !"devPtr", metadata !466, i32 16777318, metadata !428, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!610 = metadata !{i32 786689, metadata !604, metadata !"pitch", metadata !466, i32 33554534, metadata !333, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!611 = metadata !{i32 786689, metadata !604, metadata !"width", metadata !466, i32 50331750, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!612 = metadata !{i32 786689, metadata !604, metadata !"height", metadata !466, i32 67108966, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!613 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !466, i32 106, metadata !614, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!614 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !615, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!615 = metadata !{metadata !469, metadata !96, metadata !97, metadata !252, metadata !462}
!616 = metadata !{metadata !617}
!617 = metadata !{metadata !618, metadata !619, metadata !620, metadata !621}
!618 = metadata !{i32 786689, metadata !613, metadata !"dst", metadata !466, i32 16777322, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!619 = metadata !{i32 786689, metadata !613, metadata !"src", metadata !466, i32 33554538, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!620 = metadata !{i32 786689, metadata !613, metadata !"count", metadata !466, i32 50331754, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!621 = metadata !{i32 786689, metadata !613, metadata !"kind", metadata !466, i32 67108970, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!622 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !466, i32 111, metadata !623, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!623 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !624, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!624 = metadata !{metadata !469, metadata !96, metadata !252, metadata !97, metadata !252, metadata !252, metadata !252, metadata !462}
!625 = metadata !{metadata !626}
!626 = metadata !{metadata !627, metadata !628, metadata !629, metadata !630, metadata !631, metadata !632, metadata !633}
!627 = metadata !{i32 786689, metadata !622, metadata !"dst", metadata !466, i32 16777327, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!628 = metadata !{i32 786689, metadata !622, metadata !"dpitch", metadata !466, i32 33554543, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!629 = metadata !{i32 786689, metadata !622, metadata !"src", metadata !466, i32 50331759, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!630 = metadata !{i32 786689, metadata !622, metadata !"spitch", metadata !466, i32 67108975, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!631 = metadata !{i32 786689, metadata !622, metadata !"width", metadata !466, i32 83886192, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!632 = metadata !{i32 786689, metadata !622, metadata !"height", metadata !466, i32 100663408, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!633 = metadata !{i32 786689, metadata !622, metadata !"kind", metadata !466, i32 117440624, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!634 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !466, i32 116, metadata !635, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!635 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !636, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!636 = metadata !{metadata !469, metadata !485, metadata !252, metadata !252, metadata !485, metadata !252, metadata !252, metadata !252, metadata !252, metadata !462}
!637 = metadata !{metadata !638}
!638 = metadata !{metadata !639, metadata !640, metadata !641, metadata !642, metadata !643, metadata !644, metadata !645, metadata !646, metadata !647}
!639 = metadata !{i32 786689, metadata !634, metadata !"dst", metadata !466, i32 16777332, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!640 = metadata !{i32 786689, metadata !634, metadata !"wOffsetDst", metadata !466, i32 33554548, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!641 = metadata !{i32 786689, metadata !634, metadata !"hOffsetDst", metadata !466, i32 50331764, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!642 = metadata !{i32 786689, metadata !634, metadata !"src", metadata !466, i32 67108981, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!643 = metadata !{i32 786689, metadata !634, metadata !"wOffsetSrc", metadata !466, i32 83886197, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!644 = metadata !{i32 786689, metadata !634, metadata !"hOffsetSrc", metadata !466, i32 100663413, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!645 = metadata !{i32 786689, metadata !634, metadata !"width", metadata !466, i32 117440630, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!646 = metadata !{i32 786689, metadata !634, metadata !"height", metadata !466, i32 134217846, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!647 = metadata !{i32 786689, metadata !634, metadata !"kind", metadata !466, i32 150995062, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!648 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !466, i32 122, metadata !649, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!649 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !650, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!650 = metadata !{metadata !469, metadata !96, metadata !252, metadata !97, metadata !252, metadata !252, metadata !252, metadata !462, metadata !651}
!651 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !466, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !652} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!652 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !653} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!653 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !148, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!654 = metadata !{metadata !655}
!655 = metadata !{metadata !656, metadata !657, metadata !658, metadata !659, metadata !660, metadata !661, metadata !662, metadata !663}
!656 = metadata !{i32 786689, metadata !648, metadata !"dst", metadata !466, i32 16777338, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!657 = metadata !{i32 786689, metadata !648, metadata !"dpitch", metadata !466, i32 33554554, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!658 = metadata !{i32 786689, metadata !648, metadata !"src", metadata !466, i32 50331770, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!659 = metadata !{i32 786689, metadata !648, metadata !"spitch", metadata !466, i32 67108986, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!660 = metadata !{i32 786689, metadata !648, metadata !"width", metadata !466, i32 83886203, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!661 = metadata !{i32 786689, metadata !648, metadata !"height", metadata !466, i32 100663419, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!662 = metadata !{i32 786689, metadata !648, metadata !"kind", metadata !466, i32 117440635, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!663 = metadata !{i32 786689, metadata !648, metadata !"stream", metadata !466, i32 134217852, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!664 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !466, i32 128, metadata !665, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!665 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !666, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!666 = metadata !{metadata !469, metadata !96, metadata !252, metadata !485, metadata !252, metadata !252, metadata !252, metadata !252, metadata !462}
!667 = metadata !{metadata !668}
!668 = metadata !{metadata !669, metadata !670, metadata !671, metadata !672, metadata !673, metadata !674, metadata !675, metadata !676}
!669 = metadata !{i32 786689, metadata !664, metadata !"dst", metadata !466, i32 16777344, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!670 = metadata !{i32 786689, metadata !664, metadata !"dpitch", metadata !466, i32 33554560, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!671 = metadata !{i32 786689, metadata !664, metadata !"src", metadata !466, i32 50331776, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!672 = metadata !{i32 786689, metadata !664, metadata !"wOffset", metadata !466, i32 67108993, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!673 = metadata !{i32 786689, metadata !664, metadata !"hOffset", metadata !466, i32 83886209, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!674 = metadata !{i32 786689, metadata !664, metadata !"width", metadata !466, i32 100663425, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!675 = metadata !{i32 786689, metadata !664, metadata !"height", metadata !466, i32 117440641, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!676 = metadata !{i32 786689, metadata !664, metadata !"kind", metadata !466, i32 134217858, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!677 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !466, i32 134, metadata !678, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!678 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !679, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!679 = metadata !{metadata !469, metadata !96, metadata !252, metadata !485, metadata !252, metadata !252, metadata !252, metadata !252, metadata !462, metadata !651}
!680 = metadata !{metadata !681}
!681 = metadata !{metadata !682, metadata !683, metadata !684, metadata !685, metadata !686, metadata !687, metadata !688, metadata !689, metadata !690}
!682 = metadata !{i32 786689, metadata !677, metadata !"dst", metadata !466, i32 16777350, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!683 = metadata !{i32 786689, metadata !677, metadata !"dpitch", metadata !466, i32 33554566, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!684 = metadata !{i32 786689, metadata !677, metadata !"src", metadata !466, i32 50331782, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!685 = metadata !{i32 786689, metadata !677, metadata !"wOffset", metadata !466, i32 67108999, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!686 = metadata !{i32 786689, metadata !677, metadata !"hOffset", metadata !466, i32 83886215, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!687 = metadata !{i32 786689, metadata !677, metadata !"width", metadata !466, i32 100663431, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!688 = metadata !{i32 786689, metadata !677, metadata !"height", metadata !466, i32 117440647, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!689 = metadata !{i32 786689, metadata !677, metadata !"kind", metadata !466, i32 134217864, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!690 = metadata !{i32 786689, metadata !677, metadata !"stream", metadata !466, i32 150995080, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!691 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !466, i32 140, metadata !692, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!692 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !693, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!693 = metadata !{metadata !469, metadata !485, metadata !252, metadata !252, metadata !97, metadata !252, metadata !252, metadata !252, metadata !462}
!694 = metadata !{metadata !695}
!695 = metadata !{metadata !696, metadata !697, metadata !698, metadata !699, metadata !700, metadata !701, metadata !702, metadata !703}
!696 = metadata !{i32 786689, metadata !691, metadata !"dst", metadata !466, i32 16777356, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!697 = metadata !{i32 786689, metadata !691, metadata !"wOffset", metadata !466, i32 33554572, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!698 = metadata !{i32 786689, metadata !691, metadata !"hOffset", metadata !466, i32 50331788, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!699 = metadata !{i32 786689, metadata !691, metadata !"src", metadata !466, i32 67109005, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!700 = metadata !{i32 786689, metadata !691, metadata !"spitch", metadata !466, i32 83886221, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!701 = metadata !{i32 786689, metadata !691, metadata !"width", metadata !466, i32 100663437, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!702 = metadata !{i32 786689, metadata !691, metadata !"height", metadata !466, i32 117440653, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!703 = metadata !{i32 786689, metadata !691, metadata !"kind", metadata !466, i32 134217870, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!704 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !466, i32 146, metadata !705, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!705 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !706, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!706 = metadata !{metadata !469, metadata !485, metadata !252, metadata !252, metadata !97, metadata !252, metadata !252, metadata !252, metadata !462, metadata !651}
!707 = metadata !{metadata !708}
!708 = metadata !{metadata !709, metadata !710, metadata !711, metadata !712, metadata !713, metadata !714, metadata !715, metadata !716, metadata !717}
!709 = metadata !{i32 786689, metadata !704, metadata !"dst", metadata !466, i32 16777362, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!710 = metadata !{i32 786689, metadata !704, metadata !"wOffset", metadata !466, i32 33554578, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!711 = metadata !{i32 786689, metadata !704, metadata !"hOffset", metadata !466, i32 50331794, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!712 = metadata !{i32 786689, metadata !704, metadata !"src", metadata !466, i32 67109011, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!713 = metadata !{i32 786689, metadata !704, metadata !"spitch", metadata !466, i32 83886227, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!714 = metadata !{i32 786689, metadata !704, metadata !"width", metadata !466, i32 100663443, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!715 = metadata !{i32 786689, metadata !704, metadata !"height", metadata !466, i32 117440659, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!716 = metadata !{i32 786689, metadata !704, metadata !"kind", metadata !466, i32 134217876, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!717 = metadata !{i32 786689, metadata !704, metadata !"stream", metadata !466, i32 150995092, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!718 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !466, i32 152, metadata !719, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!719 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !720, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!720 = metadata !{metadata !469, metadata !721}
!721 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !722} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!722 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !723} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!723 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !148, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !724, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!724 = metadata !{metadata !725, metadata !727, metadata !733, metadata !734, metadata !735, metadata !736, metadata !737, metadata !738}
!725 = metadata !{i32 786445, metadata !723, metadata !"srcArray", metadata !148, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !726} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!726 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !148, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !485} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!727 = metadata !{i32 786445, metadata !723, metadata !"srcPos", metadata !148, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !728} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!728 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !148, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !729, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!729 = metadata !{metadata !730, metadata !731, metadata !732}
!730 = metadata !{i32 786445, metadata !728, metadata !"x", metadata !148, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !252} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!731 = metadata !{i32 786445, metadata !728, metadata !"y", metadata !148, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !252} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!732 = metadata !{i32 786445, metadata !728, metadata !"z", metadata !148, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !252} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!733 = metadata !{i32 786445, metadata !723, metadata !"srcPtr", metadata !148, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !569} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!734 = metadata !{i32 786445, metadata !723, metadata !"dstArray", metadata !148, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !726} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!735 = metadata !{i32 786445, metadata !723, metadata !"dstPos", metadata !148, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !728} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!736 = metadata !{i32 786445, metadata !723, metadata !"dstPtr", metadata !148, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !569} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!737 = metadata !{i32 786445, metadata !723, metadata !"extent", metadata !148, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !479} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!738 = metadata !{i32 786445, metadata !723, metadata !"kind", metadata !148, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !462} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!739 = metadata !{metadata !740}
!740 = metadata !{metadata !741}
!741 = metadata !{i32 786689, metadata !718, metadata !"p", metadata !466, i32 16777368, metadata !721, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!742 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !466, i32 156, metadata !743, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!743 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !744, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!744 = metadata !{metadata !469, metadata !721, metadata !651}
!745 = metadata !{metadata !746}
!746 = metadata !{metadata !747, metadata !748}
!747 = metadata !{i32 786689, metadata !742, metadata !"p", metadata !466, i32 16777372, metadata !721, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!748 = metadata !{i32 786689, metadata !742, metadata !"stream", metadata !466, i32 33554588, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!749 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !466, i32 160, metadata !750, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!750 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !751, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!751 = metadata !{metadata !469, metadata !752}
!752 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !753} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!753 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !754} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!754 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !148, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !755, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!755 = metadata !{metadata !756, metadata !757, metadata !758, metadata !759, metadata !760, metadata !761, metadata !762, metadata !763, metadata !764}
!756 = metadata !{i32 786445, metadata !754, metadata !"srcArray", metadata !148, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !726} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!757 = metadata !{i32 786445, metadata !754, metadata !"srcPos", metadata !148, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !728} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!758 = metadata !{i32 786445, metadata !754, metadata !"srcPtr", metadata !148, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !569} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!759 = metadata !{i32 786445, metadata !754, metadata !"srcDevice", metadata !148, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !19} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!760 = metadata !{i32 786445, metadata !754, metadata !"dstArray", metadata !148, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !726} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!761 = metadata !{i32 786445, metadata !754, metadata !"dstPos", metadata !148, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !728} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!762 = metadata !{i32 786445, metadata !754, metadata !"dstPtr", metadata !148, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !569} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!763 = metadata !{i32 786445, metadata !754, metadata !"dstDevice", metadata !148, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !19} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!764 = metadata !{i32 786445, metadata !754, metadata !"extent", metadata !148, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !479} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!765 = metadata !{metadata !766}
!766 = metadata !{metadata !767}
!767 = metadata !{i32 786689, metadata !749, metadata !"p", metadata !466, i32 16777376, metadata !752, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!768 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !466, i32 164, metadata !769, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!769 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !770, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!770 = metadata !{metadata !469, metadata !752, metadata !651}
!771 = metadata !{metadata !772}
!772 = metadata !{metadata !773, metadata !774}
!773 = metadata !{i32 786689, metadata !768, metadata !"p", metadata !466, i32 16777380, metadata !752, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!774 = metadata !{i32 786689, metadata !768, metadata !"stream", metadata !466, i32 33554596, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!775 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !466, i32 168, metadata !776, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!776 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !777, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!777 = metadata !{metadata !469, metadata !485, metadata !252, metadata !252, metadata !485, metadata !252, metadata !252, metadata !252, metadata !462}
!778 = metadata !{metadata !779}
!779 = metadata !{metadata !780, metadata !781, metadata !782, metadata !783, metadata !784, metadata !785, metadata !786, metadata !787}
!780 = metadata !{i32 786689, metadata !775, metadata !"dst", metadata !466, i32 16777384, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!781 = metadata !{i32 786689, metadata !775, metadata !"wOffsetDst", metadata !466, i32 33554600, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!782 = metadata !{i32 786689, metadata !775, metadata !"hOffsetDst", metadata !466, i32 50331816, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!783 = metadata !{i32 786689, metadata !775, metadata !"src", metadata !466, i32 67109033, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!784 = metadata !{i32 786689, metadata !775, metadata !"wOffsetSrc", metadata !466, i32 83886249, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!785 = metadata !{i32 786689, metadata !775, metadata !"hOffsetSrc", metadata !466, i32 100663465, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!786 = metadata !{i32 786689, metadata !775, metadata !"count", metadata !466, i32 117440682, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!787 = metadata !{i32 786689, metadata !775, metadata !"kind", metadata !466, i32 134217898, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!788 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !466, i32 174, metadata !789, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!789 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !790, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!790 = metadata !{metadata !469, metadata !96, metadata !97, metadata !252, metadata !462, metadata !651}
!791 = metadata !{metadata !792}
!792 = metadata !{metadata !793, metadata !794, metadata !795, metadata !796, metadata !797}
!793 = metadata !{i32 786689, metadata !788, metadata !"dst", metadata !466, i32 16777390, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!794 = metadata !{i32 786689, metadata !788, metadata !"src", metadata !466, i32 33554606, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!795 = metadata !{i32 786689, metadata !788, metadata !"count", metadata !466, i32 50331822, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!796 = metadata !{i32 786689, metadata !788, metadata !"kind", metadata !466, i32 67109039, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!797 = metadata !{i32 786689, metadata !788, metadata !"stream", metadata !466, i32 83886255, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!798 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !466, i32 179, metadata !799, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!799 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !800, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!800 = metadata !{metadata !469, metadata !96, metadata !485, metadata !252, metadata !252, metadata !252, metadata !462}
!801 = metadata !{metadata !802}
!802 = metadata !{metadata !803, metadata !804, metadata !805, metadata !806, metadata !807, metadata !808}
!803 = metadata !{i32 786689, metadata !798, metadata !"dst", metadata !466, i32 16777395, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!804 = metadata !{i32 786689, metadata !798, metadata !"src", metadata !466, i32 33554611, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!805 = metadata !{i32 786689, metadata !798, metadata !"wOffset", metadata !466, i32 50331827, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!806 = metadata !{i32 786689, metadata !798, metadata !"hOffset", metadata !466, i32 67109044, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!807 = metadata !{i32 786689, metadata !798, metadata !"count", metadata !466, i32 83886260, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!808 = metadata !{i32 786689, metadata !798, metadata !"kind", metadata !466, i32 100663476, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!809 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !466, i32 184, metadata !810, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!810 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !811, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!811 = metadata !{metadata !469, metadata !96, metadata !485, metadata !252, metadata !252, metadata !252, metadata !462, metadata !651}
!812 = metadata !{metadata !813}
!813 = metadata !{metadata !814, metadata !815, metadata !816, metadata !817, metadata !818, metadata !819, metadata !820}
!814 = metadata !{i32 786689, metadata !809, metadata !"dst", metadata !466, i32 16777400, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!815 = metadata !{i32 786689, metadata !809, metadata !"src", metadata !466, i32 33554616, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!816 = metadata !{i32 786689, metadata !809, metadata !"wOffset", metadata !466, i32 50331832, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!817 = metadata !{i32 786689, metadata !809, metadata !"hOffset", metadata !466, i32 67109049, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!818 = metadata !{i32 786689, metadata !809, metadata !"count", metadata !466, i32 83886265, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!819 = metadata !{i32 786689, metadata !809, metadata !"kind", metadata !466, i32 100663481, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!820 = metadata !{i32 786689, metadata !809, metadata !"stream", metadata !466, i32 117440698, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!821 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !466, i32 190, metadata !822, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!822 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !823, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!823 = metadata !{metadata !469, metadata !96, metadata !109, metadata !252, metadata !252, metadata !462}
!824 = metadata !{metadata !825}
!825 = metadata !{metadata !826, metadata !827, metadata !828, metadata !829, metadata !830}
!826 = metadata !{i32 786689, metadata !821, metadata !"dst", metadata !466, i32 16777406, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!827 = metadata !{i32 786689, metadata !821, metadata !"symbol", metadata !466, i32 33554622, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!828 = metadata !{i32 786689, metadata !821, metadata !"count", metadata !466, i32 50331838, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!829 = metadata !{i32 786689, metadata !821, metadata !"offset", metadata !466, i32 67109055, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!830 = metadata !{i32 786689, metadata !821, metadata !"kind", metadata !466, i32 83886271, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!831 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !466, i32 195, metadata !832, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!832 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !833, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!833 = metadata !{metadata !469, metadata !96, metadata !109, metadata !252, metadata !252, metadata !462, metadata !651}
!834 = metadata !{metadata !835}
!835 = metadata !{metadata !836, metadata !837, metadata !838, metadata !839, metadata !840, metadata !841}
!836 = metadata !{i32 786689, metadata !831, metadata !"dst", metadata !466, i32 16777411, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!837 = metadata !{i32 786689, metadata !831, metadata !"symbol", metadata !466, i32 33554627, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!838 = metadata !{i32 786689, metadata !831, metadata !"count", metadata !466, i32 50331843, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!839 = metadata !{i32 786689, metadata !831, metadata !"offset", metadata !466, i32 67109060, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!840 = metadata !{i32 786689, metadata !831, metadata !"kind", metadata !466, i32 83886276, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!841 = metadata !{i32 786689, metadata !831, metadata !"stream", metadata !466, i32 100663493, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!842 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !466, i32 201, metadata !843, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!843 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !844, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!844 = metadata !{metadata !469, metadata !96, metadata !19, metadata !97, metadata !19, metadata !252}
!845 = metadata !{metadata !846}
!846 = metadata !{metadata !847, metadata !848, metadata !849, metadata !850, metadata !851}
!847 = metadata !{i32 786689, metadata !842, metadata !"dst", metadata !466, i32 16777417, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!848 = metadata !{i32 786689, metadata !842, metadata !"dstDevice", metadata !466, i32 33554633, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!849 = metadata !{i32 786689, metadata !842, metadata !"src", metadata !466, i32 50331849, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!850 = metadata !{i32 786689, metadata !842, metadata !"srcDevice", metadata !466, i32 67109065, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!851 = metadata !{i32 786689, metadata !842, metadata !"count", metadata !466, i32 83886281, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!852 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !466, i32 206, metadata !853, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!853 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !854, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!854 = metadata !{metadata !469, metadata !96, metadata !19, metadata !97, metadata !19, metadata !252, metadata !651}
!855 = metadata !{metadata !856}
!856 = metadata !{metadata !857, metadata !858, metadata !859, metadata !860, metadata !861, metadata !862}
!857 = metadata !{i32 786689, metadata !852, metadata !"dst", metadata !466, i32 16777422, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!858 = metadata !{i32 786689, metadata !852, metadata !"dstDevice", metadata !466, i32 33554638, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!859 = metadata !{i32 786689, metadata !852, metadata !"src", metadata !466, i32 50331854, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!860 = metadata !{i32 786689, metadata !852, metadata !"srcDevice", metadata !466, i32 67109070, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!861 = metadata !{i32 786689, metadata !852, metadata !"count", metadata !466, i32 83886287, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!862 = metadata !{i32 786689, metadata !852, metadata !"stream", metadata !466, i32 100663503, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!863 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !466, i32 212, metadata !864, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!864 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !865, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!865 = metadata !{metadata !469, metadata !485, metadata !252, metadata !252, metadata !97, metadata !252, metadata !462}
!866 = metadata !{metadata !867}
!867 = metadata !{metadata !868, metadata !869, metadata !870, metadata !871, metadata !872, metadata !873}
!868 = metadata !{i32 786689, metadata !863, metadata !"dst", metadata !466, i32 16777428, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!869 = metadata !{i32 786689, metadata !863, metadata !"wOffset", metadata !466, i32 33554644, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!870 = metadata !{i32 786689, metadata !863, metadata !"hOffset", metadata !466, i32 50331860, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!871 = metadata !{i32 786689, metadata !863, metadata !"src", metadata !466, i32 67109077, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!872 = metadata !{i32 786689, metadata !863, metadata !"count", metadata !466, i32 83886293, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!873 = metadata !{i32 786689, metadata !863, metadata !"kind", metadata !466, i32 100663509, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!874 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !466, i32 217, metadata !875, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!875 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !876, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!876 = metadata !{metadata !469, metadata !485, metadata !252, metadata !252, metadata !97, metadata !252, metadata !462, metadata !651}
!877 = metadata !{metadata !878}
!878 = metadata !{metadata !879, metadata !880, metadata !881, metadata !882, metadata !883, metadata !884, metadata !885}
!879 = metadata !{i32 786689, metadata !874, metadata !"dst", metadata !466, i32 16777433, metadata !485, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!880 = metadata !{i32 786689, metadata !874, metadata !"wOffset", metadata !466, i32 33554649, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!881 = metadata !{i32 786689, metadata !874, metadata !"hOffset", metadata !466, i32 50331865, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!882 = metadata !{i32 786689, metadata !874, metadata !"src", metadata !466, i32 67109082, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!883 = metadata !{i32 786689, metadata !874, metadata !"count", metadata !466, i32 83886298, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!884 = metadata !{i32 786689, metadata !874, metadata !"kind", metadata !466, i32 100663514, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!885 = metadata !{i32 786689, metadata !874, metadata !"stream", metadata !466, i32 117440731, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!886 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !466, i32 223, metadata !887, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!887 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !888, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!888 = metadata !{metadata !469, metadata !21, metadata !97, metadata !252, metadata !252, metadata !462}
!889 = metadata !{metadata !890}
!890 = metadata !{metadata !891, metadata !892, metadata !893, metadata !894, metadata !895}
!891 = metadata !{i32 786689, metadata !886, metadata !"symbol", metadata !466, i32 16777439, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!892 = metadata !{i32 786689, metadata !886, metadata !"src", metadata !466, i32 33554655, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!893 = metadata !{i32 786689, metadata !886, metadata !"count", metadata !466, i32 50331871, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!894 = metadata !{i32 786689, metadata !886, metadata !"offset", metadata !466, i32 67109088, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!895 = metadata !{i32 786689, metadata !886, metadata !"kind", metadata !466, i32 83886304, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!896 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !466, i32 229, metadata !897, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!897 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !898, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!898 = metadata !{metadata !469, metadata !109, metadata !97, metadata !252, metadata !252, metadata !462, metadata !651}
!899 = metadata !{metadata !900}
!900 = metadata !{metadata !901, metadata !902, metadata !903, metadata !904, metadata !905, metadata !906}
!901 = metadata !{i32 786689, metadata !896, metadata !"symbol", metadata !466, i32 16777445, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!902 = metadata !{i32 786689, metadata !896, metadata !"src", metadata !466, i32 33554661, metadata !97, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!903 = metadata !{i32 786689, metadata !896, metadata !"count", metadata !466, i32 50331877, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!904 = metadata !{i32 786689, metadata !896, metadata !"offset", metadata !466, i32 67109093, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!905 = metadata !{i32 786689, metadata !896, metadata !"kind", metadata !466, i32 83886310, metadata !462, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!906 = metadata !{i32 786689, metadata !896, metadata !"stream", metadata !466, i32 100663526, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!907 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !466, i32 234, metadata !908, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!908 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !909, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!909 = metadata !{metadata !469, metadata !333, metadata !333}
!910 = metadata !{metadata !911}
!911 = metadata !{metadata !912, metadata !913}
!912 = metadata !{i32 786689, metadata !907, metadata !"free", metadata !466, i32 16777450, metadata !333, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!913 = metadata !{i32 786689, metadata !907, metadata !"total", metadata !466, i32 33554666, metadata !333, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!914 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !466, i32 238, metadata !915, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!915 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !916, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!916 = metadata !{metadata !469, metadata !96, metadata !19, metadata !252}
!917 = metadata !{metadata !918}
!918 = metadata !{metadata !919, metadata !920, metadata !921}
!919 = metadata !{i32 786689, metadata !914, metadata !"devPtr", metadata !466, i32 16777454, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!920 = metadata !{i32 786689, metadata !914, metadata !"value", metadata !466, i32 33554670, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!921 = metadata !{i32 786689, metadata !914, metadata !"count", metadata !466, i32 50331886, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!922 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !466, i32 243, metadata !923, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!923 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !924, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!924 = metadata !{metadata !469, metadata !96, metadata !252, metadata !19, metadata !252, metadata !252}
!925 = metadata !{metadata !926}
!926 = metadata !{metadata !927, metadata !928, metadata !929, metadata !930, metadata !931}
!927 = metadata !{i32 786689, metadata !922, metadata !"devPtr", metadata !466, i32 16777459, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!928 = metadata !{i32 786689, metadata !922, metadata !"pitch", metadata !466, i32 33554675, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!929 = metadata !{i32 786689, metadata !922, metadata !"value", metadata !466, i32 50331891, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!930 = metadata !{i32 786689, metadata !922, metadata !"width", metadata !466, i32 67109108, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!931 = metadata !{i32 786689, metadata !922, metadata !"height", metadata !466, i32 83886324, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!932 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !466, i32 248, metadata !933, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!933 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !934, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!934 = metadata !{metadata !469, metadata !96, metadata !252, metadata !19, metadata !252, metadata !252, metadata !651}
!935 = metadata !{metadata !936}
!936 = metadata !{metadata !937, metadata !938, metadata !939, metadata !940, metadata !941, metadata !942}
!937 = metadata !{i32 786689, metadata !932, metadata !"devPtr", metadata !466, i32 16777464, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!938 = metadata !{i32 786689, metadata !932, metadata !"pitch", metadata !466, i32 33554680, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!939 = metadata !{i32 786689, metadata !932, metadata !"value", metadata !466, i32 50331896, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!940 = metadata !{i32 786689, metadata !932, metadata !"width", metadata !466, i32 67109113, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!941 = metadata !{i32 786689, metadata !932, metadata !"height", metadata !466, i32 83886329, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!942 = metadata !{i32 786689, metadata !932, metadata !"stream", metadata !466, i32 100663545, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!943 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !466, i32 253, metadata !944, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!944 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !945, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!945 = metadata !{metadata !469, metadata !569, metadata !19, metadata !479}
!946 = metadata !{metadata !947}
!947 = metadata !{metadata !948, metadata !949, metadata !950}
!948 = metadata !{i32 786689, metadata !943, metadata !"pitchedDevPtr", metadata !466, i32 16777469, metadata !569, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!949 = metadata !{i32 786689, metadata !943, metadata !"value", metadata !466, i32 33554685, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!950 = metadata !{i32 786689, metadata !943, metadata !"extent", metadata !466, i32 50331902, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!951 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !466, i32 258, metadata !952, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!952 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !953, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!953 = metadata !{metadata !469, metadata !569, metadata !19, metadata !479, metadata !651}
!954 = metadata !{metadata !955}
!955 = metadata !{metadata !956, metadata !957, metadata !958, metadata !959}
!956 = metadata !{i32 786689, metadata !951, metadata !"pitchedDevPtr", metadata !466, i32 16777474, metadata !569, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!957 = metadata !{i32 786689, metadata !951, metadata !"value", metadata !466, i32 33554690, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!958 = metadata !{i32 786689, metadata !951, metadata !"extent", metadata !466, i32 50331907, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!959 = metadata !{i32 786689, metadata !951, metadata !"stream", metadata !466, i32 67109123, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!960 = metadata !{i32 786478, i32 0, metadata !466, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !466, i32 263, metadata !961, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUstre
!961 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !962, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!962 = metadata !{metadata !469, metadata !96, metadata !19, metadata !252, metadata !651}
!963 = metadata !{metadata !964}
!964 = metadata !{metadata !965, metadata !966, metadata !967, metadata !968}
!965 = metadata !{i32 786689, metadata !960, metadata !"devPtr", metadata !466, i32 16777479, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!966 = metadata !{i32 786689, metadata !960, metadata !"value", metadata !466, i32 33554695, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!967 = metadata !{i32 786689, metadata !960, metadata !"count", metadata !466, i32 50331911, metadata !252, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!968 = metadata !{i32 786689, metadata !960, metadata !"stream", metadata !466, i32 67109127, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!969 = metadata !{i32 93, i32 0, metadata !970, null}
!970 = metadata !{i32 786443, metadata !15, i32 92, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!971 = metadata !{i32 98, i32 0, metadata !970, null}
!972 = metadata !{i32 99, i32 0, metadata !970, null}
!973 = metadata !{i32 100, i32 0, metadata !970, null}
!974 = metadata !{i32 109, i32 0, metadata !975, null}
!975 = metadata !{i32 786443, metadata !970, i32 109, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!976 = metadata !{i32 111, i32 0, metadata !977, null}
!977 = metadata !{i32 786443, metadata !975, i32 110, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!978 = metadata !{i32 118, i32 0, metadata !970, null}
!979 = metadata !{i32 119, i32 0, metadata !970, null}
!980 = metadata !{i32 120, i32 0, metadata !970, null}
!981 = metadata !{i32 123, i32 0, metadata !970, null}
!982 = metadata !{i32 126, i32 0, metadata !983, null}
!983 = metadata !{i32 786443, metadata !970, i32 124, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!984 = metadata !{i32 130, i32 0, metadata !983, null}
!985 = metadata !{i32 134, i32 0, metadata !970, null}
!986 = metadata !{i32 139, i32 0, metadata !970, null}
!987 = metadata !{i32 140, i32 0, metadata !970, null}
!988 = metadata !{i32 141, i32 0, metadata !970, null}
!989 = metadata !{i32 146, i32 0, metadata !970, null}
!990 = metadata !{i32 148, i32 0, metadata !970, null}
!991 = metadata !{i32 419, i32 0, metadata !34, null}
!992 = metadata !{i32 29, i32 0, metadata !993, null}
!993 = metadata !{i32 786443, metadata !23, i32 26, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!994 = metadata !{i32 30, i32 0, metadata !993, null}
!995 = metadata !{i32 32, i32 0, metadata !993, null}
!996 = metadata !{i32 35, i32 0, metadata !993, null}
!997 = metadata !{i32 36, i32 0, metadata !993, null}
!998 = metadata !{i32 39, i32 0, metadata !999, null}
!999 = metadata !{i32 786443, metadata !993, i32 39, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!1000 = metadata !{i32 41, i32 0, metadata !1001, null}
!1001 = metadata !{i32 786443, metadata !999, i32 40, i32 0, metadata !16, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!1002 = metadata !{i32 43, i32 0, metadata !1001, null}
!1003 = metadata !{i32 45, i32 0, metadata !1004, null}
!1004 = metadata !{i32 786443, metadata !1001, i32 44, i32 0, metadata !16, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!1005 = metadata !{i32 46, i32 0, metadata !1004, null}
!1006 = metadata !{i32 48, i32 0, metadata !1004, null}
!1007 = metadata !{i32 50, i32 0, metadata !1008, null}
!1008 = metadata !{i32 786443, metadata !1004, i32 49, i32 0, metadata !16, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!1009 = metadata !{i32 51, i32 0, metadata !1008, null}
!1010 = metadata !{i32 56, i32 0, metadata !993, null}
!1011 = metadata !{i32 58, i32 0, metadata !993, null}
!1012 = metadata !{i32 60, i32 0, metadata !993, null}
!1013 = metadata !{i32 61, i32 0, metadata !993, null}
!1014 = metadata !{i32 419, i32 0, metadata !77, null}
!1015 = metadata !{i32 419, i32 0, metadata !1016, null}
!1016 = metadata !{i32 786443, metadata !77, i32 419, i32 0, metadata !35, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock//home/sawaya/Gklee/Gklee/include/cuda/vector_types.h]
!1017 = metadata !{i32 13, i32 0, metadata !1018, null}
!1018 = metadata !{i32 786443, metadata !81, i32 12, i32 0, metadata !82, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c]
!1019 = metadata !{i32 14, i32 0, metadata !1018, null}
!1020 = metadata !{i32 15, i32 0, metadata !1018, null}
!1021 = metadata !{i32 16, i32 0, metadata !107, null}
!1022 = metadata !{i32 17, i32 0, metadata !107, null}
!1023 = metadata !{metadata !"omnipotent char", metadata !1024}
!1024 = metadata !{metadata !"Simple C/C++ TBAA"}
!1025 = metadata !{i32 18, i32 0, metadata !107, null}
!1026 = metadata !{i32 14, i32 0, metadata !141, null}
!1027 = metadata !{i32 15, i32 0, metadata !141, null}
!1028 = metadata !{i32 16, i32 0, metadata !141, null}
!1029 = metadata !{i32 15, i32 0, metadata !1030, null}
!1030 = metadata !{i32 786443, metadata !237, i32 14, i32 0, metadata !238, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1031 = metadata !{metadata !"int", metadata !1023}
!1032 = metadata !{i32 16, i32 0, metadata !1030, null}
!1033 = metadata !{i32 20, i32 0, metadata !1034, null}
!1034 = metadata !{i32 786443, metadata !316, i32 19, i32 0, metadata !238, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1035 = metadata !{i32 21, i32 0, metadata !1034, null}
!1036 = metadata !{i32 25, i32 0, metadata !1037, null}
!1037 = metadata !{i32 786443, metadata !323, i32 24, i32 0, metadata !238, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1038 = metadata !{i32 29, i32 0, metadata !1039, null}
!1039 = metadata !{i32 786443, metadata !330, i32 28, i32 0, metadata !238, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1040 = metadata !{i32 33, i32 0, metadata !1041, null}
!1041 = metadata !{i32 786443, metadata !338, i32 32, i32 0, metadata !238, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1042 = metadata !{i32 34, i32 0, metadata !1041, null}
!1043 = metadata !{i32 38, i32 0, metadata !1044, null}
!1044 = metadata !{i32 786443, metadata !346, i32 37, i32 0, metadata !238, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1045 = metadata !{i32 42, i32 0, metadata !1046, null}
!1046 = metadata !{i32 786443, metadata !349, i32 41, i32 0, metadata !238, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1047 = metadata !{i32 46, i32 0, metadata !1048, null}
!1048 = metadata !{i32 786443, metadata !355, i32 45, i32 0, metadata !238, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1049 = metadata !{i32 50, i32 0, metadata !1050, null}
!1050 = metadata !{i32 786443, metadata !362, i32 49, i32 0, metadata !238, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1051 = metadata !{i32 54, i32 0, metadata !1052, null}
!1052 = metadata !{i32 786443, metadata !363, i32 53, i32 0, metadata !238, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1053 = metadata !{i32 55, i32 0, metadata !1052, null}
!1054 = metadata !{i32 59, i32 0, metadata !1055, null}
!1055 = metadata !{i32 786443, metadata !369, i32 58, i32 0, metadata !238, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1056 = metadata !{i32 60, i32 0, metadata !1055, null}
!1057 = metadata !{i32 64, i32 0, metadata !1058, null}
!1058 = metadata !{i32 786443, metadata !373, i32 63, i32 0, metadata !238, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1059 = metadata !{i32 65, i32 0, metadata !1058, null}
!1060 = metadata !{i32 69, i32 0, metadata !1061, null}
!1061 = metadata !{i32 786443, metadata !381, i32 68, i32 0, metadata !238, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1062 = metadata !{i32 73, i32 0, metadata !1063, null}
!1063 = metadata !{i32 786443, metadata !387, i32 72, i32 0, metadata !238, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1064 = metadata !{i32 77, i32 0, metadata !1065, null}
!1065 = metadata !{i32 786443, metadata !405, i32 76, i32 0, metadata !238, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1066 = metadata !{i32 81, i32 0, metadata !1067, null}
!1067 = metadata !{i32 786443, metadata !417, i32 80, i32 0, metadata !238, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1068 = metadata !{i32 85, i32 0, metadata !1069, null}
!1069 = metadata !{i32 786443, metadata !425, i32 84, i32 0, metadata !238, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1070 = metadata !{i32 89, i32 0, metadata !1071, null}
!1071 = metadata !{i32 786443, metadata !434, i32 88, i32 0, metadata !238, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1072 = metadata !{i32 93, i32 0, metadata !1073, null}
!1073 = metadata !{i32 786443, metadata !440, i32 92, i32 0, metadata !238, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1074 = metadata !{i32 97, i32 0, metadata !1075, null}
!1075 = metadata !{i32 786443, metadata !446, i32 96, i32 0, metadata !238, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1076 = metadata !{i32 26, i32 0, metadata !1077, null}
!1077 = metadata !{i32 786443, metadata !465, i32 25, i32 0, metadata !466, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1078 = metadata !{i32 30, i32 0, metadata !1079, null}
!1079 = metadata !{i32 786443, metadata !493, i32 29, i32 0, metadata !466, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1080 = metadata !{i32 31, i32 0, metadata !1079, null}
!1081 = metadata !{i32 35, i32 0, metadata !1082, null}
!1082 = metadata !{i32 786443, metadata !499, i32 34, i32 0, metadata !466, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1083 = metadata !{i32 36, i32 0, metadata !1082, null}
!1084 = metadata !{i32 40, i32 0, metadata !1085, null}
!1085 = metadata !{i32 786443, metadata !505, i32 39, i32 0, metadata !466, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1086 = metadata !{i32 41, i32 0, metadata !1085, null}
!1087 = metadata !{i32 45, i32 0, metadata !1088, null}
!1088 = metadata !{i32 786443, metadata !509, i32 44, i32 0, metadata !466, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1089 = metadata !{i32 49, i32 0, metadata !1090, null}
!1090 = metadata !{i32 786443, metadata !516, i32 48, i32 0, metadata !466, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1091 = metadata !{i32 53, i32 0, metadata !1092, null}
!1092 = metadata !{i32 786443, metadata !523, i32 52, i32 0, metadata !466, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1093 = metadata !{i32 57, i32 0, metadata !1094, null}
!1094 = metadata !{i32 786443, metadata !531, i32 56, i32 0, metadata !466, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1095 = metadata !{i32 61, i32 0, metadata !1096, null}
!1096 = metadata !{i32 786443, metadata !539, i32 60, i32 0, metadata !466, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1097 = metadata !{i32 65, i32 0, metadata !1098, null}
!1098 = metadata !{i32 786443, metadata !546, i32 64, i32 0, metadata !466, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1099 = metadata !{i32 69, i32 0, metadata !1100, null}
!1100 = metadata !{i32 786443, metadata !554, i32 68, i32 0, metadata !466, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1101 = metadata !{i32 73, i32 0, metadata !1102, null}
!1102 = metadata !{i32 786443, metadata !558, i32 72, i32 0, metadata !466, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1103 = metadata !{i32 74, i32 0, metadata !1102, null}
!1104 = metadata !{metadata !"any pointer", metadata !1023}
!1105 = metadata !{i32 75, i32 0, metadata !1102, null}
!1106 = metadata !{i32 77, i32 0, metadata !1102, null}
!1107 = metadata !{i32 81, i32 0, metadata !1108, null}
!1108 = metadata !{i32 786443, metadata !565, i32 80, i32 0, metadata !466, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1109 = metadata !{i32 86, i32 0, metadata !1110, null}
!1110 = metadata !{i32 786443, metadata !579, i32 85, i32 0, metadata !466, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1111 = metadata !{i32 91, i32 0, metadata !1112, null}
!1112 = metadata !{i32 786443, metadata !589, i32 90, i32 0, metadata !466, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1113 = metadata !{i32 95, i32 0, metadata !1114, null}
!1114 = metadata !{i32 786443, metadata !599, i32 94, i32 0, metadata !466, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1115 = metadata !{i32 96, i32 0, metadata !1114, null}
!1116 = metadata !{i32 97, i32 0, metadata !1114, null}
!1117 = metadata !{i32 99, i32 0, metadata !1114, null}
!1118 = metadata !{i32 103, i32 0, metadata !1119, null}
!1119 = metadata !{i32 786443, metadata !604, i32 102, i32 0, metadata !466, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1120 = metadata !{i32 108, i32 0, metadata !1121, null}
!1121 = metadata !{i32 786443, metadata !613, i32 106, i32 0, metadata !466, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1122 = metadata !{i32 113, i32 0, metadata !1123, null}
!1123 = metadata !{i32 786443, metadata !622, i32 112, i32 0, metadata !466, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1124 = metadata !{i32 119, i32 0, metadata !1125, null}
!1125 = metadata !{i32 786443, metadata !634, i32 118, i32 0, metadata !466, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1126 = metadata !{i32 125, i32 0, metadata !1127, null}
!1127 = metadata !{i32 786443, metadata !648, i32 124, i32 0, metadata !466, i32 20} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1128 = metadata !{i32 131, i32 0, metadata !1129, null}
!1129 = metadata !{i32 786443, metadata !664, i32 130, i32 0, metadata !466, i32 21} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1130 = metadata !{i32 137, i32 0, metadata !1131, null}
!1131 = metadata !{i32 786443, metadata !677, i32 136, i32 0, metadata !466, i32 22} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1132 = metadata !{i32 143, i32 0, metadata !1133, null}
!1133 = metadata !{i32 786443, metadata !691, i32 142, i32 0, metadata !466, i32 23} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1134 = metadata !{i32 149, i32 0, metadata !1135, null}
!1135 = metadata !{i32 786443, metadata !704, i32 148, i32 0, metadata !466, i32 24} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1136 = metadata !{i32 153, i32 0, metadata !1137, null}
!1137 = metadata !{i32 786443, metadata !718, i32 152, i32 0, metadata !466, i32 25} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1138 = metadata !{i32 157, i32 0, metadata !1139, null}
!1139 = metadata !{i32 786443, metadata !742, i32 156, i32 0, metadata !466, i32 26} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1140 = metadata !{i32 161, i32 0, metadata !1141, null}
!1141 = metadata !{i32 786443, metadata !749, i32 160, i32 0, metadata !466, i32 27} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1142 = metadata !{i32 165, i32 0, metadata !1143, null}
!1143 = metadata !{i32 786443, metadata !768, i32 164, i32 0, metadata !466, i32 28} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1144 = metadata !{i32 171, i32 0, metadata !1145, null}
!1145 = metadata !{i32 786443, metadata !775, i32 170, i32 0, metadata !466, i32 29} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1146 = metadata !{i32 176, i32 0, metadata !1147, null}
!1147 = metadata !{i32 786443, metadata !788, i32 175, i32 0, metadata !466, i32 30} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1148 = metadata !{i32 181, i32 0, metadata !1149, null}
!1149 = metadata !{i32 786443, metadata !798, i32 180, i32 0, metadata !466, i32 31} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1150 = metadata !{i32 187, i32 0, metadata !1151, null}
!1151 = metadata !{i32 786443, metadata !809, i32 186, i32 0, metadata !466, i32 32} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1152 = metadata !{i32 192, i32 0, metadata !1153, null}
!1153 = metadata !{i32 786443, metadata !821, i32 191, i32 0, metadata !466, i32 33} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1154 = metadata !{i32 198, i32 0, metadata !1155, null}
!1155 = metadata !{i32 786443, metadata !831, i32 197, i32 0, metadata !466, i32 34} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1156 = metadata !{i32 203, i32 0, metadata !1157, null}
!1157 = metadata !{i32 786443, metadata !842, i32 201, i32 0, metadata !466, i32 35} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1158 = metadata !{i32 209, i32 0, metadata !1159, null}
!1159 = metadata !{i32 786443, metadata !852, i32 207, i32 0, metadata !466, i32 36} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1160 = metadata !{i32 214, i32 0, metadata !1161, null}
!1161 = metadata !{i32 786443, metadata !863, i32 213, i32 0, metadata !466, i32 37} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1162 = metadata !{i32 220, i32 0, metadata !1163, null}
!1163 = metadata !{i32 786443, metadata !874, i32 219, i32 0, metadata !466, i32 38} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1164 = metadata !{i32 225, i32 0, metadata !1165, null}
!1165 = metadata !{i32 786443, metadata !886, i32 224, i32 0, metadata !466, i32 39} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1166 = metadata !{i32 226, i32 0, metadata !1165, null}
!1167 = metadata !{i32 231, i32 0, metadata !1168, null}
!1168 = metadata !{i32 786443, metadata !896, i32 230, i32 0, metadata !466, i32 40} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1169 = metadata !{i32 235, i32 0, metadata !1170, null}
!1170 = metadata !{i32 786443, metadata !907, i32 234, i32 0, metadata !466, i32 41} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1171 = metadata !{i32 239, i32 0, metadata !1172, null}
!1172 = metadata !{i32 786443, metadata !914, i32 238, i32 0, metadata !466, i32 42} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1173 = metadata !{i32 240, i32 0, metadata !1172, null}
!1174 = metadata !{i32 245, i32 0, metadata !1175, null}
!1175 = metadata !{i32 786443, metadata !922, i32 244, i32 0, metadata !466, i32 43} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1176 = metadata !{i32 250, i32 0, metadata !1177, null}
!1177 = metadata !{i32 786443, metadata !932, i32 249, i32 0, metadata !466, i32 44} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1178 = metadata !{i32 255, i32 0, metadata !1179, null}
!1179 = metadata !{i32 786443, metadata !943, i32 254, i32 0, metadata !466, i32 45} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1180 = metadata !{i32 260, i32 0, metadata !1181, null}
!1181 = metadata !{i32 786443, metadata !951, i32 259, i32 0, metadata !466, i32 46} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1182 = metadata !{i32 264, i32 0, metadata !1183, null}
!1183 = metadata !{i32 786443, metadata !960, i32 263, i32 0, metadata !466, i32 47} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
