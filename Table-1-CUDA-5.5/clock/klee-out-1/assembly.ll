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

@threadIdx = external global %struct.dim3
@blockIdx = external global %struct.dim3
@shared = external global [0 x float], section "__shared__"
@blockDim = external global %struct.dim3
@gridDim = external global %struct.dim3
@str = private unnamed_addr constant [18 x i8] c"CUDA Clock sample\00"
@.str = private unnamed_addr constant [65 x i8] c"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str1 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str19 = private unnamed_addr constant [11 x i8] c"GPU device\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) uwtable {
entry:
  %dinput = alloca float*, align 8
  %doutput = alloca float*, align 8
  %dtimer = alloca i64*, align 8
  %timer = alloca [128 x i64], align 16
  %input = alloca [512 x float], align 16
  %puts = call i32 @puts(i8* getelementptr inbounds ([18 x i8]* @str, i64 0, i64 0)), !dbg !1015
  store float* null, float** %dinput, align 8, !dbg !1016, !tbaa !1017
  store float* null, float** %doutput, align 8, !dbg !1020, !tbaa !1017
  store i64* null, i64** %dtimer, align 8, !dbg !1021, !tbaa !1017
  br label %for.body, !dbg !1022

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %0 = trunc i64 %indvars.iv to i32, !dbg !1023
  %conv = sitofp i32 %0 to float, !dbg !1023
  %arrayidx = getelementptr inbounds [512 x float]* %input, i64 0, i64 %indvars.iv, !dbg !1023
  store float %conv, float* %arrayidx, align 4, !dbg !1023, !tbaa !1025
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !1022
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !1022
  %exitcond = icmp eq i32 %lftr.wideiv, 512, !dbg !1022
  br i1 %exitcond, label %for.end, label %for.body, !dbg !1022

for.end:                                          ; preds = %for.body
  %1 = bitcast float** %dinput to i8**, !dbg !1026
  %call1 = call i32 @cudaMalloc(i8** %1, i64 2048), !dbg !1026
  %2 = bitcast float** %doutput to i8**, !dbg !1027
  %call2 = call i32 @cudaMalloc(i8** %2, i64 256), !dbg !1027
  %3 = bitcast i64** %dtimer to i8**, !dbg !1028
  %call3 = call i32 @cudaMalloc(i8** %3, i64 1024), !dbg !1028
  %4 = load float** %dinput, align 8, !dbg !1029, !tbaa !1017
  %5 = bitcast float* %4 to i8*, !dbg !1029
  %6 = bitcast [512 x float]* %input to i8*, !dbg !1029
  %call4 = call i32 @cudaMemcpy(i8* %5, i8* %6, i64 2048, i32 1), !dbg !1029
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 4294967360, i32 1, i64 4294967552, i32 1, i64 2048), !dbg !1030
  %7 = load float** %dinput, align 8, !dbg !1032, !tbaa !1017
  %8 = load float** %doutput, align 8, !dbg !1032, !tbaa !1017
  %9 = load i64** %dtimer, align 8, !dbg !1032, !tbaa !1017
  call fastcc void @_ZL14timedReductionPKfPfPl(float* %7, float* %8, i64* %9), !dbg !1032
  %10 = bitcast [128 x i64]* %timer to i8*, !dbg !1033
  %11 = load i64** %dtimer, align 8, !dbg !1033, !tbaa !1017
  %12 = bitcast i64* %11 to i8*, !dbg !1033
  %call7 = call i32 @cudaMemcpy(i8* %10, i8* %12, i64 1024, i32 2), !dbg !1033
  %13 = load float** %dinput, align 8, !dbg !1034, !tbaa !1017
  %14 = bitcast float* %13 to i8*, !dbg !1034
  %call8 = call i32 @cudaFree(i8* %14), !dbg !1034
  %15 = load float** %doutput, align 8, !dbg !1035, !tbaa !1017
  %16 = bitcast float* %15 to i8*, !dbg !1035
  %call9 = call i32 @cudaFree(i8* %16), !dbg !1035
  %17 = load i64** %dtimer, align 8, !dbg !1036, !tbaa !1017
  %18 = bitcast i64* %17 to i8*, !dbg !1036
  %call10 = call i32 @cudaFree(i8* %18), !dbg !1036
  %call11 = call i32 @cudaDeviceReset(), !dbg !1037
  ret i32 0, !dbg !1038
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare void @__set_CUDAConfig(i64, i32, i64, i32, ...)

define internal fastcc void @_ZL14timedReductionPKfPfPl(float* nocapture %input, float* nocapture %output, i64* nocapture %timer) uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1039, !tbaa !1040
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1041, !tbaa !1040
  %cmp = icmp eq i32 %0, 0, !dbg !1042
  br i1 %cmp, label %if.then, label %if.end, !dbg !1042

if.then:                                          ; preds = %entry
  %call = tail call i64 @clock() nounwind, !dbg !1042
  %idxprom = sext i32 %1 to i64, !dbg !1042
  %arrayidx = getelementptr inbounds i64* %timer, i64 %idxprom, !dbg !1042
  store i64 %call, i64* %arrayidx, align 8, !dbg !1042, !tbaa !1043
  br label %if.end, !dbg !1042

if.end:                                           ; preds = %if.then, %entry
  %idxprom1 = sext i32 %0 to i64, !dbg !1044
  %arrayidx2 = getelementptr inbounds float* %input, i64 %idxprom1, !dbg !1044
  %2 = load float* %arrayidx2, align 4, !dbg !1044, !tbaa !1025
  %arrayidx4 = getelementptr inbounds [0 x float]* @shared, i64 0, i64 %idxprom1, !dbg !1044
  store float %2, float* %arrayidx4, align 4, !dbg !1044, !tbaa !1025
  %3 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1045, !tbaa !1040
  %add = add i32 %3, %0, !dbg !1045
  %idxprom5 = zext i32 %add to i64, !dbg !1045
  %arrayidx6 = getelementptr inbounds float* %input, i64 %idxprom5, !dbg !1045
  %4 = load float* %arrayidx6, align 4, !dbg !1045, !tbaa !1025
  %arrayidx9 = getelementptr inbounds [0 x float]* @shared, i64 0, i64 %idxprom5, !dbg !1045
  store float %4, float* %arrayidx9, align 4, !dbg !1045, !tbaa !1025
  %cmp1054 = icmp sgt i32 %3, 0, !dbg !1046
  br i1 %cmp1054, label %for.body, label %for.end, !dbg !1046

for.body:                                         ; preds = %for.inc, %if.end
  %d.055 = phi i32 [ %div, %for.inc ], [ %3, %if.end ]
  tail call void @__syncthreads(), !dbg !1047
  %cmp11 = icmp slt i32 %0, %d.055, !dbg !1048
  br i1 %cmp11, label %if.then12, label %for.inc, !dbg !1048

if.then12:                                        ; preds = %for.body
  %5 = load float* %arrayidx4, align 4, !dbg !1049, !tbaa !1025
  %add15 = add nsw i32 %d.055, %0, !dbg !1050
  %idxprom16 = sext i32 %add15 to i64, !dbg !1050
  %arrayidx17 = getelementptr inbounds [0 x float]* @shared, i64 0, i64 %idxprom16, !dbg !1050
  %6 = load float* %arrayidx17, align 4, !dbg !1050, !tbaa !1025
  %cmp18 = fcmp olt float %6, %5, !dbg !1051
  br i1 %cmp18, label %if.then19, label %for.inc, !dbg !1051

if.then19:                                        ; preds = %if.then12
  store float %6, float* %arrayidx4, align 4, !dbg !1052, !tbaa !1025
  br label %for.inc, !dbg !1054

for.inc:                                          ; preds = %if.then19, %if.then12, %for.body
  %int_cast_to_i64 = zext i32 2 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %div = sdiv i32 %d.055, 2, !dbg !1046
  %cmp10 = icmp sgt i32 %d.055, 1, !dbg !1046
  br i1 %cmp10, label %for.body, label %for.end, !dbg !1046

for.end:                                          ; preds = %for.inc, %if.end
  br i1 %cmp, label %if.then25, label %if.end35.critedge, !dbg !1055

if.then25:                                        ; preds = %for.end
  %7 = load float* getelementptr inbounds ([0 x float]* @shared, i64 0, i64 0), align 4, !dbg !1055, !tbaa !1025
  %idxprom26 = sext i32 %1 to i64, !dbg !1055
  %arrayidx27 = getelementptr inbounds float* %output, i64 %idxprom26, !dbg !1055
  store float %7, float* %arrayidx27, align 4, !dbg !1055, !tbaa !1025
  tail call void @__syncthreads(), !dbg !1056
  %call31 = tail call i64 @clock() nounwind, !dbg !1057
  %8 = load i32* getelementptr inbounds (%struct.dim3* @gridDim, i64 0, i32 0), align 4, !dbg !1057, !tbaa !1040
  %add32 = add i32 %8, %1, !dbg !1057
  %idxprom33 = zext i32 %add32 to i64, !dbg !1057
  %arrayidx34 = getelementptr inbounds i64* %timer, i64 %idxprom33, !dbg !1057
  store i64 %call31, i64* %arrayidx34, align 8, !dbg !1057, !tbaa !1043
  br label %if.end35, !dbg !1057

if.end35.critedge:                                ; preds = %for.end
  tail call void @__syncthreads(), !dbg !1056
  br label %if.end35

if.end35:                                         ; preds = %if.end35.critedge, %if.then25
  ret void, !dbg !1058
}

declare i64 @clock() nounwind section "__device__"

declare void @__syncthreads() section "__device__"

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare i32 @puts(i8* nocapture) nounwind

define void @klee_div_zero_check(i64 %z) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %z, 0, !dbg !1059
  br i1 %cmp, label %if.then, label %if.end, !dbg !1059

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([65 x i8]* @.str, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str2, i64 0, i64 0)) noreturn nounwind, !dbg !1
  unreachable, !dbg !1061

if.end:                                           ; preds = %entry
  ret void, !dbg !1062
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !1063
  br i1 %cmp3, label %while.end, label %while.body, !dbg !1063

while.body:                                       ; preds = %while.body, %entry
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %srcaddr, %entry ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %destaddr, %entry ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %len, %entry ]
  %dec = add i64 %len.addr.04, -1, !dbg !1063
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !1064
  %0 = load i8* %src.06, align 1, !dbg !1064, !tbaa !1018
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !1064
  store i8 %0, i8* %dest.05, align 1, !dbg !1064, !tbaa !1018
  %cmp = icmp eq i64 %dec, 0, !dbg !1063
  br i1 %cmp, label %while.end, label %while.body, !dbg !1063

while.end:                                        ; preds = %while.body, %entry
  ret i8* %destaddr, !dbg !1065
}

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
entry:
  %cmp2 = icmp eq i64 %count, 0, !dbg !1066
  br i1 %cmp2, label %while.end, label %while.body.lr.ph, !dbg !1066

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %s to i8, !dbg !1067
  br label %while.body, !dbg !1066

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %a.04 = phi i8* [ %dst, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %count.addr.03 = phi i64 [ %count, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i64 %count.addr.03, -1, !dbg !1066
  %incdec.ptr = getelementptr inbounds i8* %a.04, i64 1, !dbg !1067
  store volatile i8 %conv, i8* %a.04, align 1, !dbg !1067, !tbaa !1018
  %cmp = icmp eq i64 %dec, 0, !dbg !1066
  br i1 %cmp, label %while.end, label %while.body, !dbg !1066

while.end:                                        ; preds = %while.body, %entry
  ret i8* %dst, !dbg !1068
}

define i32 @cudaChooseDevice(i32* nocapture %device, %struct.cudaDeviceProp* nocapture %prop) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !1069, !tbaa !1040
  ret i32 0, !dbg !1071
}

define i32 @cudaDeviceGetByPCIBusId(i32* nocapture %device, i8* nocapture %pciBusId) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !1072, !tbaa !1040
  ret i32 0, !dbg !1074
}

define i32 @cudaDeviceGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1075
}

define i32 @cudaDeviceGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1077
}

define i32 @cudaDeviceGetPCIBusId(i8* nocapture %pciBusId, i32 %len, i32 %device) nounwind uwtable {
entry:
  %0 = bitcast i8* %pciBusId to i32*, !dbg !1079
  store i32 3171433, i32* %0, align 1, !dbg !1079
  ret i32 0, !dbg !1081
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @cudaDeviceReset() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1082
}

define i32 @cudaDeviceSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1084
}

define i32 @cudaDeviceSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1086
}

define i32 @cudaDeviceSynchronize() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1088
}

define i32 @cudaGetDevice(i32* nocapture %device) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !1090, !tbaa !1040
  ret i32 0, !dbg !1092
}

define i32 @cudaGetDeviceCount(i32* nocapture %count) nounwind uwtable {
entry:
  store i32 1, i32* %count, align 4, !dbg !1093, !tbaa !1040
  ret i32 0, !dbg !1095
}

define i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nocapture %prop, i32 %device) nounwind uwtable {
entry:
  %arraydecay = getelementptr inbounds %struct.cudaDeviceProp* %prop, i64 0, i32 0, i64 0, !dbg !1096
  %0 = call i8* @memcpy(i8* %arraydecay, i8* getelementptr inbounds ([11 x i8]* @.str19, i64 0, i64 0), i64 11)
  ret i32 0, !dbg !1098
}

define i32 @cudaIpcCloseMemHandle(i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1099
}

define i32 @cudaIpcGetEventHandle(%struct.cudaIpcEventHandle_st* nocapture %handle, %struct.CUevent_st* nocapture %event) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1101
}

define i32 @cudaIpcGetMemHandle(%struct.cudaIpcMemHandle_st* nocapture %handle, i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1103
}

define i32 @cudaIpcOpenEventHandle(%struct.CUevent_st** nocapture %event, %struct.cudaIpcEventHandle_st* nocapture byval align 8 %handle) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1105
}

define i32 @cudaIpcOpenMemHandle(i8** nocapture %devPtr, %struct.cudaIpcMemHandle_st* nocapture byval align 8 %handle, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1107
}

define i32 @cudaSetDevice(i32 %device) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1109
}

define i32 @cudaSetDeviceFlags(i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1111
}

define i32 @cudaSetValidDevices(i32* nocapture %device_arr, i32 %len) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1113
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1115
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
entry:
  tail call void @free(i8* %devPtr) nounwind, !dbg !1117
  ret i32 0, !dbg !1119
}

declare void @free(i8* nocapture) nounwind

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
entry:
  %0 = bitcast %struct.cudaArray* %array to i8*, !dbg !1120
  tail call void @free(i8* %0) nounwind, !dbg !1120
  ret i32 0, !dbg !1122
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
entry:
  tail call void @free(i8* %ptr) nounwind, !dbg !1123
  ret i32 0, !dbg !1125
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1126
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1128
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1130
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1132
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1134
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1136
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1138
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
entry:
  tail call void @__set_device(), !dbg !1140
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1142
  store i8* %call, i8** %devPtr, align 8, !dbg !1142, !tbaa !1017
  tail call void @__clear_device(), !dbg !1143
  ret i32 0, !dbg !1144
}

declare void @__set_device()

declare noalias i8* @malloc(i64) nounwind

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1145
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1147
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1149
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
entry:
  tail call void @__set_host(), !dbg !1151
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1153
  store i8* %call, i8** %ptr, align 8, !dbg !1153, !tbaa !1017
  tail call void @__clear_host(), !dbg !1154
  ret i32 0, !dbg !1155
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1156
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1158
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1160
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1162
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1164
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1166
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1168
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1170
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1172
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1174
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1176
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1178
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1180
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1182
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1184
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1186
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1188
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1190
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1192
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1194
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1196
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1198
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1200
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
entry:
  %add.ptr = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !1202
  %0 = call i8* @memcpy(i8* %add.ptr, i8* %src, i64 %count)
  ret i32 0, !dbg !1204
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1205
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1207
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
entry:
  %0 = trunc i32 %value to i8, !dbg !1209
  %1 = zext i8 %0 to i32
  %2 = call i8* @memset(i8* %devPtr, i32 %1, i64 %count)
  ret i32 0, !dbg !1211
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1212
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1214
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1216
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1218
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1220
}

!llvm.dbg.cu = !{!0, !124, !135, !157, !173, !190, !499}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"clock.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32 0, metadata !1, metada
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
!14 = metadata !{metadata !15, metadata !47, metadata !67, metadata !117}
!15 = metadata !{i32 786478, i32 0, metadata !16, metadata !"main", metadata !"main", metadata !"", metadata !16, i32 91, metadata !17, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !23, i32 92} ; [
!16 = metadata !{i32 786473, metadata !"clock.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock", null} ; [ DW_TAG_file_type ]
!17 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !18, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!18 = metadata !{metadata !19, metadata !19, metadata !20}
!19 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!20 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !21} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!21 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !22} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!22 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!23 = metadata !{metadata !24}
!24 = metadata !{metadata !25, metadata !26, metadata !27, metadata !31, metadata !32, metadata !37, metadata !41, metadata !45}
!25 = metadata !{i32 786689, metadata !15, metadata !"argc", metadata !16, i32 16777307, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 91]
!26 = metadata !{i32 786689, metadata !15, metadata !"argv", metadata !16, i32 33554523, metadata !20, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 91]
!27 = metadata !{i32 786688, metadata !28, metadata !"dinput", metadata !16, i32 98, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dinput] [line 98]
!28 = metadata !{i32 786443, metadata !15, i32 92, i32 0, metadata !16, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!29 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !30} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!30 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!31 = metadata !{i32 786688, metadata !28, metadata !"doutput", metadata !16, i32 99, metadata !29, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [doutput] [line 99]
!32 = metadata !{i32 786688, metadata !28, metadata !"dtimer", metadata !16, i32 100, metadata !33, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dtimer] [line 100]
!33 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !34} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from clock_t]
!34 = metadata !{i32 786454, null, metadata !"clock_t", metadata !16, i32 59, i64 0, i64 0, i64 0, i32 0, metadata !35} ; [ DW_TAG_typedef ] [clock_t] [line 59, size 0, align 0, offset 0] [from __clock_t]
!35 = metadata !{i32 786454, null, metadata !"__clock_t", metadata !16, i32 135, i64 0, i64 0, i64 0, i32 0, metadata !36} ; [ DW_TAG_typedef ] [__clock_t] [line 135, size 0, align 0, offset 0] [from long int]
!36 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!37 = metadata !{i32 786688, metadata !28, metadata !"timer", metadata !16, i32 102, metadata !38, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [timer] [line 102]
!38 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 64, i32 0, i32 0, metadata !34, metadata !39, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8192, align 64, offset 0] [from clock_t]
!39 = metadata !{metadata !40}
!40 = metadata !{i32 786465, i64 0, i64 127}      ; [ DW_TAG_subrange_type ] [0, 127]
!41 = metadata !{i32 786688, metadata !28, metadata !"input", metadata !16, i32 103, metadata !42, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [input] [line 103]
!42 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !30, metadata !43, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from float]
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786465, i64 0, i64 511}      ; [ DW_TAG_subrange_type ] [0, 511]
!45 = metadata !{i32 786688, metadata !46, metadata !"i", metadata !16, i32 109, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 109]
!46 = metadata !{i32 786443, metadata !28, i32 109, i32 0, metadata !16, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!47 = metadata !{i32 786478, i32 0, metadata !16, metadata !"timedReduction", metadata !"timedReduction", metadata !"_ZL14timedReductionPKfPfPl", metadata !16, i32 25, metadata !48, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (float*, fl
!48 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !49, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{null, metadata !50, metadata !29, metadata !33}
!50 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !51} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!51 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float]
!52 = metadata !{metadata !53}
!53 = metadata !{metadata !54, metadata !55, metadata !56, metadata !57, metadata !60, metadata !61, metadata !63, metadata !66}
!54 = metadata !{i32 786689, metadata !47, metadata !"input", metadata !16, i32 16777241, metadata !50, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [input] [line 25]
!55 = metadata !{i32 786689, metadata !47, metadata !"output", metadata !16, i32 33554457, metadata !29, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [output] [line 25]
!56 = metadata !{i32 786689, metadata !47, metadata !"timer", metadata !16, i32 50331673, metadata !33, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [timer] [line 25]
!57 = metadata !{i32 786688, metadata !58, metadata !"tid", metadata !16, i32 29, metadata !59, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tid] [line 29]
!58 = metadata !{i32 786443, metadata !47, i32 26, i32 0, metadata !16, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!59 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!60 = metadata !{i32 786688, metadata !58, metadata !"bid", metadata !16, i32 30, metadata !59, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bid] [line 30]
!61 = metadata !{i32 786688, metadata !62, metadata !"d", metadata !16, i32 39, metadata !19, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d] [line 39]
!62 = metadata !{i32 786443, metadata !58, i32 39, i32 0, metadata !16, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!63 = metadata !{i32 786688, metadata !64, metadata !"f0", metadata !16, i32 45, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f0] [line 45]
!64 = metadata !{i32 786443, metadata !65, i32 44, i32 0, metadata !16, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!65 = metadata !{i32 786443, metadata !62, i32 40, i32 0, metadata !16, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!66 = metadata !{i32 786688, metadata !64, metadata !"f1", metadata !16, i32 46, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f1] [line 46]
!67 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !68, i32 419, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !78, metadata !110, i32 419} ; [ 
!68 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock", null} ; [ DW_TAG_file_type ]
!69 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{null, metadata !71, metadata !75, metadata !75, metadata !75}
!71 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !72} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!72 = metadata !{i32 786451, null, metadata !"dim3", metadata !68, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !73, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!73 = metadata !{metadata !74, metadata !76, metadata !77, metadata !78, metadata !81, metadata !99, metadata !102, metadata !107}
!74 = metadata !{i32 786445, metadata !72, metadata !"x", metadata !68, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !75} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!75 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!76 = metadata !{i32 786445, metadata !72, metadata !"y", metadata !68, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !75} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!77 = metadata !{i32 786445, metadata !72, metadata !"z", metadata !68, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !75} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!78 = metadata !{i32 786478, i32 0, metadata !72, metadata !"dim3", metadata !"dim3", metadata !"", metadata !68, i32 419, metadata !69, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !79, i32 419} ; [ DW_TAG_subpro
!79 = metadata !{metadata !80}
!80 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!81 = metadata !{i32 786478, i32 0, metadata !72, metadata !"dim3", metadata !"dim3", metadata !"", metadata !68, i32 420, metadata !82, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !79, i32 420} ; [ DW_TAG_subpro
!82 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !83, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!83 = metadata !{null, metadata !71, metadata !84}
!84 = metadata !{i32 786454, null, metadata !"uint3", metadata !68, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!85 = metadata !{i32 786451, null, metadata !"uint3", metadata !68, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !86, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!86 = metadata !{metadata !87, metadata !88, metadata !89, metadata !90, metadata !94}
!87 = metadata !{i32 786445, metadata !85, metadata !"x", metadata !68, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !75} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!88 = metadata !{i32 786445, metadata !85, metadata !"y", metadata !68, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !75} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!89 = metadata !{i32 786445, metadata !85, metadata !"z", metadata !68, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !75} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!90 = metadata !{i32 786478, i32 0, metadata !85, metadata !"uint3", metadata !"uint3", metadata !"", metadata !68, i32 188, metadata !91, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !79, i32 188} ; [ DW_TAG_subp
!91 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !92, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!92 = metadata !{null, metadata !93}
!93 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !85} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!94 = metadata !{i32 786478, i32 0, metadata !85, metadata !"uint3", metadata !"uint3", metadata !"", metadata !68, i32 188, metadata !95, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !79, i32 188} ; [ DW_TAG_subp
!95 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !96, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!96 = metadata !{null, metadata !93, metadata !97}
!97 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !98} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!98 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !85} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!99 = metadata !{i32 786478, i32 0, metadata !72, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !68, i32 421, metadata !100, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, m
!100 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !84, metadata !71}
!102 = metadata !{i32 786478, i32 0, metadata !72, metadata !"dim3", metadata !"dim3", metadata !"", metadata !68, i32 415, metadata !103, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !79, i32 415} ; [ DW_TAG_subp
!103 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !104, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!104 = metadata !{null, metadata !71, metadata !105}
!105 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !106} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!106 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !72} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!107 = metadata !{i32 786478, i32 0, metadata !72, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !68, i32 415, metadata !108, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !79, i32 415} ; [ DW_TAG_su
!108 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !109, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!109 = metadata !{null, metadata !71}
!110 = metadata !{metadata !111}
!111 = metadata !{metadata !112, metadata !114, metadata !115, metadata !116}
!112 = metadata !{i32 786689, metadata !67, metadata !"this", metadata !68, i32 16777635, metadata !113, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!113 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !72} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!114 = metadata !{i32 786689, metadata !67, metadata !"vx", metadata !68, i32 33554851, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!115 = metadata !{i32 786689, metadata !67, metadata !"vy", metadata !68, i32 50332067, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!116 = metadata !{i32 786689, metadata !67, metadata !"vz", metadata !68, i32 67109283, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!117 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !68, i32 419, metadata !69, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !78, metadata !118, i32 419} ; [
!118 = metadata !{metadata !119}
!119 = metadata !{metadata !120, metadata !121, metadata !122, metadata !123}
!120 = metadata !{i32 786689, metadata !117, metadata !"this", metadata !68, i32 16777635, metadata !113, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!121 = metadata !{i32 786689, metadata !117, metadata !"vx", metadata !68, i32 33554851, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!122 = metadata !{i32 786689, metadata !117, metadata !"vy", metadata !68, i32 50332067, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!123 = metadata !{i32 786689, metadata !117, metadata !"vz", metadata !68, i32 67109283, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!124 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!125 = metadata !{metadata !126}
!126 = metadata !{metadata !127}
!127 = metadata !{i32 786478, i32 0, metadata !128, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", metadata !128, i32 12, metadata !129, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_
!128 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!129 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !130, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!130 = metadata !{null, metadata !131}
!131 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!132 = metadata !{metadata !133}
!133 = metadata !{metadata !134}
!134 = metadata !{i32 786689, metadata !127, metadata !"z", metadata !128, i32 16777228, metadata !131, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!135 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!136 = metadata !{metadata !137}
!137 = metadata !{metadata !138}
!138 = metadata !{i32 786478, i32 0, metadata !139, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !139, i32 12, metadata !140, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !1
!139 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!140 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !141, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!141 = metadata !{metadata !142, metadata !142, metadata !143, metadata !145}
!142 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!143 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !144} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!144 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!145 = metadata !{i32 786454, null, metadata !"size_t", metadata !139, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !146} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!146 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!147 = metadata !{metadata !148}
!148 = metadata !{metadata !149, metadata !150, metadata !151, metadata !152, metadata !154}
!149 = metadata !{i32 786689, metadata !138, metadata !"destaddr", metadata !139, i32 16777228, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!150 = metadata !{i32 786689, metadata !138, metadata !"srcaddr", metadata !139, i32 33554444, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!151 = metadata !{i32 786689, metadata !138, metadata !"len", metadata !139, i32 50331660, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!152 = metadata !{i32 786688, metadata !153, metadata !"dest", metadata !139, i32 13, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!153 = metadata !{i32 786443, metadata !138, i32 12, i32 0, metadata !139, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c]
!154 = metadata !{i32 786688, metadata !153, metadata !"src", metadata !139, i32 14, metadata !155, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!155 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !156} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!156 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!157 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata 
!158 = metadata !{metadata !159}
!159 = metadata !{metadata !160}
!160 = metadata !{i32 786478, i32 0, metadata !161, metadata !"memmove", metadata !"memmove", metadata !"", metadata !161, i32 12, metadata !162, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !165, i32 12} ; [ DW_TAG
!161 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!162 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !163, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!163 = metadata !{metadata !142, metadata !142, metadata !143, metadata !164}
!164 = metadata !{i32 786454, null, metadata !"size_t", metadata !161, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !146} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!165 = metadata !{metadata !166}
!166 = metadata !{metadata !167, metadata !168, metadata !169, metadata !170, metadata !172}
!167 = metadata !{i32 786689, metadata !160, metadata !"dst", metadata !161, i32 16777228, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!168 = metadata !{i32 786689, metadata !160, metadata !"src", metadata !161, i32 33554444, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!169 = metadata !{i32 786689, metadata !160, metadata !"count", metadata !161, i32 50331660, metadata !164, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!170 = metadata !{i32 786688, metadata !171, metadata !"a", metadata !161, i32 14, metadata !21, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!171 = metadata !{i32 786443, metadata !160, i32 12, i32 0, metadata !161, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c]
!172 = metadata !{i32 786688, metadata !171, metadata !"b", metadata !161, i32 15, metadata !155, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!173 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!174 = metadata !{metadata !175}
!175 = metadata !{metadata !176}
!176 = metadata !{i32 786478, i32 0, metadata !177, metadata !"memset", metadata !"memset", metadata !"", metadata !177, i32 12, metadata !178, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !1
!177 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!178 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !179, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!179 = metadata !{metadata !142, metadata !142, metadata !19, metadata !180}
!180 = metadata !{i32 786454, null, metadata !"size_t", metadata !177, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !146} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!181 = metadata !{metadata !182}
!182 = metadata !{metadata !183, metadata !184, metadata !185, metadata !186}
!183 = metadata !{i32 786689, metadata !176, metadata !"dst", metadata !177, i32 16777228, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!184 = metadata !{i32 786689, metadata !176, metadata !"s", metadata !177, i32 33554444, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!185 = metadata !{i32 786689, metadata !176, metadata !"count", metadata !177, i32 50331660, metadata !180, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!186 = metadata !{i32 786688, metadata !187, metadata !"a", metadata !177, i32 13, metadata !188, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!187 = metadata !{i32 786443, metadata !176, i32 12, i32 0, metadata !177, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c]
!188 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !189} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!189 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !22} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!190 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tr
!191 = metadata !{metadata !192}
!192 = metadata !{metadata !193, metadata !268, metadata !274}
!193 = metadata !{i32 786436, null, metadata !"cudaError", metadata !194, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !195, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!194 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!195 = metadata !{metadata !196, metadata !197, metadata !198, metadata !199, metadata !200, metadata !201, metadata !202, metadata !203, metadata !204, metadata !205, metadata !206, metadata !207, metadata !208, metadata !209, metadata !210, metadata !2
!196 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!197 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!198 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!199 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!200 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!201 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!202 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!203 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!204 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!205 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!206 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!207 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!208 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!209 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!210 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!211 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!212 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!213 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!214 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!215 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!216 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!217 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!218 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!219 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!220 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!221 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!222 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!223 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!224 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!225 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!226 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!227 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!228 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!229 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!230 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!231 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!232 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!233 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!234 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!235 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!236 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!237 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!238 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!239 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!240 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!241 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!242 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!243 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!244 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!245 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!246 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!247 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!248 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!249 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!250 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!251 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!252 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!253 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!254 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!255 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!256 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!257 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!258 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!259 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!260 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!261 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!262 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!263 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!264 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!265 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!266 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!267 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!268 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !194, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !269, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!269 = metadata !{metadata !270, metadata !271, metadata !272, metadata !273}
!270 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!271 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!272 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!273 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!274 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !194, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !275, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!275 = metadata !{metadata !276, metadata !277, metadata !278, metadata !279, metadata !280}
!276 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!277 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!278 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!279 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!280 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!281 = metadata !{metadata !282}
!282 = metadata !{metadata !283, metadata !362, metadata !369, metadata !376, metadata !384, metadata !392, metadata !395, metadata !401, metadata !408, metadata !409, metadata !415, metadata !419, metadata !427, metadata !433, metadata !451, metadata !4
!283 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaChooseDevice", metadata !"cudaChooseDevice", metadata !"", metadata !284, i32 14, metadata !285, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, %struct.cudaDeviceProp
!284 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!285 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !286, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!286 = metadata !{metadata !287, metadata !288, metadata !289}
!287 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !284, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !193} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!288 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !19} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!289 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !290} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!290 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !291} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaDeviceProp]
!291 = metadata !{i32 786451, null, metadata !"cudaDeviceProp", metadata !194, i32 1145, i64 4800, i64 64, i32 0, i32 0, null, metadata !292, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaDeviceProp] [line 1145, size 4800, align 64, offset 0] [fr
!292 = metadata !{metadata !293, metadata !297, metadata !299, metadata !300, metadata !301, metadata !302, metadata !303, metadata !304, metadata !308, metadata !309, metadata !310, metadata !311, metadata !312, metadata !313, metadata !314, metadata !3
!293 = metadata !{i32 786445, metadata !291, metadata !"name", metadata !194, i32 1147, i64 2048, i64 8, i64 0, i32 0, metadata !294} ; [ DW_TAG_member ] [name] [line 1147, size 2048, align 8, offset 0] [from ]
!294 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !22, metadata !295, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!295 = metadata !{metadata !296}
!296 = metadata !{i32 786465, i64 0, i64 255}     ; [ DW_TAG_subrange_type ] [0, 255]
!297 = metadata !{i32 786445, metadata !291, metadata !"totalGlobalMem", metadata !194, i32 1148, i64 64, i64 64, i64 2048, i32 0, metadata !298} ; [ DW_TAG_member ] [totalGlobalMem] [line 1148, size 64, align 64, offset 2048] [from size_t]
!298 = metadata !{i32 786454, null, metadata !"size_t", metadata !194, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !146} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!299 = metadata !{i32 786445, metadata !291, metadata !"sharedMemPerBlock", metadata !194, i32 1149, i64 64, i64 64, i64 2112, i32 0, metadata !298} ; [ DW_TAG_member ] [sharedMemPerBlock] [line 1149, size 64, align 64, offset 2112] [from size_t]
!300 = metadata !{i32 786445, metadata !291, metadata !"regsPerBlock", metadata !194, i32 1150, i64 32, i64 32, i64 2176, i32 0, metadata !19} ; [ DW_TAG_member ] [regsPerBlock] [line 1150, size 32, align 32, offset 2176] [from int]
!301 = metadata !{i32 786445, metadata !291, metadata !"warpSize", metadata !194, i32 1151, i64 32, i64 32, i64 2208, i32 0, metadata !19} ; [ DW_TAG_member ] [warpSize] [line 1151, size 32, align 32, offset 2208] [from int]
!302 = metadata !{i32 786445, metadata !291, metadata !"memPitch", metadata !194, i32 1152, i64 64, i64 64, i64 2240, i32 0, metadata !298} ; [ DW_TAG_member ] [memPitch] [line 1152, size 64, align 64, offset 2240] [from size_t]
!303 = metadata !{i32 786445, metadata !291, metadata !"maxThreadsPerBlock", metadata !194, i32 1153, i64 32, i64 32, i64 2304, i32 0, metadata !19} ; [ DW_TAG_member ] [maxThreadsPerBlock] [line 1153, size 32, align 32, offset 2304] [from int]
!304 = metadata !{i32 786445, metadata !291, metadata !"maxThreadsDim", metadata !194, i32 1154, i64 96, i64 32, i64 2336, i32 0, metadata !305} ; [ DW_TAG_member ] [maxThreadsDim] [line 1154, size 96, align 32, offset 2336] [from ]
!305 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !19, metadata !306, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!306 = metadata !{metadata !307}
!307 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 2]
!308 = metadata !{i32 786445, metadata !291, metadata !"maxGridSize", metadata !194, i32 1155, i64 96, i64 32, i64 2432, i32 0, metadata !305} ; [ DW_TAG_member ] [maxGridSize] [line 1155, size 96, align 32, offset 2432] [from ]
!309 = metadata !{i32 786445, metadata !291, metadata !"clockRate", metadata !194, i32 1156, i64 32, i64 32, i64 2528, i32 0, metadata !19} ; [ DW_TAG_member ] [clockRate] [line 1156, size 32, align 32, offset 2528] [from int]
!310 = metadata !{i32 786445, metadata !291, metadata !"totalConstMem", metadata !194, i32 1157, i64 64, i64 64, i64 2560, i32 0, metadata !298} ; [ DW_TAG_member ] [totalConstMem] [line 1157, size 64, align 64, offset 2560] [from size_t]
!311 = metadata !{i32 786445, metadata !291, metadata !"major", metadata !194, i32 1158, i64 32, i64 32, i64 2624, i32 0, metadata !19} ; [ DW_TAG_member ] [major] [line 1158, size 32, align 32, offset 2624] [from int]
!312 = metadata !{i32 786445, metadata !291, metadata !"minor", metadata !194, i32 1159, i64 32, i64 32, i64 2656, i32 0, metadata !19} ; [ DW_TAG_member ] [minor] [line 1159, size 32, align 32, offset 2656] [from int]
!313 = metadata !{i32 786445, metadata !291, metadata !"textureAlignment", metadata !194, i32 1160, i64 64, i64 64, i64 2688, i32 0, metadata !298} ; [ DW_TAG_member ] [textureAlignment] [line 1160, size 64, align 64, offset 2688] [from size_t]
!314 = metadata !{i32 786445, metadata !291, metadata !"texturePitchAlignment", metadata !194, i32 1161, i64 64, i64 64, i64 2752, i32 0, metadata !298} ; [ DW_TAG_member ] [texturePitchAlignment] [line 1161, size 64, align 64, offset 2752] [from size_t]
!315 = metadata !{i32 786445, metadata !291, metadata !"deviceOverlap", metadata !194, i32 1162, i64 32, i64 32, i64 2816, i32 0, metadata !19} ; [ DW_TAG_member ] [deviceOverlap] [line 1162, size 32, align 32, offset 2816] [from int]
!316 = metadata !{i32 786445, metadata !291, metadata !"multiProcessorCount", metadata !194, i32 1163, i64 32, i64 32, i64 2848, i32 0, metadata !19} ; [ DW_TAG_member ] [multiProcessorCount] [line 1163, size 32, align 32, offset 2848] [from int]
!317 = metadata !{i32 786445, metadata !291, metadata !"kernelExecTimeoutEnabled", metadata !194, i32 1164, i64 32, i64 32, i64 2880, i32 0, metadata !19} ; [ DW_TAG_member ] [kernelExecTimeoutEnabled] [line 1164, size 32, align 32, offset 2880] [from in
!318 = metadata !{i32 786445, metadata !291, metadata !"integrated", metadata !194, i32 1165, i64 32, i64 32, i64 2912, i32 0, metadata !19} ; [ DW_TAG_member ] [integrated] [line 1165, size 32, align 32, offset 2912] [from int]
!319 = metadata !{i32 786445, metadata !291, metadata !"canMapHostMemory", metadata !194, i32 1166, i64 32, i64 32, i64 2944, i32 0, metadata !19} ; [ DW_TAG_member ] [canMapHostMemory] [line 1166, size 32, align 32, offset 2944] [from int]
!320 = metadata !{i32 786445, metadata !291, metadata !"computeMode", metadata !194, i32 1167, i64 32, i64 32, i64 2976, i32 0, metadata !19} ; [ DW_TAG_member ] [computeMode] [line 1167, size 32, align 32, offset 2976] [from int]
!321 = metadata !{i32 786445, metadata !291, metadata !"maxTexture1D", metadata !194, i32 1168, i64 32, i64 32, i64 3008, i32 0, metadata !19} ; [ DW_TAG_member ] [maxTexture1D] [line 1168, size 32, align 32, offset 3008] [from int]
!322 = metadata !{i32 786445, metadata !291, metadata !"maxTexture1DMipmap", metadata !194, i32 1169, i64 32, i64 32, i64 3040, i32 0, metadata !19} ; [ DW_TAG_member ] [maxTexture1DMipmap] [line 1169, size 32, align 32, offset 3040] [from int]
!323 = metadata !{i32 786445, metadata !291, metadata !"maxTexture1DLinear", metadata !194, i32 1170, i64 32, i64 32, i64 3072, i32 0, metadata !19} ; [ DW_TAG_member ] [maxTexture1DLinear] [line 1170, size 32, align 32, offset 3072] [from int]
!324 = metadata !{i32 786445, metadata !291, metadata !"maxTexture2D", metadata !194, i32 1171, i64 64, i64 32, i64 3104, i32 0, metadata !325} ; [ DW_TAG_member ] [maxTexture2D] [line 1171, size 64, align 32, offset 3104] [from ]
!325 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 32, i32 0, i32 0, metadata !19, metadata !326, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!326 = metadata !{metadata !327}
!327 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 1]
!328 = metadata !{i32 786445, metadata !291, metadata !"maxTexture2DMipmap", metadata !194, i32 1172, i64 64, i64 32, i64 3168, i32 0, metadata !325} ; [ DW_TAG_member ] [maxTexture2DMipmap] [line 1172, size 64, align 32, offset 3168] [from ]
!329 = metadata !{i32 786445, metadata !291, metadata !"maxTexture2DLinear", metadata !194, i32 1173, i64 96, i64 32, i64 3232, i32 0, metadata !305} ; [ DW_TAG_member ] [maxTexture2DLinear] [line 1173, size 96, align 32, offset 3232] [from ]
!330 = metadata !{i32 786445, metadata !291, metadata !"maxTexture2DGather", metadata !194, i32 1174, i64 64, i64 32, i64 3328, i32 0, metadata !325} ; [ DW_TAG_member ] [maxTexture2DGather] [line 1174, size 64, align 32, offset 3328] [from ]
!331 = metadata !{i32 786445, metadata !291, metadata !"maxTexture3D", metadata !194, i32 1175, i64 96, i64 32, i64 3392, i32 0, metadata !305} ; [ DW_TAG_member ] [maxTexture3D] [line 1175, size 96, align 32, offset 3392] [from ]
!332 = metadata !{i32 786445, metadata !291, metadata !"maxTexture3DAlt", metadata !194, i32 1176, i64 96, i64 32, i64 3488, i32 0, metadata !305} ; [ DW_TAG_member ] [maxTexture3DAlt] [line 1176, size 96, align 32, offset 3488] [from ]
!333 = metadata !{i32 786445, metadata !291, metadata !"maxTextureCubemap", metadata !194, i32 1177, i64 32, i64 32, i64 3584, i32 0, metadata !19} ; [ DW_TAG_member ] [maxTextureCubemap] [line 1177, size 32, align 32, offset 3584] [from int]
!334 = metadata !{i32 786445, metadata !291, metadata !"maxTexture1DLayered", metadata !194, i32 1178, i64 64, i64 32, i64 3616, i32 0, metadata !325} ; [ DW_TAG_member ] [maxTexture1DLayered] [line 1178, size 64, align 32, offset 3616] [from ]
!335 = metadata !{i32 786445, metadata !291, metadata !"maxTexture2DLayered", metadata !194, i32 1179, i64 96, i64 32, i64 3680, i32 0, metadata !305} ; [ DW_TAG_member ] [maxTexture2DLayered] [line 1179, size 96, align 32, offset 3680] [from ]
!336 = metadata !{i32 786445, metadata !291, metadata !"maxTextureCubemapLayered", metadata !194, i32 1180, i64 64, i64 32, i64 3776, i32 0, metadata !325} ; [ DW_TAG_member ] [maxTextureCubemapLayered] [line 1180, size 64, align 32, offset 3776] [from ]
!337 = metadata !{i32 786445, metadata !291, metadata !"maxSurface1D", metadata !194, i32 1181, i64 32, i64 32, i64 3840, i32 0, metadata !19} ; [ DW_TAG_member ] [maxSurface1D] [line 1181, size 32, align 32, offset 3840] [from int]
!338 = metadata !{i32 786445, metadata !291, metadata !"maxSurface2D", metadata !194, i32 1182, i64 64, i64 32, i64 3872, i32 0, metadata !325} ; [ DW_TAG_member ] [maxSurface2D] [line 1182, size 64, align 32, offset 3872] [from ]
!339 = metadata !{i32 786445, metadata !291, metadata !"maxSurface3D", metadata !194, i32 1183, i64 96, i64 32, i64 3936, i32 0, metadata !305} ; [ DW_TAG_member ] [maxSurface3D] [line 1183, size 96, align 32, offset 3936] [from ]
!340 = metadata !{i32 786445, metadata !291, metadata !"maxSurface1DLayered", metadata !194, i32 1184, i64 64, i64 32, i64 4032, i32 0, metadata !325} ; [ DW_TAG_member ] [maxSurface1DLayered] [line 1184, size 64, align 32, offset 4032] [from ]
!341 = metadata !{i32 786445, metadata !291, metadata !"maxSurface2DLayered", metadata !194, i32 1185, i64 96, i64 32, i64 4096, i32 0, metadata !305} ; [ DW_TAG_member ] [maxSurface2DLayered] [line 1185, size 96, align 32, offset 4096] [from ]
!342 = metadata !{i32 786445, metadata !291, metadata !"maxSurfaceCubemap", metadata !194, i32 1186, i64 32, i64 32, i64 4192, i32 0, metadata !19} ; [ DW_TAG_member ] [maxSurfaceCubemap] [line 1186, size 32, align 32, offset 4192] [from int]
!343 = metadata !{i32 786445, metadata !291, metadata !"maxSurfaceCubemapLayered", metadata !194, i32 1187, i64 64, i64 32, i64 4224, i32 0, metadata !325} ; [ DW_TAG_member ] [maxSurfaceCubemapLayered] [line 1187, size 64, align 32, offset 4224] [from ]
!344 = metadata !{i32 786445, metadata !291, metadata !"surfaceAlignment", metadata !194, i32 1188, i64 64, i64 64, i64 4288, i32 0, metadata !298} ; [ DW_TAG_member ] [surfaceAlignment] [line 1188, size 64, align 64, offset 4288] [from size_t]
!345 = metadata !{i32 786445, metadata !291, metadata !"concurrentKernels", metadata !194, i32 1189, i64 32, i64 32, i64 4352, i32 0, metadata !19} ; [ DW_TAG_member ] [concurrentKernels] [line 1189, size 32, align 32, offset 4352] [from int]
!346 = metadata !{i32 786445, metadata !291, metadata !"ECCEnabled", metadata !194, i32 1190, i64 32, i64 32, i64 4384, i32 0, metadata !19} ; [ DW_TAG_member ] [ECCEnabled] [line 1190, size 32, align 32, offset 4384] [from int]
!347 = metadata !{i32 786445, metadata !291, metadata !"pciBusID", metadata !194, i32 1191, i64 32, i64 32, i64 4416, i32 0, metadata !19} ; [ DW_TAG_member ] [pciBusID] [line 1191, size 32, align 32, offset 4416] [from int]
!348 = metadata !{i32 786445, metadata !291, metadata !"pciDeviceID", metadata !194, i32 1192, i64 32, i64 32, i64 4448, i32 0, metadata !19} ; [ DW_TAG_member ] [pciDeviceID] [line 1192, size 32, align 32, offset 4448] [from int]
!349 = metadata !{i32 786445, metadata !291, metadata !"pciDomainID", metadata !194, i32 1193, i64 32, i64 32, i64 4480, i32 0, metadata !19} ; [ DW_TAG_member ] [pciDomainID] [line 1193, size 32, align 32, offset 4480] [from int]
!350 = metadata !{i32 786445, metadata !291, metadata !"tccDriver", metadata !194, i32 1194, i64 32, i64 32, i64 4512, i32 0, metadata !19} ; [ DW_TAG_member ] [tccDriver] [line 1194, size 32, align 32, offset 4512] [from int]
!351 = metadata !{i32 786445, metadata !291, metadata !"asyncEngineCount", metadata !194, i32 1195, i64 32, i64 32, i64 4544, i32 0, metadata !19} ; [ DW_TAG_member ] [asyncEngineCount] [line 1195, size 32, align 32, offset 4544] [from int]
!352 = metadata !{i32 786445, metadata !291, metadata !"unifiedAddressing", metadata !194, i32 1196, i64 32, i64 32, i64 4576, i32 0, metadata !19} ; [ DW_TAG_member ] [unifiedAddressing] [line 1196, size 32, align 32, offset 4576] [from int]
!353 = metadata !{i32 786445, metadata !291, metadata !"memoryClockRate", metadata !194, i32 1197, i64 32, i64 32, i64 4608, i32 0, metadata !19} ; [ DW_TAG_member ] [memoryClockRate] [line 1197, size 32, align 32, offset 4608] [from int]
!354 = metadata !{i32 786445, metadata !291, metadata !"memoryBusWidth", metadata !194, i32 1198, i64 32, i64 32, i64 4640, i32 0, metadata !19} ; [ DW_TAG_member ] [memoryBusWidth] [line 1198, size 32, align 32, offset 4640] [from int]
!355 = metadata !{i32 786445, metadata !291, metadata !"l2CacheSize", metadata !194, i32 1199, i64 32, i64 32, i64 4672, i32 0, metadata !19} ; [ DW_TAG_member ] [l2CacheSize] [line 1199, size 32, align 32, offset 4672] [from int]
!356 = metadata !{i32 786445, metadata !291, metadata !"maxThreadsPerMultiProcessor", metadata !194, i32 1200, i64 32, i64 32, i64 4704, i32 0, metadata !19} ; [ DW_TAG_member ] [maxThreadsPerMultiProcessor] [line 1200, size 32, align 32, offset 4704] [f
!357 = metadata !{i32 786445, metadata !291, metadata !"streamPrioritiesSupported", metadata !194, i32 1201, i64 32, i64 32, i64 4736, i32 0, metadata !19} ; [ DW_TAG_member ] [streamPrioritiesSupported] [line 1201, size 32, align 32, offset 4736] [from 
!358 = metadata !{metadata !359}
!359 = metadata !{metadata !360, metadata !361}
!360 = metadata !{i32 786689, metadata !283, metadata !"device", metadata !284, i32 16777230, metadata !288, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 14]
!361 = metadata !{i32 786689, metadata !283, metadata !"prop", metadata !284, i32 33554446, metadata !289, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 14]
!362 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaDeviceGetByPCIBusId", metadata !"cudaDeviceGetByPCIBusId", metadata !"", metadata !284, i32 19, metadata !363, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @c
!363 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !364, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!364 = metadata !{metadata !287, metadata !288, metadata !21}
!365 = metadata !{metadata !366}
!366 = metadata !{metadata !367, metadata !368}
!367 = metadata !{i32 786689, metadata !362, metadata !"device", metadata !284, i32 16777235, metadata !288, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 19]
!368 = metadata !{i32 786689, metadata !362, metadata !"pciBusId", metadata !284, i32 33554451, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 19]
!369 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaDeviceGetCacheConfig", metadata !"cudaDeviceGetCacheConfig", metadata !"", metadata !284, i32 24, metadata !370, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cuda
!370 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !371, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!371 = metadata !{metadata !287, metadata !372}
!372 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !268} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!373 = metadata !{metadata !374}
!374 = metadata !{metadata !375}
!375 = metadata !{i32 786689, metadata !369, metadata !"pCacheConfig", metadata !284, i32 16777240, metadata !372, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 24]
!376 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaDeviceGetLimit", metadata !"cudaDeviceGetLimit", metadata !"", metadata !284, i32 28, metadata !377, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaDeviceG
!377 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !378, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!378 = metadata !{metadata !287, metadata !379, metadata !274}
!379 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !298} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!380 = metadata !{metadata !381}
!381 = metadata !{metadata !382, metadata !383}
!382 = metadata !{i32 786689, metadata !376, metadata !"pValue", metadata !284, i32 16777244, metadata !379, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 28]
!383 = metadata !{i32 786689, metadata !376, metadata !"limit", metadata !284, i32 33554460, metadata !274, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 28]
!384 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaDeviceGetPCIBusId", metadata !"cudaDeviceGetPCIBusId", metadata !"", metadata !284, i32 32, metadata !385, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @c
!385 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !386, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!386 = metadata !{metadata !287, metadata !21, metadata !19, metadata !19}
!387 = metadata !{metadata !388}
!388 = metadata !{metadata !389, metadata !390, metadata !391}
!389 = metadata !{i32 786689, metadata !384, metadata !"pciBusId", metadata !284, i32 16777248, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 32]
!390 = metadata !{i32 786689, metadata !384, metadata !"len", metadata !284, i32 33554464, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 32]
!391 = metadata !{i32 786689, metadata !384, metadata !"device", metadata !284, i32 50331680, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 32]
!392 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaDeviceReset", metadata !"cudaDeviceReset", metadata !"", metadata !284, i32 37, metadata !393, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceReset, null, nul
!393 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !394, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!394 = metadata !{metadata !287}
!395 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaDeviceSetCacheConfig", metadata !"cudaDeviceSetCacheConfig", metadata !"", metadata !284, i32 41, metadata !396, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaD
!396 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !397, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!397 = metadata !{metadata !287, metadata !268}
!398 = metadata !{metadata !399}
!399 = metadata !{metadata !400}
!400 = metadata !{i32 786689, metadata !395, metadata !"cacheConfig", metadata !284, i32 16777257, metadata !268, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 41]
!401 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaDeviceSetLimit", metadata !"cudaDeviceSetLimit", metadata !"", metadata !284, i32 45, metadata !402, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaDeviceSe
!402 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !403, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!403 = metadata !{metadata !287, metadata !274, metadata !298}
!404 = metadata !{metadata !405}
!405 = metadata !{metadata !406, metadata !407}
!406 = metadata !{i32 786689, metadata !401, metadata !"limit", metadata !284, i32 16777261, metadata !274, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 45]
!407 = metadata !{i32 786689, metadata !401, metadata !"value", metadata !284, i32 33554477, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 45]
!408 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaDeviceSynchronize", metadata !"cudaDeviceSynchronize", metadata !"", metadata !284, i32 49, metadata !393, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceSync
!409 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaGetDevice", metadata !"cudaGetDevice", metadata !"", metadata !284, i32 53, metadata !410, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDevice, null, null,
!410 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !411, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!411 = metadata !{metadata !287, metadata !288}
!412 = metadata !{metadata !413}
!413 = metadata !{metadata !414}
!414 = metadata !{i32 786689, metadata !409, metadata !"device", metadata !284, i32 16777269, metadata !288, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 53]
!415 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaGetDeviceCount", metadata !"cudaGetDeviceCount", metadata !"", metadata !284, i32 58, metadata !410, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDeviceCou
!416 = metadata !{metadata !417}
!417 = metadata !{metadata !418}
!418 = metadata !{i32 786689, metadata !415, metadata !"count", metadata !284, i32 16777274, metadata !288, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 58]
!419 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaGetDeviceProperties", metadata !"cudaGetDeviceProperties", metadata !"", metadata !284, i32 63, metadata !420, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaDe
!420 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !421, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!421 = metadata !{metadata !287, metadata !422, metadata !19}
!422 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !291} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaDeviceProp]
!423 = metadata !{metadata !424}
!424 = metadata !{metadata !425, metadata !426}
!425 = metadata !{i32 786689, metadata !419, metadata !"prop", metadata !284, i32 16777279, metadata !422, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 63]
!426 = metadata !{i32 786689, metadata !419, metadata !"device", metadata !284, i32 33554495, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 63]
!427 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaIpcCloseMemHandle", metadata !"cudaIpcCloseMemHandle", metadata !"", metadata !284, i32 68, metadata !428, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaIpcClos
!428 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !429, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!429 = metadata !{metadata !287, metadata !142}
!430 = metadata !{metadata !431}
!431 = metadata !{metadata !432}
!432 = metadata !{i32 786689, metadata !427, metadata !"devPtr", metadata !284, i32 16777284, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 68]
!433 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaIpcGetEventHandle", metadata !"cudaIpcGetEventHandle", metadata !"", metadata !284, i32 72, metadata !434, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcEve
!434 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !435, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!435 = metadata !{metadata !287, metadata !436, metadata !444}
!436 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !437} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcEventHandle_t]
!437 = metadata !{i32 786454, null, metadata !"cudaIpcEventHandle_t", metadata !284, i32 1274, i64 0, i64 0, i64 0, i32 0, metadata !438} ; [ DW_TAG_typedef ] [cudaIpcEventHandle_t] [line 1274, size 0, align 0, offset 0] [from cudaIpcEventHandle_st]
!438 = metadata !{i32 786451, null, metadata !"cudaIpcEventHandle_st", metadata !194, i32 1271, i64 512, i64 8, i32 0, i32 0, null, metadata !439, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcEventHandle_st] [line 1271, size 512, align 8, off
!439 = metadata !{metadata !440}
!440 = metadata !{i32 786445, metadata !438, metadata !"reserved", metadata !194, i32 1273, i64 512, i64 8, i64 0, i32 0, metadata !441} ; [ DW_TAG_member ] [reserved] [line 1273, size 512, align 8, offset 0] [from ]
!441 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 8, i32 0, i32 0, metadata !22, metadata !442, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!442 = metadata !{metadata !443}
!443 = metadata !{i32 786465, i64 0, i64 63}      ; [ DW_TAG_subrange_type ] [0, 63]
!444 = metadata !{i32 786454, null, metadata !"cudaEvent_t", metadata !284, i32 1303, i64 0, i64 0, i64 0, i32 0, metadata !445} ; [ DW_TAG_typedef ] [cudaEvent_t] [line 1303, size 0, align 0, offset 0] [from ]
!445 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !446} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUevent_st]
!446 = metadata !{i32 786451, null, metadata !"CUevent_st", metadata !194, i32 1303, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUevent_st] [line 1303, size 0, align 0, offset 0] [fwd] [from ]
!447 = metadata !{metadata !448}
!448 = metadata !{metadata !449, metadata !450}
!449 = metadata !{i32 786689, metadata !433, metadata !"handle", metadata !284, i32 16777288, metadata !436, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 72]
!450 = metadata !{i32 786689, metadata !433, metadata !"event", metadata !284, i32 33554504, metadata !444, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 72]
!451 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaIpcGetMemHandle", metadata !"cudaIpcGetMemHandle", metadata !"", metadata !284, i32 76, metadata !452, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcMemHand
!452 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !453, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!453 = metadata !{metadata !287, metadata !454, metadata !142}
!454 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !455} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcMemHandle_t]
!455 = metadata !{i32 786454, null, metadata !"cudaIpcMemHandle_t", metadata !284, i32 1282, i64 0, i64 0, i64 0, i32 0, metadata !456} ; [ DW_TAG_typedef ] [cudaIpcMemHandle_t] [line 1282, size 0, align 0, offset 0] [from cudaIpcMemHandle_st]
!456 = metadata !{i32 786451, null, metadata !"cudaIpcMemHandle_st", metadata !194, i32 1279, i64 512, i64 8, i32 0, i32 0, null, metadata !457, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcMemHandle_st] [line 1279, size 512, align 8, offset 
!457 = metadata !{metadata !458}
!458 = metadata !{i32 786445, metadata !456, metadata !"reserved", metadata !194, i32 1281, i64 512, i64 8, i64 0, i32 0, metadata !441} ; [ DW_TAG_member ] [reserved] [line 1281, size 512, align 8, offset 0] [from ]
!459 = metadata !{metadata !460}
!460 = metadata !{metadata !461, metadata !462}
!461 = metadata !{i32 786689, metadata !451, metadata !"handle", metadata !284, i32 16777292, metadata !454, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 76]
!462 = metadata !{i32 786689, metadata !451, metadata !"devPtr", metadata !284, i32 33554508, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 76]
!463 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaIpcOpenEventHandle", metadata !"cudaIpcOpenEventHandle", metadata !"", metadata !284, i32 80, metadata !464, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.CUevent_
!464 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !465, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!465 = metadata !{metadata !287, metadata !466, metadata !437}
!466 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !444} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaEvent_t]
!467 = metadata !{metadata !468}
!468 = metadata !{metadata !469, metadata !470}
!469 = metadata !{i32 786689, metadata !463, metadata !"event", metadata !284, i32 16777296, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 80]
!470 = metadata !{i32 786689, metadata !463, metadata !"handle", metadata !284, i32 33554512, metadata !437, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 80]
!471 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaIpcOpenMemHandle", metadata !"cudaIpcOpenMemHandle", metadata !"", metadata !284, i32 84, metadata !472, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, %struct.cudaIp
!472 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !473, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!473 = metadata !{metadata !287, metadata !474, metadata !455, metadata !75}
!474 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !142} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!475 = metadata !{metadata !476}
!476 = metadata !{metadata !477, metadata !478, metadata !479}
!477 = metadata !{i32 786689, metadata !471, metadata !"devPtr", metadata !284, i32 16777300, metadata !474, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 84]
!478 = metadata !{i32 786689, metadata !471, metadata !"handle", metadata !284, i32 33554516, metadata !455, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 84]
!479 = metadata !{i32 786689, metadata !471, metadata !"flags", metadata !284, i32 50331732, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 84]
!480 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaSetDevice", metadata !"cudaSetDevice", metadata !"", metadata !284, i32 88, metadata !481, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDevice, null, null, 
!481 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !482, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!482 = metadata !{metadata !287, metadata !19}
!483 = metadata !{metadata !484}
!484 = metadata !{metadata !485}
!485 = metadata !{i32 786689, metadata !480, metadata !"device", metadata !284, i32 16777304, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 88]
!486 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaSetDeviceFlags", metadata !"cudaSetDeviceFlags", metadata !"", metadata !284, i32 92, metadata !487, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDeviceFlag
!487 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !488, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!488 = metadata !{metadata !287, metadata !75}
!489 = metadata !{metadata !490}
!490 = metadata !{metadata !491}
!491 = metadata !{i32 786689, metadata !486, metadata !"flags", metadata !284, i32 16777308, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 92]
!492 = metadata !{i32 786478, i32 0, metadata !284, metadata !"cudaSetValidDevices", metadata !"cudaSetValidDevices", metadata !"", metadata !284, i32 96, metadata !493, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32)* @cudaSetVa
!493 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !494, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!494 = metadata !{metadata !287, metadata !288, metadata !19}
!495 = metadata !{metadata !496}
!496 = metadata !{metadata !497, metadata !498}
!497 = metadata !{i32 786689, metadata !492, metadata !"device_arr", metadata !284, i32 16777312, metadata !288, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device_arr] [line 96]
!498 = metadata !{i32 786689, metadata !492, metadata !"len", metadata !284, i32 33554528, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 96]
!499 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!500 = metadata !{metadata !501}
!501 = metadata !{metadata !193, metadata !502, metadata !508}
!502 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !194, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !503, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!503 = metadata !{metadata !504, metadata !505, metadata !506, metadata !507}
!504 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!505 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!506 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!507 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!508 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !194, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!509 = metadata !{metadata !510}
!510 = metadata !{metadata !511, metadata !539, metadata !545, metadata !551, metadata !555, metadata !562, metadata !569, metadata !577, metadata !585, metadata !592, metadata !600, metadata !604, metadata !611, metadata !625, metadata !635, metadata !6
!511 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !512, i32 24, metadata !513, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!512 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!513 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !514, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!514 = metadata !{metadata !515, metadata !516, metadata !524, metadata !530, metadata !531}
!515 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !512, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !193} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!516 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !517} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!517 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !194, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !518, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!518 = metadata !{metadata !519, metadata !520, metadata !521, metadata !522, metadata !523}
!519 = metadata !{i32 786445, metadata !517, metadata !"x", metadata !194, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !19} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!520 = metadata !{i32 786445, metadata !517, metadata !"y", metadata !194, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !19} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!521 = metadata !{i32 786445, metadata !517, metadata !"z", metadata !194, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !19} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!522 = metadata !{i32 786445, metadata !517, metadata !"w", metadata !194, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !19} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!523 = metadata !{i32 786445, metadata !517, metadata !"f", metadata !194, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !502} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!524 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !525} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!525 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !194, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !526, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!526 = metadata !{metadata !527, metadata !528, metadata !529}
!527 = metadata !{i32 786445, metadata !525, metadata !"width", metadata !194, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !298} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!528 = metadata !{i32 786445, metadata !525, metadata !"height", metadata !194, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !298} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!529 = metadata !{i32 786445, metadata !525, metadata !"depth", metadata !194, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !298} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!530 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !75} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!531 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !532} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!532 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !194, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!533 = metadata !{metadata !534}
!534 = metadata !{metadata !535, metadata !536, metadata !537, metadata !538}
!535 = metadata !{i32 786689, metadata !511, metadata !"desc", metadata !512, i32 16777240, metadata !516, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!536 = metadata !{i32 786689, metadata !511, metadata !"extent", metadata !512, i32 33554456, metadata !524, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!537 = metadata !{i32 786689, metadata !511, metadata !"flags", metadata !512, i32 50331673, metadata !530, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!538 = metadata !{i32 786689, metadata !511, metadata !"array", metadata !512, i32 67108889, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!539 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !512, i32 29, metadata !540, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !542, 
!540 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !541, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!541 = metadata !{metadata !515, metadata !142}
!542 = metadata !{metadata !543}
!543 = metadata !{metadata !544}
!544 = metadata !{i32 786689, metadata !539, metadata !"devPtr", metadata !512, i32 16777245, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!545 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !512, i32 34, metadata !546, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!546 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !547, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!547 = metadata !{metadata !515, metadata !531}
!548 = metadata !{metadata !549}
!549 = metadata !{metadata !550}
!550 = metadata !{i32 786689, metadata !545, metadata !"array", metadata !512, i32 16777250, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!551 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !512, i32 39, metadata !540, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!552 = metadata !{metadata !553}
!553 = metadata !{metadata !554}
!554 = metadata !{i32 786689, metadata !551, metadata !"ptr", metadata !512, i32 16777255, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!555 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !512, i32 44, metadata !556, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!556 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !557, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!557 = metadata !{metadata !515, metadata !474, metadata !155}
!558 = metadata !{metadata !559}
!559 = metadata !{metadata !560, metadata !561}
!560 = metadata !{i32 786689, metadata !555, metadata !"devPtr", metadata !512, i32 16777260, metadata !474, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!561 = metadata !{i32 786689, metadata !555, metadata !"symbol", metadata !512, i32 33554476, metadata !155, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!562 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !512, i32 48, metadata !563, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!563 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !564, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!564 = metadata !{metadata !515, metadata !379, metadata !155}
!565 = metadata !{metadata !566}
!566 = metadata !{metadata !567, metadata !568}
!567 = metadata !{i32 786689, metadata !562, metadata !"size", metadata !512, i32 16777264, metadata !379, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!568 = metadata !{i32 786689, metadata !562, metadata !"symbol", metadata !512, i32 33554480, metadata !155, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!569 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !512, i32 52, metadata !570, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!570 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !571, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!571 = metadata !{metadata !515, metadata !474, metadata !298, metadata !75}
!572 = metadata !{metadata !573}
!573 = metadata !{metadata !574, metadata !575, metadata !576}
!574 = metadata !{i32 786689, metadata !569, metadata !"pHost", metadata !512, i32 16777268, metadata !474, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!575 = metadata !{i32 786689, metadata !569, metadata !"size", metadata !512, i32 33554484, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!576 = metadata !{i32 786689, metadata !569, metadata !"flags", metadata !512, i32 50331700, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!577 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !512, i32 56, metadata !578, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!578 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !579, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!579 = metadata !{metadata !515, metadata !474, metadata !142, metadata !75}
!580 = metadata !{metadata !581}
!581 = metadata !{metadata !582, metadata !583, metadata !584}
!582 = metadata !{i32 786689, metadata !577, metadata !"pDevice", metadata !512, i32 16777272, metadata !474, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!583 = metadata !{i32 786689, metadata !577, metadata !"pHost", metadata !512, i32 33554488, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!584 = metadata !{i32 786689, metadata !577, metadata !"flags", metadata !512, i32 50331704, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!585 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !512, i32 60, metadata !586, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!586 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !587, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!587 = metadata !{metadata !515, metadata !530, metadata !142}
!588 = metadata !{metadata !589}
!589 = metadata !{metadata !590, metadata !591}
!590 = metadata !{i32 786689, metadata !585, metadata !"pFlags", metadata !512, i32 16777276, metadata !530, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!591 = metadata !{i32 786689, metadata !585, metadata !"pHost", metadata !512, i32 33554492, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!592 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !512, i32 64, metadata !593, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!593 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !594, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!594 = metadata !{metadata !515, metadata !142, metadata !298, metadata !75}
!595 = metadata !{metadata !596}
!596 = metadata !{metadata !597, metadata !598, metadata !599}
!597 = metadata !{i32 786689, metadata !592, metadata !"ptr", metadata !512, i32 16777280, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!598 = metadata !{i32 786689, metadata !592, metadata !"size", metadata !512, i32 33554496, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!599 = metadata !{i32 786689, metadata !592, metadata !"flags", metadata !512, i32 50331712, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!600 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !512, i32 68, metadata !540, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!601 = metadata !{metadata !602}
!602 = metadata !{metadata !603}
!603 = metadata !{i32 786689, metadata !600, metadata !"ptr", metadata !512, i32 16777284, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!604 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !512, i32 72, metadata !605, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!605 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !606, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!606 = metadata !{metadata !515, metadata !474, metadata !298}
!607 = metadata !{metadata !608}
!608 = metadata !{metadata !609, metadata !610}
!609 = metadata !{i32 786689, metadata !604, metadata !"devPtr", metadata !512, i32 16777288, metadata !474, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!610 = metadata !{i32 786689, metadata !604, metadata !"size", metadata !512, i32 33554504, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!611 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !512, i32 80, metadata !612, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!612 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !613, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!613 = metadata !{metadata !515, metadata !614, metadata !525}
!614 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !615} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!615 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !194, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !616, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!616 = metadata !{metadata !617, metadata !618, metadata !619, metadata !620}
!617 = metadata !{i32 786445, metadata !615, metadata !"ptr", metadata !194, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !142} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!618 = metadata !{i32 786445, metadata !615, metadata !"pitch", metadata !194, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !298} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!619 = metadata !{i32 786445, metadata !615, metadata !"xsize", metadata !194, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !298} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!620 = metadata !{i32 786445, metadata !615, metadata !"ysize", metadata !194, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !298} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!621 = metadata !{metadata !622}
!622 = metadata !{metadata !623, metadata !624}
!623 = metadata !{i32 786689, metadata !611, metadata !"pitchedDevPtr", metadata !512, i32 16777296, metadata !614, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!624 = metadata !{i32 786689, metadata !611, metadata !"extent", metadata !512, i32 33554512, metadata !525, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!625 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !512, i32 84, metadata !626, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!626 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !627, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!627 = metadata !{metadata !515, metadata !628, metadata !516, metadata !525, metadata !75}
!628 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !531} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!629 = metadata !{metadata !630}
!630 = metadata !{metadata !631, metadata !632, metadata !633, metadata !634}
!631 = metadata !{i32 786689, metadata !625, metadata !"array", metadata !512, i32 16777300, metadata !628, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!632 = metadata !{i32 786689, metadata !625, metadata !"desc", metadata !512, i32 33554516, metadata !516, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!633 = metadata !{i32 786689, metadata !625, metadata !"extent", metadata !512, i32 50331733, metadata !525, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!634 = metadata !{i32 786689, metadata !625, metadata !"flags", metadata !512, i32 67108949, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!635 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !512, i32 89, metadata !636, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!636 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !637, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!637 = metadata !{metadata !515, metadata !628, metadata !516, metadata !298, metadata !298, metadata !75}
!638 = metadata !{metadata !639}
!639 = metadata !{metadata !640, metadata !641, metadata !642, metadata !643, metadata !644}
!640 = metadata !{i32 786689, metadata !635, metadata !"array", metadata !512, i32 16777305, metadata !628, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!641 = metadata !{i32 786689, metadata !635, metadata !"desc", metadata !512, i32 33554521, metadata !516, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!642 = metadata !{i32 786689, metadata !635, metadata !"width", metadata !512, i32 50331738, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!643 = metadata !{i32 786689, metadata !635, metadata !"height", metadata !512, i32 67108954, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!644 = metadata !{i32 786689, metadata !635, metadata !"flags", metadata !512, i32 83886170, metadata !75, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!645 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !512, i32 94, metadata !605, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!646 = metadata !{metadata !647}
!647 = metadata !{metadata !648, metadata !649}
!648 = metadata !{i32 786689, metadata !645, metadata !"ptr", metadata !512, i32 16777310, metadata !474, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!649 = metadata !{i32 786689, metadata !645, metadata !"size", metadata !512, i32 33554526, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!650 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !512, i32 102, metadata !651, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!651 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !652, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!652 = metadata !{metadata !515, metadata !474, metadata !379, metadata !298, metadata !298}
!653 = metadata !{metadata !654}
!654 = metadata !{metadata !655, metadata !656, metadata !657, metadata !658}
!655 = metadata !{i32 786689, metadata !650, metadata !"devPtr", metadata !512, i32 16777318, metadata !474, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!656 = metadata !{i32 786689, metadata !650, metadata !"pitch", metadata !512, i32 33554534, metadata !379, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!657 = metadata !{i32 786689, metadata !650, metadata !"width", metadata !512, i32 50331750, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!658 = metadata !{i32 786689, metadata !650, metadata !"height", metadata !512, i32 67108966, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!659 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !512, i32 106, metadata !660, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!660 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !661, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!661 = metadata !{metadata !515, metadata !142, metadata !143, metadata !298, metadata !508}
!662 = metadata !{metadata !663}
!663 = metadata !{metadata !664, metadata !665, metadata !666, metadata !667}
!664 = metadata !{i32 786689, metadata !659, metadata !"dst", metadata !512, i32 16777322, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!665 = metadata !{i32 786689, metadata !659, metadata !"src", metadata !512, i32 33554538, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!666 = metadata !{i32 786689, metadata !659, metadata !"count", metadata !512, i32 50331754, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!667 = metadata !{i32 786689, metadata !659, metadata !"kind", metadata !512, i32 67108970, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!668 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !512, i32 111, metadata !669, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!669 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !670, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!670 = metadata !{metadata !515, metadata !142, metadata !298, metadata !143, metadata !298, metadata !298, metadata !298, metadata !508}
!671 = metadata !{metadata !672}
!672 = metadata !{metadata !673, metadata !674, metadata !675, metadata !676, metadata !677, metadata !678, metadata !679}
!673 = metadata !{i32 786689, metadata !668, metadata !"dst", metadata !512, i32 16777327, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!674 = metadata !{i32 786689, metadata !668, metadata !"dpitch", metadata !512, i32 33554543, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!675 = metadata !{i32 786689, metadata !668, metadata !"src", metadata !512, i32 50331759, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!676 = metadata !{i32 786689, metadata !668, metadata !"spitch", metadata !512, i32 67108975, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!677 = metadata !{i32 786689, metadata !668, metadata !"width", metadata !512, i32 83886192, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!678 = metadata !{i32 786689, metadata !668, metadata !"height", metadata !512, i32 100663408, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!679 = metadata !{i32 786689, metadata !668, metadata !"kind", metadata !512, i32 117440624, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!680 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !512, i32 116, metadata !681, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!681 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !682, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!682 = metadata !{metadata !515, metadata !531, metadata !298, metadata !298, metadata !531, metadata !298, metadata !298, metadata !298, metadata !298, metadata !508}
!683 = metadata !{metadata !684}
!684 = metadata !{metadata !685, metadata !686, metadata !687, metadata !688, metadata !689, metadata !690, metadata !691, metadata !692, metadata !693}
!685 = metadata !{i32 786689, metadata !680, metadata !"dst", metadata !512, i32 16777332, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!686 = metadata !{i32 786689, metadata !680, metadata !"wOffsetDst", metadata !512, i32 33554548, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!687 = metadata !{i32 786689, metadata !680, metadata !"hOffsetDst", metadata !512, i32 50331764, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!688 = metadata !{i32 786689, metadata !680, metadata !"src", metadata !512, i32 67108981, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!689 = metadata !{i32 786689, metadata !680, metadata !"wOffsetSrc", metadata !512, i32 83886197, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!690 = metadata !{i32 786689, metadata !680, metadata !"hOffsetSrc", metadata !512, i32 100663413, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!691 = metadata !{i32 786689, metadata !680, metadata !"width", metadata !512, i32 117440630, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!692 = metadata !{i32 786689, metadata !680, metadata !"height", metadata !512, i32 134217846, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!693 = metadata !{i32 786689, metadata !680, metadata !"kind", metadata !512, i32 150995062, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!694 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !512, i32 122, metadata !695, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!695 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !696, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!696 = metadata !{metadata !515, metadata !142, metadata !298, metadata !143, metadata !298, metadata !298, metadata !298, metadata !508, metadata !697}
!697 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !512, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !698} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!698 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !699} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!699 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !194, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!700 = metadata !{metadata !701}
!701 = metadata !{metadata !702, metadata !703, metadata !704, metadata !705, metadata !706, metadata !707, metadata !708, metadata !709}
!702 = metadata !{i32 786689, metadata !694, metadata !"dst", metadata !512, i32 16777338, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!703 = metadata !{i32 786689, metadata !694, metadata !"dpitch", metadata !512, i32 33554554, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!704 = metadata !{i32 786689, metadata !694, metadata !"src", metadata !512, i32 50331770, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!705 = metadata !{i32 786689, metadata !694, metadata !"spitch", metadata !512, i32 67108986, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!706 = metadata !{i32 786689, metadata !694, metadata !"width", metadata !512, i32 83886203, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!707 = metadata !{i32 786689, metadata !694, metadata !"height", metadata !512, i32 100663419, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!708 = metadata !{i32 786689, metadata !694, metadata !"kind", metadata !512, i32 117440635, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!709 = metadata !{i32 786689, metadata !694, metadata !"stream", metadata !512, i32 134217852, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!710 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !512, i32 128, metadata !711, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!711 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !712, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!712 = metadata !{metadata !515, metadata !142, metadata !298, metadata !531, metadata !298, metadata !298, metadata !298, metadata !298, metadata !508}
!713 = metadata !{metadata !714}
!714 = metadata !{metadata !715, metadata !716, metadata !717, metadata !718, metadata !719, metadata !720, metadata !721, metadata !722}
!715 = metadata !{i32 786689, metadata !710, metadata !"dst", metadata !512, i32 16777344, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!716 = metadata !{i32 786689, metadata !710, metadata !"dpitch", metadata !512, i32 33554560, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!717 = metadata !{i32 786689, metadata !710, metadata !"src", metadata !512, i32 50331776, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!718 = metadata !{i32 786689, metadata !710, metadata !"wOffset", metadata !512, i32 67108993, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!719 = metadata !{i32 786689, metadata !710, metadata !"hOffset", metadata !512, i32 83886209, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!720 = metadata !{i32 786689, metadata !710, metadata !"width", metadata !512, i32 100663425, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!721 = metadata !{i32 786689, metadata !710, metadata !"height", metadata !512, i32 117440641, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!722 = metadata !{i32 786689, metadata !710, metadata !"kind", metadata !512, i32 134217858, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!723 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !512, i32 134, metadata !724, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!724 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !725, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!725 = metadata !{metadata !515, metadata !142, metadata !298, metadata !531, metadata !298, metadata !298, metadata !298, metadata !298, metadata !508, metadata !697}
!726 = metadata !{metadata !727}
!727 = metadata !{metadata !728, metadata !729, metadata !730, metadata !731, metadata !732, metadata !733, metadata !734, metadata !735, metadata !736}
!728 = metadata !{i32 786689, metadata !723, metadata !"dst", metadata !512, i32 16777350, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!729 = metadata !{i32 786689, metadata !723, metadata !"dpitch", metadata !512, i32 33554566, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!730 = metadata !{i32 786689, metadata !723, metadata !"src", metadata !512, i32 50331782, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!731 = metadata !{i32 786689, metadata !723, metadata !"wOffset", metadata !512, i32 67108999, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!732 = metadata !{i32 786689, metadata !723, metadata !"hOffset", metadata !512, i32 83886215, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!733 = metadata !{i32 786689, metadata !723, metadata !"width", metadata !512, i32 100663431, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!734 = metadata !{i32 786689, metadata !723, metadata !"height", metadata !512, i32 117440647, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!735 = metadata !{i32 786689, metadata !723, metadata !"kind", metadata !512, i32 134217864, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!736 = metadata !{i32 786689, metadata !723, metadata !"stream", metadata !512, i32 150995080, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!737 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !512, i32 140, metadata !738, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!738 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !739, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!739 = metadata !{metadata !515, metadata !531, metadata !298, metadata !298, metadata !143, metadata !298, metadata !298, metadata !298, metadata !508}
!740 = metadata !{metadata !741}
!741 = metadata !{metadata !742, metadata !743, metadata !744, metadata !745, metadata !746, metadata !747, metadata !748, metadata !749}
!742 = metadata !{i32 786689, metadata !737, metadata !"dst", metadata !512, i32 16777356, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!743 = metadata !{i32 786689, metadata !737, metadata !"wOffset", metadata !512, i32 33554572, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!744 = metadata !{i32 786689, metadata !737, metadata !"hOffset", metadata !512, i32 50331788, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!745 = metadata !{i32 786689, metadata !737, metadata !"src", metadata !512, i32 67109005, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!746 = metadata !{i32 786689, metadata !737, metadata !"spitch", metadata !512, i32 83886221, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!747 = metadata !{i32 786689, metadata !737, metadata !"width", metadata !512, i32 100663437, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!748 = metadata !{i32 786689, metadata !737, metadata !"height", metadata !512, i32 117440653, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!749 = metadata !{i32 786689, metadata !737, metadata !"kind", metadata !512, i32 134217870, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!750 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !512, i32 146, metadata !751, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!751 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !752, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!752 = metadata !{metadata !515, metadata !531, metadata !298, metadata !298, metadata !143, metadata !298, metadata !298, metadata !298, metadata !508, metadata !697}
!753 = metadata !{metadata !754}
!754 = metadata !{metadata !755, metadata !756, metadata !757, metadata !758, metadata !759, metadata !760, metadata !761, metadata !762, metadata !763}
!755 = metadata !{i32 786689, metadata !750, metadata !"dst", metadata !512, i32 16777362, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!756 = metadata !{i32 786689, metadata !750, metadata !"wOffset", metadata !512, i32 33554578, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!757 = metadata !{i32 786689, metadata !750, metadata !"hOffset", metadata !512, i32 50331794, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!758 = metadata !{i32 786689, metadata !750, metadata !"src", metadata !512, i32 67109011, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!759 = metadata !{i32 786689, metadata !750, metadata !"spitch", metadata !512, i32 83886227, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!760 = metadata !{i32 786689, metadata !750, metadata !"width", metadata !512, i32 100663443, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!761 = metadata !{i32 786689, metadata !750, metadata !"height", metadata !512, i32 117440659, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!762 = metadata !{i32 786689, metadata !750, metadata !"kind", metadata !512, i32 134217876, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!763 = metadata !{i32 786689, metadata !750, metadata !"stream", metadata !512, i32 150995092, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!764 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !512, i32 152, metadata !765, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!765 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !766, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!766 = metadata !{metadata !515, metadata !767}
!767 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !768} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!768 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !769} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!769 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !194, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !770, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!770 = metadata !{metadata !771, metadata !773, metadata !779, metadata !780, metadata !781, metadata !782, metadata !783, metadata !784}
!771 = metadata !{i32 786445, metadata !769, metadata !"srcArray", metadata !194, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !772} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!772 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !194, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !531} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!773 = metadata !{i32 786445, metadata !769, metadata !"srcPos", metadata !194, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !774} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!774 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !194, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !775, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!775 = metadata !{metadata !776, metadata !777, metadata !778}
!776 = metadata !{i32 786445, metadata !774, metadata !"x", metadata !194, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !298} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!777 = metadata !{i32 786445, metadata !774, metadata !"y", metadata !194, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !298} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!778 = metadata !{i32 786445, metadata !774, metadata !"z", metadata !194, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !298} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!779 = metadata !{i32 786445, metadata !769, metadata !"srcPtr", metadata !194, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !615} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!780 = metadata !{i32 786445, metadata !769, metadata !"dstArray", metadata !194, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !772} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!781 = metadata !{i32 786445, metadata !769, metadata !"dstPos", metadata !194, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !774} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!782 = metadata !{i32 786445, metadata !769, metadata !"dstPtr", metadata !194, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !615} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!783 = metadata !{i32 786445, metadata !769, metadata !"extent", metadata !194, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !525} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!784 = metadata !{i32 786445, metadata !769, metadata !"kind", metadata !194, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !508} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!785 = metadata !{metadata !786}
!786 = metadata !{metadata !787}
!787 = metadata !{i32 786689, metadata !764, metadata !"p", metadata !512, i32 16777368, metadata !767, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!788 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !512, i32 156, metadata !789, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!789 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !790, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!790 = metadata !{metadata !515, metadata !767, metadata !697}
!791 = metadata !{metadata !792}
!792 = metadata !{metadata !793, metadata !794}
!793 = metadata !{i32 786689, metadata !788, metadata !"p", metadata !512, i32 16777372, metadata !767, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!794 = metadata !{i32 786689, metadata !788, metadata !"stream", metadata !512, i32 33554588, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!795 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !512, i32 160, metadata !796, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!796 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !797, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!797 = metadata !{metadata !515, metadata !798}
!798 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !799} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!799 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !800} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!800 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !194, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !801, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!801 = metadata !{metadata !802, metadata !803, metadata !804, metadata !805, metadata !806, metadata !807, metadata !808, metadata !809, metadata !810}
!802 = metadata !{i32 786445, metadata !800, metadata !"srcArray", metadata !194, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !772} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!803 = metadata !{i32 786445, metadata !800, metadata !"srcPos", metadata !194, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !774} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!804 = metadata !{i32 786445, metadata !800, metadata !"srcPtr", metadata !194, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !615} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!805 = metadata !{i32 786445, metadata !800, metadata !"srcDevice", metadata !194, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !19} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!806 = metadata !{i32 786445, metadata !800, metadata !"dstArray", metadata !194, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !772} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!807 = metadata !{i32 786445, metadata !800, metadata !"dstPos", metadata !194, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !774} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!808 = metadata !{i32 786445, metadata !800, metadata !"dstPtr", metadata !194, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !615} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!809 = metadata !{i32 786445, metadata !800, metadata !"dstDevice", metadata !194, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !19} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!810 = metadata !{i32 786445, metadata !800, metadata !"extent", metadata !194, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !525} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!811 = metadata !{metadata !812}
!812 = metadata !{metadata !813}
!813 = metadata !{i32 786689, metadata !795, metadata !"p", metadata !512, i32 16777376, metadata !798, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!814 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !512, i32 164, metadata !815, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!815 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !816, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!816 = metadata !{metadata !515, metadata !798, metadata !697}
!817 = metadata !{metadata !818}
!818 = metadata !{metadata !819, metadata !820}
!819 = metadata !{i32 786689, metadata !814, metadata !"p", metadata !512, i32 16777380, metadata !798, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!820 = metadata !{i32 786689, metadata !814, metadata !"stream", metadata !512, i32 33554596, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!821 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !512, i32 168, metadata !822, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!822 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !823, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!823 = metadata !{metadata !515, metadata !531, metadata !298, metadata !298, metadata !531, metadata !298, metadata !298, metadata !298, metadata !508}
!824 = metadata !{metadata !825}
!825 = metadata !{metadata !826, metadata !827, metadata !828, metadata !829, metadata !830, metadata !831, metadata !832, metadata !833}
!826 = metadata !{i32 786689, metadata !821, metadata !"dst", metadata !512, i32 16777384, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!827 = metadata !{i32 786689, metadata !821, metadata !"wOffsetDst", metadata !512, i32 33554600, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!828 = metadata !{i32 786689, metadata !821, metadata !"hOffsetDst", metadata !512, i32 50331816, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!829 = metadata !{i32 786689, metadata !821, metadata !"src", metadata !512, i32 67109033, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!830 = metadata !{i32 786689, metadata !821, metadata !"wOffsetSrc", metadata !512, i32 83886249, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!831 = metadata !{i32 786689, metadata !821, metadata !"hOffsetSrc", metadata !512, i32 100663465, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!832 = metadata !{i32 786689, metadata !821, metadata !"count", metadata !512, i32 117440682, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!833 = metadata !{i32 786689, metadata !821, metadata !"kind", metadata !512, i32 134217898, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!834 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !512, i32 174, metadata !835, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct.C
!835 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !836, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!836 = metadata !{metadata !515, metadata !142, metadata !143, metadata !298, metadata !508, metadata !697}
!837 = metadata !{metadata !838}
!838 = metadata !{metadata !839, metadata !840, metadata !841, metadata !842, metadata !843}
!839 = metadata !{i32 786689, metadata !834, metadata !"dst", metadata !512, i32 16777390, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!840 = metadata !{i32 786689, metadata !834, metadata !"src", metadata !512, i32 33554606, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!841 = metadata !{i32 786689, metadata !834, metadata !"count", metadata !512, i32 50331822, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!842 = metadata !{i32 786689, metadata !834, metadata !"kind", metadata !512, i32 67109039, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!843 = metadata !{i32 786689, metadata !834, metadata !"stream", metadata !512, i32 83886255, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!844 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !512, i32 179, metadata !845, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaArra
!845 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !846, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!846 = metadata !{metadata !515, metadata !142, metadata !531, metadata !298, metadata !298, metadata !298, metadata !508}
!847 = metadata !{metadata !848}
!848 = metadata !{metadata !849, metadata !850, metadata !851, metadata !852, metadata !853, metadata !854}
!849 = metadata !{i32 786689, metadata !844, metadata !"dst", metadata !512, i32 16777395, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!850 = metadata !{i32 786689, metadata !844, metadata !"src", metadata !512, i32 33554611, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!851 = metadata !{i32 786689, metadata !844, metadata !"wOffset", metadata !512, i32 50331827, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!852 = metadata !{i32 786689, metadata !844, metadata !"hOffset", metadata !512, i32 67109044, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!853 = metadata !{i32 786689, metadata !844, metadata !"count", metadata !512, i32 83886260, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!854 = metadata !{i32 786689, metadata !844, metadata !"kind", metadata !512, i32 100663476, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!855 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !512, i32 184, metadata !856, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struc
!856 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !857, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!857 = metadata !{metadata !515, metadata !142, metadata !531, metadata !298, metadata !298, metadata !298, metadata !508, metadata !697}
!858 = metadata !{metadata !859}
!859 = metadata !{metadata !860, metadata !861, metadata !862, metadata !863, metadata !864, metadata !865, metadata !866}
!860 = metadata !{i32 786689, metadata !855, metadata !"dst", metadata !512, i32 16777400, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!861 = metadata !{i32 786689, metadata !855, metadata !"src", metadata !512, i32 33554616, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!862 = metadata !{i32 786689, metadata !855, metadata !"wOffset", metadata !512, i32 50331832, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!863 = metadata !{i32 786689, metadata !855, metadata !"hOffset", metadata !512, i32 67109049, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!864 = metadata !{i32 786689, metadata !855, metadata !"count", metadata !512, i32 83886265, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!865 = metadata !{i32 786689, metadata !855, metadata !"kind", metadata !512, i32 100663481, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!866 = metadata !{i32 786689, metadata !855, metadata !"stream", metadata !512, i32 117440698, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!867 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !512, i32 190, metadata !868, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64,
!868 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !869, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!869 = metadata !{metadata !515, metadata !142, metadata !155, metadata !298, metadata !298, metadata !508}
!870 = metadata !{metadata !871}
!871 = metadata !{metadata !872, metadata !873, metadata !874, metadata !875, metadata !876}
!872 = metadata !{i32 786689, metadata !867, metadata !"dst", metadata !512, i32 16777406, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!873 = metadata !{i32 786689, metadata !867, metadata !"symbol", metadata !512, i32 33554622, metadata !155, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!874 = metadata !{i32 786689, metadata !867, metadata !"count", metadata !512, i32 50331838, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!875 = metadata !{i32 786689, metadata !867, metadata !"offset", metadata !512, i32 67109055, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!876 = metadata !{i32 786689, metadata !867, metadata !"kind", metadata !512, i32 83886271, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!877 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !512, i32 195, metadata !878, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*,
!878 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !879, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!879 = metadata !{metadata !515, metadata !142, metadata !155, metadata !298, metadata !298, metadata !508, metadata !697}
!880 = metadata !{metadata !881}
!881 = metadata !{metadata !882, metadata !883, metadata !884, metadata !885, metadata !886, metadata !887}
!882 = metadata !{i32 786689, metadata !877, metadata !"dst", metadata !512, i32 16777411, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!883 = metadata !{i32 786689, metadata !877, metadata !"symbol", metadata !512, i32 33554627, metadata !155, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!884 = metadata !{i32 786689, metadata !877, metadata !"count", metadata !512, i32 50331843, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!885 = metadata !{i32 786689, metadata !877, metadata !"offset", metadata !512, i32 67109060, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!886 = metadata !{i32 786689, metadata !877, metadata !"kind", metadata !512, i32 83886276, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!887 = metadata !{i32 786689, metadata !877, metadata !"stream", metadata !512, i32 100663493, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!888 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !512, i32 201, metadata !889, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cuda
!889 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !890, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!890 = metadata !{metadata !515, metadata !142, metadata !19, metadata !143, metadata !19, metadata !298}
!891 = metadata !{metadata !892}
!892 = metadata !{metadata !893, metadata !894, metadata !895, metadata !896, metadata !897}
!893 = metadata !{i32 786689, metadata !888, metadata !"dst", metadata !512, i32 16777417, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!894 = metadata !{i32 786689, metadata !888, metadata !"dstDevice", metadata !512, i32 33554633, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!895 = metadata !{i32 786689, metadata !888, metadata !"src", metadata !512, i32 50331849, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!896 = metadata !{i32 786689, metadata !888, metadata !"srcDevice", metadata !512, i32 67109065, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!897 = metadata !{i32 786689, metadata !888, metadata !"count", metadata !512, i32 83886281, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!898 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !512, i32 206, metadata !899, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i
!899 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !900, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!900 = metadata !{metadata !515, metadata !142, metadata !19, metadata !143, metadata !19, metadata !298, metadata !697}
!901 = metadata !{metadata !902}
!902 = metadata !{metadata !903, metadata !904, metadata !905, metadata !906, metadata !907, metadata !908}
!903 = metadata !{i32 786689, metadata !898, metadata !"dst", metadata !512, i32 16777422, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!904 = metadata !{i32 786689, metadata !898, metadata !"dstDevice", metadata !512, i32 33554638, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!905 = metadata !{i32 786689, metadata !898, metadata !"src", metadata !512, i32 50331854, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!906 = metadata !{i32 786689, metadata !898, metadata !"srcDevice", metadata !512, i32 67109070, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!907 = metadata !{i32 786689, metadata !898, metadata !"count", metadata !512, i32 83886287, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!908 = metadata !{i32 786689, metadata !898, metadata !"stream", metadata !512, i32 100663503, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!909 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !512, i32 212, metadata !910, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64, 
!910 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !911, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!911 = metadata !{metadata !515, metadata !531, metadata !298, metadata !298, metadata !143, metadata !298, metadata !508}
!912 = metadata !{metadata !913}
!913 = metadata !{metadata !914, metadata !915, metadata !916, metadata !917, metadata !918, metadata !919}
!914 = metadata !{i32 786689, metadata !909, metadata !"dst", metadata !512, i32 16777428, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!915 = metadata !{i32 786689, metadata !909, metadata !"wOffset", metadata !512, i32 33554644, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!916 = metadata !{i32 786689, metadata !909, metadata !"hOffset", metadata !512, i32 50331860, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!917 = metadata !{i32 786689, metadata !909, metadata !"src", metadata !512, i32 67109077, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!918 = metadata !{i32 786689, metadata !909, metadata !"count", metadata !512, i32 83886293, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!919 = metadata !{i32 786689, metadata !909, metadata !"kind", metadata !512, i32 100663509, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!920 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !512, i32 217, metadata !921, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!921 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !922, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!922 = metadata !{metadata !515, metadata !531, metadata !298, metadata !298, metadata !143, metadata !298, metadata !508, metadata !697}
!923 = metadata !{metadata !924}
!924 = metadata !{metadata !925, metadata !926, metadata !927, metadata !928, metadata !929, metadata !930, metadata !931}
!925 = metadata !{i32 786689, metadata !920, metadata !"dst", metadata !512, i32 16777433, metadata !531, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!926 = metadata !{i32 786689, metadata !920, metadata !"wOffset", metadata !512, i32 33554649, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!927 = metadata !{i32 786689, metadata !920, metadata !"hOffset", metadata !512, i32 50331865, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!928 = metadata !{i32 786689, metadata !920, metadata !"src", metadata !512, i32 67109082, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!929 = metadata !{i32 786689, metadata !920, metadata !"count", metadata !512, i32 83886298, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!930 = metadata !{i32 786689, metadata !920, metadata !"kind", metadata !512, i32 100663514, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!931 = metadata !{i32 786689, metadata !920, metadata !"stream", metadata !512, i32 117440731, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!932 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !512, i32 223, metadata !933, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i32
!933 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !934, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!934 = metadata !{metadata !515, metadata !21, metadata !143, metadata !298, metadata !298, metadata !508}
!935 = metadata !{metadata !936}
!936 = metadata !{metadata !937, metadata !938, metadata !939, metadata !940, metadata !941}
!937 = metadata !{i32 786689, metadata !932, metadata !"symbol", metadata !512, i32 16777439, metadata !21, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!938 = metadata !{i32 786689, metadata !932, metadata !"src", metadata !512, i32 33554655, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!939 = metadata !{i32 786689, metadata !932, metadata !"count", metadata !512, i32 50331871, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!940 = metadata !{i32 786689, metadata !932, metadata !"offset", metadata !512, i32 67109088, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!941 = metadata !{i32 786689, metadata !932, metadata !"kind", metadata !512, i32 83886304, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!942 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !512, i32 229, metadata !943, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64
!943 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !944, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!944 = metadata !{metadata !515, metadata !155, metadata !143, metadata !298, metadata !298, metadata !508, metadata !697}
!945 = metadata !{metadata !946}
!946 = metadata !{metadata !947, metadata !948, metadata !949, metadata !950, metadata !951, metadata !952}
!947 = metadata !{i32 786689, metadata !942, metadata !"symbol", metadata !512, i32 16777445, metadata !155, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!948 = metadata !{i32 786689, metadata !942, metadata !"src", metadata !512, i32 33554661, metadata !143, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!949 = metadata !{i32 786689, metadata !942, metadata !"count", metadata !512, i32 50331877, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!950 = metadata !{i32 786689, metadata !942, metadata !"offset", metadata !512, i32 67109093, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!951 = metadata !{i32 786689, metadata !942, metadata !"kind", metadata !512, i32 83886310, metadata !508, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!952 = metadata !{i32 786689, metadata !942, metadata !"stream", metadata !512, i32 100663526, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!953 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !512, i32 234, metadata !954, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo, n
!954 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !955, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!955 = metadata !{metadata !515, metadata !379, metadata !379}
!956 = metadata !{metadata !957}
!957 = metadata !{metadata !958, metadata !959}
!958 = metadata !{i32 786689, metadata !953, metadata !"free", metadata !512, i32 16777450, metadata !379, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!959 = metadata !{i32 786689, metadata !953, metadata !"total", metadata !512, i32 33554666, metadata !379, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!960 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !512, i32 238, metadata !961, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, null
!961 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !962, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!962 = metadata !{metadata !515, metadata !142, metadata !19, metadata !298}
!963 = metadata !{metadata !964}
!964 = metadata !{metadata !965, metadata !966, metadata !967}
!965 = metadata !{i32 786689, metadata !960, metadata !"devPtr", metadata !512, i32 16777454, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!966 = metadata !{i32 786689, metadata !960, metadata !"value", metadata !512, i32 33554670, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!967 = metadata !{i32 786689, metadata !960, metadata !"count", metadata !512, i32 50331886, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!968 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !512, i32 243, metadata !969, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMems
!969 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !970, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!970 = metadata !{metadata !515, metadata !142, metadata !298, metadata !19, metadata !298, metadata !298}
!971 = metadata !{metadata !972}
!972 = metadata !{metadata !973, metadata !974, metadata !975, metadata !976, metadata !977}
!973 = metadata !{i32 786689, metadata !968, metadata !"devPtr", metadata !512, i32 16777459, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!974 = metadata !{i32 786689, metadata !968, metadata !"pitch", metadata !512, i32 33554675, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!975 = metadata !{i32 786689, metadata !968, metadata !"value", metadata !512, i32 50331891, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!976 = metadata !{i32 786689, metadata !968, metadata !"width", metadata !512, i32 67109108, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!977 = metadata !{i32 786689, metadata !968, metadata !"height", metadata !512, i32 83886324, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!978 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !512, i32 248, metadata !979, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64, 
!979 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !980, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!980 = metadata !{metadata !515, metadata !142, metadata !298, metadata !19, metadata !298, metadata !298, metadata !697}
!981 = metadata !{metadata !982}
!982 = metadata !{metadata !983, metadata !984, metadata !985, metadata !986, metadata !987, metadata !988}
!983 = metadata !{i32 786689, metadata !978, metadata !"devPtr", metadata !512, i32 16777464, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!984 = metadata !{i32 786689, metadata !978, metadata !"pitch", metadata !512, i32 33554680, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!985 = metadata !{i32 786689, metadata !978, metadata !"value", metadata !512, i32 50331896, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!986 = metadata !{i32 786689, metadata !978, metadata !"width", metadata !512, i32 67109113, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!987 = metadata !{i32 786689, metadata !978, metadata !"height", metadata !512, i32 83886329, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!988 = metadata !{i32 786689, metadata !978, metadata !"stream", metadata !512, i32 100663545, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!989 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !512, i32 253, metadata !990, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %stru
!990 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !991, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!991 = metadata !{metadata !515, metadata !615, metadata !19, metadata !525}
!992 = metadata !{metadata !993}
!993 = metadata !{metadata !994, metadata !995, metadata !996}
!994 = metadata !{i32 786689, metadata !989, metadata !"pitchedDevPtr", metadata !512, i32 16777469, metadata !615, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!995 = metadata !{i32 786689, metadata !989, metadata !"value", metadata !512, i32 33554685, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!996 = metadata !{i32 786689, metadata !989, metadata !"extent", metadata !512, i32 50331902, metadata !525, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!997 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !512, i32 258, metadata !998, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, 
!998 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !999, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!999 = metadata !{metadata !515, metadata !615, metadata !19, metadata !525, metadata !697}
!1000 = metadata !{metadata !1001}
!1001 = metadata !{metadata !1002, metadata !1003, metadata !1004, metadata !1005}
!1002 = metadata !{i32 786689, metadata !997, metadata !"pitchedDevPtr", metadata !512, i32 16777474, metadata !615, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!1003 = metadata !{i32 786689, metadata !997, metadata !"value", metadata !512, i32 33554690, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!1004 = metadata !{i32 786689, metadata !997, metadata !"extent", metadata !512, i32 50331907, metadata !525, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!1005 = metadata !{i32 786689, metadata !997, metadata !"stream", metadata !512, i32 67109123, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!1006 = metadata !{i32 786478, i32 0, metadata !512, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !512, i32 263, metadata !1007, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUst
!1007 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1008, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1008 = metadata !{metadata !515, metadata !142, metadata !19, metadata !298, metadata !697}
!1009 = metadata !{metadata !1010}
!1010 = metadata !{metadata !1011, metadata !1012, metadata !1013, metadata !1014}
!1011 = metadata !{i32 786689, metadata !1006, metadata !"devPtr", metadata !512, i32 16777479, metadata !142, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!1012 = metadata !{i32 786689, metadata !1006, metadata !"value", metadata !512, i32 33554695, metadata !19, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!1013 = metadata !{i32 786689, metadata !1006, metadata !"count", metadata !512, i32 50331911, metadata !298, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!1014 = metadata !{i32 786689, metadata !1006, metadata !"stream", metadata !512, i32 67109127, metadata !697, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!1015 = metadata !{i32 93, i32 0, metadata !28, null}
!1016 = metadata !{i32 98, i32 0, metadata !28, null}
!1017 = metadata !{metadata !"any pointer", metadata !1018}
!1018 = metadata !{metadata !"omnipotent char", metadata !1019}
!1019 = metadata !{metadata !"Simple C/C++ TBAA"}
!1020 = metadata !{i32 99, i32 0, metadata !28, null}
!1021 = metadata !{i32 100, i32 0, metadata !28, null}
!1022 = metadata !{i32 109, i32 0, metadata !46, null}
!1023 = metadata !{i32 111, i32 0, metadata !1024, null}
!1024 = metadata !{i32 786443, metadata !46, i32 110, i32 0, metadata !16, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!1025 = metadata !{metadata !"float", metadata !1018}
!1026 = metadata !{i32 118, i32 0, metadata !28, null}
!1027 = metadata !{i32 119, i32 0, metadata !28, null}
!1028 = metadata !{i32 120, i32 0, metadata !28, null}
!1029 = metadata !{i32 123, i32 0, metadata !28, null}
!1030 = metadata !{i32 126, i32 0, metadata !1031, null}
!1031 = metadata !{i32 786443, metadata !28, i32 124, i32 0, metadata !16, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!1032 = metadata !{i32 130, i32 0, metadata !1031, null}
!1033 = metadata !{i32 134, i32 0, metadata !28, null}
!1034 = metadata !{i32 139, i32 0, metadata !28, null}
!1035 = metadata !{i32 140, i32 0, metadata !28, null}
!1036 = metadata !{i32 141, i32 0, metadata !28, null}
!1037 = metadata !{i32 146, i32 0, metadata !28, null}
!1038 = metadata !{i32 148, i32 0, metadata !28, null}
!1039 = metadata !{i32 29, i32 0, metadata !58, null}
!1040 = metadata !{metadata !"int", metadata !1018}
!1041 = metadata !{i32 30, i32 0, metadata !58, null}
!1042 = metadata !{i32 32, i32 0, metadata !58, null}
!1043 = metadata !{metadata !"long", metadata !1018}
!1044 = metadata !{i32 35, i32 0, metadata !58, null}
!1045 = metadata !{i32 36, i32 0, metadata !58, null}
!1046 = metadata !{i32 39, i32 0, metadata !62, null}
!1047 = metadata !{i32 41, i32 0, metadata !65, null}
!1048 = metadata !{i32 43, i32 0, metadata !65, null}
!1049 = metadata !{i32 45, i32 0, metadata !64, null}
!1050 = metadata !{i32 46, i32 0, metadata !64, null}
!1051 = metadata !{i32 48, i32 0, metadata !64, null}
!1052 = metadata !{i32 50, i32 0, metadata !1053, null}
!1053 = metadata !{i32 786443, metadata !64, i32 49, i32 0, metadata !16, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/clock/clock.cpp]
!1054 = metadata !{i32 51, i32 0, metadata !1053, null}
!1055 = metadata !{i32 56, i32 0, metadata !58, null}
!1056 = metadata !{i32 58, i32 0, metadata !58, null}
!1057 = metadata !{i32 60, i32 0, metadata !58, null}
!1058 = metadata !{i32 61, i32 0, metadata !58, null}
!1059 = metadata !{i32 13, i32 0, metadata !1060, null}
!1060 = metadata !{i32 786443, metadata !127, i32 12, i32 0, metadata !128, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c]
!1061 = metadata !{i32 14, i32 0, metadata !1060, null}
!1062 = metadata !{i32 15, i32 0, metadata !1060, null}
!1063 = metadata !{i32 16, i32 0, metadata !153, null}
!1064 = metadata !{i32 17, i32 0, metadata !153, null}
!1065 = metadata !{i32 18, i32 0, metadata !153, null}
!1066 = metadata !{i32 14, i32 0, metadata !187, null}
!1067 = metadata !{i32 15, i32 0, metadata !187, null}
!1068 = metadata !{i32 16, i32 0, metadata !187, null}
!1069 = metadata !{i32 15, i32 0, metadata !1070, null}
!1070 = metadata !{i32 786443, metadata !283, i32 14, i32 0, metadata !284, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1071 = metadata !{i32 16, i32 0, metadata !1070, null}
!1072 = metadata !{i32 20, i32 0, metadata !1073, null}
!1073 = metadata !{i32 786443, metadata !362, i32 19, i32 0, metadata !284, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1074 = metadata !{i32 21, i32 0, metadata !1073, null}
!1075 = metadata !{i32 25, i32 0, metadata !1076, null}
!1076 = metadata !{i32 786443, metadata !369, i32 24, i32 0, metadata !284, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1077 = metadata !{i32 29, i32 0, metadata !1078, null}
!1078 = metadata !{i32 786443, metadata !376, i32 28, i32 0, metadata !284, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1079 = metadata !{i32 33, i32 0, metadata !1080, null}
!1080 = metadata !{i32 786443, metadata !384, i32 32, i32 0, metadata !284, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1081 = metadata !{i32 34, i32 0, metadata !1080, null}
!1082 = metadata !{i32 38, i32 0, metadata !1083, null}
!1083 = metadata !{i32 786443, metadata !392, i32 37, i32 0, metadata !284, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1084 = metadata !{i32 42, i32 0, metadata !1085, null}
!1085 = metadata !{i32 786443, metadata !395, i32 41, i32 0, metadata !284, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1086 = metadata !{i32 46, i32 0, metadata !1087, null}
!1087 = metadata !{i32 786443, metadata !401, i32 45, i32 0, metadata !284, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1088 = metadata !{i32 50, i32 0, metadata !1089, null}
!1089 = metadata !{i32 786443, metadata !408, i32 49, i32 0, metadata !284, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1090 = metadata !{i32 54, i32 0, metadata !1091, null}
!1091 = metadata !{i32 786443, metadata !409, i32 53, i32 0, metadata !284, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1092 = metadata !{i32 55, i32 0, metadata !1091, null}
!1093 = metadata !{i32 59, i32 0, metadata !1094, null}
!1094 = metadata !{i32 786443, metadata !415, i32 58, i32 0, metadata !284, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1095 = metadata !{i32 60, i32 0, metadata !1094, null}
!1096 = metadata !{i32 64, i32 0, metadata !1097, null}
!1097 = metadata !{i32 786443, metadata !419, i32 63, i32 0, metadata !284, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1098 = metadata !{i32 65, i32 0, metadata !1097, null}
!1099 = metadata !{i32 69, i32 0, metadata !1100, null}
!1100 = metadata !{i32 786443, metadata !427, i32 68, i32 0, metadata !284, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1101 = metadata !{i32 73, i32 0, metadata !1102, null}
!1102 = metadata !{i32 786443, metadata !433, i32 72, i32 0, metadata !284, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1103 = metadata !{i32 77, i32 0, metadata !1104, null}
!1104 = metadata !{i32 786443, metadata !451, i32 76, i32 0, metadata !284, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1105 = metadata !{i32 81, i32 0, metadata !1106, null}
!1106 = metadata !{i32 786443, metadata !463, i32 80, i32 0, metadata !284, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1107 = metadata !{i32 85, i32 0, metadata !1108, null}
!1108 = metadata !{i32 786443, metadata !471, i32 84, i32 0, metadata !284, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1109 = metadata !{i32 89, i32 0, metadata !1110, null}
!1110 = metadata !{i32 786443, metadata !480, i32 88, i32 0, metadata !284, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1111 = metadata !{i32 93, i32 0, metadata !1112, null}
!1112 = metadata !{i32 786443, metadata !486, i32 92, i32 0, metadata !284, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1113 = metadata !{i32 97, i32 0, metadata !1114, null}
!1114 = metadata !{i32 786443, metadata !492, i32 96, i32 0, metadata !284, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1115 = metadata !{i32 26, i32 0, metadata !1116, null}
!1116 = metadata !{i32 786443, metadata !511, i32 25, i32 0, metadata !512, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1117 = metadata !{i32 30, i32 0, metadata !1118, null}
!1118 = metadata !{i32 786443, metadata !539, i32 29, i32 0, metadata !512, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1119 = metadata !{i32 31, i32 0, metadata !1118, null}
!1120 = metadata !{i32 35, i32 0, metadata !1121, null}
!1121 = metadata !{i32 786443, metadata !545, i32 34, i32 0, metadata !512, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1122 = metadata !{i32 36, i32 0, metadata !1121, null}
!1123 = metadata !{i32 40, i32 0, metadata !1124, null}
!1124 = metadata !{i32 786443, metadata !551, i32 39, i32 0, metadata !512, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1125 = metadata !{i32 41, i32 0, metadata !1124, null}
!1126 = metadata !{i32 45, i32 0, metadata !1127, null}
!1127 = metadata !{i32 786443, metadata !555, i32 44, i32 0, metadata !512, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1128 = metadata !{i32 49, i32 0, metadata !1129, null}
!1129 = metadata !{i32 786443, metadata !562, i32 48, i32 0, metadata !512, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1130 = metadata !{i32 53, i32 0, metadata !1131, null}
!1131 = metadata !{i32 786443, metadata !569, i32 52, i32 0, metadata !512, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1132 = metadata !{i32 57, i32 0, metadata !1133, null}
!1133 = metadata !{i32 786443, metadata !577, i32 56, i32 0, metadata !512, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1134 = metadata !{i32 61, i32 0, metadata !1135, null}
!1135 = metadata !{i32 786443, metadata !585, i32 60, i32 0, metadata !512, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1136 = metadata !{i32 65, i32 0, metadata !1137, null}
!1137 = metadata !{i32 786443, metadata !592, i32 64, i32 0, metadata !512, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1138 = metadata !{i32 69, i32 0, metadata !1139, null}
!1139 = metadata !{i32 786443, metadata !600, i32 68, i32 0, metadata !512, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1140 = metadata !{i32 73, i32 0, metadata !1141, null}
!1141 = metadata !{i32 786443, metadata !604, i32 72, i32 0, metadata !512, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1142 = metadata !{i32 74, i32 0, metadata !1141, null}
!1143 = metadata !{i32 75, i32 0, metadata !1141, null}
!1144 = metadata !{i32 77, i32 0, metadata !1141, null}
!1145 = metadata !{i32 81, i32 0, metadata !1146, null}
!1146 = metadata !{i32 786443, metadata !611, i32 80, i32 0, metadata !512, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1147 = metadata !{i32 86, i32 0, metadata !1148, null}
!1148 = metadata !{i32 786443, metadata !625, i32 85, i32 0, metadata !512, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1149 = metadata !{i32 91, i32 0, metadata !1150, null}
!1150 = metadata !{i32 786443, metadata !635, i32 90, i32 0, metadata !512, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1151 = metadata !{i32 95, i32 0, metadata !1152, null}
!1152 = metadata !{i32 786443, metadata !645, i32 94, i32 0, metadata !512, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1153 = metadata !{i32 96, i32 0, metadata !1152, null}
!1154 = metadata !{i32 97, i32 0, metadata !1152, null}
!1155 = metadata !{i32 99, i32 0, metadata !1152, null}
!1156 = metadata !{i32 103, i32 0, metadata !1157, null}
!1157 = metadata !{i32 786443, metadata !650, i32 102, i32 0, metadata !512, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1158 = metadata !{i32 108, i32 0, metadata !1159, null}
!1159 = metadata !{i32 786443, metadata !659, i32 106, i32 0, metadata !512, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1160 = metadata !{i32 113, i32 0, metadata !1161, null}
!1161 = metadata !{i32 786443, metadata !668, i32 112, i32 0, metadata !512, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1162 = metadata !{i32 119, i32 0, metadata !1163, null}
!1163 = metadata !{i32 786443, metadata !680, i32 118, i32 0, metadata !512, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1164 = metadata !{i32 125, i32 0, metadata !1165, null}
!1165 = metadata !{i32 786443, metadata !694, i32 124, i32 0, metadata !512, i32 20} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1166 = metadata !{i32 131, i32 0, metadata !1167, null}
!1167 = metadata !{i32 786443, metadata !710, i32 130, i32 0, metadata !512, i32 21} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1168 = metadata !{i32 137, i32 0, metadata !1169, null}
!1169 = metadata !{i32 786443, metadata !723, i32 136, i32 0, metadata !512, i32 22} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1170 = metadata !{i32 143, i32 0, metadata !1171, null}
!1171 = metadata !{i32 786443, metadata !737, i32 142, i32 0, metadata !512, i32 23} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1172 = metadata !{i32 149, i32 0, metadata !1173, null}
!1173 = metadata !{i32 786443, metadata !750, i32 148, i32 0, metadata !512, i32 24} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1174 = metadata !{i32 153, i32 0, metadata !1175, null}
!1175 = metadata !{i32 786443, metadata !764, i32 152, i32 0, metadata !512, i32 25} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1176 = metadata !{i32 157, i32 0, metadata !1177, null}
!1177 = metadata !{i32 786443, metadata !788, i32 156, i32 0, metadata !512, i32 26} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1178 = metadata !{i32 161, i32 0, metadata !1179, null}
!1179 = metadata !{i32 786443, metadata !795, i32 160, i32 0, metadata !512, i32 27} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1180 = metadata !{i32 165, i32 0, metadata !1181, null}
!1181 = metadata !{i32 786443, metadata !814, i32 164, i32 0, metadata !512, i32 28} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1182 = metadata !{i32 171, i32 0, metadata !1183, null}
!1183 = metadata !{i32 786443, metadata !821, i32 170, i32 0, metadata !512, i32 29} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1184 = metadata !{i32 176, i32 0, metadata !1185, null}
!1185 = metadata !{i32 786443, metadata !834, i32 175, i32 0, metadata !512, i32 30} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1186 = metadata !{i32 181, i32 0, metadata !1187, null}
!1187 = metadata !{i32 786443, metadata !844, i32 180, i32 0, metadata !512, i32 31} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1188 = metadata !{i32 187, i32 0, metadata !1189, null}
!1189 = metadata !{i32 786443, metadata !855, i32 186, i32 0, metadata !512, i32 32} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1190 = metadata !{i32 192, i32 0, metadata !1191, null}
!1191 = metadata !{i32 786443, metadata !867, i32 191, i32 0, metadata !512, i32 33} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1192 = metadata !{i32 198, i32 0, metadata !1193, null}
!1193 = metadata !{i32 786443, metadata !877, i32 197, i32 0, metadata !512, i32 34} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1194 = metadata !{i32 203, i32 0, metadata !1195, null}
!1195 = metadata !{i32 786443, metadata !888, i32 201, i32 0, metadata !512, i32 35} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1196 = metadata !{i32 209, i32 0, metadata !1197, null}
!1197 = metadata !{i32 786443, metadata !898, i32 207, i32 0, metadata !512, i32 36} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1198 = metadata !{i32 214, i32 0, metadata !1199, null}
!1199 = metadata !{i32 786443, metadata !909, i32 213, i32 0, metadata !512, i32 37} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1200 = metadata !{i32 220, i32 0, metadata !1201, null}
!1201 = metadata !{i32 786443, metadata !920, i32 219, i32 0, metadata !512, i32 38} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1202 = metadata !{i32 225, i32 0, metadata !1203, null}
!1203 = metadata !{i32 786443, metadata !932, i32 224, i32 0, metadata !512, i32 39} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1204 = metadata !{i32 226, i32 0, metadata !1203, null}
!1205 = metadata !{i32 231, i32 0, metadata !1206, null}
!1206 = metadata !{i32 786443, metadata !942, i32 230, i32 0, metadata !512, i32 40} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1207 = metadata !{i32 235, i32 0, metadata !1208, null}
!1208 = metadata !{i32 786443, metadata !953, i32 234, i32 0, metadata !512, i32 41} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1209 = metadata !{i32 239, i32 0, metadata !1210, null}
!1210 = metadata !{i32 786443, metadata !960, i32 238, i32 0, metadata !512, i32 42} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1211 = metadata !{i32 240, i32 0, metadata !1210, null}
!1212 = metadata !{i32 245, i32 0, metadata !1213, null}
!1213 = metadata !{i32 786443, metadata !968, i32 244, i32 0, metadata !512, i32 43} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1214 = metadata !{i32 250, i32 0, metadata !1215, null}
!1215 = metadata !{i32 786443, metadata !978, i32 249, i32 0, metadata !512, i32 44} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1216 = metadata !{i32 255, i32 0, metadata !1217, null}
!1217 = metadata !{i32 786443, metadata !989, i32 254, i32 0, metadata !512, i32 45} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1218 = metadata !{i32 260, i32 0, metadata !1219, null}
!1219 = metadata !{i32 786443, metadata !997, i32 259, i32 0, metadata !512, i32 46} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1220 = metadata !{i32 264, i32 0, metadata !1221, null}
!1221 = metadata !{i32 786443, metadata !1006, i32 263, i32 0, metadata !512, i32 47} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
