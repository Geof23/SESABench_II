; ModuleID = 'clock'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.uint4 = type { i32, i32, i32, i32 }
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

@.str = private unnamed_addr constant [17 x i8] c"%s Starting...\0A\0A\00", align 1
@.str4 = private unnamed_addr constant [69 x i8] c"*** Running GPU scan for short arrays (%d identical iterations)...\0A\0A\00", align 1
@.str5 = private unnamed_addr constant [68 x i8] c"***Running GPU scan for large arrays (%u identical iterations)...\0A\0A\00", align 1
@.str6 = private unnamed_addr constant [45 x i8] c"Running scan for %u elements (%u arrays)...\0A\00", align 1
@.str11 = private unnamed_addr constant [17 x i8] c" ...Results %s\0A\0A\00", align 1
@.str12 = private unnamed_addr constant [6 x i8] c"Match\00", align 1
@str = private unnamed_addr constant [43 x i8] c"Allocating and initializing host arrays...\00"
@str16 = private unnamed_addr constant [43 x i8] c"Allocating and initializing CUDA arrays...\00"
@str17 = private unnamed_addr constant [29 x i8] c"Initializing CUDA-C scan...\0A\00"
@str18 = private unnamed_addr constant [26 x i8] c"Validating the results...\00"
@str19 = private unnamed_addr constant [28 x i8] c"...reading back GPU results\00"
@str20 = private unnamed_addr constant [23 x i8] c"...scanExclusiveHost()\00"
@str21 = private unnamed_addr constant [26 x i8] c" ...comparing the results\00"
@str22 = private unnamed_addr constant [17 x i8] c"Shutting down...\00"
@_ZZ19scanExclusiveSharedP5uint4S0_jE6s_Data = internal global [512 x i32] zeroinitializer, section "__shared__", align 16
@blockIdx = external global %struct.dim3
@blockDim = external global %struct.dim3
@threadIdx = external global %struct.dim3
@_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data = internal global [512 x i32] zeroinitializer, section "__shared__", align 16
@_ZZ13uniformUpdateP5uint4PjE3buf = internal unnamed_addr global i32 0, section "__shared__", align 4
@MAX_BATCH_ELEMENTS = constant i32 67108864, align 4
@MIN_SHORT_ARRAY_SIZE = constant i32 4, align 4
@MAX_SHORT_ARRAY_SIZE = constant i32 1024, align 4
@MIN_LARGE_ARRAY_SIZE = constant i32 2048, align 4
@MAX_LARGE_ARRAY_SIZE = constant i32 262144, align 4
@_ZL5d_Buf = internal global i32* null, align 8
@.str7 = private unnamed_addr constant [28 x i8] c"factorizationRemainder == 1\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"scan.cpp\00", align 1
@__PRETTY_FUNCTION__.scanExclusiveShort = private unnamed_addr constant [54 x i8] c"size_t scanExclusiveShort(uint *, uint *, uint, uint)\00", align 1
@.str2 = private unnamed_addr constant [79 x i8] c"(arrayLength >= MIN_SHORT_ARRAY_SIZE) && (arrayLength <= MAX_SHORT_ARRAY_SIZE)\00", align 1
@.str3 = private unnamed_addr constant [48 x i8] c"(batchSize * arrayLength) <= MAX_BATCH_ELEMENTS\00", align 1
@.str48 = private unnamed_addr constant [43 x i8] c"(batchSize * arrayLength) % (4 * 256) == 0\00", align 1
@__PRETTY_FUNCTION__.scanExclusiveLarge = private unnamed_addr constant [54 x i8] c"size_t scanExclusiveLarge(uint *, uint *, uint, uint)\00", align 1
@.str69 = private unnamed_addr constant [79 x i8] c"(arrayLength >= MIN_LARGE_ARRAY_SIZE) && (arrayLength <= MAX_LARGE_ARRAY_SIZE)\00", align 1
@str9 = private unnamed_addr constant [39 x i8] c"scanExclusiveShared() execution FAILED\00"
@str10 = private unnamed_addr constant [40 x i8] c"scanExclusiveShared2() execution FAILED\00"
@str11 = private unnamed_addr constant [33 x i8] c"uniformUpdate() execution FAILED\00"
@.str8 = private unnamed_addr constant [65 x i8] c"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str19 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str210 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str119 = private unnamed_addr constant [11 x i8] c"GPU device\00", align 1

define void @scanExclusiveHost(i32* nocapture %dst, i32* nocapture %src, i32 %batchSize, i32 %arrayLength) nounwind uwtable {
entry:
  %cmp28 = icmp eq i32 %batchSize, 0, !dbg !1183
  br i1 %cmp28, label %for.end14, label %for.body.lr.ph, !dbg !1183

for.body.lr.ph:                                   ; preds = %entry
  %cmp226 = icmp ugt i32 %arrayLength, 1, !dbg !1184
  %idx.ext = zext i32 %arrayLength to i64, !dbg !1183
  br i1 %cmp226, label %for.body3.lr.ph.us, label %for.inc10

for.inc10.us:                                     ; preds = %for.body3.us
  %inc11.us = add i32 %i.031.us, 1, !dbg !1183
  %add.ptr.us = getelementptr inbounds i32* %src.addr.029.us, i64 %idx.ext, !dbg !1183
  %add.ptr13.us = getelementptr inbounds i32* %dst.addr.030.us, i64 %idx.ext, !dbg !1183
  %exitcond34 = icmp eq i32 %inc11.us, %batchSize, !dbg !1183
  br i1 %exitcond34, label %for.end14, label %for.body3.lr.ph.us, !dbg !1183

for.body3.us:                                     ; preds = %for.body3.lr.ph.us, %for.body3.us.for.body3.us_crit_edge
  %0 = phi i32 [ 0, %for.body3.lr.ph.us ], [ %.pre, %for.body3.us.for.body3.us_crit_edge ]
  %indvars.iv = phi i64 [ 1, %for.body3.lr.ph.us ], [ %indvars.iv.next, %for.body3.us.for.body3.us_crit_edge ]
  %j.027.us = phi i32 [ 1, %for.body3.lr.ph.us ], [ %inc.us, %for.body3.us.for.body3.us_crit_edge ]
  %sub.us = add i32 %j.027.us, -1, !dbg !1185
  %idxprom.us = zext i32 %sub.us to i64, !dbg !1185
  %arrayidx4.us = getelementptr inbounds i32* %src.addr.029.us, i64 %idxprom.us, !dbg !1185
  %1 = load i32* %arrayidx4.us, align 4, !dbg !1185, !tbaa !1186
  %add.us = add i32 %0, %1, !dbg !1185
  %arrayidx9.us = getelementptr inbounds i32* %dst.addr.030.us, i64 %indvars.iv, !dbg !1185
  store i32 %add.us, i32* %arrayidx9.us, align 4, !dbg !1185, !tbaa !1186
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !1184
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !1184
  %exitcond33 = icmp eq i32 %lftr.wideiv, %arrayLength, !dbg !1184
  br i1 %exitcond33, label %for.inc10.us, label %for.body3.us.for.body3.us_crit_edge, !dbg !1184

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %inc.us = add i32 %j.027.us, 1, !dbg !1184
  %idxprom.us.phi.trans.insert = zext i32 %j.027.us to i64
  %arrayidx7.us.phi.trans.insert = getelementptr inbounds i32* %dst.addr.030.us, i64 %idxprom.us.phi.trans.insert
  %.pre = load i32* %arrayidx7.us.phi.trans.insert, align 4, !dbg !1185, !tbaa !1186
  br label %for.body3.us, !dbg !1184

for.body3.lr.ph.us:                               ; preds = %for.inc10.us, %for.body.lr.ph
  %i.031.us = phi i32 [ %inc11.us, %for.inc10.us ], [ 0, %for.body.lr.ph ]
  %dst.addr.030.us = phi i32* [ %add.ptr13.us, %for.inc10.us ], [ %dst, %for.body.lr.ph ]
  %src.addr.029.us = phi i32* [ %add.ptr.us, %for.inc10.us ], [ %src, %for.body.lr.ph ]
  store i32 0, i32* %dst.addr.030.us, align 4, !dbg !1189, !tbaa !1186
  br label %for.body3.us, !dbg !1184

for.inc10:                                        ; preds = %for.inc10, %for.body.lr.ph
  %i.031 = phi i32 [ %inc11, %for.inc10 ], [ 0, %for.body.lr.ph ]
  %dst.addr.030 = phi i32* [ %add.ptr13, %for.inc10 ], [ %dst, %for.body.lr.ph ]
  store i32 0, i32* %dst.addr.030, align 4, !dbg !1189, !tbaa !1186
  %inc11 = add i32 %i.031, 1, !dbg !1183
  %add.ptr13 = getelementptr inbounds i32* %dst.addr.030, i64 %idx.ext, !dbg !1183
  %exitcond = icmp eq i32 %inc11, %batchSize, !dbg !1183
  br i1 %exitcond, label %for.end14, label %for.inc10, !dbg !1183

for.end14:                                        ; preds = %for.inc10, %for.inc10.us, %entry
  ret void, !dbg !1190
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn uwtable {
entry:
  %d_Input = alloca i32*, align 8
  %d_Output = alloca i32*, align 8
  %0 = load i8** %argv, align 8, !dbg !1191, !tbaa !1192
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str, i64 0, i64 0), i8* %0), !dbg !1191
  %puts = call i32 @puts(i8* getelementptr inbounds ([43 x i8]* @str, i64 0, i64 0)), !dbg !1193
  %call2 = call noalias i8* @malloc(i64 65536) nounwind, !dbg !1194
  %1 = bitcast i8* %call2 to i32*, !dbg !1194
  %call4 = call noalias i8* @malloc(i64 65536) nounwind, !dbg !1195
  call void @srand(i32 2009) nounwind, !dbg !1196
  br label %for.body, !dbg !1197

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %call5 = call i32 @rand() nounwind, !dbg !1198
  %arrayidx6 = getelementptr inbounds i32* %1, i64 %indvars.iv, !dbg !1198
  store i32 %call5, i32* %arrayidx6, align 4, !dbg !1198, !tbaa !1186
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !1197
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !1197
  %exitcond = icmp eq i32 %lftr.wideiv, 16384, !dbg !1197
  br i1 %exitcond, label %for.end, label %for.body, !dbg !1197

for.end:                                          ; preds = %for.body
  %puts50 = call i32 @puts(i8* getelementptr inbounds ([43 x i8]* @str16, i64 0, i64 0)), !dbg !1200
  %2 = bitcast i32** %d_Input to i8**, !dbg !1201
  %call8 = call i32 @cudaMalloc(i8** %2, i64 65536), !dbg !1201
  %3 = bitcast i32** %d_Output to i8**, !dbg !1202
  %call9 = call i32 @cudaMalloc(i8** %3, i64 65536), !dbg !1202
  %4 = load i32** %d_Input, align 8, !dbg !1203, !tbaa !1192
  %5 = bitcast i32* %4 to i8*, !dbg !1203
  %call10 = call i32 @cudaMemcpy(i8* %5, i8* %call2, i64 65536, i32 1), !dbg !1203
  %puts51 = call i32 @puts(i8* getelementptr inbounds ([29 x i8]* @str17, i64 0, i64 0)), !dbg !1204
  call void @initScan(), !dbg !1205
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([69 x i8]* @.str4, i64 0, i64 0), i32 100), !dbg !1206
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([68 x i8]* @.str5, i64 0, i64 0), i32 100), !dbg !1207
  %6 = load i32* @MIN_LARGE_ARRAY_SIZE, align 4, !dbg !1208, !tbaa !1186
  %7 = load i32* @MAX_LARGE_ARRAY_SIZE, align 4, !dbg !1208, !tbaa !1186
  %cmp1558 = icmp ugt i32 %6, %7, !dbg !1208
  br i1 %cmp1558, label %for.end32, label %for.body16, !dbg !1208

for.body16:                                       ; preds = %for.inc31, %for.end
  %arrayLength.059 = phi i32 [ %shl, %for.inc31 ], [ %6, %for.end ]
  %int_cast_to_i64 = zext i32 %arrayLength.059 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %div = udiv i32 16384, %arrayLength.059, !dbg !1209
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([45 x i8]* @.str6, i64 0, i64 0), i32 %arrayLength.059, i32 %div), !dbg !1209
  %8 = load i32** %d_Output, align 8, !dbg !1210, !tbaa !1192
  %9 = load i32** %d_Input, align 8, !dbg !1210, !tbaa !1192
  %call19 = call i64 @scanExclusiveLarge(i32* %8, i32* %9, i32 %div, i32 %arrayLength.059), !dbg !1210
  %puts52 = call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str18, i64 0, i64 0)), !dbg !1211
  %puts53 = call i32 @puts(i8* getelementptr inbounds ([28 x i8]* @str19, i64 0, i64 0)), !dbg !1212
  %10 = load i32** %d_Output, align 8, !dbg !1213, !tbaa !1192
  %11 = bitcast i32* %10 to i8*, !dbg !1213
  %call22 = call i32 @cudaMemcpy(i8* %call4, i8* %11, i64 65536, i32 2), !dbg !1213
  %puts54 = call i32 @puts(i8* getelementptr inbounds ([23 x i8]* @str20, i64 0, i64 0)), !dbg !1214
  %puts55 = call i32 @puts(i8* getelementptr inbounds ([26 x i8]* @str21, i64 0, i64 0)), !dbg !1215
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str11, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str12, i64 0, i64 0)), !dbg !1216
  %cmp28 = icmp eq i32 %arrayLength.059, %7, !dbg !1217
  br i1 %cmp28, label %if.then, label %for.inc31, !dbg !1217

if.then:                                          ; preds = %for.body16
  %putchar = call i32 @putchar(i32 10), !dbg !1218
  %putchar56 = call i32 @putchar(i32 10), !dbg !1220
  br label %for.inc31, !dbg !1221

for.inc31:                                        ; preds = %if.then, %for.body16
  %shl = shl i32 %arrayLength.059, 1, !dbg !1208
  %cmp15 = icmp ugt i32 %shl, %7, !dbg !1208
  br i1 %cmp15, label %for.end32, label %for.body16, !dbg !1208

for.end32:                                        ; preds = %for.inc31, %for.end
  %puts57 = call i32 @puts(i8* getelementptr inbounds ([17 x i8]* @str22, i64 0, i64 0)), !dbg !1222
  call void @closeScan(), !dbg !1223
  %12 = load i32** %d_Output, align 8, !dbg !1224, !tbaa !1192
  %13 = bitcast i32* %12 to i8*, !dbg !1224
  %call34 = call i32 @cudaFree(i8* %13), !dbg !1224
  %14 = load i32** %d_Input, align 8, !dbg !1225, !tbaa !1192
  %15 = bitcast i32* %14 to i8*, !dbg !1225
  %call35 = call i32 @cudaFree(i8* %15), !dbg !1225
  %call36 = call i32 @cudaDeviceReset(), !dbg !1226
  call void @exit(i32 0) noreturn nounwind, !dbg !1227
  unreachable, !dbg !1227
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind

declare noalias i8* @malloc(i64) nounwind

declare void @srand(i32) nounwind

declare i32 @rand() nounwind

declare void @exit(i32) noreturn nounwind

declare i32 @puts(i8* nocapture) nounwind

declare i32 @putchar(i32)

define void @_Z19scanExclusiveSharedP5uint4S0_j(%struct.uint4* nocapture %d_Dst, %struct.uint4* nocapture %d_Src, i32 %size) uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1228, !tbaa !1186
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1228, !tbaa !1186
  %mul = mul i32 %1, %0, !dbg !1228
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1228, !tbaa !1186
  %add = add i32 %mul, %2, !dbg !1228
  %idxprom = zext i32 %add to i64, !dbg !1229
  %arrayidx = getelementptr inbounds %struct.uint4* %d_Src, i64 %idxprom, !dbg !1229
  %idata4.sroa.0.0..cast = bitcast %struct.uint4* %arrayidx to i64*, !dbg !1229
  %idata4.sroa.0.0.copyload = load i64* %idata4.sroa.0.0..cast, align 16, !dbg !1229
  %idata4.sroa.1.8..idx = getelementptr inbounds %struct.uint4* %d_Src, i64 %idxprom, i32 2, !dbg !1229
  %idata4.sroa.1.8..cast = bitcast i32* %idata4.sroa.1.8..idx to i64*, !dbg !1229
  %idata4.sroa.1.8.copyload = load i64* %idata4.sroa.1.8..cast, align 8, !dbg !1229
  %call = tail call { i64, i64 } @_Z14scan4Exclusive5uint4PVjj(i64 %idata4.sroa.0.0.copyload, i64 %idata4.sroa.1.8.copyload, i32* getelementptr inbounds ([512 x i32]* @_ZZ19scanExclusiveSharedP5uint4S0_jE6s_Data, i64 0, i64 0), i32 %size), !dbg !1230
  %3 = extractvalue { i64, i64 } %call, 0, !dbg !1230
  %4 = extractvalue { i64, i64 } %call, 1, !dbg !1230
  %arrayidx2 = getelementptr inbounds %struct.uint4* %d_Dst, i64 %idxprom, !dbg !1231
  %odata4.sroa.0.0..cast = bitcast %struct.uint4* %arrayidx2 to i64*, !dbg !1231
  store i64 %3, i64* %odata4.sroa.0.0..cast, align 16, !dbg !1231
  %odata4.sroa.1.8..idx = getelementptr inbounds %struct.uint4* %d_Dst, i64 %idxprom, i32 2, !dbg !1231
  %odata4.sroa.1.8..cast = bitcast i32* %odata4.sroa.1.8..idx to i64*, !dbg !1231
  store i64 %4, i64* %odata4.sroa.1.8..cast, align 8, !dbg !1231
  ret void, !dbg !1232
}

define linkonce_odr { i64, i64 } @_Z14scan4Exclusive5uint4PVjj(i64 %idata4.coerce0, i64 %idata4.coerce1, i32* nocapture %s_Data, i32 %size) uwtable inlinehint section "__device__" {
entry:
  %idata4.sroa.0.4.extract.shift26.i = lshr i64 %idata4.coerce0, 32, !dbg !1233
  %add.i = add i64 %idata4.sroa.0.4.extract.shift26.i, %idata4.coerce0, !dbg !1233
  %add2.i = add i64 %add.i, %idata4.coerce1, !dbg !1235
  %idata4.sroa.1.12.extract.shift40.i = lshr i64 %idata4.coerce1, 32, !dbg !1236
  %add4.i = add i64 %add2.i, %idata4.sroa.1.12.extract.shift40.i, !dbg !1236
  %idata4.sroa.1.12.extract.trunc33.i = trunc i64 %add4.i to i32, !dbg !1237
  %div.i = lshr i32 %size, 2, !dbg !1237
  %0 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1238, !tbaa !1186
  %mul.i.i.i = shl i32 %0, 1, !dbg !1238
  %sub.i.i.i = add i32 %div.i, -1, !dbg !1238
  %and.i.i.i = and i32 %0, %sub.i.i.i, !dbg !1238
  %sub1.i.i.i = sub i32 %mul.i.i.i, %and.i.i.i, !dbg !1238
  %idxprom.i.i.i = zext i32 %sub1.i.i.i to i64, !dbg !1241
  %arrayidx.i.i.i = getelementptr inbounds i32* %s_Data, i64 %idxprom.i.i.i, !dbg !1241
  store volatile i32 0, i32* %arrayidx.i.i.i, align 4, !dbg !1241, !tbaa !1186
  %add.i.i.i = add i32 %sub1.i.i.i, %div.i, !dbg !1242
  %idxprom2.i.i.i = zext i32 %add.i.i.i to i64, !dbg !1243
  %arrayidx3.i.i.i = getelementptr inbounds i32* %s_Data, i64 %idxprom2.i.i.i, !dbg !1243
  store volatile i32 %idata4.sroa.1.12.extract.trunc33.i, i32* %arrayidx3.i.i.i, align 4, !dbg !1243, !tbaa !1186
  %cmp29.i.i.i = icmp ugt i32 %size, 7, !dbg !1244
  br i1 %cmp29.i.i.i, label %for.body.i.i.i, label %_Z14scan4Inclusive5uint4PVjj.exit, !dbg !1244

for.body.i.i.i:                                   ; preds = %for.body.i.i.i, %entry
  %offset.030.i.i.i = phi i32 [ %shl.i.i.i, %for.body.i.i.i ], [ 1, %entry ]
  tail call void @__syncthreads(), !dbg !1245
  %1 = load volatile i32* %arrayidx3.i.i.i, align 4, !dbg !1246, !tbaa !1186
  %sub6.i.i.i = sub i32 %add.i.i.i, %offset.030.i.i.i, !dbg !1246
  %idxprom7.i.i.i = zext i32 %sub6.i.i.i to i64, !dbg !1246
  %arrayidx8.i.i.i = getelementptr inbounds i32* %s_Data, i64 %idxprom7.i.i.i, !dbg !1246
  %2 = load volatile i32* %arrayidx8.i.i.i, align 4, !dbg !1246, !tbaa !1186
  %add9.i.i.i = add i32 %2, %1, !dbg !1246
  tail call void @__syncthreads(), !dbg !1247
  store volatile i32 %add9.i.i.i, i32* %arrayidx3.i.i.i, align 4, !dbg !1248, !tbaa !1186
  %shl.i.i.i = shl i32 %offset.030.i.i.i, 1, !dbg !1244
  %cmp.i.i.i = icmp ult i32 %shl.i.i.i, %div.i, !dbg !1244
  br i1 %cmp.i.i.i, label %for.body.i.i.i, label %_Z14scan4Inclusive5uint4PVjj.exit, !dbg !1244

_Z14scan4Inclusive5uint4PVjj.exit:                ; preds = %for.body.i.i.i, %entry
  %3 = load volatile i32* %arrayidx3.i.i.i, align 4, !dbg !1249, !tbaa !1186
  %sub.i.i = sub i32 %3, %idata4.sroa.1.12.extract.trunc33.i, !dbg !1239
  %idata4.sroa.0.0.extract.trunc.i = trunc i64 %idata4.coerce0 to i32, !dbg !1250
  %add7.i = add i32 %sub.i.i, %idata4.sroa.0.0.extract.trunc.i, !dbg !1250
  %idata4.sroa.0.0.insert.ext.i = zext i32 %add7.i to i64, !dbg !1250
  %idata4.sroa.0.4.extract.trunc.i = trunc i64 %add.i to i32, !dbg !1251
  %add9.i = add i32 %sub.i.i, %idata4.sroa.0.4.extract.trunc.i, !dbg !1251
  %idata4.sroa.0.4.insert.ext.i = zext i32 %add9.i to i64, !dbg !1251
  %idata4.sroa.0.4.insert.shift.i = shl nuw i64 %idata4.sroa.0.4.insert.ext.i, 32, !dbg !1251
  %idata4.sroa.0.4.insert.insert.i = or i64 %idata4.sroa.0.4.insert.shift.i, %idata4.sroa.0.0.insert.ext.i, !dbg !1251
  %idata4.sroa.1.8.extract.trunc.i = trunc i64 %add2.i to i32, !dbg !1252
  %add11.i = add i32 %sub.i.i, %idata4.sroa.1.8.extract.trunc.i, !dbg !1252
  %idata4.sroa.1.8.insert.ext.i = zext i32 %add11.i to i64, !dbg !1252
  %idata4.sroa.1.12.insert.ext.i = zext i32 %3 to i64, !dbg !1253
  %idata4.sroa.1.12.insert.shift.i = shl nuw i64 %idata4.sroa.1.12.insert.ext.i, 32, !dbg !1253
  %idata4.sroa.1.12.insert.insert.i = or i64 %idata4.sroa.1.8.insert.ext.i, %idata4.sroa.1.12.insert.shift.i, !dbg !1253
  %sub = sub i64 %idata4.sroa.0.0.insert.ext.i, %idata4.coerce0, !dbg !1254
  %retval.sroa.0.0.insert.ext = and i64 %sub, 4294967295, !dbg !1254
  %idata4.sroa.0.4.extract.shift = and i64 %idata4.coerce0, -4294967296, !dbg !1255
  %retval.sroa.0.4.extract.shift14 = sub i64 %idata4.sroa.0.4.insert.insert.i, %idata4.sroa.0.4.extract.shift, !dbg !1255
  %retval.sroa.0.4.insert.shift = and i64 %retval.sroa.0.4.extract.shift14, -4294967296, !dbg !1255
  %retval.sroa.0.4.insert.insert = or i64 %retval.sroa.0.4.insert.shift, %retval.sroa.0.0.insert.ext, !dbg !1255
  %sub5 = sub i64 %idata4.sroa.1.8.insert.ext.i, %idata4.coerce1, !dbg !1256
  %retval.sroa.1.8.insert.ext = and i64 %sub5, 4294967295, !dbg !1256
  %idata4.sroa.1.12.extract.shift = and i64 %idata4.coerce1, -4294967296, !dbg !1257
  %retval.sroa.1.12.extract.shift16 = sub i64 %idata4.sroa.1.12.insert.insert.i, %idata4.sroa.1.12.extract.shift, !dbg !1257
  %retval.sroa.1.12.insert.shift = and i64 %retval.sroa.1.12.extract.shift16, -4294967296, !dbg !1257
  %retval.sroa.1.12.insert.insert = or i64 %retval.sroa.1.12.insert.shift, %retval.sroa.1.8.insert.ext, !dbg !1257
  %.fca.0.insert = insertvalue { i64, i64 } undef, i64 %retval.sroa.0.4.insert.insert, 0, !dbg !1258
  %.fca.1.insert = insertvalue { i64, i64 } %.fca.0.insert, i64 %retval.sroa.1.12.insert.insert, 1, !dbg !1258
  ret { i64, i64 } %.fca.1.insert, !dbg !1258
}

define void @_Z20scanExclusiveShared2PjS_S_jj(i32* nocapture %d_Buf, i32* nocapture %d_Dst, i32* nocapture %d_Src, i32 %N, i32 %arrayLength) uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1259, !tbaa !1186
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1259, !tbaa !1186
  %mul = mul i32 %1, %0, !dbg !1259
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1259, !tbaa !1186
  %add = add i32 %mul, %2, !dbg !1259
  %cmp = icmp ult i32 %add, %N, !dbg !1260
  br i1 %cmp, label %if.then, label %if.end, !dbg !1260

if.then:                                          ; preds = %entry
  %mul1 = shl i32 %add, 10, !dbg !1261
  %add218 = or i32 %mul1, 1023, !dbg !1261
  %idxprom = zext i32 %add218 to i64, !dbg !1261
  %arrayidx = getelementptr inbounds i32* %d_Dst, i64 %idxprom, !dbg !1261
  %3 = load i32* %arrayidx, align 4, !dbg !1261, !tbaa !1186
  %arrayidx6 = getelementptr inbounds i32* %d_Src, i64 %idxprom, !dbg !1261
  %4 = load i32* %arrayidx6, align 4, !dbg !1261, !tbaa !1186
  %add7 = add i32 %4, %3, !dbg !1261
  br label %if.end, !dbg !1261

if.end:                                           ; preds = %if.then, %entry
  %idata.0 = phi i32 [ %add7, %if.then ], [ 0, %entry ]
  %mul.i.i = shl i32 %2, 1, !dbg !1262
  %sub.i.i = add i32 %arrayLength, -1, !dbg !1262
  %and.i.i = and i32 %2, %sub.i.i, !dbg !1262
  %sub1.i.i = sub i32 %mul.i.i, %and.i.i, !dbg !1262
  %idxprom.i.i = zext i32 %sub1.i.i to i64, !dbg !1265
  %arrayidx.i.i = getelementptr inbounds [512 x i32]* @_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, i64 0, i64 %idxprom.i.i, !dbg !1265
  store volatile i32 0, i32* %arrayidx.i.i, align 4, !dbg !1265, !tbaa !1186
  %add.i.i = add i32 %sub1.i.i, %arrayLength, !dbg !1266
  %idxprom2.i.i = zext i32 %add.i.i to i64, !dbg !1267
  %arrayidx3.i.i = getelementptr inbounds [512 x i32]* @_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, i64 0, i64 %idxprom2.i.i, !dbg !1267
  store volatile i32 %idata.0, i32* %arrayidx3.i.i, align 4, !dbg !1267, !tbaa !1186
  %cmp29.i.i = icmp ugt i32 %arrayLength, 1, !dbg !1268
  br i1 %cmp29.i.i, label %for.body.i.i, label %_Z14scan1ExclusivejPVjj.exit, !dbg !1268

for.body.i.i:                                     ; preds = %for.body.i.i, %if.end
  %offset.030.i.i = phi i32 [ %shl.i.i, %for.body.i.i ], [ 1, %if.end ]
  tail call void @__syncthreads(), !dbg !1269
  %5 = load volatile i32* %arrayidx3.i.i, align 4, !dbg !1270, !tbaa !1186
  %sub6.i.i = sub i32 %add.i.i, %offset.030.i.i, !dbg !1270
  %idxprom7.i.i = zext i32 %sub6.i.i to i64, !dbg !1270
  %arrayidx8.i.i = getelementptr inbounds [512 x i32]* @_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data, i64 0, i64 %idxprom7.i.i, !dbg !1270
  %6 = load volatile i32* %arrayidx8.i.i, align 4, !dbg !1270, !tbaa !1186
  %add9.i.i = add i32 %6, %5, !dbg !1270
  tail call void @__syncthreads(), !dbg !1271
  store volatile i32 %add9.i.i, i32* %arrayidx3.i.i, align 4, !dbg !1272, !tbaa !1186
  %shl.i.i = shl i32 %offset.030.i.i, 1, !dbg !1268
  %cmp.i.i = icmp ult i32 %shl.i.i, %arrayLength, !dbg !1268
  br i1 %cmp.i.i, label %for.body.i.i, label %_Z14scan1ExclusivejPVjj.exit, !dbg !1268

_Z14scan1ExclusivejPVjj.exit:                     ; preds = %for.body.i.i, %if.end
  %7 = load volatile i32* %arrayidx3.i.i, align 4, !dbg !1273, !tbaa !1186
  br i1 %cmp, label %if.then9, label %if.end12, !dbg !1274

if.then9:                                         ; preds = %_Z14scan1ExclusivejPVjj.exit
  %sub.i = sub i32 %7, %idata.0, !dbg !1263
  %idxprom10 = zext i32 %add to i64, !dbg !1275
  %arrayidx11 = getelementptr inbounds i32* %d_Buf, i64 %idxprom10, !dbg !1275
  store i32 %sub.i, i32* %arrayidx11, align 4, !dbg !1275, !tbaa !1186
  br label %if.end12, !dbg !1277

if.end12:                                         ; preds = %if.then9, %_Z14scan1ExclusivejPVjj.exit
  ret void, !dbg !1278
}

define void @_Z13uniformUpdateP5uint4Pj(%struct.uint4* nocapture %d_Data, i32* nocapture %d_Buffer) uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1279, !tbaa !1186
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1279, !tbaa !1186
  %mul = mul i32 %1, %0, !dbg !1279
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1279, !tbaa !1186
  %add = add i32 %mul, %2, !dbg !1279
  %cmp = icmp eq i32 %2, 0, !dbg !1280
  br i1 %cmp, label %if.then, label %if.end, !dbg !1280

if.then:                                          ; preds = %entry
  %idxprom = zext i32 %0 to i64, !dbg !1281
  %arrayidx = getelementptr inbounds i32* %d_Buffer, i64 %idxprom, !dbg !1281
  %3 = load i32* %arrayidx, align 4, !dbg !1281, !tbaa !1186
  store i32 %3, i32* @_ZZ13uniformUpdateP5uint4PjE3buf, align 4, !dbg !1281, !tbaa !1186
  br label %if.end, !dbg !1283

if.end:                                           ; preds = %if.then, %entry
  tail call void @__syncthreads(), !dbg !1284
  %idxprom1 = zext i32 %add to i64, !dbg !1285
  %data4.sroa.0.0..idx9 = getelementptr inbounds %struct.uint4* %d_Data, i64 %idxprom1, i32 0, !dbg !1285
  %data4.sroa.0.0.copyload10 = load i32* %data4.sroa.0.0..idx9, align 16, !dbg !1285
  %data4.sroa.1.4..idx12 = getelementptr inbounds %struct.uint4* %d_Data, i64 %idxprom1, i32 1, !dbg !1285
  %data4.sroa.1.4.copyload13 = load i32* %data4.sroa.1.4..idx12, align 4, !dbg !1285
  %data4.sroa.2.8..idx15 = getelementptr inbounds %struct.uint4* %d_Data, i64 %idxprom1, i32 2, !dbg !1285
  %data4.sroa.2.8.copyload16 = load i32* %data4.sroa.2.8..idx15, align 8, !dbg !1285
  %data4.sroa.3.12..idx18 = getelementptr inbounds %struct.uint4* %d_Data, i64 %idxprom1, i32 3, !dbg !1285
  %data4.sroa.3.12.copyload19 = load i32* %data4.sroa.3.12..idx18, align 4, !dbg !1285
  %4 = load i32* @_ZZ13uniformUpdateP5uint4PjE3buf, align 4, !dbg !1286, !tbaa !1186
  %add3 = add i32 %4, %data4.sroa.0.0.copyload10, !dbg !1286
  %add4 = add i32 %4, %data4.sroa.1.4.copyload13, !dbg !1287
  %add5 = add i32 %4, %data4.sroa.2.8.copyload16, !dbg !1288
  %add6 = add i32 %4, %data4.sroa.3.12.copyload19, !dbg !1289
  store i32 %add3, i32* %data4.sroa.0.0..idx9, align 16, !dbg !1290
  store i32 %add4, i32* %data4.sroa.1.4..idx12, align 4, !dbg !1290
  store i32 %add5, i32* %data4.sroa.2.8..idx15, align 8, !dbg !1290
  store i32 %add6, i32* %data4.sroa.3.12..idx18, align 4, !dbg !1290
  ret void, !dbg !1291
}

declare void @__syncthreads() section "__device__"

define void @initScan() uwtable {
entry:
  %call = tail call i32 @cudaMalloc(i8** bitcast (i32** @_ZL5d_Buf to i8**), i64 262144), !dbg !1292
  ret void, !dbg !1294
}

define void @closeScan() uwtable {
entry:
  %0 = load i32** @_ZL5d_Buf, align 8, !dbg !1295, !tbaa !1192
  %1 = bitcast i32* %0 to i8*, !dbg !1295
  %call = tail call i32 @cudaFree(i8* %1), !dbg !1295
  ret void, !dbg !1297
}

define i64 @scanExclusiveShort(i32* nocapture %d_Dst, i32* nocapture %d_Src, i32 %batchSize, i32 %arrayLength) uwtable {
entry:
  %tobool.i = icmp eq i32 %arrayLength, 0, !dbg !1298
  br i1 %tobool.i, label %cond.false, label %for.cond.preheader.i, !dbg !1298

for.cond.preheader.i:                             ; preds = %entry
  %and4.i = and i32 %arrayLength, 1, !dbg !1301
  %cmp5.i = icmp eq i32 %and4.i, 0, !dbg !1301
  br i1 %cmp5.i, label %for.inc.i, label %_ZL12factorRadix2Rjj.exit, !dbg !1301

for.inc.i:                                        ; preds = %for.inc.i, %for.cond.preheader.i
  %L.addr.06.i = phi i32 [ %shr.i, %for.inc.i ], [ %arrayLength, %for.cond.preheader.i ]
  %shr.i = lshr i32 %L.addr.06.i, 1, !dbg !1301
  %and.i = and i32 %shr.i, 1, !dbg !1301
  %cmp.i = icmp eq i32 %and.i, 0, !dbg !1301
  br i1 %cmp.i, label %for.inc.i, label %_ZL12factorRadix2Rjj.exit, !dbg !1301

_ZL12factorRadix2Rjj.exit:                        ; preds = %for.inc.i, %for.cond.preheader.i
  %retval.0.i = phi i32 [ %arrayLength, %for.cond.preheader.i ], [ %shr.i, %for.inc.i ]
  %cmp = icmp eq i32 %retval.0.i, 1, !dbg !1304
  br i1 %cmp, label %cond.end, label %cond.false, !dbg !1304

cond.false:                                       ; preds = %_ZL12factorRadix2Rjj.exit, %entry
  tail call void @__assert_fail(i8* getelementptr inbounds ([28 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 209, i8* getelementptr inbounds ([54 x i8]* @__PRETTY_FUNCTION__.scanExclusiveShort, i64 0, i64
  unreachable, !dbg !1304

cond.end:                                         ; preds = %_ZL12factorRadix2Rjj.exit
  %arrayLength.off = add i32 %arrayLength, -4, !dbg !1305
  %0 = icmp ult i32 %arrayLength.off, 1021, !dbg !1305
  br i1 %0, label %cond.end5, label %cond.false4, !dbg !1305

cond.false4:                                      ; preds = %cond.end
  tail call void @__assert_fail(i8* getelementptr inbounds ([79 x i8]* @.str2, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 212, i8* getelementptr inbounds ([54 x i8]* @__PRETTY_FUNCTION__.scanExclusiveShort, i64 0, i64
  unreachable, !dbg !1305

cond.end5:                                        ; preds = %cond.end
  %mul = mul i32 %arrayLength, %batchSize, !dbg !1306
  %cmp6 = icmp ult i32 %mul, 67108865, !dbg !1306
  br i1 %cmp6, label %cond.end9, label %cond.false8, !dbg !1306

cond.false8:                                      ; preds = %cond.end5
  tail call void @__assert_fail(i8* getelementptr inbounds ([48 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 215, i8* getelementptr inbounds ([54 x i8]* @__PRETTY_FUNCTION__.scanExclusiveShort, i64 0, i64
  unreachable, !dbg !1306

cond.end9:                                        ; preds = %cond.end5
  %rem = and i32 %mul, 1023, !dbg !1307
  %cmp11 = icmp eq i32 %rem, 0, !dbg !1307
  br i1 %cmp11, label %cond.end14, label %cond.false13, !dbg !1307

cond.false13:                                     ; preds = %cond.end9
  tail call void @__assert_fail(i8* getelementptr inbounds ([43 x i8]* @.str48, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 218, i8* getelementptr inbounds ([54 x i8]* @__PRETTY_FUNCTION__.scanExclusiveShort, i64 0, i6
  unreachable, !dbg !1307

cond.end14:                                       ; preds = %cond.end9
  %div = lshr i32 %mul, 10, !dbg !1308
  %agg.tmp.sroa.0.0.insert.ext = zext i32 %div to i64, !dbg !1310
  %agg.tmp.sroa.0.4.insert.insert = or i64 %agg.tmp.sroa.0.0.insert.ext, 4294967296, !dbg !1310
  tail call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %agg.tmp.sroa.0.4.insert.insert, i32 1, i64 4294967552, i32 1), !dbg !1308
  %1 = bitcast i32* %d_Dst to %struct.uint4*, !dbg !1312
  %2 = bitcast i32* %d_Src to %struct.uint4*, !dbg !1312
  tail call void @_Z19scanExclusiveSharedP5uint4S0_j(%struct.uint4* %1, %struct.uint4* %2, i32 %arrayLength), !dbg !1312
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8]* @str9, i64 0, i64 0)), !dbg !1313
  ret i64 256, !dbg !1314
}

declare void @__assert_fail(i8*, i8*, i32, i8*) noreturn nounwind

declare void @__set_CUDAConfig(i64, i32, i64, i32, ...)

define i64 @scanExclusiveLarge(i32* nocapture %d_Dst, i32* nocapture %d_Src, i32 %batchSize, i32 %arrayLength) uwtable {
entry:
  %tobool.i = icmp eq i32 %arrayLength, 0, !dbg !1315
  br i1 %tobool.i, label %cond.false, label %for.cond.preheader.i, !dbg !1315

for.cond.preheader.i:                             ; preds = %entry
  %and4.i = and i32 %arrayLength, 1, !dbg !1317
  %cmp5.i = icmp eq i32 %and4.i, 0, !dbg !1317
  br i1 %cmp5.i, label %for.inc.i, label %_ZL12factorRadix2Rjj.exit, !dbg !1317

for.inc.i:                                        ; preds = %for.inc.i, %for.cond.preheader.i
  %L.addr.06.i = phi i32 [ %shr.i, %for.inc.i ], [ %arrayLength, %for.cond.preheader.i ]
  %shr.i = lshr i32 %L.addr.06.i, 1, !dbg !1317
  %and.i = and i32 %shr.i, 1, !dbg !1317
  %cmp.i = icmp eq i32 %and.i, 0, !dbg !1317
  br i1 %cmp.i, label %for.inc.i, label %_ZL12factorRadix2Rjj.exit, !dbg !1317

_ZL12factorRadix2Rjj.exit:                        ; preds = %for.inc.i, %for.cond.preheader.i
  %retval.0.i = phi i32 [ %arrayLength, %for.cond.preheader.i ], [ %shr.i, %for.inc.i ]
  %cmp = icmp eq i32 %retval.0.i, 1, !dbg !1318
  br i1 %cmp, label %cond.end, label %cond.false, !dbg !1318

cond.false:                                       ; preds = %_ZL12factorRadix2Rjj.exit, %entry
  tail call void @__assert_fail(i8* getelementptr inbounds ([28 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 243, i8* getelementptr inbounds ([54 x i8]* @__PRETTY_FUNCTION__.scanExclusiveLarge, i64 0, i64
  unreachable, !dbg !1318

cond.end:                                         ; preds = %_ZL12factorRadix2Rjj.exit
  %arrayLength.off = add i32 %arrayLength, -2048, !dbg !1319
  %0 = icmp ult i32 %arrayLength.off, 260097, !dbg !1319
  br i1 %0, label %cond.end5, label %cond.false4, !dbg !1319

cond.false4:                                      ; preds = %cond.end
  tail call void @__assert_fail(i8* getelementptr inbounds ([79 x i8]* @.str69, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 246, i8* getelementptr inbounds ([54 x i8]* @__PRETTY_FUNCTION__.scanExclusiveLarge, i64 0, i6
  unreachable, !dbg !1319

cond.end5:                                        ; preds = %cond.end
  %mul = mul i32 %arrayLength, %batchSize, !dbg !1320
  %cmp6 = icmp ult i32 %mul, 67108865, !dbg !1320
  br i1 %cmp6, label %cond.end9, label %cond.false8, !dbg !1320

cond.false8:                                      ; preds = %cond.end5
  tail call void @__assert_fail(i8* getelementptr inbounds ([48 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 249, i8* getelementptr inbounds ([54 x i8]* @__PRETTY_FUNCTION__.scanExclusiveLarge, i64 0, i64
  unreachable, !dbg !1320

cond.end9:                                        ; preds = %cond.end5
  %div = lshr i32 %mul, 10, !dbg !1321
  %agg.tmp.sroa.0.0.insert.ext = zext i32 %div to i64, !dbg !1323
  %agg.tmp.sroa.0.4.insert.insert = or i64 %agg.tmp.sroa.0.0.insert.ext, 4294967296, !dbg !1323
  tail call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %agg.tmp.sroa.0.4.insert.insert, i32 1, i64 4294967552, i32 1), !dbg !1321
  %1 = bitcast i32* %d_Dst to %struct.uint4*, !dbg !1325
  %2 = bitcast i32* %d_Src to %struct.uint4*, !dbg !1325
  tail call void @_Z19scanExclusiveSharedP5uint4S0_j(%struct.uint4* %1, %struct.uint4* %2, i32 1024), !dbg !1325
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([39 x i8]* @str9, i64 0, i64 0)), !dbg !1326
  %rem.i = and i32 %div, 255, !dbg !1327
  %div.i = lshr i32 %mul, 18, !dbg !1327
  %not.cmp.i = icmp ne i32 %rem.i, 0, !dbg !1327
  %add.i = zext i1 %not.cmp.i to i32, !dbg !1327
  %cond.i = add i32 %add.i, %div.i, !dbg !1327
  %agg.tmp16.sroa.0.0.insert.ext = zext i32 %cond.i to i64, !dbg !1330
  %agg.tmp16.sroa.0.4.insert.insert = or i64 %agg.tmp16.sroa.0.0.insert.ext, 4294967296, !dbg !1330
  tail call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %agg.tmp16.sroa.0.4.insert.insert, i32 1, i64 4294967552, i32 1), !dbg !1332
  %3 = load i32** @_ZL5d_Buf, align 8, !dbg !1334, !tbaa !1192
  %div20 = lshr i32 %arrayLength, 10, !dbg !1334
  tail call void @_Z20scanExclusiveShared2PjS_S_jj(i32* %3, i32* %d_Dst, i32* %d_Src, i32 %div, i32 %div20), !dbg !1334
  %puts63 = tail call i32 @puts(i8* getelementptr inbounds ([40 x i8]* @str10, i64 0, i64 0)), !dbg !1335
  tail call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %agg.tmp.sroa.0.4.insert.insert, i32 1, i64 4294967552, i32 1), !dbg !1336
  %4 = load i32** @_ZL5d_Buf, align 8, !dbg !1338, !tbaa !1192
  tail call void @_Z13uniformUpdateP5uint4Pj(%struct.uint4* %1, i32* %4), !dbg !1338
  %puts64 = tail call i32 @puts(i8* getelementptr inbounds ([33 x i8]* @str11, i64 0, i64 0)), !dbg !1339
  ret i64 256, !dbg !1340
}

define void @klee_div_zero_check(i64 %z) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %z, 0, !dbg !1341
  br i1 %cmp, label %if.then, label %if.end, !dbg !1341

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([65 x i8]* @.str8, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str210, i64 0, i64 0)) noreturn nounwind, !db
  unreachable, !dbg !1343

if.end:                                           ; preds = %entry
  ret void, !dbg !1344
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !1345
  br i1 %cmp3, label %while.end, label %while.body, !dbg !1345

while.body:                                       ; preds = %while.body, %entry
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %srcaddr, %entry ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %destaddr, %entry ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %len, %entry ]
  %dec = add i64 %len.addr.04, -1, !dbg !1345
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !1346
  %0 = load i8* %src.06, align 1, !dbg !1346, !tbaa !1187
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !1346
  store i8 %0, i8* %dest.05, align 1, !dbg !1346, !tbaa !1187
  %cmp = icmp eq i64 %dec, 0, !dbg !1345
  br i1 %cmp, label %while.end, label %while.body, !dbg !1345

while.end:                                        ; preds = %while.body, %entry
  ret i8* %destaddr, !dbg !1347
}

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
entry:
  %cmp2 = icmp eq i64 %count, 0, !dbg !1348
  br i1 %cmp2, label %while.end, label %while.body.lr.ph, !dbg !1348

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %s to i8, !dbg !1349
  br label %while.body, !dbg !1348

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %a.04 = phi i8* [ %dst, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %count.addr.03 = phi i64 [ %count, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i64 %count.addr.03, -1, !dbg !1348
  %incdec.ptr = getelementptr inbounds i8* %a.04, i64 1, !dbg !1349
  store volatile i8 %conv, i8* %a.04, align 1, !dbg !1349, !tbaa !1187
  %cmp = icmp eq i64 %dec, 0, !dbg !1348
  br i1 %cmp, label %while.end, label %while.body, !dbg !1348

while.end:                                        ; preds = %while.body, %entry
  ret i8* %dst, !dbg !1350
}

define i32 @cudaChooseDevice(i32* nocapture %device, %struct.cudaDeviceProp* nocapture %prop) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !1351, !tbaa !1186
  ret i32 0, !dbg !1353
}

define i32 @cudaDeviceGetByPCIBusId(i32* nocapture %device, i8* nocapture %pciBusId) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !1354, !tbaa !1186
  ret i32 0, !dbg !1356
}

define i32 @cudaDeviceGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1357
}

define i32 @cudaDeviceGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1359
}

define i32 @cudaDeviceGetPCIBusId(i8* nocapture %pciBusId, i32 %len, i32 %device) nounwind uwtable {
entry:
  %0 = bitcast i8* %pciBusId to i32*, !dbg !1361
  store i32 3171433, i32* %0, align 1, !dbg !1361
  ret i32 0, !dbg !1363
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @cudaDeviceReset() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1364
}

define i32 @cudaDeviceSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1366
}

define i32 @cudaDeviceSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1368
}

define i32 @cudaDeviceSynchronize() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1370
}

define i32 @cudaGetDevice(i32* nocapture %device) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !1372, !tbaa !1186
  ret i32 0, !dbg !1374
}

define i32 @cudaGetDeviceCount(i32* nocapture %count) nounwind uwtable {
entry:
  store i32 1, i32* %count, align 4, !dbg !1375, !tbaa !1186
  ret i32 0, !dbg !1377
}

define i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nocapture %prop, i32 %device) nounwind uwtable {
entry:
  %arraydecay = getelementptr inbounds %struct.cudaDeviceProp* %prop, i64 0, i32 0, i64 0, !dbg !1378
  %0 = call i8* @memcpy(i8* %arraydecay, i8* getelementptr inbounds ([11 x i8]* @.str119, i64 0, i64 0), i64 11)
  ret i32 0, !dbg !1380
}

define i32 @cudaIpcCloseMemHandle(i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1381
}

define i32 @cudaIpcGetEventHandle(%struct.cudaIpcEventHandle_st* nocapture %handle, %struct.CUevent_st* nocapture %event) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1383
}

define i32 @cudaIpcGetMemHandle(%struct.cudaIpcMemHandle_st* nocapture %handle, i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1385
}

define i32 @cudaIpcOpenEventHandle(%struct.CUevent_st** nocapture %event, %struct.cudaIpcEventHandle_st* nocapture byval align 8 %handle) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1387
}

define i32 @cudaIpcOpenMemHandle(i8** nocapture %devPtr, %struct.cudaIpcMemHandle_st* nocapture byval align 8 %handle, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1389
}

define i32 @cudaSetDevice(i32 %device) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1391
}

define i32 @cudaSetDeviceFlags(i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1393
}

define i32 @cudaSetValidDevices(i32* nocapture %device_arr, i32 %len) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1395
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1397
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
entry:
  tail call void @free(i8* %devPtr) nounwind, !dbg !1399
  ret i32 0, !dbg !1401
}

declare void @free(i8* nocapture) nounwind

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
entry:
  %0 = bitcast %struct.cudaArray* %array to i8*, !dbg !1402
  tail call void @free(i8* %0) nounwind, !dbg !1402
  ret i32 0, !dbg !1404
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
entry:
  tail call void @free(i8* %ptr) nounwind, !dbg !1405
  ret i32 0, !dbg !1407
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1408
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1410
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1412
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1414
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1416
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1418
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1420
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
entry:
  tail call void @__set_device(), !dbg !1422
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1424
  store i8* %call, i8** %devPtr, align 8, !dbg !1424, !tbaa !1192
  tail call void @__clear_device(), !dbg !1425
  ret i32 0, !dbg !1426
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1427
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1429
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1431
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
entry:
  tail call void @__set_host(), !dbg !1433
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1435
  store i8* %call, i8** %ptr, align 8, !dbg !1435, !tbaa !1192
  tail call void @__clear_host(), !dbg !1436
  ret i32 0, !dbg !1437
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1438
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1440
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1442
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1444
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1446
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1448
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1450
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1452
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1454
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1456
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1458
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1460
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1462
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1464
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1466
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1468
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1470
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1472
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1474
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1476
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1478
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1480
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1482
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
entry:
  %add.ptr = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !1484
  %0 = call i8* @memcpy(i8* %add.ptr, i8* %src, i64 %count)
  ret i32 0, !dbg !1486
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1487
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1489
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
entry:
  %0 = trunc i32 %value to i8, !dbg !1491
  %1 = zext i8 %0 to i32
  %2 = call i8* @memset(i8* %devPtr, i32 %1, i64 %count)
  ret i32 0, !dbg !1493
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1494
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1496
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1498
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1500
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1502
}

!llvm.dbg.cu = !{!0, !24, !75, !293, !304, !325, !341, !358, !667}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"scan_gold.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32 0, metadata !1, met
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"scanExclusiveHost", metadata !"scanExclusiveHost", metadata !"", metadata !6, i32 29, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, i32*, i32, i32)* @scanExclu
!6 = metadata !{i32 786473, metadata !"scan_gold.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !10, metadata !10}
!9 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint]
!10 = metadata !{i32 786454, null, metadata !"uint", metadata !6, i32 20, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [uint] [line 20, size 0, align 0, offset 0] [from unsigned int]
!11 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!12 = metadata !{metadata !13}
!13 = metadata !{metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !21}
!14 = metadata !{i32 786689, metadata !5, metadata !"dst", metadata !6, i32 16777246, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 30]
!15 = metadata !{i32 786689, metadata !5, metadata !"src", metadata !6, i32 33554463, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 31]
!16 = metadata !{i32 786689, metadata !5, metadata !"batchSize", metadata !6, i32 50331680, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [batchSize] [line 32]
!17 = metadata !{i32 786689, metadata !5, metadata !"arrayLength", metadata !6, i32 67108897, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arrayLength] [line 33]
!18 = metadata !{i32 786688, metadata !19, metadata !"i", metadata !6, i32 36, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 36]
!19 = metadata !{i32 786443, metadata !20, i32 36, i32 0, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan_gold.cpp]
!20 = metadata !{i32 786443, metadata !5, i32 35, i32 0, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan_gold.cpp]
!21 = metadata !{i32 786688, metadata !22, metadata !"j", metadata !6, i32 40, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 40]
!22 = metadata !{i32 786443, metadata !23, i32 40, i32 0, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan_gold.cpp]
!23 = metadata !{i32 786443, metadata !19, i32 37, i32 0, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan_gold.cpp]
!24 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32 0, metadata !25, metada
!25 = metadata !{metadata !26}
!26 = metadata !{metadata !27}
!27 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !28, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !29, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!28 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan", null} ; [ DW_TAG_file_type ]
!29 = metadata !{metadata !30, metadata !31, metadata !32, metadata !33, metadata !34}
!30 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!31 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!32 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!33 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!34 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!35 = metadata !{metadata !36}
!36 = metadata !{metadata !37}
!37 = metadata !{i32 786478, i32 0, metadata !38, metadata !"main", metadata !"main", metadata !"", metadata !38, i32 22, metadata !39, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !45, i32 23} ; [
!38 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan", null} ; [ DW_TAG_file_type ]
!39 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !40, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!40 = metadata !{metadata !41, metadata !41, metadata !42}
!41 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!42 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !43} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!43 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !44} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!44 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!45 = metadata !{metadata !46}
!46 = metadata !{metadata !47, metadata !48, metadata !49, metadata !53, metadata !54, metadata !55, metadata !56, metadata !57, metadata !59, metadata !61, metadata !62, metadata !65, metadata !67, metadata !69}
!47 = metadata !{i32 786689, metadata !37, metadata !"argc", metadata !38, i32 16777238, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 22]
!48 = metadata !{i32 786689, metadata !37, metadata !"argv", metadata !38, i32 33554454, metadata !42, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 22]
!49 = metadata !{i32 786688, metadata !50, metadata !"d_Input", metadata !38, i32 29, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d_Input] [line 29]
!50 = metadata !{i32 786443, metadata !37, i32 23, i32 0, metadata !38, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/main.cpp]
!51 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !52} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint]
!52 = metadata !{i32 786454, null, metadata !"uint", metadata !38, i32 20, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [uint] [line 20, size 0, align 0, offset 0] [from unsigned int]
!53 = metadata !{i32 786688, metadata !50, metadata !"d_Output", metadata !38, i32 29, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [d_Output] [line 29]
!54 = metadata !{i32 786688, metadata !50, metadata !"h_Input", metadata !38, i32 30, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h_Input] [line 30]
!55 = metadata !{i32 786688, metadata !50, metadata !"h_OutputCPU", metadata !38, i32 30, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h_OutputCPU] [line 30]
!56 = metadata !{i32 786688, metadata !50, metadata !"h_OutputGPU", metadata !38, i32 30, metadata !51, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [h_OutputGPU] [line 30]
!57 = metadata !{i32 786688, metadata !50, metadata !"N", metadata !38, i32 33, metadata !58, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [N] [line 33]
!58 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !52} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint]
!59 = metadata !{i32 786688, metadata !60, metadata !"i", metadata !38, i32 45, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 45]
!60 = metadata !{i32 786443, metadata !50, i32 45, i32 0, metadata !38, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/main.cpp]
!61 = metadata !{i32 786688, metadata !50, metadata !"globalFlag", metadata !38, i32 63, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [globalFlag] [line 63]
!62 = metadata !{i32 786688, metadata !50, metadata !"szWorkgroup", metadata !38, i32 64, metadata !63, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [szWorkgroup] [line 64]
!63 = metadata !{i32 786454, null, metadata !"size_t", metadata !38, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!64 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!65 = metadata !{i32 786688, metadata !50, metadata !"iCycles", metadata !38, i32 65, metadata !66, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iCycles] [line 65]
!66 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !41} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!67 = metadata !{i32 786688, metadata !68, metadata !"arrayLength", metadata !38, i32 122, metadata !52, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [arrayLength] [line 122]
!68 = metadata !{i32 786443, metadata !50, i32 122, i32 0, metadata !38, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/main.cpp]
!69 = metadata !{i32 786688, metadata !70, metadata !"localFlag", metadata !38, i32 148, metadata !41, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [localFlag] [line 148]
!70 = metadata !{i32 786443, metadata !68, i32 123, i32 0, metadata !38, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/main.cpp]
!71 = metadata !{metadata !72}
!72 = metadata !{metadata !73, metadata !73, metadata !73, metadata !73, metadata !73, metadata !73, metadata !73, metadata !74, metadata !74, metadata !73, metadata !73, metadata !73}
!73 = metadata !{i32 786484, i32 0, metadata !38, metadata !"N", metadata !"N", metadata !"N", metadata !38, i32 33, metadata !58, i32 1, i32 1, i32 16384} ; [ DW_TAG_variable ] [N] [line 33] [local] [def]
!74 = metadata !{i32 786484, i32 0, metadata !38, metadata !"iCycles", metadata !"iCycles", metadata !"iCycles", metadata !38, i32 65, metadata !66, i32 1, i32 1, i32 100} ; [ DW_TAG_variable ] [iCycles] [line 65] [local] [def]
!75 = metadata !{i32 786449, i32 0, i32 4, metadata !"scan.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32 0, metadata !1, metadat
!76 = metadata !{metadata !77}
!77 = metadata !{metadata !78, metadata !117, metadata !132, metadata !142, metadata !145, metadata !146, metadata !159, metadata !171, metadata !178, metadata !224, metadata !231, metadata !239, metadata !249, metadata !261, metadata !271}
!78 = metadata !{i32 786478, i32 0, metadata !79, metadata !"scanExclusiveShared", metadata !"scanExclusiveShared", metadata !"_Z19scanExclusiveSharedP5uint4S0_j", metadata !79, i32 77, metadata !80, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 tru
!79 = metadata !{i32 786473, metadata !"scan.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan", null} ; [ DW_TAG_file_type ]
!80 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !81, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!81 = metadata !{null, metadata !82, metadata !82, metadata !107}
!82 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !83} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint4]
!83 = metadata !{i32 786454, null, metadata !"uint4", metadata !79, i32 383, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_typedef ] [uint4] [line 383, size 0, align 0, offset 0] [from uint4]
!84 = metadata !{i32 786451, null, metadata !"uint4", metadata !85, i32 198, i64 128, i64 128, i32 0, i32 0, null, metadata !86, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint4] [line 198, size 128, align 128, offset 0] [from ]
!85 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan", null} ; [ DW_TAG_file_type ]
!86 = metadata !{metadata !87, metadata !88, metadata !89, metadata !90, metadata !91, metadata !97, metadata !102, metadata !103}
!87 = metadata !{i32 786445, metadata !84, metadata !"x", metadata !85, i32 200, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [x] [line 200, size 32, align 32, offset 0] [from unsigned int]
!88 = metadata !{i32 786445, metadata !84, metadata !"y", metadata !85, i32 200, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [y] [line 200, size 32, align 32, offset 32] [from unsigned int]
!89 = metadata !{i32 786445, metadata !84, metadata !"z", metadata !85, i32 200, i64 32, i64 32, i64 64, i32 0, metadata !11} ; [ DW_TAG_member ] [z] [line 200, size 32, align 32, offset 64] [from unsigned int]
!90 = metadata !{i32 786445, metadata !84, metadata !"w", metadata !85, i32 200, i64 32, i64 32, i64 96, i32 0, metadata !11} ; [ DW_TAG_member ] [w] [line 200, size 32, align 32, offset 96] [from unsigned int]
!91 = metadata !{i32 786478, i32 0, metadata !84, metadata !"uint4", metadata !"uint4", metadata !"", metadata !85, i32 198, metadata !92, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !95, i32 198} ; [ DW_TAG_subp
!92 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !93, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!93 = metadata !{null, metadata !94}
!94 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !84} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint4]
!95 = metadata !{metadata !96}
!96 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!97 = metadata !{i32 786478, i32 0, metadata !84, metadata !"uint4", metadata !"uint4", metadata !"", metadata !85, i32 198, metadata !98, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !95, i32 198} ; [ DW_TAG_subp
!98 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !99, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!99 = metadata !{null, metadata !94, metadata !100}
!100 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !101} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint4]
!102 = metadata !{i32 786478, i32 0, metadata !84, metadata !"~uint4", metadata !"~uint4", metadata !"", metadata !85, i32 198, metadata !92, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !95, i32 198} ; [ DW_TAG_s
!103 = metadata !{i32 786478, i32 0, metadata !84, metadata !"operator=", metadata !"operator=", metadata !"_ZN5uint4aSERKS_", metadata !85, i32 198, metadata !104, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !95
!104 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !105, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!105 = metadata !{metadata !106, metadata !94, metadata !100}
!106 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !84} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from uint4]
!107 = metadata !{i32 786454, null, metadata !"uint", metadata !79, i32 20, i64 0, i64 0, i64 0, i32 0, metadata !11} ; [ DW_TAG_typedef ] [uint] [line 20, size 0, align 0, offset 0] [from unsigned int]
!108 = metadata !{metadata !109}
!109 = metadata !{metadata !110, metadata !111, metadata !112, metadata !113, metadata !115, metadata !116}
!110 = metadata !{i32 786689, metadata !78, metadata !"d_Dst", metadata !79, i32 16777294, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Dst] [line 78]
!111 = metadata !{i32 786689, metadata !78, metadata !"d_Src", metadata !79, i32 33554511, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Src] [line 79]
!112 = metadata !{i32 786689, metadata !78, metadata !"size", metadata !79, i32 50331728, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 80]
!113 = metadata !{i32 786688, metadata !114, metadata !"pos", metadata !79, i32 85, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 85]
!114 = metadata !{i32 786443, metadata !78, i32 82, i32 0, metadata !79, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!115 = metadata !{i32 786688, metadata !114, metadata !"idata4", metadata !79, i32 88, metadata !83, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idata4] [line 88]
!116 = metadata !{i32 786688, metadata !114, metadata !"odata4", metadata !79, i32 91, metadata !83, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [odata4] [line 91]
!117 = metadata !{i32 786478, i32 0, metadata !79, metadata !"scanExclusiveShared2", metadata !"scanExclusiveShared2", metadata !"_Z20scanExclusiveShared2PjS_S_jj", metadata !79, i32 98, metadata !118, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 t
!118 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !119, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!119 = metadata !{null, metadata !120, metadata !120, metadata !120, metadata !107, metadata !107}
!120 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !107} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint]
!121 = metadata !{metadata !122}
!122 = metadata !{metadata !123, metadata !124, metadata !125, metadata !126, metadata !127, metadata !128, metadata !130, metadata !131}
!123 = metadata !{i32 786689, metadata !117, metadata !"d_Buf", metadata !79, i32 16777315, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Buf] [line 99]
!124 = metadata !{i32 786689, metadata !117, metadata !"d_Dst", metadata !79, i32 33554532, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Dst] [line 100]
!125 = metadata !{i32 786689, metadata !117, metadata !"d_Src", metadata !79, i32 50331749, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Src] [line 101]
!126 = metadata !{i32 786689, metadata !117, metadata !"N", metadata !79, i32 67108966, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [N] [line 102]
!127 = metadata !{i32 786689, metadata !117, metadata !"arrayLength", metadata !79, i32 83886183, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arrayLength] [line 103]
!128 = metadata !{i32 786688, metadata !129, metadata !"pos", metadata !79, i32 109, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 109]
!129 = metadata !{i32 786443, metadata !117, i32 105, i32 0, metadata !79, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!130 = metadata !{i32 786688, metadata !129, metadata !"idata", metadata !79, i32 113, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idata] [line 113]
!131 = metadata !{i32 786688, metadata !129, metadata !"odata", metadata !79, i32 121, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [odata] [line 121]
!132 = metadata !{i32 786478, i32 0, metadata !79, metadata !"uniformUpdate", metadata !"uniformUpdate", metadata !"_Z13uniformUpdateP5uint4Pj", metadata !79, i32 131, metadata !133, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (%struct.
!133 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !134, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!134 = metadata !{null, metadata !82, metadata !120}
!135 = metadata !{metadata !136}
!136 = metadata !{metadata !137, metadata !138, metadata !139, metadata !141}
!137 = metadata !{i32 786689, metadata !132, metadata !"d_Data", metadata !79, i32 16777348, metadata !82, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Data] [line 132]
!138 = metadata !{i32 786689, metadata !132, metadata !"d_Buffer", metadata !79, i32 33554565, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Buffer] [line 133]
!139 = metadata !{i32 786688, metadata !140, metadata !"pos", metadata !79, i32 137, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 137]
!140 = metadata !{i32 786443, metadata !132, i32 135, i32 0, metadata !79, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!141 = metadata !{i32 786688, metadata !140, metadata !"data4", metadata !79, i32 146, metadata !83, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [data4] [line 146]
!142 = metadata !{i32 786478, i32 0, metadata !79, metadata !"initScan", metadata !"initScan", metadata !"", metadata !79, i32 168, metadata !143, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @initScan, null, null, metadata !1, i32 1
!143 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !144, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!144 = metadata !{null}
!145 = metadata !{i32 786478, i32 0, metadata !79, metadata !"closeScan", metadata !"closeScan", metadata !"", metadata !79, i32 173, metadata !143, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ()* @closeScan, null, null, metadata !1, i3
!146 = metadata !{i32 786478, i32 0, metadata !79, metadata !"scanExclusiveShort", metadata !"scanExclusiveShort", metadata !"", metadata !79, i32 199, metadata !147, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32*, i32*, i32, i32)* @s
!147 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !148, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!148 = metadata !{metadata !149, metadata !120, metadata !120, metadata !107, metadata !107}
!149 = metadata !{i32 786454, null, metadata !"size_t", metadata !79, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!150 = metadata !{metadata !151}
!151 = metadata !{metadata !152, metadata !153, metadata !154, metadata !155, metadata !156, metadata !158}
!152 = metadata !{i32 786689, metadata !146, metadata !"d_Dst", metadata !79, i32 16777416, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Dst] [line 200]
!153 = metadata !{i32 786689, metadata !146, metadata !"d_Src", metadata !79, i32 33554633, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Src] [line 201]
!154 = metadata !{i32 786689, metadata !146, metadata !"batchSize", metadata !79, i32 50331850, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [batchSize] [line 202]
!155 = metadata !{i32 786689, metadata !146, metadata !"arrayLength", metadata !79, i32 67109067, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arrayLength] [line 203]
!156 = metadata !{i32 786688, metadata !157, metadata !"log2L", metadata !79, i32 207, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [log2L] [line 207]
!157 = metadata !{i32 786443, metadata !146, i32 205, i32 0, metadata !79, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!158 = metadata !{i32 786688, metadata !157, metadata !"factorizationRemainder", metadata !79, i32 208, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [factorizationRemainder] [line 208]
!159 = metadata !{i32 786478, i32 0, metadata !79, metadata !"scanExclusiveLarge", metadata !"scanExclusiveLarge", metadata !"", metadata !79, i32 233, metadata !147, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i64 (i32*, i32*, i32, i32)* @s
!160 = metadata !{metadata !161}
!161 = metadata !{metadata !162, metadata !163, metadata !164, metadata !165, metadata !166, metadata !168, metadata !169}
!162 = metadata !{i32 786689, metadata !159, metadata !"d_Dst", metadata !79, i32 16777450, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Dst] [line 234]
!163 = metadata !{i32 786689, metadata !159, metadata !"d_Src", metadata !79, i32 33554667, metadata !120, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [d_Src] [line 235]
!164 = metadata !{i32 786689, metadata !159, metadata !"batchSize", metadata !79, i32 50331884, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [batchSize] [line 236]
!165 = metadata !{i32 786689, metadata !159, metadata !"arrayLength", metadata !79, i32 67109101, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [arrayLength] [line 237]
!166 = metadata !{i32 786688, metadata !167, metadata !"log2L", metadata !79, i32 241, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [log2L] [line 241]
!167 = metadata !{i32 786443, metadata !159, i32 239, i32 0, metadata !79, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!168 = metadata !{i32 786688, metadata !167, metadata !"factorizationRemainder", metadata !79, i32 242, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [factorizationRemainder] [line 242]
!169 = metadata !{i32 786688, metadata !167, metadata !"blockCount2", metadata !79, i32 263, metadata !170, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [blockCount2] [line 263]
!170 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint]
!171 = metadata !{i32 786478, i32 0, metadata !79, metadata !"iDivUp", metadata !"iDivUp", metadata !"_ZL6iDivUpjj", metadata !79, i32 194, metadata !172, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !174, i32 195} ;
!172 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !173, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!173 = metadata !{metadata !107, metadata !107, metadata !107}
!174 = metadata !{metadata !175}
!175 = metadata !{metadata !176, metadata !177}
!176 = metadata !{i32 786689, metadata !171, metadata !"dividend", metadata !79, i32 16777410, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dividend] [line 194]
!177 = metadata !{i32 786689, metadata !171, metadata !"divisor", metadata !79, i32 33554626, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [divisor] [line 194]
!178 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !85, i32 419, metadata !179, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !187, metadata !217, i32 419} ;
!179 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !180, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!180 = metadata !{null, metadata !181, metadata !11, metadata !11, metadata !11}
!181 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !182} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!182 = metadata !{i32 786451, null, metadata !"dim3", metadata !85, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !183, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!183 = metadata !{metadata !184, metadata !185, metadata !186, metadata !187, metadata !188, metadata !206, metadata !209, metadata !214}
!184 = metadata !{i32 786445, metadata !182, metadata !"x", metadata !85, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!185 = metadata !{i32 786445, metadata !182, metadata !"y", metadata !85, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!186 = metadata !{i32 786445, metadata !182, metadata !"z", metadata !85, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !11} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!187 = metadata !{i32 786478, i32 0, metadata !182, metadata !"dim3", metadata !"dim3", metadata !"", metadata !85, i32 419, metadata !179, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !95, i32 419} ; [ DW_TAG_sub
!188 = metadata !{i32 786478, i32 0, metadata !182, metadata !"dim3", metadata !"dim3", metadata !"", metadata !85, i32 420, metadata !189, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !95, i32 420} ; [ DW_TAG_sub
!189 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !190, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!190 = metadata !{null, metadata !181, metadata !191}
!191 = metadata !{i32 786454, null, metadata !"uint3", metadata !85, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !192} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!192 = metadata !{i32 786451, null, metadata !"uint3", metadata !85, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !193, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!193 = metadata !{metadata !194, metadata !195, metadata !196, metadata !197, metadata !201}
!194 = metadata !{i32 786445, metadata !192, metadata !"x", metadata !85, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !11} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!195 = metadata !{i32 786445, metadata !192, metadata !"y", metadata !85, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !11} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!196 = metadata !{i32 786445, metadata !192, metadata !"z", metadata !85, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !11} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!197 = metadata !{i32 786478, i32 0, metadata !192, metadata !"uint3", metadata !"uint3", metadata !"", metadata !85, i32 188, metadata !198, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !95, i32 188} ; [ DW_TAG_s
!198 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !199, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!199 = metadata !{null, metadata !200}
!200 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !192} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!201 = metadata !{i32 786478, i32 0, metadata !192, metadata !"uint3", metadata !"uint3", metadata !"", metadata !85, i32 188, metadata !202, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !95, i32 188} ; [ DW_TAG_s
!202 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !203, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!203 = metadata !{null, metadata !200, metadata !204}
!204 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !205} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!205 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !192} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!206 = metadata !{i32 786478, i32 0, metadata !182, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !85, i32 421, metadata !207, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0,
!207 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !208, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!208 = metadata !{metadata !191, metadata !181}
!209 = metadata !{i32 786478, i32 0, metadata !182, metadata !"dim3", metadata !"dim3", metadata !"", metadata !85, i32 415, metadata !210, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !95, i32 415} ; [ DW_TAG_sub
!210 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !211, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!211 = metadata !{null, metadata !181, metadata !212}
!212 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !213} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!213 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !182} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!214 = metadata !{i32 786478, i32 0, metadata !182, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !85, i32 415, metadata !215, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !95, i32 415} ; [ DW_TAG_s
!215 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !216, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!216 = metadata !{null, metadata !181}
!217 = metadata !{metadata !218}
!218 = metadata !{metadata !219, metadata !221, metadata !222, metadata !223}
!219 = metadata !{i32 786689, metadata !178, metadata !"this", metadata !85, i32 16777635, metadata !220, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!220 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !182} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!221 = metadata !{i32 786689, metadata !178, metadata !"vx", metadata !85, i32 33554851, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!222 = metadata !{i32 786689, metadata !178, metadata !"vy", metadata !85, i32 50332067, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!223 = metadata !{i32 786689, metadata !178, metadata !"vz", metadata !85, i32 67109283, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!224 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !85, i32 419, metadata !179, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !187, metadata !225, i32 419} ;
!225 = metadata !{metadata !226}
!226 = metadata !{metadata !227, metadata !228, metadata !229, metadata !230}
!227 = metadata !{i32 786689, metadata !224, metadata !"this", metadata !85, i32 16777635, metadata !220, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!228 = metadata !{i32 786689, metadata !224, metadata !"vx", metadata !85, i32 33554851, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!229 = metadata !{i32 786689, metadata !224, metadata !"vy", metadata !85, i32 50332067, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!230 = metadata !{i32 786689, metadata !224, metadata !"vz", metadata !85, i32 67109283, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!231 = metadata !{i32 786478, i32 0, metadata !79, metadata !"factorRadix2", metadata !"factorRadix2", metadata !"_ZL12factorRadix2Rjj", metadata !79, i32 179, metadata !232, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metad
!232 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !233, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!233 = metadata !{metadata !107, metadata !234, metadata !107}
!234 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from uint]
!235 = metadata !{metadata !236}
!236 = metadata !{metadata !237, metadata !238}
!237 = metadata !{i32 786689, metadata !231, metadata !"log2L", metadata !79, i32 16777395, metadata !234, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [log2L] [line 179]
!238 = metadata !{i32 786689, metadata !231, metadata !"L", metadata !79, i32 33554611, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [L] [line 179]
!239 = metadata !{i32 786478, i32 0, metadata !79, metadata !"scan1Exclusive", metadata !"scan1Exclusive", metadata !"_Z14scan1ExclusivejPVjj", metadata !79, i32 38, metadata !240, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null
!240 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !241, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!241 = metadata !{metadata !107, metadata !107, metadata !242, metadata !107}
!242 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !243} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!243 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !107} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from uint]
!244 = metadata !{metadata !245}
!245 = metadata !{metadata !246, metadata !247, metadata !248}
!246 = metadata !{i32 786689, metadata !239, metadata !"idata", metadata !79, i32 16777254, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idata] [line 38]
!247 = metadata !{i32 786689, metadata !239, metadata !"s_Data", metadata !79, i32 33554470, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s_Data] [line 38]
!248 = metadata !{i32 786689, metadata !239, metadata !"size", metadata !79, i32 50331686, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 38]
!249 = metadata !{i32 786478, i32 0, metadata !79, metadata !"scan1Inclusive", metadata !"scan1Inclusive", metadata !"_Z14scan1InclusivejPVjj", metadata !79, i32 20, metadata !240, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null
!250 = metadata !{metadata !251}
!251 = metadata !{metadata !252, metadata !253, metadata !254, metadata !255, metadata !257, metadata !259}
!252 = metadata !{i32 786689, metadata !249, metadata !"idata", metadata !79, i32 16777236, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idata] [line 20]
!253 = metadata !{i32 786689, metadata !249, metadata !"s_Data", metadata !79, i32 33554452, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s_Data] [line 20]
!254 = metadata !{i32 786689, metadata !249, metadata !"size", metadata !79, i32 50331668, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 20]
!255 = metadata !{i32 786688, metadata !256, metadata !"pos", metadata !79, i32 22, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pos] [line 22]
!256 = metadata !{i32 786443, metadata !249, i32 21, i32 0, metadata !79, i32 20} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!257 = metadata !{i32 786688, metadata !258, metadata !"offset", metadata !79, i32 27, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [offset] [line 27]
!258 = metadata !{i32 786443, metadata !256, i32 27, i32 0, metadata !79, i32 21} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!259 = metadata !{i32 786688, metadata !260, metadata !"t", metadata !79, i32 30, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [t] [line 30]
!260 = metadata !{i32 786443, metadata !258, i32 28, i32 0, metadata !79, i32 22} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!261 = metadata !{i32 786478, i32 0, metadata !79, metadata !"scan4Exclusive", metadata !"scan4Exclusive", metadata !"_Z14scan4Exclusive5uint4PVjj", metadata !79, i32 64, metadata !262, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, { i64, i64 
!262 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !263, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!263 = metadata !{metadata !83, metadata !83, metadata !242, metadata !107}
!264 = metadata !{metadata !265}
!265 = metadata !{metadata !266, metadata !267, metadata !268, metadata !269}
!266 = metadata !{i32 786689, metadata !261, metadata !"idata4", metadata !79, i32 16777280, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idata4] [line 64]
!267 = metadata !{i32 786689, metadata !261, metadata !"s_Data", metadata !79, i32 33554496, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s_Data] [line 64]
!268 = metadata !{i32 786689, metadata !261, metadata !"size", metadata !79, i32 50331712, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!269 = metadata !{i32 786688, metadata !270, metadata !"odata4", metadata !79, i32 66, metadata !83, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [odata4] [line 66]
!270 = metadata !{i32 786443, metadata !261, i32 65, i32 0, metadata !79, i32 23} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!271 = metadata !{i32 786478, i32 0, metadata !79, metadata !"scan4Inclusive", metadata !"scan4Inclusive", metadata !"_Z14scan4Inclusive5uint4PVjj", metadata !79, i32 44, metadata !262, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null,
!272 = metadata !{metadata !273}
!273 = metadata !{metadata !274, metadata !275, metadata !276, metadata !277}
!274 = metadata !{i32 786689, metadata !271, metadata !"idata4", metadata !79, i32 16777260, metadata !83, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idata4] [line 44]
!275 = metadata !{i32 786689, metadata !271, metadata !"s_Data", metadata !79, i32 33554476, metadata !242, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s_Data] [line 44]
!276 = metadata !{i32 786689, metadata !271, metadata !"size", metadata !79, i32 50331692, metadata !107, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 44]
!277 = metadata !{i32 786688, metadata !278, metadata !"oval", metadata !79, i32 52, metadata !107, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [oval] [line 52]
!278 = metadata !{i32 786443, metadata !271, i32 45, i32 0, metadata !79, i32 24} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!279 = metadata !{metadata !280}
!280 = metadata !{metadata !281, metadata !285, metadata !286, metadata !287, metadata !288, metadata !289, metadata !290, metadata !291, metadata !292}
!281 = metadata !{i32 786484, i32 0, metadata !78, metadata !"s_Data", metadata !"s_Data", metadata !"", metadata !79, i32 83, metadata !282, i32 1, i32 1, [512 x i32]* @_ZZ19scanExclusiveSharedP5uint4S0_jE6s_Data} ; [ DW_TAG_variable ] [s_Data] [line 83
!282 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !107, metadata !283, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from uint]
!283 = metadata !{metadata !284}
!284 = metadata !{i32 786465, i64 0, i64 511}     ; [ DW_TAG_subrange_type ] [0, 511]
!285 = metadata !{i32 786484, i32 0, metadata !117, metadata !"s_Data", metadata !"s_Data", metadata !"", metadata !79, i32 106, metadata !282, i32 1, i32 1, [512 x i32]* @_ZZ20scanExclusiveShared2PjS_S_jjE6s_Data} ; [ DW_TAG_variable ] [s_Data] [line 10
!286 = metadata !{i32 786484, i32 0, metadata !132, metadata !"buf", metadata !"buf", metadata !"", metadata !79, i32 136, metadata !107, i32 1, i32 1, i32* @_ZZ13uniformUpdateP5uint4PjE3buf} ; [ DW_TAG_variable ] [buf] [line 136] [local] [def]
!287 = metadata !{i32 786484, i32 0, null, metadata !"MAX_BATCH_ELEMENTS", metadata !"MAX_BATCH_ELEMENTS", metadata !"", metadata !79, i32 159, metadata !170, i32 0, i32 1, i32* @MAX_BATCH_ELEMENTS} ; [ DW_TAG_variable ] [MAX_BATCH_ELEMENTS] [line 159] [
!288 = metadata !{i32 786484, i32 0, null, metadata !"MIN_SHORT_ARRAY_SIZE", metadata !"MIN_SHORT_ARRAY_SIZE", metadata !"", metadata !79, i32 160, metadata !170, i32 0, i32 1, i32* @MIN_SHORT_ARRAY_SIZE} ; [ DW_TAG_variable ] [MIN_SHORT_ARRAY_SIZE] [lin
!289 = metadata !{i32 786484, i32 0, null, metadata !"MAX_SHORT_ARRAY_SIZE", metadata !"MAX_SHORT_ARRAY_SIZE", metadata !"", metadata !79, i32 161, metadata !170, i32 0, i32 1, i32* @MAX_SHORT_ARRAY_SIZE} ; [ DW_TAG_variable ] [MAX_SHORT_ARRAY_SIZE] [lin
!290 = metadata !{i32 786484, i32 0, null, metadata !"MIN_LARGE_ARRAY_SIZE", metadata !"MIN_LARGE_ARRAY_SIZE", metadata !"", metadata !79, i32 162, metadata !170, i32 0, i32 1, i32* @MIN_LARGE_ARRAY_SIZE} ; [ DW_TAG_variable ] [MIN_LARGE_ARRAY_SIZE] [lin
!291 = metadata !{i32 786484, i32 0, null, metadata !"MAX_LARGE_ARRAY_SIZE", metadata !"MAX_LARGE_ARRAY_SIZE", metadata !"", metadata !79, i32 163, metadata !170, i32 0, i32 1, i32* @MAX_LARGE_ARRAY_SIZE} ; [ DW_TAG_variable ] [MAX_LARGE_ARRAY_SIZE] [lin
!292 = metadata !{i32 786484, i32 0, null, metadata !"d_Buf", metadata !"d_Buf", metadata !"_ZL5d_Buf", metadata !79, i32 166, metadata !120, i32 1, i32 1, i32** @_ZL5d_Buf} ; [ DW_TAG_variable ] [d_Buf] [line 166] [local] [def]
!293 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!294 = metadata !{metadata !295}
!295 = metadata !{metadata !296}
!296 = metadata !{i32 786478, i32 0, metadata !297, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", metadata !297, i32 12, metadata !298, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_
!297 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!298 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !299, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!299 = metadata !{null, metadata !300}
!300 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!301 = metadata !{metadata !302}
!302 = metadata !{metadata !303}
!303 = metadata !{i32 786689, metadata !296, metadata !"z", metadata !297, i32 16777228, metadata !300, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!304 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!305 = metadata !{metadata !306}
!306 = metadata !{metadata !307}
!307 = metadata !{i32 786478, i32 0, metadata !308, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !308, i32 12, metadata !309, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !3
!308 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!309 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !310, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!310 = metadata !{metadata !311, metadata !311, metadata !312, metadata !314}
!311 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!312 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !313} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!313 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!314 = metadata !{i32 786454, null, metadata !"size_t", metadata !308, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!315 = metadata !{metadata !316}
!316 = metadata !{metadata !317, metadata !318, metadata !319, metadata !320, metadata !322}
!317 = metadata !{i32 786689, metadata !307, metadata !"destaddr", metadata !308, i32 16777228, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!318 = metadata !{i32 786689, metadata !307, metadata !"srcaddr", metadata !308, i32 33554444, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!319 = metadata !{i32 786689, metadata !307, metadata !"len", metadata !308, i32 50331660, metadata !314, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!320 = metadata !{i32 786688, metadata !321, metadata !"dest", metadata !308, i32 13, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!321 = metadata !{i32 786443, metadata !307, i32 12, i32 0, metadata !308, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c]
!322 = metadata !{i32 786688, metadata !321, metadata !"src", metadata !308, i32 14, metadata !323, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!323 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !324} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!324 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!325 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata 
!326 = metadata !{metadata !327}
!327 = metadata !{metadata !328}
!328 = metadata !{i32 786478, i32 0, metadata !329, metadata !"memmove", metadata !"memmove", metadata !"", metadata !329, i32 12, metadata !330, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !333, i32 12} ; [ DW_TAG
!329 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!330 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !331, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!331 = metadata !{metadata !311, metadata !311, metadata !312, metadata !332}
!332 = metadata !{i32 786454, null, metadata !"size_t", metadata !329, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!333 = metadata !{metadata !334}
!334 = metadata !{metadata !335, metadata !336, metadata !337, metadata !338, metadata !340}
!335 = metadata !{i32 786689, metadata !328, metadata !"dst", metadata !329, i32 16777228, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!336 = metadata !{i32 786689, metadata !328, metadata !"src", metadata !329, i32 33554444, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!337 = metadata !{i32 786689, metadata !328, metadata !"count", metadata !329, i32 50331660, metadata !332, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!338 = metadata !{i32 786688, metadata !339, metadata !"a", metadata !329, i32 14, metadata !43, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!339 = metadata !{i32 786443, metadata !328, i32 12, i32 0, metadata !329, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c]
!340 = metadata !{i32 786688, metadata !339, metadata !"b", metadata !329, i32 15, metadata !323, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!341 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!342 = metadata !{metadata !343}
!343 = metadata !{metadata !344}
!344 = metadata !{i32 786478, i32 0, metadata !345, metadata !"memset", metadata !"memset", metadata !"", metadata !345, i32 12, metadata !346, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !3
!345 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!346 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !347, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!347 = metadata !{metadata !311, metadata !311, metadata !41, metadata !348}
!348 = metadata !{i32 786454, null, metadata !"size_t", metadata !345, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!349 = metadata !{metadata !350}
!350 = metadata !{metadata !351, metadata !352, metadata !353, metadata !354}
!351 = metadata !{i32 786689, metadata !344, metadata !"dst", metadata !345, i32 16777228, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!352 = metadata !{i32 786689, metadata !344, metadata !"s", metadata !345, i32 33554444, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!353 = metadata !{i32 786689, metadata !344, metadata !"count", metadata !345, i32 50331660, metadata !348, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!354 = metadata !{i32 786688, metadata !355, metadata !"a", metadata !345, i32 13, metadata !356, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!355 = metadata !{i32 786443, metadata !344, i32 12, i32 0, metadata !345, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c]
!356 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !357} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!357 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !44} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!358 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tr
!359 = metadata !{metadata !360}
!360 = metadata !{metadata !361, metadata !436, metadata !442}
!361 = metadata !{i32 786436, null, metadata !"cudaError", metadata !362, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !363, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!362 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!363 = metadata !{metadata !364, metadata !365, metadata !366, metadata !367, metadata !368, metadata !369, metadata !370, metadata !371, metadata !372, metadata !373, metadata !374, metadata !375, metadata !376, metadata !377, metadata !378, metadata !3
!364 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!365 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!366 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!367 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!368 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!369 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!370 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!371 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!372 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!373 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!374 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!375 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!376 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!377 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!378 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!379 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!380 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!381 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!382 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!383 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!384 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!385 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!386 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!387 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!388 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!389 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!390 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!391 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!392 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!393 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!394 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!395 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!396 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!397 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!398 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!399 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!400 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!401 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!402 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!403 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!404 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!405 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!406 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!407 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!408 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!409 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!410 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!411 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!412 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!413 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!414 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!415 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!416 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!417 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!418 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!419 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!420 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!421 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!422 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!423 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!424 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!425 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!426 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!427 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!428 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!429 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!430 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!431 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!432 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!433 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!434 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!435 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!436 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !362, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !437, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!437 = metadata !{metadata !438, metadata !439, metadata !440, metadata !441}
!438 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!439 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!440 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!441 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!442 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !362, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !443, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!443 = metadata !{metadata !444, metadata !445, metadata !446, metadata !447, metadata !448}
!444 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!445 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!446 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!447 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!448 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!449 = metadata !{metadata !450}
!450 = metadata !{metadata !451, metadata !530, metadata !537, metadata !544, metadata !552, metadata !560, metadata !563, metadata !569, metadata !576, metadata !577, metadata !583, metadata !587, metadata !595, metadata !601, metadata !619, metadata !6
!451 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaChooseDevice", metadata !"cudaChooseDevice", metadata !"", metadata !452, i32 14, metadata !453, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, %struct.cudaDeviceProp
!452 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!453 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !454, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!454 = metadata !{metadata !455, metadata !456, metadata !457}
!455 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !452, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !361} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!456 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !41} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!457 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !458} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!458 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !459} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaDeviceProp]
!459 = metadata !{i32 786451, null, metadata !"cudaDeviceProp", metadata !362, i32 1145, i64 4800, i64 64, i32 0, i32 0, null, metadata !460, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaDeviceProp] [line 1145, size 4800, align 64, offset 0] [fr
!460 = metadata !{metadata !461, metadata !465, metadata !467, metadata !468, metadata !469, metadata !470, metadata !471, metadata !472, metadata !476, metadata !477, metadata !478, metadata !479, metadata !480, metadata !481, metadata !482, metadata !4
!461 = metadata !{i32 786445, metadata !459, metadata !"name", metadata !362, i32 1147, i64 2048, i64 8, i64 0, i32 0, metadata !462} ; [ DW_TAG_member ] [name] [line 1147, size 2048, align 8, offset 0] [from ]
!462 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !44, metadata !463, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!463 = metadata !{metadata !464}
!464 = metadata !{i32 786465, i64 0, i64 255}     ; [ DW_TAG_subrange_type ] [0, 255]
!465 = metadata !{i32 786445, metadata !459, metadata !"totalGlobalMem", metadata !362, i32 1148, i64 64, i64 64, i64 2048, i32 0, metadata !466} ; [ DW_TAG_member ] [totalGlobalMem] [line 1148, size 64, align 64, offset 2048] [from size_t]
!466 = metadata !{i32 786454, null, metadata !"size_t", metadata !362, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !64} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!467 = metadata !{i32 786445, metadata !459, metadata !"sharedMemPerBlock", metadata !362, i32 1149, i64 64, i64 64, i64 2112, i32 0, metadata !466} ; [ DW_TAG_member ] [sharedMemPerBlock] [line 1149, size 64, align 64, offset 2112] [from size_t]
!468 = metadata !{i32 786445, metadata !459, metadata !"regsPerBlock", metadata !362, i32 1150, i64 32, i64 32, i64 2176, i32 0, metadata !41} ; [ DW_TAG_member ] [regsPerBlock] [line 1150, size 32, align 32, offset 2176] [from int]
!469 = metadata !{i32 786445, metadata !459, metadata !"warpSize", metadata !362, i32 1151, i64 32, i64 32, i64 2208, i32 0, metadata !41} ; [ DW_TAG_member ] [warpSize] [line 1151, size 32, align 32, offset 2208] [from int]
!470 = metadata !{i32 786445, metadata !459, metadata !"memPitch", metadata !362, i32 1152, i64 64, i64 64, i64 2240, i32 0, metadata !466} ; [ DW_TAG_member ] [memPitch] [line 1152, size 64, align 64, offset 2240] [from size_t]
!471 = metadata !{i32 786445, metadata !459, metadata !"maxThreadsPerBlock", metadata !362, i32 1153, i64 32, i64 32, i64 2304, i32 0, metadata !41} ; [ DW_TAG_member ] [maxThreadsPerBlock] [line 1153, size 32, align 32, offset 2304] [from int]
!472 = metadata !{i32 786445, metadata !459, metadata !"maxThreadsDim", metadata !362, i32 1154, i64 96, i64 32, i64 2336, i32 0, metadata !473} ; [ DW_TAG_member ] [maxThreadsDim] [line 1154, size 96, align 32, offset 2336] [from ]
!473 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !41, metadata !474, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!474 = metadata !{metadata !475}
!475 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 2]
!476 = metadata !{i32 786445, metadata !459, metadata !"maxGridSize", metadata !362, i32 1155, i64 96, i64 32, i64 2432, i32 0, metadata !473} ; [ DW_TAG_member ] [maxGridSize] [line 1155, size 96, align 32, offset 2432] [from ]
!477 = metadata !{i32 786445, metadata !459, metadata !"clockRate", metadata !362, i32 1156, i64 32, i64 32, i64 2528, i32 0, metadata !41} ; [ DW_TAG_member ] [clockRate] [line 1156, size 32, align 32, offset 2528] [from int]
!478 = metadata !{i32 786445, metadata !459, metadata !"totalConstMem", metadata !362, i32 1157, i64 64, i64 64, i64 2560, i32 0, metadata !466} ; [ DW_TAG_member ] [totalConstMem] [line 1157, size 64, align 64, offset 2560] [from size_t]
!479 = metadata !{i32 786445, metadata !459, metadata !"major", metadata !362, i32 1158, i64 32, i64 32, i64 2624, i32 0, metadata !41} ; [ DW_TAG_member ] [major] [line 1158, size 32, align 32, offset 2624] [from int]
!480 = metadata !{i32 786445, metadata !459, metadata !"minor", metadata !362, i32 1159, i64 32, i64 32, i64 2656, i32 0, metadata !41} ; [ DW_TAG_member ] [minor] [line 1159, size 32, align 32, offset 2656] [from int]
!481 = metadata !{i32 786445, metadata !459, metadata !"textureAlignment", metadata !362, i32 1160, i64 64, i64 64, i64 2688, i32 0, metadata !466} ; [ DW_TAG_member ] [textureAlignment] [line 1160, size 64, align 64, offset 2688] [from size_t]
!482 = metadata !{i32 786445, metadata !459, metadata !"texturePitchAlignment", metadata !362, i32 1161, i64 64, i64 64, i64 2752, i32 0, metadata !466} ; [ DW_TAG_member ] [texturePitchAlignment] [line 1161, size 64, align 64, offset 2752] [from size_t]
!483 = metadata !{i32 786445, metadata !459, metadata !"deviceOverlap", metadata !362, i32 1162, i64 32, i64 32, i64 2816, i32 0, metadata !41} ; [ DW_TAG_member ] [deviceOverlap] [line 1162, size 32, align 32, offset 2816] [from int]
!484 = metadata !{i32 786445, metadata !459, metadata !"multiProcessorCount", metadata !362, i32 1163, i64 32, i64 32, i64 2848, i32 0, metadata !41} ; [ DW_TAG_member ] [multiProcessorCount] [line 1163, size 32, align 32, offset 2848] [from int]
!485 = metadata !{i32 786445, metadata !459, metadata !"kernelExecTimeoutEnabled", metadata !362, i32 1164, i64 32, i64 32, i64 2880, i32 0, metadata !41} ; [ DW_TAG_member ] [kernelExecTimeoutEnabled] [line 1164, size 32, align 32, offset 2880] [from in
!486 = metadata !{i32 786445, metadata !459, metadata !"integrated", metadata !362, i32 1165, i64 32, i64 32, i64 2912, i32 0, metadata !41} ; [ DW_TAG_member ] [integrated] [line 1165, size 32, align 32, offset 2912] [from int]
!487 = metadata !{i32 786445, metadata !459, metadata !"canMapHostMemory", metadata !362, i32 1166, i64 32, i64 32, i64 2944, i32 0, metadata !41} ; [ DW_TAG_member ] [canMapHostMemory] [line 1166, size 32, align 32, offset 2944] [from int]
!488 = metadata !{i32 786445, metadata !459, metadata !"computeMode", metadata !362, i32 1167, i64 32, i64 32, i64 2976, i32 0, metadata !41} ; [ DW_TAG_member ] [computeMode] [line 1167, size 32, align 32, offset 2976] [from int]
!489 = metadata !{i32 786445, metadata !459, metadata !"maxTexture1D", metadata !362, i32 1168, i64 32, i64 32, i64 3008, i32 0, metadata !41} ; [ DW_TAG_member ] [maxTexture1D] [line 1168, size 32, align 32, offset 3008] [from int]
!490 = metadata !{i32 786445, metadata !459, metadata !"maxTexture1DMipmap", metadata !362, i32 1169, i64 32, i64 32, i64 3040, i32 0, metadata !41} ; [ DW_TAG_member ] [maxTexture1DMipmap] [line 1169, size 32, align 32, offset 3040] [from int]
!491 = metadata !{i32 786445, metadata !459, metadata !"maxTexture1DLinear", metadata !362, i32 1170, i64 32, i64 32, i64 3072, i32 0, metadata !41} ; [ DW_TAG_member ] [maxTexture1DLinear] [line 1170, size 32, align 32, offset 3072] [from int]
!492 = metadata !{i32 786445, metadata !459, metadata !"maxTexture2D", metadata !362, i32 1171, i64 64, i64 32, i64 3104, i32 0, metadata !493} ; [ DW_TAG_member ] [maxTexture2D] [line 1171, size 64, align 32, offset 3104] [from ]
!493 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 32, i32 0, i32 0, metadata !41, metadata !494, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!494 = metadata !{metadata !495}
!495 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 1]
!496 = metadata !{i32 786445, metadata !459, metadata !"maxTexture2DMipmap", metadata !362, i32 1172, i64 64, i64 32, i64 3168, i32 0, metadata !493} ; [ DW_TAG_member ] [maxTexture2DMipmap] [line 1172, size 64, align 32, offset 3168] [from ]
!497 = metadata !{i32 786445, metadata !459, metadata !"maxTexture2DLinear", metadata !362, i32 1173, i64 96, i64 32, i64 3232, i32 0, metadata !473} ; [ DW_TAG_member ] [maxTexture2DLinear] [line 1173, size 96, align 32, offset 3232] [from ]
!498 = metadata !{i32 786445, metadata !459, metadata !"maxTexture2DGather", metadata !362, i32 1174, i64 64, i64 32, i64 3328, i32 0, metadata !493} ; [ DW_TAG_member ] [maxTexture2DGather] [line 1174, size 64, align 32, offset 3328] [from ]
!499 = metadata !{i32 786445, metadata !459, metadata !"maxTexture3D", metadata !362, i32 1175, i64 96, i64 32, i64 3392, i32 0, metadata !473} ; [ DW_TAG_member ] [maxTexture3D] [line 1175, size 96, align 32, offset 3392] [from ]
!500 = metadata !{i32 786445, metadata !459, metadata !"maxTexture3DAlt", metadata !362, i32 1176, i64 96, i64 32, i64 3488, i32 0, metadata !473} ; [ DW_TAG_member ] [maxTexture3DAlt] [line 1176, size 96, align 32, offset 3488] [from ]
!501 = metadata !{i32 786445, metadata !459, metadata !"maxTextureCubemap", metadata !362, i32 1177, i64 32, i64 32, i64 3584, i32 0, metadata !41} ; [ DW_TAG_member ] [maxTextureCubemap] [line 1177, size 32, align 32, offset 3584] [from int]
!502 = metadata !{i32 786445, metadata !459, metadata !"maxTexture1DLayered", metadata !362, i32 1178, i64 64, i64 32, i64 3616, i32 0, metadata !493} ; [ DW_TAG_member ] [maxTexture1DLayered] [line 1178, size 64, align 32, offset 3616] [from ]
!503 = metadata !{i32 786445, metadata !459, metadata !"maxTexture2DLayered", metadata !362, i32 1179, i64 96, i64 32, i64 3680, i32 0, metadata !473} ; [ DW_TAG_member ] [maxTexture2DLayered] [line 1179, size 96, align 32, offset 3680] [from ]
!504 = metadata !{i32 786445, metadata !459, metadata !"maxTextureCubemapLayered", metadata !362, i32 1180, i64 64, i64 32, i64 3776, i32 0, metadata !493} ; [ DW_TAG_member ] [maxTextureCubemapLayered] [line 1180, size 64, align 32, offset 3776] [from ]
!505 = metadata !{i32 786445, metadata !459, metadata !"maxSurface1D", metadata !362, i32 1181, i64 32, i64 32, i64 3840, i32 0, metadata !41} ; [ DW_TAG_member ] [maxSurface1D] [line 1181, size 32, align 32, offset 3840] [from int]
!506 = metadata !{i32 786445, metadata !459, metadata !"maxSurface2D", metadata !362, i32 1182, i64 64, i64 32, i64 3872, i32 0, metadata !493} ; [ DW_TAG_member ] [maxSurface2D] [line 1182, size 64, align 32, offset 3872] [from ]
!507 = metadata !{i32 786445, metadata !459, metadata !"maxSurface3D", metadata !362, i32 1183, i64 96, i64 32, i64 3936, i32 0, metadata !473} ; [ DW_TAG_member ] [maxSurface3D] [line 1183, size 96, align 32, offset 3936] [from ]
!508 = metadata !{i32 786445, metadata !459, metadata !"maxSurface1DLayered", metadata !362, i32 1184, i64 64, i64 32, i64 4032, i32 0, metadata !493} ; [ DW_TAG_member ] [maxSurface1DLayered] [line 1184, size 64, align 32, offset 4032] [from ]
!509 = metadata !{i32 786445, metadata !459, metadata !"maxSurface2DLayered", metadata !362, i32 1185, i64 96, i64 32, i64 4096, i32 0, metadata !473} ; [ DW_TAG_member ] [maxSurface2DLayered] [line 1185, size 96, align 32, offset 4096] [from ]
!510 = metadata !{i32 786445, metadata !459, metadata !"maxSurfaceCubemap", metadata !362, i32 1186, i64 32, i64 32, i64 4192, i32 0, metadata !41} ; [ DW_TAG_member ] [maxSurfaceCubemap] [line 1186, size 32, align 32, offset 4192] [from int]
!511 = metadata !{i32 786445, metadata !459, metadata !"maxSurfaceCubemapLayered", metadata !362, i32 1187, i64 64, i64 32, i64 4224, i32 0, metadata !493} ; [ DW_TAG_member ] [maxSurfaceCubemapLayered] [line 1187, size 64, align 32, offset 4224] [from ]
!512 = metadata !{i32 786445, metadata !459, metadata !"surfaceAlignment", metadata !362, i32 1188, i64 64, i64 64, i64 4288, i32 0, metadata !466} ; [ DW_TAG_member ] [surfaceAlignment] [line 1188, size 64, align 64, offset 4288] [from size_t]
!513 = metadata !{i32 786445, metadata !459, metadata !"concurrentKernels", metadata !362, i32 1189, i64 32, i64 32, i64 4352, i32 0, metadata !41} ; [ DW_TAG_member ] [concurrentKernels] [line 1189, size 32, align 32, offset 4352] [from int]
!514 = metadata !{i32 786445, metadata !459, metadata !"ECCEnabled", metadata !362, i32 1190, i64 32, i64 32, i64 4384, i32 0, metadata !41} ; [ DW_TAG_member ] [ECCEnabled] [line 1190, size 32, align 32, offset 4384] [from int]
!515 = metadata !{i32 786445, metadata !459, metadata !"pciBusID", metadata !362, i32 1191, i64 32, i64 32, i64 4416, i32 0, metadata !41} ; [ DW_TAG_member ] [pciBusID] [line 1191, size 32, align 32, offset 4416] [from int]
!516 = metadata !{i32 786445, metadata !459, metadata !"pciDeviceID", metadata !362, i32 1192, i64 32, i64 32, i64 4448, i32 0, metadata !41} ; [ DW_TAG_member ] [pciDeviceID] [line 1192, size 32, align 32, offset 4448] [from int]
!517 = metadata !{i32 786445, metadata !459, metadata !"pciDomainID", metadata !362, i32 1193, i64 32, i64 32, i64 4480, i32 0, metadata !41} ; [ DW_TAG_member ] [pciDomainID] [line 1193, size 32, align 32, offset 4480] [from int]
!518 = metadata !{i32 786445, metadata !459, metadata !"tccDriver", metadata !362, i32 1194, i64 32, i64 32, i64 4512, i32 0, metadata !41} ; [ DW_TAG_member ] [tccDriver] [line 1194, size 32, align 32, offset 4512] [from int]
!519 = metadata !{i32 786445, metadata !459, metadata !"asyncEngineCount", metadata !362, i32 1195, i64 32, i64 32, i64 4544, i32 0, metadata !41} ; [ DW_TAG_member ] [asyncEngineCount] [line 1195, size 32, align 32, offset 4544] [from int]
!520 = metadata !{i32 786445, metadata !459, metadata !"unifiedAddressing", metadata !362, i32 1196, i64 32, i64 32, i64 4576, i32 0, metadata !41} ; [ DW_TAG_member ] [unifiedAddressing] [line 1196, size 32, align 32, offset 4576] [from int]
!521 = metadata !{i32 786445, metadata !459, metadata !"memoryClockRate", metadata !362, i32 1197, i64 32, i64 32, i64 4608, i32 0, metadata !41} ; [ DW_TAG_member ] [memoryClockRate] [line 1197, size 32, align 32, offset 4608] [from int]
!522 = metadata !{i32 786445, metadata !459, metadata !"memoryBusWidth", metadata !362, i32 1198, i64 32, i64 32, i64 4640, i32 0, metadata !41} ; [ DW_TAG_member ] [memoryBusWidth] [line 1198, size 32, align 32, offset 4640] [from int]
!523 = metadata !{i32 786445, metadata !459, metadata !"l2CacheSize", metadata !362, i32 1199, i64 32, i64 32, i64 4672, i32 0, metadata !41} ; [ DW_TAG_member ] [l2CacheSize] [line 1199, size 32, align 32, offset 4672] [from int]
!524 = metadata !{i32 786445, metadata !459, metadata !"maxThreadsPerMultiProcessor", metadata !362, i32 1200, i64 32, i64 32, i64 4704, i32 0, metadata !41} ; [ DW_TAG_member ] [maxThreadsPerMultiProcessor] [line 1200, size 32, align 32, offset 4704] [f
!525 = metadata !{i32 786445, metadata !459, metadata !"streamPrioritiesSupported", metadata !362, i32 1201, i64 32, i64 32, i64 4736, i32 0, metadata !41} ; [ DW_TAG_member ] [streamPrioritiesSupported] [line 1201, size 32, align 32, offset 4736] [from 
!526 = metadata !{metadata !527}
!527 = metadata !{metadata !528, metadata !529}
!528 = metadata !{i32 786689, metadata !451, metadata !"device", metadata !452, i32 16777230, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 14]
!529 = metadata !{i32 786689, metadata !451, metadata !"prop", metadata !452, i32 33554446, metadata !457, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 14]
!530 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaDeviceGetByPCIBusId", metadata !"cudaDeviceGetByPCIBusId", metadata !"", metadata !452, i32 19, metadata !531, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @c
!531 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !532, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!532 = metadata !{metadata !455, metadata !456, metadata !43}
!533 = metadata !{metadata !534}
!534 = metadata !{metadata !535, metadata !536}
!535 = metadata !{i32 786689, metadata !530, metadata !"device", metadata !452, i32 16777235, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 19]
!536 = metadata !{i32 786689, metadata !530, metadata !"pciBusId", metadata !452, i32 33554451, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 19]
!537 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaDeviceGetCacheConfig", metadata !"cudaDeviceGetCacheConfig", metadata !"", metadata !452, i32 24, metadata !538, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cuda
!538 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !539, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!539 = metadata !{metadata !455, metadata !540}
!540 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !436} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!541 = metadata !{metadata !542}
!542 = metadata !{metadata !543}
!543 = metadata !{i32 786689, metadata !537, metadata !"pCacheConfig", metadata !452, i32 16777240, metadata !540, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 24]
!544 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaDeviceGetLimit", metadata !"cudaDeviceGetLimit", metadata !"", metadata !452, i32 28, metadata !545, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaDeviceG
!545 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !546, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!546 = metadata !{metadata !455, metadata !547, metadata !442}
!547 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !466} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!548 = metadata !{metadata !549}
!549 = metadata !{metadata !550, metadata !551}
!550 = metadata !{i32 786689, metadata !544, metadata !"pValue", metadata !452, i32 16777244, metadata !547, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 28]
!551 = metadata !{i32 786689, metadata !544, metadata !"limit", metadata !452, i32 33554460, metadata !442, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 28]
!552 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaDeviceGetPCIBusId", metadata !"cudaDeviceGetPCIBusId", metadata !"", metadata !452, i32 32, metadata !553, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)* @c
!553 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !554, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!554 = metadata !{metadata !455, metadata !43, metadata !41, metadata !41}
!555 = metadata !{metadata !556}
!556 = metadata !{metadata !557, metadata !558, metadata !559}
!557 = metadata !{i32 786689, metadata !552, metadata !"pciBusId", metadata !452, i32 16777248, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 32]
!558 = metadata !{i32 786689, metadata !552, metadata !"len", metadata !452, i32 33554464, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 32]
!559 = metadata !{i32 786689, metadata !552, metadata !"device", metadata !452, i32 50331680, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 32]
!560 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaDeviceReset", metadata !"cudaDeviceReset", metadata !"", metadata !452, i32 37, metadata !561, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceReset, null, nul
!561 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !562, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!562 = metadata !{metadata !455}
!563 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaDeviceSetCacheConfig", metadata !"cudaDeviceSetCacheConfig", metadata !"", metadata !452, i32 41, metadata !564, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaD
!564 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !565, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!565 = metadata !{metadata !455, metadata !436}
!566 = metadata !{metadata !567}
!567 = metadata !{metadata !568}
!568 = metadata !{i32 786689, metadata !563, metadata !"cacheConfig", metadata !452, i32 16777257, metadata !436, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 41]
!569 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaDeviceSetLimit", metadata !"cudaDeviceSetLimit", metadata !"", metadata !452, i32 45, metadata !570, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaDeviceSe
!570 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !571, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!571 = metadata !{metadata !455, metadata !442, metadata !466}
!572 = metadata !{metadata !573}
!573 = metadata !{metadata !574, metadata !575}
!574 = metadata !{i32 786689, metadata !569, metadata !"limit", metadata !452, i32 16777261, metadata !442, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 45]
!575 = metadata !{i32 786689, metadata !569, metadata !"value", metadata !452, i32 33554477, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 45]
!576 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaDeviceSynchronize", metadata !"cudaDeviceSynchronize", metadata !"", metadata !452, i32 49, metadata !561, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceSync
!577 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaGetDevice", metadata !"cudaGetDevice", metadata !"", metadata !452, i32 53, metadata !578, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDevice, null, null,
!578 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !579, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!579 = metadata !{metadata !455, metadata !456}
!580 = metadata !{metadata !581}
!581 = metadata !{metadata !582}
!582 = metadata !{i32 786689, metadata !577, metadata !"device", metadata !452, i32 16777269, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 53]
!583 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaGetDeviceCount", metadata !"cudaGetDeviceCount", metadata !"", metadata !452, i32 58, metadata !578, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDeviceCou
!584 = metadata !{metadata !585}
!585 = metadata !{metadata !586}
!586 = metadata !{i32 786689, metadata !583, metadata !"count", metadata !452, i32 16777274, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 58]
!587 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaGetDeviceProperties", metadata !"cudaGetDeviceProperties", metadata !"", metadata !452, i32 63, metadata !588, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaDe
!588 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !589, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!589 = metadata !{metadata !455, metadata !590, metadata !41}
!590 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !459} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaDeviceProp]
!591 = metadata !{metadata !592}
!592 = metadata !{metadata !593, metadata !594}
!593 = metadata !{i32 786689, metadata !587, metadata !"prop", metadata !452, i32 16777279, metadata !590, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 63]
!594 = metadata !{i32 786689, metadata !587, metadata !"device", metadata !452, i32 33554495, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 63]
!595 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaIpcCloseMemHandle", metadata !"cudaIpcCloseMemHandle", metadata !"", metadata !452, i32 68, metadata !596, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaIpcClos
!596 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !597, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!597 = metadata !{metadata !455, metadata !311}
!598 = metadata !{metadata !599}
!599 = metadata !{metadata !600}
!600 = metadata !{i32 786689, metadata !595, metadata !"devPtr", metadata !452, i32 16777284, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 68]
!601 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaIpcGetEventHandle", metadata !"cudaIpcGetEventHandle", metadata !"", metadata !452, i32 72, metadata !602, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcEve
!602 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !603, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!603 = metadata !{metadata !455, metadata !604, metadata !612}
!604 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !605} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcEventHandle_t]
!605 = metadata !{i32 786454, null, metadata !"cudaIpcEventHandle_t", metadata !452, i32 1274, i64 0, i64 0, i64 0, i32 0, metadata !606} ; [ DW_TAG_typedef ] [cudaIpcEventHandle_t] [line 1274, size 0, align 0, offset 0] [from cudaIpcEventHandle_st]
!606 = metadata !{i32 786451, null, metadata !"cudaIpcEventHandle_st", metadata !362, i32 1271, i64 512, i64 8, i32 0, i32 0, null, metadata !607, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcEventHandle_st] [line 1271, size 512, align 8, off
!607 = metadata !{metadata !608}
!608 = metadata !{i32 786445, metadata !606, metadata !"reserved", metadata !362, i32 1273, i64 512, i64 8, i64 0, i32 0, metadata !609} ; [ DW_TAG_member ] [reserved] [line 1273, size 512, align 8, offset 0] [from ]
!609 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 8, i32 0, i32 0, metadata !44, metadata !610, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!610 = metadata !{metadata !611}
!611 = metadata !{i32 786465, i64 0, i64 63}      ; [ DW_TAG_subrange_type ] [0, 63]
!612 = metadata !{i32 786454, null, metadata !"cudaEvent_t", metadata !452, i32 1303, i64 0, i64 0, i64 0, i32 0, metadata !613} ; [ DW_TAG_typedef ] [cudaEvent_t] [line 1303, size 0, align 0, offset 0] [from ]
!613 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !614} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUevent_st]
!614 = metadata !{i32 786451, null, metadata !"CUevent_st", metadata !362, i32 1303, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUevent_st] [line 1303, size 0, align 0, offset 0] [fwd] [from ]
!615 = metadata !{metadata !616}
!616 = metadata !{metadata !617, metadata !618}
!617 = metadata !{i32 786689, metadata !601, metadata !"handle", metadata !452, i32 16777288, metadata !604, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 72]
!618 = metadata !{i32 786689, metadata !601, metadata !"event", metadata !452, i32 33554504, metadata !612, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 72]
!619 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaIpcGetMemHandle", metadata !"cudaIpcGetMemHandle", metadata !"", metadata !452, i32 76, metadata !620, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcMemHand
!620 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !621, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!621 = metadata !{metadata !455, metadata !622, metadata !311}
!622 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !623} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcMemHandle_t]
!623 = metadata !{i32 786454, null, metadata !"cudaIpcMemHandle_t", metadata !452, i32 1282, i64 0, i64 0, i64 0, i32 0, metadata !624} ; [ DW_TAG_typedef ] [cudaIpcMemHandle_t] [line 1282, size 0, align 0, offset 0] [from cudaIpcMemHandle_st]
!624 = metadata !{i32 786451, null, metadata !"cudaIpcMemHandle_st", metadata !362, i32 1279, i64 512, i64 8, i32 0, i32 0, null, metadata !625, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcMemHandle_st] [line 1279, size 512, align 8, offset 
!625 = metadata !{metadata !626}
!626 = metadata !{i32 786445, metadata !624, metadata !"reserved", metadata !362, i32 1281, i64 512, i64 8, i64 0, i32 0, metadata !609} ; [ DW_TAG_member ] [reserved] [line 1281, size 512, align 8, offset 0] [from ]
!627 = metadata !{metadata !628}
!628 = metadata !{metadata !629, metadata !630}
!629 = metadata !{i32 786689, metadata !619, metadata !"handle", metadata !452, i32 16777292, metadata !622, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 76]
!630 = metadata !{i32 786689, metadata !619, metadata !"devPtr", metadata !452, i32 33554508, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 76]
!631 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaIpcOpenEventHandle", metadata !"cudaIpcOpenEventHandle", metadata !"", metadata !452, i32 80, metadata !632, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.CUevent_
!632 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !633, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!633 = metadata !{metadata !455, metadata !634, metadata !605}
!634 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !612} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaEvent_t]
!635 = metadata !{metadata !636}
!636 = metadata !{metadata !637, metadata !638}
!637 = metadata !{i32 786689, metadata !631, metadata !"event", metadata !452, i32 16777296, metadata !634, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 80]
!638 = metadata !{i32 786689, metadata !631, metadata !"handle", metadata !452, i32 33554512, metadata !605, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 80]
!639 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaIpcOpenMemHandle", metadata !"cudaIpcOpenMemHandle", metadata !"", metadata !452, i32 84, metadata !640, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, %struct.cudaIp
!640 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !641, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!641 = metadata !{metadata !455, metadata !642, metadata !623, metadata !11}
!642 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !311} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!643 = metadata !{metadata !644}
!644 = metadata !{metadata !645, metadata !646, metadata !647}
!645 = metadata !{i32 786689, metadata !639, metadata !"devPtr", metadata !452, i32 16777300, metadata !642, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 84]
!646 = metadata !{i32 786689, metadata !639, metadata !"handle", metadata !452, i32 33554516, metadata !623, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 84]
!647 = metadata !{i32 786689, metadata !639, metadata !"flags", metadata !452, i32 50331732, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 84]
!648 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaSetDevice", metadata !"cudaSetDevice", metadata !"", metadata !452, i32 88, metadata !649, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDevice, null, null, 
!649 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !650, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!650 = metadata !{metadata !455, metadata !41}
!651 = metadata !{metadata !652}
!652 = metadata !{metadata !653}
!653 = metadata !{i32 786689, metadata !648, metadata !"device", metadata !452, i32 16777304, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 88]
!654 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaSetDeviceFlags", metadata !"cudaSetDeviceFlags", metadata !"", metadata !452, i32 92, metadata !655, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDeviceFlag
!655 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !656, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!656 = metadata !{metadata !455, metadata !11}
!657 = metadata !{metadata !658}
!658 = metadata !{metadata !659}
!659 = metadata !{i32 786689, metadata !654, metadata !"flags", metadata !452, i32 16777308, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 92]
!660 = metadata !{i32 786478, i32 0, metadata !452, metadata !"cudaSetValidDevices", metadata !"cudaSetValidDevices", metadata !"", metadata !452, i32 96, metadata !661, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32)* @cudaSetVa
!661 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !662, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!662 = metadata !{metadata !455, metadata !456, metadata !41}
!663 = metadata !{metadata !664}
!664 = metadata !{metadata !665, metadata !666}
!665 = metadata !{i32 786689, metadata !660, metadata !"device_arr", metadata !452, i32 16777312, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device_arr] [line 96]
!666 = metadata !{i32 786689, metadata !660, metadata !"len", metadata !452, i32 33554528, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 96]
!667 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!668 = metadata !{metadata !669}
!669 = metadata !{metadata !361, metadata !670, metadata !676}
!670 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !362, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !671, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!671 = metadata !{metadata !672, metadata !673, metadata !674, metadata !675}
!672 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!673 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!674 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!675 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!676 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !362, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !29, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!677 = metadata !{metadata !678}
!678 = metadata !{metadata !679, metadata !707, metadata !713, metadata !719, metadata !723, metadata !730, metadata !737, metadata !745, metadata !753, metadata !760, metadata !768, metadata !772, metadata !779, metadata !793, metadata !803, metadata !8
!679 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !680, i32 24, metadata !681, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!680 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!681 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !682, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!682 = metadata !{metadata !683, metadata !684, metadata !692, metadata !698, metadata !699}
!683 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !680, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !361} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!684 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !685} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!685 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !362, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !686, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!686 = metadata !{metadata !687, metadata !688, metadata !689, metadata !690, metadata !691}
!687 = metadata !{i32 786445, metadata !685, metadata !"x", metadata !362, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !41} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!688 = metadata !{i32 786445, metadata !685, metadata !"y", metadata !362, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !41} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!689 = metadata !{i32 786445, metadata !685, metadata !"z", metadata !362, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !41} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!690 = metadata !{i32 786445, metadata !685, metadata !"w", metadata !362, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !41} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!691 = metadata !{i32 786445, metadata !685, metadata !"f", metadata !362, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !670} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!692 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !693} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!693 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !362, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !694, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!694 = metadata !{metadata !695, metadata !696, metadata !697}
!695 = metadata !{i32 786445, metadata !693, metadata !"width", metadata !362, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !466} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!696 = metadata !{i32 786445, metadata !693, metadata !"height", metadata !362, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !466} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!697 = metadata !{i32 786445, metadata !693, metadata !"depth", metadata !362, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !466} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!698 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !11} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!699 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !700} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!700 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !362, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!701 = metadata !{metadata !702}
!702 = metadata !{metadata !703, metadata !704, metadata !705, metadata !706}
!703 = metadata !{i32 786689, metadata !679, metadata !"desc", metadata !680, i32 16777240, metadata !684, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!704 = metadata !{i32 786689, metadata !679, metadata !"extent", metadata !680, i32 33554456, metadata !692, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!705 = metadata !{i32 786689, metadata !679, metadata !"flags", metadata !680, i32 50331673, metadata !698, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!706 = metadata !{i32 786689, metadata !679, metadata !"array", metadata !680, i32 67108889, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!707 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !680, i32 29, metadata !708, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !710, 
!708 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !709, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!709 = metadata !{metadata !683, metadata !311}
!710 = metadata !{metadata !711}
!711 = metadata !{metadata !712}
!712 = metadata !{i32 786689, metadata !707, metadata !"devPtr", metadata !680, i32 16777245, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!713 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !680, i32 34, metadata !714, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!714 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !715, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!715 = metadata !{metadata !683, metadata !699}
!716 = metadata !{metadata !717}
!717 = metadata !{metadata !718}
!718 = metadata !{i32 786689, metadata !713, metadata !"array", metadata !680, i32 16777250, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!719 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !680, i32 39, metadata !708, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!720 = metadata !{metadata !721}
!721 = metadata !{metadata !722}
!722 = metadata !{i32 786689, metadata !719, metadata !"ptr", metadata !680, i32 16777255, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!723 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !680, i32 44, metadata !724, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!724 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !725, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!725 = metadata !{metadata !683, metadata !642, metadata !323}
!726 = metadata !{metadata !727}
!727 = metadata !{metadata !728, metadata !729}
!728 = metadata !{i32 786689, metadata !723, metadata !"devPtr", metadata !680, i32 16777260, metadata !642, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!729 = metadata !{i32 786689, metadata !723, metadata !"symbol", metadata !680, i32 33554476, metadata !323, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!730 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !680, i32 48, metadata !731, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!731 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !732, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!732 = metadata !{metadata !683, metadata !547, metadata !323}
!733 = metadata !{metadata !734}
!734 = metadata !{metadata !735, metadata !736}
!735 = metadata !{i32 786689, metadata !730, metadata !"size", metadata !680, i32 16777264, metadata !547, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!736 = metadata !{i32 786689, metadata !730, metadata !"symbol", metadata !680, i32 33554480, metadata !323, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!737 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !680, i32 52, metadata !738, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!738 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !739, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!739 = metadata !{metadata !683, metadata !642, metadata !466, metadata !11}
!740 = metadata !{metadata !741}
!741 = metadata !{metadata !742, metadata !743, metadata !744}
!742 = metadata !{i32 786689, metadata !737, metadata !"pHost", metadata !680, i32 16777268, metadata !642, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!743 = metadata !{i32 786689, metadata !737, metadata !"size", metadata !680, i32 33554484, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!744 = metadata !{i32 786689, metadata !737, metadata !"flags", metadata !680, i32 50331700, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!745 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !680, i32 56, metadata !746, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!746 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !747, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!747 = metadata !{metadata !683, metadata !642, metadata !311, metadata !11}
!748 = metadata !{metadata !749}
!749 = metadata !{metadata !750, metadata !751, metadata !752}
!750 = metadata !{i32 786689, metadata !745, metadata !"pDevice", metadata !680, i32 16777272, metadata !642, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!751 = metadata !{i32 786689, metadata !745, metadata !"pHost", metadata !680, i32 33554488, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!752 = metadata !{i32 786689, metadata !745, metadata !"flags", metadata !680, i32 50331704, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!753 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !680, i32 60, metadata !754, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!754 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !755, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!755 = metadata !{metadata !683, metadata !698, metadata !311}
!756 = metadata !{metadata !757}
!757 = metadata !{metadata !758, metadata !759}
!758 = metadata !{i32 786689, metadata !753, metadata !"pFlags", metadata !680, i32 16777276, metadata !698, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!759 = metadata !{i32 786689, metadata !753, metadata !"pHost", metadata !680, i32 33554492, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!760 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !680, i32 64, metadata !761, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!761 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !762, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!762 = metadata !{metadata !683, metadata !311, metadata !466, metadata !11}
!763 = metadata !{metadata !764}
!764 = metadata !{metadata !765, metadata !766, metadata !767}
!765 = metadata !{i32 786689, metadata !760, metadata !"ptr", metadata !680, i32 16777280, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!766 = metadata !{i32 786689, metadata !760, metadata !"size", metadata !680, i32 33554496, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!767 = metadata !{i32 786689, metadata !760, metadata !"flags", metadata !680, i32 50331712, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!768 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !680, i32 68, metadata !708, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!769 = metadata !{metadata !770}
!770 = metadata !{metadata !771}
!771 = metadata !{i32 786689, metadata !768, metadata !"ptr", metadata !680, i32 16777284, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!772 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !680, i32 72, metadata !773, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!773 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !774, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!774 = metadata !{metadata !683, metadata !642, metadata !466}
!775 = metadata !{metadata !776}
!776 = metadata !{metadata !777, metadata !778}
!777 = metadata !{i32 786689, metadata !772, metadata !"devPtr", metadata !680, i32 16777288, metadata !642, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!778 = metadata !{i32 786689, metadata !772, metadata !"size", metadata !680, i32 33554504, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!779 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !680, i32 80, metadata !780, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!780 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !781, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!781 = metadata !{metadata !683, metadata !782, metadata !693}
!782 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !783} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!783 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !362, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !784, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!784 = metadata !{metadata !785, metadata !786, metadata !787, metadata !788}
!785 = metadata !{i32 786445, metadata !783, metadata !"ptr", metadata !362, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !311} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!786 = metadata !{i32 786445, metadata !783, metadata !"pitch", metadata !362, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !466} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!787 = metadata !{i32 786445, metadata !783, metadata !"xsize", metadata !362, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !466} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!788 = metadata !{i32 786445, metadata !783, metadata !"ysize", metadata !362, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !466} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!789 = metadata !{metadata !790}
!790 = metadata !{metadata !791, metadata !792}
!791 = metadata !{i32 786689, metadata !779, metadata !"pitchedDevPtr", metadata !680, i32 16777296, metadata !782, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!792 = metadata !{i32 786689, metadata !779, metadata !"extent", metadata !680, i32 33554512, metadata !693, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!793 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !680, i32 84, metadata !794, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!794 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !795, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!795 = metadata !{metadata !683, metadata !796, metadata !684, metadata !693, metadata !11}
!796 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !699} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!797 = metadata !{metadata !798}
!798 = metadata !{metadata !799, metadata !800, metadata !801, metadata !802}
!799 = metadata !{i32 786689, metadata !793, metadata !"array", metadata !680, i32 16777300, metadata !796, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!800 = metadata !{i32 786689, metadata !793, metadata !"desc", metadata !680, i32 33554516, metadata !684, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!801 = metadata !{i32 786689, metadata !793, metadata !"extent", metadata !680, i32 50331733, metadata !693, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!802 = metadata !{i32 786689, metadata !793, metadata !"flags", metadata !680, i32 67108949, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!803 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !680, i32 89, metadata !804, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!804 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !805, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!805 = metadata !{metadata !683, metadata !796, metadata !684, metadata !466, metadata !466, metadata !11}
!806 = metadata !{metadata !807}
!807 = metadata !{metadata !808, metadata !809, metadata !810, metadata !811, metadata !812}
!808 = metadata !{i32 786689, metadata !803, metadata !"array", metadata !680, i32 16777305, metadata !796, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!809 = metadata !{i32 786689, metadata !803, metadata !"desc", metadata !680, i32 33554521, metadata !684, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!810 = metadata !{i32 786689, metadata !803, metadata !"width", metadata !680, i32 50331738, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!811 = metadata !{i32 786689, metadata !803, metadata !"height", metadata !680, i32 67108954, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!812 = metadata !{i32 786689, metadata !803, metadata !"flags", metadata !680, i32 83886170, metadata !11, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!813 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !680, i32 94, metadata !773, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!814 = metadata !{metadata !815}
!815 = metadata !{metadata !816, metadata !817}
!816 = metadata !{i32 786689, metadata !813, metadata !"ptr", metadata !680, i32 16777310, metadata !642, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!817 = metadata !{i32 786689, metadata !813, metadata !"size", metadata !680, i32 33554526, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!818 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !680, i32 102, metadata !819, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!819 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !820, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!820 = metadata !{metadata !683, metadata !642, metadata !547, metadata !466, metadata !466}
!821 = metadata !{metadata !822}
!822 = metadata !{metadata !823, metadata !824, metadata !825, metadata !826}
!823 = metadata !{i32 786689, metadata !818, metadata !"devPtr", metadata !680, i32 16777318, metadata !642, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!824 = metadata !{i32 786689, metadata !818, metadata !"pitch", metadata !680, i32 33554534, metadata !547, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!825 = metadata !{i32 786689, metadata !818, metadata !"width", metadata !680, i32 50331750, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!826 = metadata !{i32 786689, metadata !818, metadata !"height", metadata !680, i32 67108966, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!827 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !680, i32 106, metadata !828, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!828 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !829, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!829 = metadata !{metadata !683, metadata !311, metadata !312, metadata !466, metadata !676}
!830 = metadata !{metadata !831}
!831 = metadata !{metadata !832, metadata !833, metadata !834, metadata !835}
!832 = metadata !{i32 786689, metadata !827, metadata !"dst", metadata !680, i32 16777322, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!833 = metadata !{i32 786689, metadata !827, metadata !"src", metadata !680, i32 33554538, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!834 = metadata !{i32 786689, metadata !827, metadata !"count", metadata !680, i32 50331754, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!835 = metadata !{i32 786689, metadata !827, metadata !"kind", metadata !680, i32 67108970, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!836 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !680, i32 111, metadata !837, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!837 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !838, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!838 = metadata !{metadata !683, metadata !311, metadata !466, metadata !312, metadata !466, metadata !466, metadata !466, metadata !676}
!839 = metadata !{metadata !840}
!840 = metadata !{metadata !841, metadata !842, metadata !843, metadata !844, metadata !845, metadata !846, metadata !847}
!841 = metadata !{i32 786689, metadata !836, metadata !"dst", metadata !680, i32 16777327, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!842 = metadata !{i32 786689, metadata !836, metadata !"dpitch", metadata !680, i32 33554543, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!843 = metadata !{i32 786689, metadata !836, metadata !"src", metadata !680, i32 50331759, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!844 = metadata !{i32 786689, metadata !836, metadata !"spitch", metadata !680, i32 67108975, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!845 = metadata !{i32 786689, metadata !836, metadata !"width", metadata !680, i32 83886192, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!846 = metadata !{i32 786689, metadata !836, metadata !"height", metadata !680, i32 100663408, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!847 = metadata !{i32 786689, metadata !836, metadata !"kind", metadata !680, i32 117440624, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!848 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !680, i32 116, metadata !849, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!849 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !850, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!850 = metadata !{metadata !683, metadata !699, metadata !466, metadata !466, metadata !699, metadata !466, metadata !466, metadata !466, metadata !466, metadata !676}
!851 = metadata !{metadata !852}
!852 = metadata !{metadata !853, metadata !854, metadata !855, metadata !856, metadata !857, metadata !858, metadata !859, metadata !860, metadata !861}
!853 = metadata !{i32 786689, metadata !848, metadata !"dst", metadata !680, i32 16777332, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!854 = metadata !{i32 786689, metadata !848, metadata !"wOffsetDst", metadata !680, i32 33554548, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!855 = metadata !{i32 786689, metadata !848, metadata !"hOffsetDst", metadata !680, i32 50331764, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!856 = metadata !{i32 786689, metadata !848, metadata !"src", metadata !680, i32 67108981, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!857 = metadata !{i32 786689, metadata !848, metadata !"wOffsetSrc", metadata !680, i32 83886197, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!858 = metadata !{i32 786689, metadata !848, metadata !"hOffsetSrc", metadata !680, i32 100663413, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!859 = metadata !{i32 786689, metadata !848, metadata !"width", metadata !680, i32 117440630, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!860 = metadata !{i32 786689, metadata !848, metadata !"height", metadata !680, i32 134217846, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!861 = metadata !{i32 786689, metadata !848, metadata !"kind", metadata !680, i32 150995062, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!862 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !680, i32 122, metadata !863, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!863 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !864, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!864 = metadata !{metadata !683, metadata !311, metadata !466, metadata !312, metadata !466, metadata !466, metadata !466, metadata !676, metadata !865}
!865 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !680, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !866} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!866 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !867} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!867 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !362, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!868 = metadata !{metadata !869}
!869 = metadata !{metadata !870, metadata !871, metadata !872, metadata !873, metadata !874, metadata !875, metadata !876, metadata !877}
!870 = metadata !{i32 786689, metadata !862, metadata !"dst", metadata !680, i32 16777338, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!871 = metadata !{i32 786689, metadata !862, metadata !"dpitch", metadata !680, i32 33554554, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!872 = metadata !{i32 786689, metadata !862, metadata !"src", metadata !680, i32 50331770, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!873 = metadata !{i32 786689, metadata !862, metadata !"spitch", metadata !680, i32 67108986, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!874 = metadata !{i32 786689, metadata !862, metadata !"width", metadata !680, i32 83886203, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!875 = metadata !{i32 786689, metadata !862, metadata !"height", metadata !680, i32 100663419, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!876 = metadata !{i32 786689, metadata !862, metadata !"kind", metadata !680, i32 117440635, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!877 = metadata !{i32 786689, metadata !862, metadata !"stream", metadata !680, i32 134217852, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!878 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !680, i32 128, metadata !879, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!879 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !880, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!880 = metadata !{metadata !683, metadata !311, metadata !466, metadata !699, metadata !466, metadata !466, metadata !466, metadata !466, metadata !676}
!881 = metadata !{metadata !882}
!882 = metadata !{metadata !883, metadata !884, metadata !885, metadata !886, metadata !887, metadata !888, metadata !889, metadata !890}
!883 = metadata !{i32 786689, metadata !878, metadata !"dst", metadata !680, i32 16777344, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!884 = metadata !{i32 786689, metadata !878, metadata !"dpitch", metadata !680, i32 33554560, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!885 = metadata !{i32 786689, metadata !878, metadata !"src", metadata !680, i32 50331776, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!886 = metadata !{i32 786689, metadata !878, metadata !"wOffset", metadata !680, i32 67108993, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!887 = metadata !{i32 786689, metadata !878, metadata !"hOffset", metadata !680, i32 83886209, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!888 = metadata !{i32 786689, metadata !878, metadata !"width", metadata !680, i32 100663425, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!889 = metadata !{i32 786689, metadata !878, metadata !"height", metadata !680, i32 117440641, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!890 = metadata !{i32 786689, metadata !878, metadata !"kind", metadata !680, i32 134217858, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!891 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !680, i32 134, metadata !892, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!892 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !893, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!893 = metadata !{metadata !683, metadata !311, metadata !466, metadata !699, metadata !466, metadata !466, metadata !466, metadata !466, metadata !676, metadata !865}
!894 = metadata !{metadata !895}
!895 = metadata !{metadata !896, metadata !897, metadata !898, metadata !899, metadata !900, metadata !901, metadata !902, metadata !903, metadata !904}
!896 = metadata !{i32 786689, metadata !891, metadata !"dst", metadata !680, i32 16777350, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!897 = metadata !{i32 786689, metadata !891, metadata !"dpitch", metadata !680, i32 33554566, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!898 = metadata !{i32 786689, metadata !891, metadata !"src", metadata !680, i32 50331782, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!899 = metadata !{i32 786689, metadata !891, metadata !"wOffset", metadata !680, i32 67108999, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!900 = metadata !{i32 786689, metadata !891, metadata !"hOffset", metadata !680, i32 83886215, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!901 = metadata !{i32 786689, metadata !891, metadata !"width", metadata !680, i32 100663431, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!902 = metadata !{i32 786689, metadata !891, metadata !"height", metadata !680, i32 117440647, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!903 = metadata !{i32 786689, metadata !891, metadata !"kind", metadata !680, i32 134217864, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!904 = metadata !{i32 786689, metadata !891, metadata !"stream", metadata !680, i32 150995080, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!905 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !680, i32 140, metadata !906, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!906 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !907, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!907 = metadata !{metadata !683, metadata !699, metadata !466, metadata !466, metadata !312, metadata !466, metadata !466, metadata !466, metadata !676}
!908 = metadata !{metadata !909}
!909 = metadata !{metadata !910, metadata !911, metadata !912, metadata !913, metadata !914, metadata !915, metadata !916, metadata !917}
!910 = metadata !{i32 786689, metadata !905, metadata !"dst", metadata !680, i32 16777356, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!911 = metadata !{i32 786689, metadata !905, metadata !"wOffset", metadata !680, i32 33554572, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!912 = metadata !{i32 786689, metadata !905, metadata !"hOffset", metadata !680, i32 50331788, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!913 = metadata !{i32 786689, metadata !905, metadata !"src", metadata !680, i32 67109005, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!914 = metadata !{i32 786689, metadata !905, metadata !"spitch", metadata !680, i32 83886221, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!915 = metadata !{i32 786689, metadata !905, metadata !"width", metadata !680, i32 100663437, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!916 = metadata !{i32 786689, metadata !905, metadata !"height", metadata !680, i32 117440653, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!917 = metadata !{i32 786689, metadata !905, metadata !"kind", metadata !680, i32 134217870, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!918 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !680, i32 146, metadata !919, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!919 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !920, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!920 = metadata !{metadata !683, metadata !699, metadata !466, metadata !466, metadata !312, metadata !466, metadata !466, metadata !466, metadata !676, metadata !865}
!921 = metadata !{metadata !922}
!922 = metadata !{metadata !923, metadata !924, metadata !925, metadata !926, metadata !927, metadata !928, metadata !929, metadata !930, metadata !931}
!923 = metadata !{i32 786689, metadata !918, metadata !"dst", metadata !680, i32 16777362, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!924 = metadata !{i32 786689, metadata !918, metadata !"wOffset", metadata !680, i32 33554578, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!925 = metadata !{i32 786689, metadata !918, metadata !"hOffset", metadata !680, i32 50331794, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!926 = metadata !{i32 786689, metadata !918, metadata !"src", metadata !680, i32 67109011, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!927 = metadata !{i32 786689, metadata !918, metadata !"spitch", metadata !680, i32 83886227, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!928 = metadata !{i32 786689, metadata !918, metadata !"width", metadata !680, i32 100663443, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!929 = metadata !{i32 786689, metadata !918, metadata !"height", metadata !680, i32 117440659, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!930 = metadata !{i32 786689, metadata !918, metadata !"kind", metadata !680, i32 134217876, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!931 = metadata !{i32 786689, metadata !918, metadata !"stream", metadata !680, i32 150995092, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!932 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !680, i32 152, metadata !933, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!933 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !934, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!934 = metadata !{metadata !683, metadata !935}
!935 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !936} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!936 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !937} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!937 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !362, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !938, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!938 = metadata !{metadata !939, metadata !941, metadata !947, metadata !948, metadata !949, metadata !950, metadata !951, metadata !952}
!939 = metadata !{i32 786445, metadata !937, metadata !"srcArray", metadata !362, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !940} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!940 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !362, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !699} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!941 = metadata !{i32 786445, metadata !937, metadata !"srcPos", metadata !362, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !942} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!942 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !362, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !943, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!943 = metadata !{metadata !944, metadata !945, metadata !946}
!944 = metadata !{i32 786445, metadata !942, metadata !"x", metadata !362, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !466} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!945 = metadata !{i32 786445, metadata !942, metadata !"y", metadata !362, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !466} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!946 = metadata !{i32 786445, metadata !942, metadata !"z", metadata !362, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !466} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!947 = metadata !{i32 786445, metadata !937, metadata !"srcPtr", metadata !362, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !783} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!948 = metadata !{i32 786445, metadata !937, metadata !"dstArray", metadata !362, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !940} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!949 = metadata !{i32 786445, metadata !937, metadata !"dstPos", metadata !362, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !942} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!950 = metadata !{i32 786445, metadata !937, metadata !"dstPtr", metadata !362, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !783} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!951 = metadata !{i32 786445, metadata !937, metadata !"extent", metadata !362, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !693} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!952 = metadata !{i32 786445, metadata !937, metadata !"kind", metadata !362, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !676} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!953 = metadata !{metadata !954}
!954 = metadata !{metadata !955}
!955 = metadata !{i32 786689, metadata !932, metadata !"p", metadata !680, i32 16777368, metadata !935, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!956 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !680, i32 156, metadata !957, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms
!957 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !958, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!958 = metadata !{metadata !683, metadata !935, metadata !865}
!959 = metadata !{metadata !960}
!960 = metadata !{metadata !961, metadata !962}
!961 = metadata !{i32 786689, metadata !956, metadata !"p", metadata !680, i32 16777372, metadata !935, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!962 = metadata !{i32 786689, metadata !956, metadata !"stream", metadata !680, i32 33554588, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!963 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !680, i32 160, metadata !964, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerPar
!964 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !965, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!965 = metadata !{metadata !683, metadata !966}
!966 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !967} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!967 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !968} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!968 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !362, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !969, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, off
!969 = metadata !{metadata !970, metadata !971, metadata !972, metadata !973, metadata !974, metadata !975, metadata !976, metadata !977, metadata !978}
!970 = metadata !{i32 786445, metadata !968, metadata !"srcArray", metadata !362, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !940} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!971 = metadata !{i32 786445, metadata !968, metadata !"srcPos", metadata !362, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !942} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!972 = metadata !{i32 786445, metadata !968, metadata !"srcPtr", metadata !362, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !783} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!973 = metadata !{i32 786445, metadata !968, metadata !"srcDevice", metadata !362, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !41} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!974 = metadata !{i32 786445, metadata !968, metadata !"dstArray", metadata !362, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !940} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!975 = metadata !{i32 786445, metadata !968, metadata !"dstPos", metadata !362, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !942} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!976 = metadata !{i32 786445, metadata !968, metadata !"dstPtr", metadata !362, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !783} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!977 = metadata !{i32 786445, metadata !968, metadata !"dstDevice", metadata !362, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !41} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!978 = metadata !{i32 786445, metadata !968, metadata !"extent", metadata !362, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !693} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!979 = metadata !{metadata !980}
!980 = metadata !{metadata !981}
!981 = metadata !{i32 786689, metadata !963, metadata !"p", metadata !680, i32 16777376, metadata !966, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!982 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !680, i32 164, metadata !983, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcp
!983 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !984, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!984 = metadata !{metadata !683, metadata !966, metadata !865}
!985 = metadata !{metadata !986}
!986 = metadata !{metadata !987, metadata !988}
!987 = metadata !{i32 786689, metadata !982, metadata !"p", metadata !680, i32 16777380, metadata !966, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!988 = metadata !{i32 786689, metadata !982, metadata !"stream", metadata !680, i32 33554596, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!989 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !680, i32 168, metadata !990, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArr
!990 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !991, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!991 = metadata !{metadata !683, metadata !699, metadata !466, metadata !466, metadata !699, metadata !466, metadata !466, metadata !466, metadata !676}
!992 = metadata !{metadata !993}
!993 = metadata !{metadata !994, metadata !995, metadata !996, metadata !997, metadata !998, metadata !999, metadata !1000, metadata !1001}
!994 = metadata !{i32 786689, metadata !989, metadata !"dst", metadata !680, i32 16777384, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!995 = metadata !{i32 786689, metadata !989, metadata !"wOffsetDst", metadata !680, i32 33554600, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!996 = metadata !{i32 786689, metadata !989, metadata !"hOffsetDst", metadata !680, i32 50331816, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!997 = metadata !{i32 786689, metadata !989, metadata !"src", metadata !680, i32 67109033, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!998 = metadata !{i32 786689, metadata !989, metadata !"wOffsetSrc", metadata !680, i32 83886249, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!999 = metadata !{i32 786689, metadata !989, metadata !"hOffsetSrc", metadata !680, i32 100663465, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!1000 = metadata !{i32 786689, metadata !989, metadata !"count", metadata !680, i32 117440682, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!1001 = metadata !{i32 786689, metadata !989, metadata !"kind", metadata !680, i32 134217898, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!1002 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !680, i32 174, metadata !1003, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct
!1003 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1004, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1004 = metadata !{metadata !683, metadata !311, metadata !312, metadata !466, metadata !676, metadata !865}
!1005 = metadata !{metadata !1006}
!1006 = metadata !{metadata !1007, metadata !1008, metadata !1009, metadata !1010, metadata !1011}
!1007 = metadata !{i32 786689, metadata !1002, metadata !"dst", metadata !680, i32 16777390, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!1008 = metadata !{i32 786689, metadata !1002, metadata !"src", metadata !680, i32 33554606, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!1009 = metadata !{i32 786689, metadata !1002, metadata !"count", metadata !680, i32 50331822, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!1010 = metadata !{i32 786689, metadata !1002, metadata !"kind", metadata !680, i32 67109039, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!1011 = metadata !{i32 786689, metadata !1002, metadata !"stream", metadata !680, i32 83886255, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!1012 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !680, i32 179, metadata !1013, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaAr
!1013 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1014, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1014 = metadata !{metadata !683, metadata !311, metadata !699, metadata !466, metadata !466, metadata !466, metadata !676}
!1015 = metadata !{metadata !1016}
!1016 = metadata !{metadata !1017, metadata !1018, metadata !1019, metadata !1020, metadata !1021, metadata !1022}
!1017 = metadata !{i32 786689, metadata !1012, metadata !"dst", metadata !680, i32 16777395, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!1018 = metadata !{i32 786689, metadata !1012, metadata !"src", metadata !680, i32 33554611, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!1019 = metadata !{i32 786689, metadata !1012, metadata !"wOffset", metadata !680, i32 50331827, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!1020 = metadata !{i32 786689, metadata !1012, metadata !"hOffset", metadata !680, i32 67109044, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!1021 = metadata !{i32 786689, metadata !1012, metadata !"count", metadata !680, i32 83886260, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!1022 = metadata !{i32 786689, metadata !1012, metadata !"kind", metadata !680, i32 100663476, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!1023 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !680, i32 184, metadata !1024, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %str
!1024 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1025, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1025 = metadata !{metadata !683, metadata !311, metadata !699, metadata !466, metadata !466, metadata !466, metadata !676, metadata !865}
!1026 = metadata !{metadata !1027}
!1027 = metadata !{metadata !1028, metadata !1029, metadata !1030, metadata !1031, metadata !1032, metadata !1033, metadata !1034}
!1028 = metadata !{i32 786689, metadata !1023, metadata !"dst", metadata !680, i32 16777400, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!1029 = metadata !{i32 786689, metadata !1023, metadata !"src", metadata !680, i32 33554616, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!1030 = metadata !{i32 786689, metadata !1023, metadata !"wOffset", metadata !680, i32 50331832, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!1031 = metadata !{i32 786689, metadata !1023, metadata !"hOffset", metadata !680, i32 67109049, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!1032 = metadata !{i32 786689, metadata !1023, metadata !"count", metadata !680, i32 83886265, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!1033 = metadata !{i32 786689, metadata !1023, metadata !"kind", metadata !680, i32 100663481, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!1034 = metadata !{i32 786689, metadata !1023, metadata !"stream", metadata !680, i32 117440698, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!1035 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !680, i32 190, metadata !1036, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i6
!1036 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1037, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1037 = metadata !{metadata !683, metadata !311, metadata !323, metadata !466, metadata !466, metadata !676}
!1038 = metadata !{metadata !1039}
!1039 = metadata !{metadata !1040, metadata !1041, metadata !1042, metadata !1043, metadata !1044}
!1040 = metadata !{i32 786689, metadata !1035, metadata !"dst", metadata !680, i32 16777406, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!1041 = metadata !{i32 786689, metadata !1035, metadata !"symbol", metadata !680, i32 33554622, metadata !323, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!1042 = metadata !{i32 786689, metadata !1035, metadata !"count", metadata !680, i32 50331838, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!1043 = metadata !{i32 786689, metadata !1035, metadata !"offset", metadata !680, i32 67109055, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!1044 = metadata !{i32 786689, metadata !1035, metadata !"kind", metadata !680, i32 83886271, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!1045 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !680, i32 195, metadata !1046, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8
!1046 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1047, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1047 = metadata !{metadata !683, metadata !311, metadata !323, metadata !466, metadata !466, metadata !676, metadata !865}
!1048 = metadata !{metadata !1049}
!1049 = metadata !{metadata !1050, metadata !1051, metadata !1052, metadata !1053, metadata !1054, metadata !1055}
!1050 = metadata !{i32 786689, metadata !1045, metadata !"dst", metadata !680, i32 16777411, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!1051 = metadata !{i32 786689, metadata !1045, metadata !"symbol", metadata !680, i32 33554627, metadata !323, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!1052 = metadata !{i32 786689, metadata !1045, metadata !"count", metadata !680, i32 50331843, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!1053 = metadata !{i32 786689, metadata !1045, metadata !"offset", metadata !680, i32 67109060, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!1054 = metadata !{i32 786689, metadata !1045, metadata !"kind", metadata !680, i32 83886276, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!1055 = metadata !{i32 786689, metadata !1045, metadata !"stream", metadata !680, i32 100663493, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!1056 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !680, i32 201, metadata !1057, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cu
!1057 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1058, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1058 = metadata !{metadata !683, metadata !311, metadata !41, metadata !312, metadata !41, metadata !466}
!1059 = metadata !{metadata !1060}
!1060 = metadata !{metadata !1061, metadata !1062, metadata !1063, metadata !1064, metadata !1065}
!1061 = metadata !{i32 786689, metadata !1056, metadata !"dst", metadata !680, i32 16777417, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!1062 = metadata !{i32 786689, metadata !1056, metadata !"dstDevice", metadata !680, i32 33554633, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!1063 = metadata !{i32 786689, metadata !1056, metadata !"src", metadata !680, i32 50331849, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!1064 = metadata !{i32 786689, metadata !1056, metadata !"srcDevice", metadata !680, i32 67109065, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!1065 = metadata !{i32 786689, metadata !1056, metadata !"count", metadata !680, i32 83886281, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!1066 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !680, i32 206, metadata !1067, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32,
!1067 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1068, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1068 = metadata !{metadata !683, metadata !311, metadata !41, metadata !312, metadata !41, metadata !466, metadata !865}
!1069 = metadata !{metadata !1070}
!1070 = metadata !{metadata !1071, metadata !1072, metadata !1073, metadata !1074, metadata !1075, metadata !1076}
!1071 = metadata !{i32 786689, metadata !1066, metadata !"dst", metadata !680, i32 16777422, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!1072 = metadata !{i32 786689, metadata !1066, metadata !"dstDevice", metadata !680, i32 33554638, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!1073 = metadata !{i32 786689, metadata !1066, metadata !"src", metadata !680, i32 50331854, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!1074 = metadata !{i32 786689, metadata !1066, metadata !"srcDevice", metadata !680, i32 67109070, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!1075 = metadata !{i32 786689, metadata !1066, metadata !"count", metadata !680, i32 83886287, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!1076 = metadata !{i32 786689, metadata !1066, metadata !"stream", metadata !680, i32 100663503, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!1077 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !680, i32 212, metadata !1078, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64
!1078 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1079, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1079 = metadata !{metadata !683, metadata !699, metadata !466, metadata !466, metadata !312, metadata !466, metadata !676}
!1080 = metadata !{metadata !1081}
!1081 = metadata !{metadata !1082, metadata !1083, metadata !1084, metadata !1085, metadata !1086, metadata !1087}
!1082 = metadata !{i32 786689, metadata !1077, metadata !"dst", metadata !680, i32 16777428, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!1083 = metadata !{i32 786689, metadata !1077, metadata !"wOffset", metadata !680, i32 33554644, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!1084 = metadata !{i32 786689, metadata !1077, metadata !"hOffset", metadata !680, i32 50331860, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!1085 = metadata !{i32 786689, metadata !1077, metadata !"src", metadata !680, i32 67109077, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!1086 = metadata !{i32 786689, metadata !1077, metadata !"count", metadata !680, i32 83886293, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!1087 = metadata !{i32 786689, metadata !1077, metadata !"kind", metadata !680, i32 100663509, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!1088 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !680, i32 217, metadata !1089, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaA
!1089 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1090, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1090 = metadata !{metadata !683, metadata !699, metadata !466, metadata !466, metadata !312, metadata !466, metadata !676, metadata !865}
!1091 = metadata !{metadata !1092}
!1092 = metadata !{metadata !1093, metadata !1094, metadata !1095, metadata !1096, metadata !1097, metadata !1098, metadata !1099}
!1093 = metadata !{i32 786689, metadata !1088, metadata !"dst", metadata !680, i32 16777433, metadata !699, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!1094 = metadata !{i32 786689, metadata !1088, metadata !"wOffset", metadata !680, i32 33554649, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!1095 = metadata !{i32 786689, metadata !1088, metadata !"hOffset", metadata !680, i32 50331865, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!1096 = metadata !{i32 786689, metadata !1088, metadata !"src", metadata !680, i32 67109082, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!1097 = metadata !{i32 786689, metadata !1088, metadata !"count", metadata !680, i32 83886298, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!1098 = metadata !{i32 786689, metadata !1088, metadata !"kind", metadata !680, i32 100663514, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!1099 = metadata !{i32 786689, metadata !1088, metadata !"stream", metadata !680, i32 117440731, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!1100 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !680, i32 223, metadata !1101, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i
!1101 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1102, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1102 = metadata !{metadata !683, metadata !43, metadata !312, metadata !466, metadata !466, metadata !676}
!1103 = metadata !{metadata !1104}
!1104 = metadata !{metadata !1105, metadata !1106, metadata !1107, metadata !1108, metadata !1109}
!1105 = metadata !{i32 786689, metadata !1100, metadata !"symbol", metadata !680, i32 16777439, metadata !43, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!1106 = metadata !{i32 786689, metadata !1100, metadata !"src", metadata !680, i32 33554655, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!1107 = metadata !{i32 786689, metadata !1100, metadata !"count", metadata !680, i32 50331871, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!1108 = metadata !{i32 786689, metadata !1100, metadata !"offset", metadata !680, i32 67109088, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!1109 = metadata !{i32 786689, metadata !1100, metadata !"kind", metadata !680, i32 83886304, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!1110 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !680, i32 229, metadata !1111, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i
!1111 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1112, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1112 = metadata !{metadata !683, metadata !323, metadata !312, metadata !466, metadata !466, metadata !676, metadata !865}
!1113 = metadata !{metadata !1114}
!1114 = metadata !{metadata !1115, metadata !1116, metadata !1117, metadata !1118, metadata !1119, metadata !1120}
!1115 = metadata !{i32 786689, metadata !1110, metadata !"symbol", metadata !680, i32 16777445, metadata !323, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!1116 = metadata !{i32 786689, metadata !1110, metadata !"src", metadata !680, i32 33554661, metadata !312, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!1117 = metadata !{i32 786689, metadata !1110, metadata !"count", metadata !680, i32 50331877, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!1118 = metadata !{i32 786689, metadata !1110, metadata !"offset", metadata !680, i32 67109093, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!1119 = metadata !{i32 786689, metadata !1110, metadata !"kind", metadata !680, i32 83886310, metadata !676, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!1120 = metadata !{i32 786689, metadata !1110, metadata !"stream", metadata !680, i32 100663526, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!1121 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !680, i32 234, metadata !1122, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo,
!1122 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1123, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1123 = metadata !{metadata !683, metadata !547, metadata !547}
!1124 = metadata !{metadata !1125}
!1125 = metadata !{metadata !1126, metadata !1127}
!1126 = metadata !{i32 786689, metadata !1121, metadata !"free", metadata !680, i32 16777450, metadata !547, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!1127 = metadata !{i32 786689, metadata !1121, metadata !"total", metadata !680, i32 33554666, metadata !547, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!1128 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !680, i32 238, metadata !1129, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, nu
!1129 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1130, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1130 = metadata !{metadata !683, metadata !311, metadata !41, metadata !466}
!1131 = metadata !{metadata !1132}
!1132 = metadata !{metadata !1133, metadata !1134, metadata !1135}
!1133 = metadata !{i32 786689, metadata !1128, metadata !"devPtr", metadata !680, i32 16777454, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!1134 = metadata !{i32 786689, metadata !1128, metadata !"value", metadata !680, i32 33554670, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!1135 = metadata !{i32 786689, metadata !1128, metadata !"count", metadata !680, i32 50331886, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!1136 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !680, i32 243, metadata !1137, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMe
!1137 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1138, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1138 = metadata !{metadata !683, metadata !311, metadata !466, metadata !41, metadata !466, metadata !466}
!1139 = metadata !{metadata !1140}
!1140 = metadata !{metadata !1141, metadata !1142, metadata !1143, metadata !1144, metadata !1145}
!1141 = metadata !{i32 786689, metadata !1136, metadata !"devPtr", metadata !680, i32 16777459, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!1142 = metadata !{i32 786689, metadata !1136, metadata !"pitch", metadata !680, i32 33554675, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!1143 = metadata !{i32 786689, metadata !1136, metadata !"value", metadata !680, i32 50331891, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!1144 = metadata !{i32 786689, metadata !1136, metadata !"width", metadata !680, i32 67109108, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!1145 = metadata !{i32 786689, metadata !1136, metadata !"height", metadata !680, i32 83886324, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!1146 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !680, i32 248, metadata !1147, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64
!1147 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1148, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1148 = metadata !{metadata !683, metadata !311, metadata !466, metadata !41, metadata !466, metadata !466, metadata !865}
!1149 = metadata !{metadata !1150}
!1150 = metadata !{metadata !1151, metadata !1152, metadata !1153, metadata !1154, metadata !1155, metadata !1156}
!1151 = metadata !{i32 786689, metadata !1146, metadata !"devPtr", metadata !680, i32 16777464, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!1152 = metadata !{i32 786689, metadata !1146, metadata !"pitch", metadata !680, i32 33554680, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!1153 = metadata !{i32 786689, metadata !1146, metadata !"value", metadata !680, i32 50331896, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!1154 = metadata !{i32 786689, metadata !1146, metadata !"width", metadata !680, i32 67109113, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!1155 = metadata !{i32 786689, metadata !1146, metadata !"height", metadata !680, i32 83886329, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!1156 = metadata !{i32 786689, metadata !1146, metadata !"stream", metadata !680, i32 100663545, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!1157 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !680, i32 253, metadata !1158, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %st
!1158 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1159, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1159 = metadata !{metadata !683, metadata !783, metadata !41, metadata !693}
!1160 = metadata !{metadata !1161}
!1161 = metadata !{metadata !1162, metadata !1163, metadata !1164}
!1162 = metadata !{i32 786689, metadata !1157, metadata !"pitchedDevPtr", metadata !680, i32 16777469, metadata !783, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!1163 = metadata !{i32 786689, metadata !1157, metadata !"value", metadata !680, i32 33554685, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!1164 = metadata !{i32 786689, metadata !1157, metadata !"extent", metadata !680, i32 50331902, metadata !693, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!1165 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !680, i32 258, metadata !1166, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*
!1166 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1167, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1167 = metadata !{metadata !683, metadata !783, metadata !41, metadata !693, metadata !865}
!1168 = metadata !{metadata !1169}
!1169 = metadata !{metadata !1170, metadata !1171, metadata !1172, metadata !1173}
!1170 = metadata !{i32 786689, metadata !1165, metadata !"pitchedDevPtr", metadata !680, i32 16777474, metadata !783, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!1171 = metadata !{i32 786689, metadata !1165, metadata !"value", metadata !680, i32 33554690, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!1172 = metadata !{i32 786689, metadata !1165, metadata !"extent", metadata !680, i32 50331907, metadata !693, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!1173 = metadata !{i32 786689, metadata !1165, metadata !"stream", metadata !680, i32 67109123, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!1174 = metadata !{i32 786478, i32 0, metadata !680, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !680, i32 263, metadata !1175, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUst
!1175 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1176, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1176 = metadata !{metadata !683, metadata !311, metadata !41, metadata !466, metadata !865}
!1177 = metadata !{metadata !1178}
!1178 = metadata !{metadata !1179, metadata !1180, metadata !1181, metadata !1182}
!1179 = metadata !{i32 786689, metadata !1174, metadata !"devPtr", metadata !680, i32 16777479, metadata !311, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!1180 = metadata !{i32 786689, metadata !1174, metadata !"value", metadata !680, i32 33554695, metadata !41, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!1181 = metadata !{i32 786689, metadata !1174, metadata !"count", metadata !680, i32 50331911, metadata !466, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!1182 = metadata !{i32 786689, metadata !1174, metadata !"stream", metadata !680, i32 67109127, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!1183 = metadata !{i32 36, i32 0, metadata !19, null}
!1184 = metadata !{i32 40, i32 0, metadata !22, null}
!1185 = metadata !{i32 41, i32 0, metadata !22, null}
!1186 = metadata !{metadata !"int", metadata !1187}
!1187 = metadata !{metadata !"omnipotent char", metadata !1188}
!1188 = metadata !{metadata !"Simple C/C++ TBAA"}
!1189 = metadata !{i32 38, i32 0, metadata !23, null}
!1190 = metadata !{i32 43, i32 0, metadata !20, null}
!1191 = metadata !{i32 24, i32 0, metadata !50, null}
!1192 = metadata !{metadata !"any pointer", metadata !1187}
!1193 = metadata !{i32 35, i32 0, metadata !50, null}
!1194 = metadata !{i32 37, i32 0, metadata !50, null}
!1195 = metadata !{i32 39, i32 0, metadata !50, null}
!1196 = metadata !{i32 43, i32 0, metadata !50, null}
!1197 = metadata !{i32 45, i32 0, metadata !60, null}
!1198 = metadata !{i32 47, i32 0, metadata !1199, null}
!1199 = metadata !{i32 786443, metadata !60, i32 46, i32 0, metadata !38, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/main.cpp]
!1200 = metadata !{i32 51, i32 0, metadata !50, null}
!1201 = metadata !{i32 55, i32 0, metadata !50, null}
!1202 = metadata !{i32 56, i32 0, metadata !50, null}
!1203 = metadata !{i32 58, i32 0, metadata !50, null}
!1204 = metadata !{i32 60, i32 0, metadata !50, null}
!1205 = metadata !{i32 61, i32 0, metadata !50, null}
!1206 = metadata !{i32 66, i32 0, metadata !50, null}
!1207 = metadata !{i32 120, i32 0, metadata !50, null}
!1208 = metadata !{i32 122, i32 0, metadata !68, null}
!1209 = metadata !{i32 124, i32 0, metadata !70, null}
!1210 = metadata !{i32 131, i32 0, metadata !70, null}
!1211 = metadata !{i32 138, i32 0, metadata !70, null}
!1212 = metadata !{i32 139, i32 0, metadata !70, null}
!1213 = metadata !{i32 141, i32 0, metadata !70, null}
!1214 = metadata !{i32 143, i32 0, metadata !70, null}
!1215 = metadata !{i32 147, i32 0, metadata !70, null}
!1216 = metadata !{i32 160, i32 0, metadata !70, null}
!1217 = metadata !{i32 164, i32 0, metadata !70, null}
!1218 = metadata !{i32 166, i32 0, metadata !1219, null}
!1219 = metadata !{i32 786443, metadata !70, i32 165, i32 0, metadata !38, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/main.cpp]
!1220 = metadata !{i32 169, i32 0, metadata !1219, null}
!1221 = metadata !{i32 170, i32 0, metadata !1219, null}
!1222 = metadata !{i32 174, i32 0, metadata !50, null}
!1223 = metadata !{i32 175, i32 0, metadata !50, null}
!1224 = metadata !{i32 178, i32 0, metadata !50, null}
!1225 = metadata !{i32 179, i32 0, metadata !50, null}
!1226 = metadata !{i32 183, i32 0, metadata !50, null}
!1227 = metadata !{i32 185, i32 0, metadata !50, null}
!1228 = metadata !{i32 85, i32 0, metadata !114, null}
!1229 = metadata !{i32 88, i32 0, metadata !114, null}
!1230 = metadata !{i32 91, i32 0, metadata !114, null}
!1231 = metadata !{i32 94, i32 0, metadata !114, null}
!1232 = metadata !{i32 95, i32 0, metadata !114, null}
!1233 = metadata !{i32 47, i32 0, metadata !278, metadata !1234}
!1234 = metadata !{i32 66, i32 0, metadata !270, null}
!1235 = metadata !{i32 48, i32 0, metadata !278, metadata !1234}
!1236 = metadata !{i32 49, i32 0, metadata !278, metadata !1234}
!1237 = metadata !{i32 52, i32 0, metadata !278, metadata !1234}
!1238 = metadata !{i32 22, i32 0, metadata !256, metadata !1239}
!1239 = metadata !{i32 40, i32 0, metadata !1240, metadata !1237}
!1240 = metadata !{i32 786443, metadata !239, i32 39, i32 0, metadata !79, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1241 = metadata !{i32 23, i32 0, metadata !256, metadata !1239}
!1242 = metadata !{i32 24, i32 0, metadata !256, metadata !1239}
!1243 = metadata !{i32 25, i32 0, metadata !256, metadata !1239}
!1244 = metadata !{i32 27, i32 0, metadata !258, metadata !1239}
!1245 = metadata !{i32 29, i32 0, metadata !260, metadata !1239}
!1246 = metadata !{i32 30, i32 0, metadata !260, metadata !1239}
!1247 = metadata !{i32 31, i32 0, metadata !260, metadata !1239}
!1248 = metadata !{i32 32, i32 0, metadata !260, metadata !1239}
!1249 = metadata !{i32 35, i32 0, metadata !256, metadata !1239}
!1250 = metadata !{i32 54, i32 0, metadata !278, metadata !1234}
!1251 = metadata !{i32 55, i32 0, metadata !278, metadata !1234}
!1252 = metadata !{i32 56, i32 0, metadata !278, metadata !1234}
!1253 = metadata !{i32 57, i32 0, metadata !278, metadata !1234}
!1254 = metadata !{i32 67, i32 0, metadata !270, null}
!1255 = metadata !{i32 68, i32 0, metadata !270, null}
!1256 = metadata !{i32 69, i32 0, metadata !270, null}
!1257 = metadata !{i32 70, i32 0, metadata !270, null}
!1258 = metadata !{i32 71, i32 0, metadata !270, null}
!1259 = metadata !{i32 109, i32 0, metadata !129, null}
!1260 = metadata !{i32 115, i32 0, metadata !129, null}
!1261 = metadata !{i32 116, i32 0, metadata !129, null}
!1262 = metadata !{i32 22, i32 0, metadata !256, metadata !1263}
!1263 = metadata !{i32 40, i32 0, metadata !1240, metadata !1264}
!1264 = metadata !{i32 121, i32 0, metadata !129, null}
!1265 = metadata !{i32 23, i32 0, metadata !256, metadata !1263}
!1266 = metadata !{i32 24, i32 0, metadata !256, metadata !1263}
!1267 = metadata !{i32 25, i32 0, metadata !256, metadata !1263}
!1268 = metadata !{i32 27, i32 0, metadata !258, metadata !1263}
!1269 = metadata !{i32 29, i32 0, metadata !260, metadata !1263}
!1270 = metadata !{i32 30, i32 0, metadata !260, metadata !1263}
!1271 = metadata !{i32 31, i32 0, metadata !260, metadata !1263}
!1272 = metadata !{i32 32, i32 0, metadata !260, metadata !1263}
!1273 = metadata !{i32 35, i32 0, metadata !256, metadata !1263}
!1274 = metadata !{i32 124, i32 0, metadata !129, null}
!1275 = metadata !{i32 126, i32 0, metadata !1276, null}
!1276 = metadata !{i32 786443, metadata !129, i32 125, i32 0, metadata !79, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1277 = metadata !{i32 127, i32 0, metadata !1276, null}
!1278 = metadata !{i32 128, i32 0, metadata !129, null}
!1279 = metadata !{i32 137, i32 0, metadata !140, null}
!1280 = metadata !{i32 139, i32 0, metadata !140, null}
!1281 = metadata !{i32 141, i32 0, metadata !1282, null}
!1282 = metadata !{i32 786443, metadata !140, i32 140, i32 0, metadata !79, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1283 = metadata !{i32 142, i32 0, metadata !1282, null}
!1284 = metadata !{i32 144, i32 0, metadata !140, null}
!1285 = metadata !{i32 146, i32 0, metadata !140, null}
!1286 = metadata !{i32 147, i32 0, metadata !140, null}
!1287 = metadata !{i32 148, i32 0, metadata !140, null}
!1288 = metadata !{i32 149, i32 0, metadata !140, null}
!1289 = metadata !{i32 150, i32 0, metadata !140, null}
!1290 = metadata !{i32 151, i32 0, metadata !140, null}
!1291 = metadata !{i32 152, i32 0, metadata !140, null}
!1292 = metadata !{i32 170, i32 0, metadata !1293, null}
!1293 = metadata !{i32 786443, metadata !142, i32 169, i32 0, metadata !79, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1294 = metadata !{i32 171, i32 0, metadata !1293, null}
!1295 = metadata !{i32 176, i32 0, metadata !1296, null}
!1296 = metadata !{i32 786443, metadata !145, i32 174, i32 0, metadata !79, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1297 = metadata !{i32 177, i32 0, metadata !1296, null}
!1298 = metadata !{i32 181, i32 0, metadata !1299, metadata !1300}
!1299 = metadata !{i32 786443, metadata !231, i32 180, i32 0, metadata !79, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1300 = metadata !{i32 208, i32 0, metadata !157, null}
!1301 = metadata !{i32 188, i32 0, metadata !1302, metadata !1300}
!1302 = metadata !{i32 786443, metadata !1303, i32 188, i32 0, metadata !79, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1303 = metadata !{i32 786443, metadata !1299, i32 187, i32 0, metadata !79, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1304 = metadata !{i32 209, i32 0, metadata !157, null}
!1305 = metadata !{i32 212, i32 0, metadata !157, null}
!1306 = metadata !{i32 215, i32 0, metadata !157, null}
!1307 = metadata !{i32 218, i32 0, metadata !157, null}
!1308 = metadata !{i32 219, i32 0, metadata !1309, null}
!1309 = metadata !{i32 786443, metadata !157, i32 219, i32 0, metadata !79, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1310 = metadata !{i32 419, i32 0, metadata !224, metadata !1311}
!1311 = metadata !{i32 419, i32 0, metadata !178, metadata !1308}
!1312 = metadata !{i32 221, i32 0, metadata !1309, null}
!1313 = metadata !{i32 228, i32 0, metadata !157, null}
!1314 = metadata !{i32 230, i32 0, metadata !157, null}
!1315 = metadata !{i32 181, i32 0, metadata !1299, metadata !1316}
!1316 = metadata !{i32 242, i32 0, metadata !167, null}
!1317 = metadata !{i32 188, i32 0, metadata !1302, metadata !1316}
!1318 = metadata !{i32 243, i32 0, metadata !167, null}
!1319 = metadata !{i32 246, i32 0, metadata !167, null}
!1320 = metadata !{i32 249, i32 0, metadata !167, null}
!1321 = metadata !{i32 250, i32 0, metadata !1322, null}
!1322 = metadata !{i32 786443, metadata !167, i32 250, i32 0, metadata !79, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1323 = metadata !{i32 419, i32 0, metadata !224, metadata !1324}
!1324 = metadata !{i32 419, i32 0, metadata !178, metadata !1321}
!1325 = metadata !{i32 252, i32 0, metadata !1322, null}
!1326 = metadata !{i32 259, i32 0, metadata !167, null}
!1327 = metadata !{i32 196, i32 0, metadata !1328, metadata !1329}
!1328 = metadata !{i32 786443, metadata !171, i32 195, i32 0, metadata !79, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1329 = metadata !{i32 263, i32 0, metadata !167, null}
!1330 = metadata !{i32 419, i32 0, metadata !224, metadata !1331}
!1331 = metadata !{i32 419, i32 0, metadata !178, metadata !1332}
!1332 = metadata !{i32 264, i32 0, metadata !1333, null}
!1333 = metadata !{i32 786443, metadata !167, i32 264, i32 0, metadata !79, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1334 = metadata !{i32 266, i32 0, metadata !1333, null}
!1335 = metadata !{i32 275, i32 0, metadata !167, null}
!1336 = metadata !{i32 276, i32 0, metadata !1337, null}
!1337 = metadata !{i32 786443, metadata !167, i32 276, i32 0, metadata !79, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-1-CUDA-5.5/scan/scan.cpp]
!1338 = metadata !{i32 278, i32 0, metadata !1337, null}
!1339 = metadata !{i32 284, i32 0, metadata !167, null}
!1340 = metadata !{i32 286, i32 0, metadata !167, null}
!1341 = metadata !{i32 13, i32 0, metadata !1342, null}
!1342 = metadata !{i32 786443, metadata !296, i32 12, i32 0, metadata !297, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c]
!1343 = metadata !{i32 14, i32 0, metadata !1342, null}
!1344 = metadata !{i32 15, i32 0, metadata !1342, null}
!1345 = metadata !{i32 16, i32 0, metadata !321, null}
!1346 = metadata !{i32 17, i32 0, metadata !321, null}
!1347 = metadata !{i32 18, i32 0, metadata !321, null}
!1348 = metadata !{i32 14, i32 0, metadata !355, null}
!1349 = metadata !{i32 15, i32 0, metadata !355, null}
!1350 = metadata !{i32 16, i32 0, metadata !355, null}
!1351 = metadata !{i32 15, i32 0, metadata !1352, null}
!1352 = metadata !{i32 786443, metadata !451, i32 14, i32 0, metadata !452, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1353 = metadata !{i32 16, i32 0, metadata !1352, null}
!1354 = metadata !{i32 20, i32 0, metadata !1355, null}
!1355 = metadata !{i32 786443, metadata !530, i32 19, i32 0, metadata !452, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1356 = metadata !{i32 21, i32 0, metadata !1355, null}
!1357 = metadata !{i32 25, i32 0, metadata !1358, null}
!1358 = metadata !{i32 786443, metadata !537, i32 24, i32 0, metadata !452, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1359 = metadata !{i32 29, i32 0, metadata !1360, null}
!1360 = metadata !{i32 786443, metadata !544, i32 28, i32 0, metadata !452, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1361 = metadata !{i32 33, i32 0, metadata !1362, null}
!1362 = metadata !{i32 786443, metadata !552, i32 32, i32 0, metadata !452, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1363 = metadata !{i32 34, i32 0, metadata !1362, null}
!1364 = metadata !{i32 38, i32 0, metadata !1365, null}
!1365 = metadata !{i32 786443, metadata !560, i32 37, i32 0, metadata !452, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1366 = metadata !{i32 42, i32 0, metadata !1367, null}
!1367 = metadata !{i32 786443, metadata !563, i32 41, i32 0, metadata !452, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1368 = metadata !{i32 46, i32 0, metadata !1369, null}
!1369 = metadata !{i32 786443, metadata !569, i32 45, i32 0, metadata !452, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1370 = metadata !{i32 50, i32 0, metadata !1371, null}
!1371 = metadata !{i32 786443, metadata !576, i32 49, i32 0, metadata !452, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1372 = metadata !{i32 54, i32 0, metadata !1373, null}
!1373 = metadata !{i32 786443, metadata !577, i32 53, i32 0, metadata !452, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1374 = metadata !{i32 55, i32 0, metadata !1373, null}
!1375 = metadata !{i32 59, i32 0, metadata !1376, null}
!1376 = metadata !{i32 786443, metadata !583, i32 58, i32 0, metadata !452, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1377 = metadata !{i32 60, i32 0, metadata !1376, null}
!1378 = metadata !{i32 64, i32 0, metadata !1379, null}
!1379 = metadata !{i32 786443, metadata !587, i32 63, i32 0, metadata !452, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1380 = metadata !{i32 65, i32 0, metadata !1379, null}
!1381 = metadata !{i32 69, i32 0, metadata !1382, null}
!1382 = metadata !{i32 786443, metadata !595, i32 68, i32 0, metadata !452, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1383 = metadata !{i32 73, i32 0, metadata !1384, null}
!1384 = metadata !{i32 786443, metadata !601, i32 72, i32 0, metadata !452, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1385 = metadata !{i32 77, i32 0, metadata !1386, null}
!1386 = metadata !{i32 786443, metadata !619, i32 76, i32 0, metadata !452, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1387 = metadata !{i32 81, i32 0, metadata !1388, null}
!1388 = metadata !{i32 786443, metadata !631, i32 80, i32 0, metadata !452, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1389 = metadata !{i32 85, i32 0, metadata !1390, null}
!1390 = metadata !{i32 786443, metadata !639, i32 84, i32 0, metadata !452, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1391 = metadata !{i32 89, i32 0, metadata !1392, null}
!1392 = metadata !{i32 786443, metadata !648, i32 88, i32 0, metadata !452, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1393 = metadata !{i32 93, i32 0, metadata !1394, null}
!1394 = metadata !{i32 786443, metadata !654, i32 92, i32 0, metadata !452, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1395 = metadata !{i32 97, i32 0, metadata !1396, null}
!1396 = metadata !{i32 786443, metadata !660, i32 96, i32 0, metadata !452, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!1397 = metadata !{i32 26, i32 0, metadata !1398, null}
!1398 = metadata !{i32 786443, metadata !679, i32 25, i32 0, metadata !680, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1399 = metadata !{i32 30, i32 0, metadata !1400, null}
!1400 = metadata !{i32 786443, metadata !707, i32 29, i32 0, metadata !680, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1401 = metadata !{i32 31, i32 0, metadata !1400, null}
!1402 = metadata !{i32 35, i32 0, metadata !1403, null}
!1403 = metadata !{i32 786443, metadata !713, i32 34, i32 0, metadata !680, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1404 = metadata !{i32 36, i32 0, metadata !1403, null}
!1405 = metadata !{i32 40, i32 0, metadata !1406, null}
!1406 = metadata !{i32 786443, metadata !719, i32 39, i32 0, metadata !680, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1407 = metadata !{i32 41, i32 0, metadata !1406, null}
!1408 = metadata !{i32 45, i32 0, metadata !1409, null}
!1409 = metadata !{i32 786443, metadata !723, i32 44, i32 0, metadata !680, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1410 = metadata !{i32 49, i32 0, metadata !1411, null}
!1411 = metadata !{i32 786443, metadata !730, i32 48, i32 0, metadata !680, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1412 = metadata !{i32 53, i32 0, metadata !1413, null}
!1413 = metadata !{i32 786443, metadata !737, i32 52, i32 0, metadata !680, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1414 = metadata !{i32 57, i32 0, metadata !1415, null}
!1415 = metadata !{i32 786443, metadata !745, i32 56, i32 0, metadata !680, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1416 = metadata !{i32 61, i32 0, metadata !1417, null}
!1417 = metadata !{i32 786443, metadata !753, i32 60, i32 0, metadata !680, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1418 = metadata !{i32 65, i32 0, metadata !1419, null}
!1419 = metadata !{i32 786443, metadata !760, i32 64, i32 0, metadata !680, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1420 = metadata !{i32 69, i32 0, metadata !1421, null}
!1421 = metadata !{i32 786443, metadata !768, i32 68, i32 0, metadata !680, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1422 = metadata !{i32 73, i32 0, metadata !1423, null}
!1423 = metadata !{i32 786443, metadata !772, i32 72, i32 0, metadata !680, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1424 = metadata !{i32 74, i32 0, metadata !1423, null}
!1425 = metadata !{i32 75, i32 0, metadata !1423, null}
!1426 = metadata !{i32 77, i32 0, metadata !1423, null}
!1427 = metadata !{i32 81, i32 0, metadata !1428, null}
!1428 = metadata !{i32 786443, metadata !779, i32 80, i32 0, metadata !680, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1429 = metadata !{i32 86, i32 0, metadata !1430, null}
!1430 = metadata !{i32 786443, metadata !793, i32 85, i32 0, metadata !680, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1431 = metadata !{i32 91, i32 0, metadata !1432, null}
!1432 = metadata !{i32 786443, metadata !803, i32 90, i32 0, metadata !680, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1433 = metadata !{i32 95, i32 0, metadata !1434, null}
!1434 = metadata !{i32 786443, metadata !813, i32 94, i32 0, metadata !680, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1435 = metadata !{i32 96, i32 0, metadata !1434, null}
!1436 = metadata !{i32 97, i32 0, metadata !1434, null}
!1437 = metadata !{i32 99, i32 0, metadata !1434, null}
!1438 = metadata !{i32 103, i32 0, metadata !1439, null}
!1439 = metadata !{i32 786443, metadata !818, i32 102, i32 0, metadata !680, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1440 = metadata !{i32 108, i32 0, metadata !1441, null}
!1441 = metadata !{i32 786443, metadata !827, i32 106, i32 0, metadata !680, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1442 = metadata !{i32 113, i32 0, metadata !1443, null}
!1443 = metadata !{i32 786443, metadata !836, i32 112, i32 0, metadata !680, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1444 = metadata !{i32 119, i32 0, metadata !1445, null}
!1445 = metadata !{i32 786443, metadata !848, i32 118, i32 0, metadata !680, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1446 = metadata !{i32 125, i32 0, metadata !1447, null}
!1447 = metadata !{i32 786443, metadata !862, i32 124, i32 0, metadata !680, i32 20} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1448 = metadata !{i32 131, i32 0, metadata !1449, null}
!1449 = metadata !{i32 786443, metadata !878, i32 130, i32 0, metadata !680, i32 21} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1450 = metadata !{i32 137, i32 0, metadata !1451, null}
!1451 = metadata !{i32 786443, metadata !891, i32 136, i32 0, metadata !680, i32 22} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1452 = metadata !{i32 143, i32 0, metadata !1453, null}
!1453 = metadata !{i32 786443, metadata !905, i32 142, i32 0, metadata !680, i32 23} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1454 = metadata !{i32 149, i32 0, metadata !1455, null}
!1455 = metadata !{i32 786443, metadata !918, i32 148, i32 0, metadata !680, i32 24} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1456 = metadata !{i32 153, i32 0, metadata !1457, null}
!1457 = metadata !{i32 786443, metadata !932, i32 152, i32 0, metadata !680, i32 25} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1458 = metadata !{i32 157, i32 0, metadata !1459, null}
!1459 = metadata !{i32 786443, metadata !956, i32 156, i32 0, metadata !680, i32 26} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1460 = metadata !{i32 161, i32 0, metadata !1461, null}
!1461 = metadata !{i32 786443, metadata !963, i32 160, i32 0, metadata !680, i32 27} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1462 = metadata !{i32 165, i32 0, metadata !1463, null}
!1463 = metadata !{i32 786443, metadata !982, i32 164, i32 0, metadata !680, i32 28} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1464 = metadata !{i32 171, i32 0, metadata !1465, null}
!1465 = metadata !{i32 786443, metadata !989, i32 170, i32 0, metadata !680, i32 29} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1466 = metadata !{i32 176, i32 0, metadata !1467, null}
!1467 = metadata !{i32 786443, metadata !1002, i32 175, i32 0, metadata !680, i32 30} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1468 = metadata !{i32 181, i32 0, metadata !1469, null}
!1469 = metadata !{i32 786443, metadata !1012, i32 180, i32 0, metadata !680, i32 31} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1470 = metadata !{i32 187, i32 0, metadata !1471, null}
!1471 = metadata !{i32 786443, metadata !1023, i32 186, i32 0, metadata !680, i32 32} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1472 = metadata !{i32 192, i32 0, metadata !1473, null}
!1473 = metadata !{i32 786443, metadata !1035, i32 191, i32 0, metadata !680, i32 33} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1474 = metadata !{i32 198, i32 0, metadata !1475, null}
!1475 = metadata !{i32 786443, metadata !1045, i32 197, i32 0, metadata !680, i32 34} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1476 = metadata !{i32 203, i32 0, metadata !1477, null}
!1477 = metadata !{i32 786443, metadata !1056, i32 201, i32 0, metadata !680, i32 35} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1478 = metadata !{i32 209, i32 0, metadata !1479, null}
!1479 = metadata !{i32 786443, metadata !1066, i32 207, i32 0, metadata !680, i32 36} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1480 = metadata !{i32 214, i32 0, metadata !1481, null}
!1481 = metadata !{i32 786443, metadata !1077, i32 213, i32 0, metadata !680, i32 37} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1482 = metadata !{i32 220, i32 0, metadata !1483, null}
!1483 = metadata !{i32 786443, metadata !1088, i32 219, i32 0, metadata !680, i32 38} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1484 = metadata !{i32 225, i32 0, metadata !1485, null}
!1485 = metadata !{i32 786443, metadata !1100, i32 224, i32 0, metadata !680, i32 39} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1486 = metadata !{i32 226, i32 0, metadata !1485, null}
!1487 = metadata !{i32 231, i32 0, metadata !1488, null}
!1488 = metadata !{i32 786443, metadata !1110, i32 230, i32 0, metadata !680, i32 40} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1489 = metadata !{i32 235, i32 0, metadata !1490, null}
!1490 = metadata !{i32 786443, metadata !1121, i32 234, i32 0, metadata !680, i32 41} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1491 = metadata !{i32 239, i32 0, metadata !1492, null}
!1492 = metadata !{i32 786443, metadata !1128, i32 238, i32 0, metadata !680, i32 42} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1493 = metadata !{i32 240, i32 0, metadata !1492, null}
!1494 = metadata !{i32 245, i32 0, metadata !1495, null}
!1495 = metadata !{i32 786443, metadata !1136, i32 244, i32 0, metadata !680, i32 43} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1496 = metadata !{i32 250, i32 0, metadata !1497, null}
!1497 = metadata !{i32 786443, metadata !1146, i32 249, i32 0, metadata !680, i32 44} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1498 = metadata !{i32 255, i32 0, metadata !1499, null}
!1499 = metadata !{i32 786443, metadata !1157, i32 254, i32 0, metadata !680, i32 45} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1500 = metadata !{i32 260, i32 0, metadata !1501, null}
!1501 = metadata !{i32 786443, metadata !1165, i32 259, i32 0, metadata !680, i32 46} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1502 = metadata !{i32 264, i32 0, metadata !1503, null}
!1503 = metadata !{i32 786443, metadata !1174, i32 263, i32 0, metadata !680, i32 47} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
