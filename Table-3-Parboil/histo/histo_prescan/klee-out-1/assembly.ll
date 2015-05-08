; ModuleID = 'histo.sym.new'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.ushort4 = type { i16, i16, i16, i16 }
%struct.uchar4 = type { i8, i8, i8, i8 }
%struct.uint4 = type { i32, i32, i32, i32 }
%struct.uint2 = type { i32, i32 }
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
@blockDim = external global %struct.dim3
@.str = private unnamed_addr constant [18 x i8] c"size: %u, j: %u \0A\00", align 1
@gridDim = external global %struct.dim3
@.str1 = private unnamed_addr constant [35 x i8] c"range: %u, bin: %u, bin_div2: %u \0A\00", align 1
@_ZZ17histo_main_kernelP6uchar4jjjjjPjS1_S1_E9sub_histo = internal global [24 x [256 x i32]] zeroinitializer, section "__shared__", align 16
@_ZZ20histo_prescan_kernelPjiS_E3Avg = internal unnamed_addr global [512 x float] zeroinitializer, section "__shared__", align 16
@_ZZ20histo_prescan_kernelPjiS_E6StdDev = internal unnamed_addr global [512 x float] zeroinitializer, section "__shared__", align 16
@.str5 = private unnamed_addr constant [83 x i8] c"/home/peng/PPoPP14-GKLEE-Test/Parboil/parboil/datasets/histo/default/input/img.bin\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"rb\00", align 1
@.str7 = private unnamed_addr constant [53 x i8] c"Error reading input and output dimensions from file\0A\00", align 1
@stderr = external global %struct._IO_FILE*
@.str8 = private unnamed_addr constant [67 x i8] c"img_width: %u, img_height: %u, histo_width: %u, histo_height: %u \0A\00", align 1
@.str9 = private unnamed_addr constant [37 x i8] c"Error reading input array from file\0A\00", align 1
@.str10 = private unnamed_addr constant [13 x i8] c"ranges_input\00", align 1
@.str2 = private unnamed_addr constant [65 x i8] c"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str13 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str24 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1

define void @_Z18histo_final_kerneljjjjPjS_S_S_(i32 %sm_range_min, i32 %sm_range_max, i32 %histo_height, i32 %histo_width, i32* nocapture %global_subhisto, i32* nocapture %global_histo, i32* nocapture %global_overflow, i32* nocapture %final_histo) uwtabl
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1236, !tbaa !1237
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1236, !tbaa !1237
  %2 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1236, !tbaa !1237
  %mul = mul i32 %2, %1, !dbg !1236
  %add = add i32 %mul, %0, !dbg !1236
  %mul1 = mul i32 %sm_range_min, 24576, !dbg !1240
  %sub = sub i32 %sm_range_max, %sm_range_min, !dbg !1241
  %3 = mul i32 %sub, 24576, !dbg !1241
  %div = lshr exact i32 %mul1, 2, !dbg !1242
  %cmp243 = icmp ult i32 %add, %div, !dbg !1242
  br i1 %cmp243, label %for.body.lr.ph, label %for.end, !dbg !1242

for.body.lr.ph:                                   ; preds = %entry
  %4 = bitcast i32* %global_histo to %struct.ushort4*, !dbg !1243
  br label %for.body, !dbg !1242

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %j.0245 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %i.0244 = phi i32 [ %add, %for.body.lr.ph ], [ %add36, %for.body ]
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i64 8, i32 %j.0245), !dbg !1244
  %idxprom = zext i32 %i.0244 to i64, !dbg !1243
  %arrayidx = getelementptr inbounds %struct.ushort4* %4, i64 %idxprom, !dbg !1243
  %global_histo_data.sroa.0.0..idx = getelementptr inbounds %struct.ushort4* %arrayidx, i64 0, i32 0, !dbg !1243
  %global_histo_data.sroa.0.0.copyload = load i16* %global_histo_data.sroa.0.0..idx, align 8, !dbg !1243
  %global_histo_data.sroa.1.2..idx203 = getelementptr inbounds %struct.ushort4* %4, i64 %idxprom, i32 1, !dbg !1243
  %global_histo_data.sroa.1.2.copyload = load i16* %global_histo_data.sroa.1.2..idx203, align 2, !dbg !1243
  %global_histo_data.sroa.2.4..idx205 = getelementptr inbounds %struct.ushort4* %4, i64 %idxprom, i32 2, !dbg !1243
  %global_histo_data.sroa.2.4.copyload = load i16* %global_histo_data.sroa.2.4..idx205, align 4, !dbg !1243
  %global_histo_data.sroa.3.6..idx207 = getelementptr inbounds %struct.ushort4* %4, i64 %idxprom, i32 3, !dbg !1243
  %global_histo_data.sroa.3.6.copyload = load i16* %global_histo_data.sroa.3.6..idx207, align 2, !dbg !1243
  %5 = bitcast %struct.ushort4* %arrayidx to i64*, !dbg !1245
  store i64 0, i64* %5, align 8, !dbg !1245
  %conv = zext i16 %global_histo_data.sroa.0.0.copyload to i32, !dbg !1246
  %call6 = tail call i32 @min(i32 %conv, i32 255), !dbg !1246
  %conv9 = zext i16 %global_histo_data.sroa.1.2.copyload to i32, !dbg !1247
  %call10 = tail call i32 @min(i32 %conv9, i32 255), !dbg !1247
  %conv13 = zext i16 %global_histo_data.sroa.2.4.copyload to i32, !dbg !1248
  %call14 = tail call i32 @min(i32 %conv13, i32 255), !dbg !1248
  %conv17 = zext i16 %global_histo_data.sroa.3.6.copyload to i32, !dbg !1249
  %call18 = tail call i32 @min(i32 %conv17, i32 255), !dbg !1249
  %conv23 = trunc i32 %call6 to i8, !dbg !1250
  %conv26 = trunc i32 %call10 to i8, !dbg !1250
  %conv29 = trunc i32 %call14 to i8, !dbg !1250
  %conv32 = trunc i32 %call18 to i8, !dbg !1250
  %arrayidx34230 = getelementptr inbounds i32* %final_histo, i64 %idxprom, !dbg !1251
  %arrayidx34 = bitcast i32* %arrayidx34230 to %struct.uchar4*, !dbg !1251
  %final_histo_data.sroa.0.0..idx = bitcast i32* %arrayidx34230 to i8*, !dbg !1251
  store i8 %conv23, i8* %final_histo_data.sroa.0.0..idx, align 4, !dbg !1251
  %final_histo_data.sroa.1.1..idx = getelementptr inbounds %struct.uchar4* %arrayidx34, i64 0, i32 1, !dbg !1251
  store i8 %conv26, i8* %final_histo_data.sroa.1.1..idx, align 1, !dbg !1251
  %final_histo_data.sroa.2.2..idx = getelementptr inbounds %struct.uchar4* %arrayidx34, i64 0, i32 2, !dbg !1251
  store i8 %conv29, i8* %final_histo_data.sroa.2.2..idx, align 2, !dbg !1251
  %final_histo_data.sroa.3.3..idx = getelementptr inbounds %struct.uchar4* %arrayidx34, i64 0, i32 3, !dbg !1251
  store i8 %conv32, i8* %final_histo_data.sroa.3.3..idx, align 1, !dbg !1251
  %6 = load i32* getelementptr inbounds (%struct.dim3* @gridDim, i64 0, i32 0), align 4, !dbg !1242, !tbaa !1237
  %7 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1242, !tbaa !1237
  %mul35 = mul i32 %7, %6, !dbg !1242
  %add36 = add i32 %mul35, %i.0244, !dbg !1242
  %inc = add i32 %j.0245, 1, !dbg !1242
  %cmp = icmp ult i32 %add36, %div, !dbg !1242
  br i1 %cmp, label %for.body, label %for.end, !dbg !1242

for.end:                                          ; preds = %for.body, %entry
  %add39 = add i32 %add, %div, !dbg !1252
  %mul3 = add i32 %mul1, 24576, !dbg !1241
  %add41 = add i32 %mul3, %3, !dbg !1252
  %div42 = lshr exact i32 %add41, 2, !dbg !1252
  %cmp43241 = icmp ult i32 %add39, %div42, !dbg !1252
  br i1 %cmp43241, label %for.body44.lr.ph, label %for.end.for.end115_crit_edge, !dbg !1252

for.end.for.end115_crit_edge:                     ; preds = %for.end
  %mul121.pre = mul i32 %histo_width, %histo_height, !dbg !1253
  br label %for.end115, !dbg !1252

for.body44.lr.ph:                                 ; preds = %for.end
  %8 = bitcast i32* %global_overflow to %struct.uint4*, !dbg !1254
  %mul62 = mul i32 %histo_width, %histo_height, !dbg !1255
  br label %for.body44, !dbg !1252

for.body44:                                       ; preds = %for.end84, %for.body44.lr.ph
  %i37.0242 = phi i32 [ %add39, %for.body44.lr.ph ], [ %add114, %for.end84 ]
  %idxprom46 = zext i32 %i37.0242 to i64, !dbg !1254
  %arrayidx47 = getelementptr inbounds %struct.uint4* %8, i64 %idxprom46, !dbg !1254
  %global_histo_data45.sroa.0.0..idx = getelementptr inbounds %struct.uint4* %arrayidx47, i64 0, i32 0, !dbg !1254
  %global_histo_data45.sroa.0.0.copyload = load i32* %global_histo_data45.sroa.0.0..idx, align 16, !dbg !1254
  %global_histo_data45.sroa.1.4..idx193 = getelementptr inbounds %struct.uint4* %8, i64 %idxprom46, i32 1, !dbg !1254
  %global_histo_data45.sroa.1.4.copyload = load i32* %global_histo_data45.sroa.1.4..idx193, align 4, !dbg !1254
  %global_histo_data45.sroa.2.8..idx194 = getelementptr inbounds %struct.uint4* %8, i64 %idxprom46, i32 2, !dbg !1254
  %global_histo_data45.sroa.2.8.copyload = load i32* %global_histo_data45.sroa.2.8..idx194, align 8, !dbg !1254
  %global_histo_data45.sroa.3.12..idx195 = getelementptr inbounds %struct.uint4* %8, i64 %idxprom46, i32 3, !dbg !1254
  %global_histo_data45.sroa.3.12.copyload = load i32* %global_histo_data45.sroa.3.12..idx195, align 4, !dbg !1254
  %9 = bitcast %struct.uint4* %arrayidx47 to i8*, !dbg !1256
  %10 = call i8* @memset(i8* %9, i32 0, i64 16)
  br label %for.body61, !dbg !1257

for.body61:                                       ; preds = %for.body61, %for.body44
  %internal_histo_data.sroa.3.0240 = phi i32 [ %global_histo_data45.sroa.3.12.copyload, %for.body44 ], [ %add81, %for.body61 ]
  %internal_histo_data.sroa.2.0239 = phi i32 [ %global_histo_data45.sroa.2.8.copyload, %for.body44 ], [ %add77, %for.body61 ]
  %internal_histo_data.sroa.1.0238 = phi i32 [ %global_histo_data45.sroa.1.4.copyload, %for.body44 ], [ %add73, %for.body61 ]
  %internal_histo_data.sroa.0.0237 = phi i32 [ %global_histo_data45.sroa.0.0.copyload, %for.body44 ], [ %add69, %for.body61 ]
  %j58.0236 = phi i32 [ 0, %for.body44 ], [ %inc83, %for.body61 ]
  %mul63 = mul i32 %mul62, %j58.0236, !dbg !1255
  %div64 = lshr i32 %mul63, 2, !dbg !1255
  %add65 = add i32 %div64, %i37.0242, !dbg !1255
  %idxprom66 = zext i32 %add65 to i64, !dbg !1255
  %arrayidx67 = getelementptr inbounds i32* %global_subhisto, i64 %idxprom66, !dbg !1255
  %11 = load i32* %arrayidx67, align 4, !dbg !1255, !tbaa !1237
  %and = and i32 %11, 255, !dbg !1258
  %add69 = add i32 %and, %internal_histo_data.sroa.0.0237, !dbg !1258
  %shr70 = lshr i32 %11, 8, !dbg !1259
  %and71 = and i32 %shr70, 255, !dbg !1259
  %add73 = add i32 %and71, %internal_histo_data.sroa.1.0238, !dbg !1259
  %shr74 = lshr i32 %11, 16, !dbg !1260
  %and75 = and i32 %shr74, 255, !dbg !1260
  %add77 = add i32 %and75, %internal_histo_data.sroa.2.0239, !dbg !1260
  %shr78 = lshr i32 %11, 24, !dbg !1261
  %add81 = add i32 %shr78, %internal_histo_data.sroa.3.0240, !dbg !1261
  %inc83 = add nsw i32 %j58.0236, 1, !dbg !1257
  %exitcond = icmp eq i32 %inc83, 14, !dbg !1257
  br i1 %exitcond, label %for.end84, label %for.body61, !dbg !1257

for.end84:                                        ; preds = %for.body61
  %call.i = tail call i32 @umin(i32 %add69, i32 255), !dbg !1262
  %call.i231 = tail call i32 @umin(i32 %add73, i32 255), !dbg !1265
  %call.i232 = tail call i32 @umin(i32 %add77, i32 255), !dbg !1267
  %call.i233 = tail call i32 @umin(i32 %add81, i32 255), !dbg !1269
  %conv100 = trunc i32 %call.i to i8, !dbg !1271
  %conv103 = trunc i32 %call.i231 to i8, !dbg !1271
  %conv106 = trunc i32 %call.i232 to i8, !dbg !1271
  %conv109 = trunc i32 %call.i233 to i8, !dbg !1271
  %arrayidx111229 = getelementptr inbounds i32* %final_histo, i64 %idxprom46, !dbg !1272
  %arrayidx111 = bitcast i32* %arrayidx111229 to %struct.uchar4*, !dbg !1272
  %final_histo_data97.sroa.0.0..idx = bitcast i32* %arrayidx111229 to i8*, !dbg !1272
  store i8 %conv100, i8* %final_histo_data97.sroa.0.0..idx, align 4, !dbg !1272
  %final_histo_data97.sroa.1.1..idx = getelementptr inbounds %struct.uchar4* %arrayidx111, i64 0, i32 1, !dbg !1272
  store i8 %conv103, i8* %final_histo_data97.sroa.1.1..idx, align 1, !dbg !1272
  %final_histo_data97.sroa.2.2..idx = getelementptr inbounds %struct.uchar4* %arrayidx111, i64 0, i32 2, !dbg !1272
  store i8 %conv106, i8* %final_histo_data97.sroa.2.2..idx, align 2, !dbg !1272
  %final_histo_data97.sroa.3.3..idx = getelementptr inbounds %struct.uchar4* %arrayidx111, i64 0, i32 3, !dbg !1272
  store i8 %conv109, i8* %final_histo_data97.sroa.3.3..idx, align 1, !dbg !1272
  %12 = load i32* getelementptr inbounds (%struct.dim3* @gridDim, i64 0, i32 0), align 4, !dbg !1252, !tbaa !1237
  %13 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1252, !tbaa !1237
  %mul113 = mul i32 %13, %12, !dbg !1252
  %add114 = add i32 %mul113, %i37.0242, !dbg !1252
  %cmp43 = icmp ult i32 %add114, %div42, !dbg !1252
  br i1 %cmp43, label %for.body44, label %for.end115, !dbg !1252

for.end115:                                       ; preds = %for.end84, %for.end.for.end115_crit_edge
  %mul121.pre-phi = phi i32 [ %mul121.pre, %for.end.for.end115_crit_edge ], [ %mul62, %for.end84 ], !dbg !1253
  %add119 = add i32 %add, %div42, !dbg !1253
  %div122 = lshr i32 %mul121.pre-phi, 2, !dbg !1253
  %cmp123234 = icmp ult i32 %add119, %div122, !dbg !1253
  br i1 %cmp123234, label %for.body124.lr.ph, label %for.end168, !dbg !1253

for.body124.lr.ph:                                ; preds = %for.end115
  %14 = bitcast i32* %global_histo to %struct.ushort4*, !dbg !1273
  br label %for.body124, !dbg !1253

for.body124:                                      ; preds = %for.body124, %for.body124.lr.ph
  %i116.0235 = phi i32 [ %add119, %for.body124.lr.ph ], [ %add167, %for.body124 ]
  %idxprom126 = zext i32 %i116.0235 to i64, !dbg !1273
  %arrayidx127 = getelementptr inbounds %struct.ushort4* %14, i64 %idxprom126, !dbg !1273
  %global_histo_data125.sroa.0.0..idx = getelementptr inbounds %struct.ushort4* %arrayidx127, i64 0, i32 0, !dbg !1273
  %global_histo_data125.sroa.0.0.copyload = load i16* %global_histo_data125.sroa.0.0..idx, align 8, !dbg !1273
  %global_histo_data125.sroa.1.2..idx171 = getelementptr inbounds %struct.ushort4* %14, i64 %idxprom126, i32 1, !dbg !1273
  %global_histo_data125.sroa.1.2.copyload = load i16* %global_histo_data125.sroa.1.2..idx171, align 2, !dbg !1273
  %global_histo_data125.sroa.2.4..idx173 = getelementptr inbounds %struct.ushort4* %14, i64 %idxprom126, i32 2, !dbg !1273
  %global_histo_data125.sroa.2.4.copyload = load i16* %global_histo_data125.sroa.2.4..idx173, align 4, !dbg !1273
  %global_histo_data125.sroa.3.6..idx175 = getelementptr inbounds %struct.ushort4* %14, i64 %idxprom126, i32 3, !dbg !1273
  %global_histo_data125.sroa.3.6.copyload = load i16* %global_histo_data125.sroa.3.6..idx175, align 2, !dbg !1273
  %15 = bitcast %struct.ushort4* %arrayidx127 to i64*, !dbg !1274
  store i64 0, i64* %15, align 8, !dbg !1274
  %conv131 = zext i16 %global_histo_data125.sroa.0.0.copyload to i32, !dbg !1275
  %call132 = tail call i32 @min(i32 %conv131, i32 255), !dbg !1275
  %conv136 = zext i16 %global_histo_data125.sroa.1.2.copyload to i32, !dbg !1276
  %call137 = tail call i32 @min(i32 %conv136, i32 255), !dbg !1276
  %conv141 = zext i16 %global_histo_data125.sroa.2.4.copyload to i32, !dbg !1277
  %call142 = tail call i32 @min(i32 %conv141, i32 255), !dbg !1277
  %conv146 = zext i16 %global_histo_data125.sroa.3.6.copyload to i32, !dbg !1278
  %call147 = tail call i32 @min(i32 %conv146, i32 255), !dbg !1278
  %conv153 = trunc i32 %call132 to i8, !dbg !1279
  %conv156 = trunc i32 %call137 to i8, !dbg !1279
  %conv159 = trunc i32 %call142 to i8, !dbg !1279
  %conv162 = trunc i32 %call147 to i8, !dbg !1279
  %arrayidx164228 = getelementptr inbounds i32* %final_histo, i64 %idxprom126, !dbg !1280
  %arrayidx164 = bitcast i32* %arrayidx164228 to %struct.uchar4*, !dbg !1280
  %final_histo_data150.sroa.0.0..idx = bitcast i32* %arrayidx164228 to i8*, !dbg !1280
  store i8 %conv153, i8* %final_histo_data150.sroa.0.0..idx, align 4, !dbg !1280
  %final_histo_data150.sroa.1.1..idx = getelementptr inbounds %struct.uchar4* %arrayidx164, i64 0, i32 1, !dbg !1280
  store i8 %conv156, i8* %final_histo_data150.sroa.1.1..idx, align 1, !dbg !1280
  %final_histo_data150.sroa.2.2..idx = getelementptr inbounds %struct.uchar4* %arrayidx164, i64 0, i32 2, !dbg !1280
  store i8 %conv159, i8* %final_histo_data150.sroa.2.2..idx, align 2, !dbg !1280
  %final_histo_data150.sroa.3.3..idx = getelementptr inbounds %struct.uchar4* %arrayidx164, i64 0, i32 3, !dbg !1280
  store i8 %conv162, i8* %final_histo_data150.sroa.3.3..idx, align 1, !dbg !1280
  %16 = load i32* getelementptr inbounds (%struct.dim3* @gridDim, i64 0, i32 0), align 4, !dbg !1253, !tbaa !1237
  %17 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1253, !tbaa !1237
  %mul166 = mul i32 %17, %16, !dbg !1253
  %add167 = add i32 %mul166, %i116.0235, !dbg !1253
  %cmp123 = icmp ult i32 %add167, %div122, !dbg !1253
  br i1 %cmp123, label %for.body124, label %for.end168, !dbg !1253

for.end168:                                       ; preds = %for.body124, %for.end115
  ret void, !dbg !1281
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @min(i32, i32) section "__device__"

declare i32 @umin(i32, i32) section "__device__"

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define void @_Z12calculateBinjP6uchar4(i32 %bin, %struct.uchar4* nocapture %sm_mapping) nounwind uwtable section "__device__" {
entry:
  %shr = lshr i32 %bin, 2, !dbg !1282
  %conv2 = trunc i32 %shr to i8, !dbg !1282
  %shr3 = lshr i32 %bin, 10, !dbg !1283
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %rem4 = urem i32 %shr3, 24, !dbg !1283
  %conv5 = trunc i32 %rem4 to i8, !dbg !1283
  %int_cast_to_i641 = zext i32 24576 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641)
  %div = udiv i32 %bin, 24576, !dbg !1284
  %conv6 = trunc i32 %div to i8, !dbg !1284
  %conv = shl i32 %bin, 3, !dbg !1285
  %conv.tr = trunc i32 %conv to i8, !dbg !1285
  %conv8 = and i8 %conv.tr, 24, !dbg !1285
  %sm.sroa.0.0..idx = getelementptr inbounds %struct.uchar4* %sm_mapping, i64 0, i32 0, !dbg !1286
  store i8 %conv6, i8* %sm.sroa.0.0..idx, align 4, !dbg !1286
  %sm.sroa.1.1..idx = getelementptr inbounds %struct.uchar4* %sm_mapping, i64 0, i32 1, !dbg !1286
  store i8 %conv5, i8* %sm.sroa.1.1..idx, align 1, !dbg !1286
  %sm.sroa.2.2..idx = getelementptr inbounds %struct.uchar4* %sm_mapping, i64 0, i32 2, !dbg !1286
  store i8 %conv2, i8* %sm.sroa.2.2..idx, align 2, !dbg !1286
  %sm.sroa.3.3..idx = getelementptr inbounds %struct.uchar4* %sm_mapping, i64 0, i32 3, !dbg !1286
  store i8 %conv8, i8* %sm.sroa.3.3..idx, align 1, !dbg !1286
  ret void, !dbg !1287
}

define void @_Z26histo_intermediates_kernelP5uint2jjjP6uchar4(%struct.uint2* nocapture %input, i32 %height, i32 %width, i32 %input_pitch, %struct.uchar4* nocapture %sm_mappings) nounwind uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1288, !tbaa !1237
  %mul = shl i32 %0, 4, !dbg !1288
  %mul1 = mul i32 %mul, %input_pitch, !dbg !1289
  %idx.ext = zext i32 %mul1 to i64, !dbg !1289
  %1 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1289, !tbaa !1237
  %idx.ext2 = zext i32 %1 to i64, !dbg !1289
  %add.ptr.sum = add i64 %idx.ext, %idx.ext2, !dbg !1289
  %add.ptr3 = getelementptr inbounds %struct.uint2* %input, i64 %add.ptr.sum, !dbg !1289
  %mul4 = mul i32 %mul, %width, !dbg !1290
  %add = add i32 %mul4, %1, !dbg !1290
  %rem = and i32 %width, 1, !dbg !1291
  %tobool = icmp eq i32 %rem, 0, !dbg !1291
  br i1 %tobool, label %land.end.thread, label %land.end, !dbg !1291

land.end.thread:                                  ; preds = %entry
  %idx.ext1044 = zext i32 %input_pitch to i64, !dbg !1292
  br label %land.end.land.end.split_crit_edge

land.end:                                         ; preds = %entry
  %2 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1291, !tbaa !1237
  %sub = add i32 %2, -1, !dbg !1291
  %cmp = icmp eq i32 %1, %sub, !dbg !1291
  %idx.ext10 = zext i32 %input_pitch to i64, !dbg !1292
  br i1 %cmp, label %if.end.us, label %land.end.land.end.split_crit_edge

land.end.land.end.split_crit_edge:                ; preds = %land.end, %land.end.thread
  %idx.ext1045 = phi i64 [ %idx.ext1044, %land.end.thread ], [ %idx.ext10, %land.end ]
  br label %if.end, !dbg !1293

if.end.us:                                        ; preds = %if.end.us, %land.end
  %load_bin.039.us = phi %struct.uint2* [ %add.ptr11.us, %if.end.us ], [ %add.ptr3, %land.end ]
  %store.038.us = phi i32 [ %add12.us, %if.end.us ], [ %add, %land.end ]
  %i.037.us = phi i32 [ %inc.us, %if.end.us ], [ 0, %land.end ]
  %bin_value.sroa.0.0..idx.us = getelementptr inbounds %struct.uint2* %load_bin.039.us, i64 0, i32 0, !dbg !1294
  %bin_value.sroa.0.0.copyload.us = load i32* %bin_value.sroa.0.0..idx.us, align 8, !dbg !1294
  %idxprom.us = zext i32 %store.038.us to i64, !dbg !1295
  %shr.i.us = lshr i32 %bin_value.sroa.0.0.copyload.us, 2, !dbg !1296
  %conv2.i.us = trunc i32 %shr.i.us to i8, !dbg !1296
  %shr3.i.us = lshr i32 %bin_value.sroa.0.0.copyload.us, 10, !dbg !1297
  %int_cast_to_i64 = zext i32 24 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %rem4.i.us = urem i32 %shr3.i.us, 24, !dbg !1297
  %conv5.i.us = trunc i32 %rem4.i.us to i8, !dbg !1297
  %int_cast_to_i641 = zext i32 24576 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641)
  %div.i.us = udiv i32 %bin_value.sroa.0.0.copyload.us, 24576, !dbg !1298
  %conv6.i.us = trunc i32 %div.i.us to i8, !dbg !1298
  %conv.i.us = shl i32 %bin_value.sroa.0.0.copyload.us, 3, !dbg !1299
  %conv.tr.i.us = trunc i32 %conv.i.us to i8, !dbg !1299
  %conv8.i.us = and i8 %conv.tr.i.us, 24, !dbg !1299
  %sm.sroa.0.0..idx.i.us = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom.us, i32 0, !dbg !1300
  store i8 %conv6.i.us, i8* %sm.sroa.0.0..idx.i.us, align 4, !dbg !1300
  %sm.sroa.1.1..idx.i.us = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom.us, i32 1, !dbg !1300
  store i8 %conv5.i.us, i8* %sm.sroa.1.1..idx.i.us, align 1, !dbg !1300
  %sm.sroa.2.2..idx.i.us = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom.us, i32 2, !dbg !1300
  store i8 %conv2.i.us, i8* %sm.sroa.2.2..idx.i.us, align 2, !dbg !1300
  %sm.sroa.3.3..idx.i.us = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom.us, i32 3, !dbg !1300
  store i8 %conv8.i.us, i8* %sm.sroa.3.3..idx.i.us, align 1, !dbg !1300
  %add.ptr11.us = getelementptr inbounds %struct.uint2* %load_bin.039.us, i64 %idx.ext10, !dbg !1292
  %add12.us = add i32 %store.038.us, %width, !dbg !1301
  %inc.us = add nsw i32 %i.037.us, 1, !dbg !1293
  %exitcond40 = icmp eq i32 %inc.us, 16, !dbg !1293
  br i1 %exitcond40, label %for.end, label %if.end.us, !dbg !1293

if.end:                                           ; preds = %if.end, %land.end.land.end.split_crit_edge
  %load_bin.039 = phi %struct.uint2* [ %add.ptr3, %land.end.land.end.split_crit_edge ], [ %add.ptr11, %if.end ]
  %store.038 = phi i32 [ %add, %land.end.land.end.split_crit_edge ], [ %add12, %if.end ]
  %i.037 = phi i32 [ 0, %land.end.land.end.split_crit_edge ], [ %inc, %if.end ]
  %3 = bitcast %struct.uint2* %load_bin.039 to i64*, !dbg !1294
  %bin_value.sroa.0.0.copyload = load i64* %3, align 8, !dbg !1294
  %4 = trunc i64 %bin_value.sroa.0.0.copyload to i32, !dbg !1294
  %5 = lshr i64 %bin_value.sroa.0.0.copyload, 32
  %idxprom = zext i32 %store.038 to i64, !dbg !1295
  %shr.i = lshr i32 %4, 2, !dbg !1296
  %conv2.i = trunc i32 %shr.i to i8, !dbg !1296
  %shr3.i = lshr i32 %4, 10, !dbg !1297
  %int_cast_to_i642 = zext i32 24 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i642)
  %rem4.i = urem i32 %shr3.i, 24, !dbg !1297
  %conv5.i = trunc i32 %rem4.i to i8, !dbg !1297
  %int_cast_to_i643 = zext i32 24576 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i643)
  %div.i = udiv i32 %4, 24576, !dbg !1298
  %conv6.i = trunc i32 %div.i to i8, !dbg !1298
  %conv.i = shl i32 %4, 3, !dbg !1299
  %conv.tr.i = trunc i32 %conv.i to i8, !dbg !1299
  %conv8.i = and i8 %conv.tr.i, 24, !dbg !1299
  %sm.sroa.0.0..idx.i = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom, i32 0, !dbg !1300
  store i8 %conv6.i, i8* %sm.sroa.0.0..idx.i, align 4, !dbg !1300
  %sm.sroa.1.1..idx.i = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom, i32 1, !dbg !1300
  store i8 %conv5.i, i8* %sm.sroa.1.1..idx.i, align 1, !dbg !1300
  %sm.sroa.2.2..idx.i = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom, i32 2, !dbg !1300
  store i8 %conv2.i, i8* %sm.sroa.2.2..idx.i, align 2, !dbg !1300
  %sm.sroa.3.3..idx.i = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom, i32 3, !dbg !1300
  store i8 %conv8.i, i8* %sm.sroa.3.3..idx.i, align 1, !dbg !1300
  %6 = trunc i64 %5 to i32
  %7 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1302, !tbaa !1237
  %add7 = add i32 %7, %store.038, !dbg !1302
  %idxprom8 = zext i32 %add7 to i64, !dbg !1302
  %shr.i2341 = lshr i64 %bin_value.sroa.0.0.copyload, 34, !dbg !1303
  %conv2.i24 = trunc i64 %shr.i2341 to i8, !dbg !1303
  %shr3.i2542 = lshr i64 %bin_value.sroa.0.0.copyload, 42, !dbg !1304
  %shr3.i25 = trunc i64 %shr3.i2542 to i32, !dbg !1304
  %int_cast_to_i644 = zext i32 24 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i644)
  %rem4.i26 = urem i32 %shr3.i25, 24, !dbg !1304
  %conv5.i27 = trunc i32 %rem4.i26 to i8, !dbg !1304
  %int_cast_to_i645 = zext i32 24576 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i645)
  %div.i28 = udiv i32 %6, 24576, !dbg !1305
  %conv6.i29 = trunc i32 %div.i28 to i8, !dbg !1305
  %conv.i3043 = shl nuw nsw i64 %5, 3, !dbg !1306
  %conv.tr.i31 = trunc i64 %conv.i3043 to i8, !dbg !1306
  %conv8.i32 = and i8 %conv.tr.i31, 24, !dbg !1306
  %sm.sroa.0.0..idx.i33 = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom8, i32 0, !dbg !1307
  store i8 %conv6.i29, i8* %sm.sroa.0.0..idx.i33, align 4, !dbg !1307
  %sm.sroa.1.1..idx.i34 = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom8, i32 1, !dbg !1307
  store i8 %conv5.i27, i8* %sm.sroa.1.1..idx.i34, align 1, !dbg !1307
  %sm.sroa.2.2..idx.i35 = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom8, i32 2, !dbg !1307
  store i8 %conv2.i24, i8* %sm.sroa.2.2..idx.i35, align 2, !dbg !1307
  %sm.sroa.3.3..idx.i36 = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom8, i32 3, !dbg !1307
  store i8 %conv8.i32, i8* %sm.sroa.3.3..idx.i36, align 1, !dbg !1307
  %add.ptr11 = getelementptr inbounds %struct.uint2* %load_bin.039, i64 %idx.ext1045, !dbg !1292
  %add12 = add i32 %store.038, %width, !dbg !1301
  %inc = add nsw i32 %i.037, 1, !dbg !1293
  %exitcond = icmp eq i32 %inc, 16, !dbg !1293
  br i1 %exitcond, label %for.end, label %if.end, !dbg !1293

for.end:                                          ; preds = %if.end, %if.end.us
  ret void, !dbg !1308
}

define void @_Z19testIncrementGlobalPjjj6uchar4(i32* %global_histo, i32 %sm_range_min, i32 %sm_range_max, i32 %sm.coerce) uwtable section "__device__" {
entry:
  %conv = and i32 %sm.coerce, 255, !dbg !1309
  %cmp = icmp ult i32 %conv, %sm_range_min, !dbg !1310
  %cmp4 = icmp ugt i32 %conv, %sm_range_max, !dbg !1310
  %or.cond = or i1 %cmp, %cmp4, !dbg !1310
  br i1 %or.cond, label %if.then, label %if.end18, !dbg !1310

if.then:                                          ; preds = %entry
  %sm.sroa.3.3.extract.shift = lshr i32 %sm.coerce, 27
  %sm.sroa.2.2.extract.shift = lshr i32 %sm.coerce, 16
  %sm.sroa.1.1.extract.shift = lshr i32 %sm.coerce, 8
  %mul = mul i32 %conv, 24576, !dbg !1311
  %add = or i32 %mul, %sm.sroa.3.3.extract.shift, !dbg !1311
  %conv2 = shl nuw nsw i32 %sm.sroa.2.2.extract.shift, 2, !dbg !1311
  %shl = and i32 %conv2, 1020, !dbg !1311
  %add5 = add i32 %add, %shl, !dbg !1311
  %conv1 = shl i32 %sm.sroa.1.1.extract.shift, 10, !dbg !1311
  %shl6 = and i32 %conv1, 261120, !dbg !1311
  %add7 = add i32 %add5, %shl6, !dbg !1311
  %div8 = lshr i32 %add7, 1, !dbg !1312
  %rem = shl nsw i32 %add7, 4, !dbg !1313
  %0 = and i32 %rem, 16, !dbg !1313
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str1, i64 0, i64 0), i32 %conv, i32 %add7, i32 %div8), !dbg !1314
  %idxprom = zext i32 %div8 to i64, !dbg !1315
  %arrayidx = getelementptr inbounds i32* %global_histo, i64 %idxprom, !dbg !1315
  %1 = load i32* %arrayidx, align 4, !dbg !1315, !tbaa !1237
  %shr = lshr i32 %1, %0, !dbg !1316
  %conv11 = and i32 %shr, 65535, !dbg !1317
  %cmp12 = icmp ult i32 %conv11, 255, !dbg !1317
  br i1 %cmp12, label %if.then13, label %if.end18, !dbg !1317

if.then13:                                        ; preds = %if.then
  %shl16 = shl i32 1, %0, !dbg !1318
  %call.i = tail call i32 @__uAtomicAdd(i32* %arrayidx, i32 %shl16), !dbg !1320
  br label %if.end18, !dbg !1322

if.end18:                                         ; preds = %if.then13, %if.then, %entry
  ret void, !dbg !1323
}

define void @_Z18testIncrementLocalPjPA256_jj6uchar4(i32* %global_overflow, [256 x i32]* %smem, i32 %myRange, i32 %sm.coerce) uwtable section "__device__" {
entry:
  %sm.sroa.1.1.extract.shift = lshr i32 %sm.coerce, 8
  %sm.sroa.2.2.extract.shift = lshr i32 %sm.coerce, 16
  %sm.sroa.3.3.extract.shift = lshr i32 %sm.coerce, 24
  %conv = and i32 %sm.coerce, 255, !dbg !1324
  %conv1 = and i32 %sm.sroa.1.1.extract.shift, 255, !dbg !1325
  %conv2 = and i32 %sm.sroa.2.2.extract.shift, 255, !dbg !1326
  %cmp = icmp eq i32 %conv, %myRange, !dbg !1327
  br i1 %cmp, label %if.then, label %if.end81, !dbg !1327

if.then:                                          ; preds = %entry
  %shl = shl i32 1, %sm.sroa.3.3.extract.shift, !dbg !1328
  %idxprom = zext i32 %conv2 to i64, !dbg !1329
  %idxprom4 = zext i32 %conv1 to i64, !dbg !1329
  %arrayidx5 = getelementptr inbounds [256 x i32]* %smem, i64 %idxprom4, i64 %idxprom, !dbg !1329
  %call.i = tail call i32 @__uAtomicAdd(i32* %arrayidx5, i32 %shl), !dbg !1330
  %shr = lshr i32 %call.i, %sm.sroa.3.3.extract.shift, !dbg !1331
  %and = and i32 %shr, 255, !dbg !1331
  %cmp6 = icmp eq i32 %and, 255, !dbg !1332
  br i1 %cmp6, label %if.then7, label %if.end81, !dbg !1332

if.then7:                                         ; preds = %if.then
  %mul = mul i32 %myRange, 24576, !dbg !1333
  %div = lshr i32 %sm.coerce, 27, !dbg !1333
  %add8 = or i32 %mul, %div, !dbg !1333
  %shl9 = shl nuw nsw i32 %conv2, 2, !dbg !1333
  %add10 = add i32 %add8, %shl9, !dbg !1333
  %shl11 = shl nuw nsw i32 %conv1, 10, !dbg !1333
  %add12 = add i32 %add10, %shl11, !dbg !1333
  %cmp13 = icmp ult i32 %sm.coerce, 402653184, !dbg !1334
  %cmp14 = icmp ult i32 %sm.coerce, 268435456, !dbg !1335
  %cmp17 = icmp ult i32 %sm.coerce, 134217728, !dbg !1336
  %add20 = add i32 %sm.sroa.3.3.extract.shift, 8, !dbg !1337
  %shr21 = lshr i32 %call.i, %add20, !dbg !1337
  %and22 = and i32 %shr21, 255, !dbg !1337
  %add23 = add i32 %sm.sroa.3.3.extract.shift, 16, !dbg !1338
  %shr24 = lshr i32 %call.i, %add23, !dbg !1338
  %and25 = and i32 %shr24, 255, !dbg !1338
  %add26 = add i32 %sm.sroa.3.3.extract.shift, 24, !dbg !1339
  %shr27 = lshr i32 %call.i, %add26, !dbg !1339
  %and28 = and i32 %shr27, 255, !dbg !1339
  %cmp33 = icmp eq i32 %and22, 255, !dbg !1340
  %or.cond = and i1 %cmp14, %cmp33, !dbg !1340
  %cmp38 = icmp eq i32 %and25, 255, !dbg !1341
  %or.cond108 = and i1 %cmp17, %cmp38, !dbg !1341
  br i1 %cmp13, label %if.then42, label %if.end.thread, !dbg !1342

if.end.thread:                                    ; preds = %if.then7
  br i1 %or.cond, label %if.then47, label %if.end50, !dbg !1343

if.then42:                                        ; preds = %if.then7
  %cmp43 = icmp ne i32 %and22, 255, !dbg !1344
  %cond44 = select i1 %cmp43, i32 -1, i32 255, !dbg !1344
  br i1 %or.cond, label %if.then47, label %if.end50, !dbg !1343

if.then47:                                        ; preds = %if.then42, %if.end.thread
  %bin_plus_1_add.0131 = phi i32 [ %cond44, %if.then42 ], [ undef, %if.end.thread ]
  %overflow_into_bin_plus_1.0121129 = phi i1 [ true, %if.then42 ], [ false, %if.end.thread ]
  %cmp48 = icmp ne i32 %and25, 255, !dbg !1343
  %cond49 = select i1 %cmp48, i32 -1, i32 255, !dbg !1343
  br i1 %or.cond108, label %if.then52, label %if.end55, !dbg !1345

if.end50:                                         ; preds = %if.then42, %if.end.thread
  %bin_plus_1_add.0130 = phi i32 [ %cond44, %if.then42 ], [ undef, %if.end.thread ]
  %overflow_into_bin_plus_1.0121128 = phi i1 [ true, %if.then42 ], [ false, %if.end.thread ]
  br i1 %or.cond108, label %if.then52, label %if.end55, !dbg !1345

if.then52:                                        ; preds = %if.end50, %if.then47
  %bin_plus_2_add.0141 = phi i32 [ %cond49, %if.then47 ], [ undef, %if.end50 ]
  %.109122126137 = phi i1 [ true, %if.then47 ], [ false, %if.end50 ]
  %overflow_into_bin_plus_1.0121128135 = phi i1 [ %overflow_into_bin_plus_1.0121129, %if.then47 ], [ %overflow_into_bin_plus_1.0121128, %if.end50 ]
  %bin_plus_1_add.0130133 = phi i32 [ %bin_plus_1_add.0131, %if.then47 ], [ %bin_plus_1_add.0130, %if.end50 ]
  %cmp53 = icmp ne i32 %and28, 255, !dbg !1345
  %cond54 = select i1 %cmp53, i32 -1, i32 255, !dbg !1345
  %idxprom56142 = zext i32 %add12 to i64, !dbg !1346
  %arrayidx57143 = getelementptr inbounds i32* %global_overflow, i64 %idxprom56142, !dbg !1346
  %call.i111144 = tail call i32 @__uAtomicAdd(i32* %arrayidx57143, i32 256), !dbg !1347
  br i1 %overflow_into_bin_plus_1.0121128135, label %if.then60, label %if.end65, !dbg !1348

if.end55:                                         ; preds = %if.end50, %if.then47
  %bin_plus_2_add.0140 = phi i32 [ undef, %if.end50 ], [ %cond49, %if.then47 ]
  %.109122126136 = phi i1 [ false, %if.end50 ], [ true, %if.then47 ]
  %overflow_into_bin_plus_1.0121128134 = phi i1 [ %overflow_into_bin_plus_1.0121128, %if.end50 ], [ %overflow_into_bin_plus_1.0121129, %if.then47 ]
  %bin_plus_1_add.0130132 = phi i32 [ %bin_plus_1_add.0130, %if.end50 ], [ %bin_plus_1_add.0131, %if.then47 ]
  %idxprom56 = zext i32 %add12 to i64, !dbg !1346
  %arrayidx57 = getelementptr inbounds i32* %global_overflow, i64 %idxprom56, !dbg !1346
  %call.i111 = tail call i32 @__uAtomicAdd(i32* %arrayidx57, i32 256), !dbg !1347
  br i1 %overflow_into_bin_plus_1.0121128134, label %if.then60, label %if.end65, !dbg !1348

if.then60:                                        ; preds = %if.end55, %if.then52
  %bin_plus_3_add.0153 = phi i32 [ %cond54, %if.then52 ], [ undef, %if.end55 ]
  %bin_plus_1_add.0130132151 = phi i32 [ %bin_plus_1_add.0130133, %if.then52 ], [ %bin_plus_1_add.0130132, %if.end55 ]
  %.109122126136150 = phi i1 [ %.109122126137, %if.then52 ], [ %.109122126136, %if.end55 ]
  %.110123124138148 = phi i1 [ true, %if.then52 ], [ false, %if.end55 ]
  %bin_plus_2_add.0140146 = phi i32 [ %bin_plus_2_add.0141, %if.then52 ], [ %bin_plus_2_add.0140, %if.end55 ]
  %add61 = add i32 %add12, 1, !dbg !1348
  %idxprom62 = zext i32 %add61 to i64, !dbg !1348
  %arrayidx63 = getelementptr inbounds i32* %global_overflow, i64 %idxprom62, !dbg !1348
  %call.i112 = tail call i32 @__uAtomicAdd(i32* %arrayidx63, i32 %bin_plus_1_add.0130132151), !dbg !1349
  br i1 %.109122126136150, label %if.then67, label %if.end72, !dbg !1350

if.end65:                                         ; preds = %if.end55, %if.then52
  %bin_plus_3_add.0152 = phi i32 [ %cond54, %if.then52 ], [ undef, %if.end55 ]
  %.109122126136149 = phi i1 [ %.109122126137, %if.then52 ], [ %.109122126136, %if.end55 ]
  %.110123124138147 = phi i1 [ true, %if.then52 ], [ false, %if.end55 ]
  %bin_plus_2_add.0140145 = phi i32 [ %bin_plus_2_add.0141, %if.then52 ], [ %bin_plus_2_add.0140, %if.end55 ]
  br i1 %.109122126136149, label %if.then67, label %if.end72, !dbg !1350

if.then67:                                        ; preds = %if.end65, %if.then60
  %bin_plus_2_add.0140145158 = phi i32 [ %bin_plus_2_add.0140146, %if.then60 ], [ %bin_plus_2_add.0140145, %if.end65 ]
  %.110123124138147157 = phi i1 [ %.110123124138148, %if.then60 ], [ %.110123124138147, %if.end65 ]
  %bin_plus_3_add.0152155 = phi i32 [ %bin_plus_3_add.0153, %if.then60 ], [ %bin_plus_3_add.0152, %if.end65 ]
  %add68 = add i32 %add12, 2, !dbg !1350
  %idxprom69 = zext i32 %add68 to i64, !dbg !1350
  %arrayidx70 = getelementptr inbounds i32* %global_overflow, i64 %idxprom69, !dbg !1350
  %call.i113 = tail call i32 @__uAtomicAdd(i32* %arrayidx70, i32 %bin_plus_2_add.0140145158), !dbg !1351
  br i1 %.110123124138147157, label %if.then74, label %if.end81, !dbg !1352

if.end72:                                         ; preds = %if.end65, %if.then60
  %.110123124138147156 = phi i1 [ %.110123124138148, %if.then60 ], [ %.110123124138147, %if.end65 ]
  %bin_plus_3_add.0152154 = phi i32 [ %bin_plus_3_add.0153, %if.then60 ], [ %bin_plus_3_add.0152, %if.end65 ]
  br i1 %.110123124138147156, label %if.then74, label %if.end81, !dbg !1352

if.then74:                                        ; preds = %if.end72, %if.then67
  %bin_plus_3_add.0152154159 = phi i32 [ %bin_plus_3_add.0152155, %if.then67 ], [ %bin_plus_3_add.0152154, %if.end72 ]
  %add75 = add i32 %add12, 3, !dbg !1352
  %idxprom76 = zext i32 %add75 to i64, !dbg !1352
  %arrayidx77 = getelementptr inbounds i32* %global_overflow, i64 %idxprom76, !dbg !1352
  %call.i114 = tail call i32 @__uAtomicAdd(i32* %arrayidx77, i32 %bin_plus_3_add.0152154159), !dbg !1353
  br label %if.end81, !dbg !1352

if.end81:                                         ; preds = %if.then74, %if.end72, %if.then67, %if.then, %entry
  ret void, !dbg !1354
}

define void @_Z11clearMemoryPA256_j([256 x i32]* nocapture %smem) nounwind uwtable section "__device__" {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1355, !tbaa !1237
  %cmp3 = icmp slt i32 %0, 6144, !dbg !1355
  br i1 %cmp3, label %for.body, label %for.end, !dbg !1355

for.body:                                         ; preds = %for.body, %entry
  %i.04 = phi i32 [ %add, %for.body ], [ %0, %entry ]
  %idxprom = sext i32 %i.04 to i64, !dbg !1356
  %arrayidx = getelementptr inbounds [256 x i32]* %smem, i64 0, i64 %idxprom, !dbg !1356
  store i32 0, i32* %arrayidx, align 4, !dbg !1356, !tbaa !1237
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1355, !tbaa !1237
  %add = add i32 %1, %i.04, !dbg !1355
  %cmp = icmp slt i32 %add, 6144, !dbg !1355
  br i1 %cmp, label %for.body, label %for.end, !dbg !1355

for.end:                                          ; preds = %for.body, %entry
  ret void, !dbg !1358
}

define void @_Z10copyMemoryPjPA256_j(i32* nocapture %dst, [256 x i32]* nocapture %src) nounwind uwtable section "__device__" {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1359, !tbaa !1237
  %cmp6 = icmp slt i32 %0, 6144, !dbg !1359
  br i1 %cmp6, label %for.body, label %for.end, !dbg !1359

for.body:                                         ; preds = %for.body, %entry
  %i.07 = phi i32 [ %add, %for.body ], [ %0, %entry ]
  %idxprom = sext i32 %i.07 to i64, !dbg !1360
  %arrayidx = getelementptr inbounds [256 x i32]* %src, i64 0, i64 %idxprom, !dbg !1360
  %1 = load i32* %arrayidx, align 4, !dbg !1360, !tbaa !1237
  %arrayidx2 = getelementptr inbounds i32* %dst, i64 %idxprom, !dbg !1360
  store i32 %1, i32* %arrayidx2, align 4, !dbg !1360, !tbaa !1237
  %2 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1359, !tbaa !1237
  %add = add i32 %2, %i.07, !dbg !1359
  %cmp = icmp slt i32 %add, 6144, !dbg !1359
  br i1 %cmp, label %for.body, label %for.end, !dbg !1359

for.end:                                          ; preds = %for.body, %entry
  ret void, !dbg !1362
}

define void @_Z17histo_main_kernelP6uchar4jjjjjPjS1_S1_(%struct.uchar4* nocapture %sm_mappings, i32 %num_elements, i32 %sm_range_min, i32 %sm_range_max, i32 %histo_height, i32 %histo_width, i32* nocapture %global_subhisto, i32* %global_histo, i32* %globa
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 1), align 4, !dbg !1363, !tbaa !1237
  %add = add i32 %0, %sm_range_min, !dbg !1363
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1364, !tbaa !1237
  %2 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1364, !tbaa !1237
  %mul = mul i32 %2, %1, !dbg !1364
  %3 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1364, !tbaa !1237
  %add1 = add i32 %mul, %3, !dbg !1364
  %cmp3.i = icmp slt i32 %3, 6144, !dbg !1365
  br i1 %cmp3.i, label %for.body.i, label %_Z11clearMemoryPA256_j.exit, !dbg !1365

for.body.i:                                       ; preds = %for.body.i, %entry
  %i.04.i = phi i32 [ %add.i, %for.body.i ], [ %3, %entry ]
  %idxprom.i = sext i32 %i.04.i to i64, !dbg !1367
  %arrayidx.i = getelementptr inbounds [24 x [256 x i32]]* @_ZZ17histo_main_kernelP6uchar4jjjjjPjS1_S1_E9sub_histo, i64 0, i64 0, i64 %idxprom.i, !dbg !1367
  store i32 0, i32* %arrayidx.i, align 4, !dbg !1367, !tbaa !1237
  %add.i = add i32 %2, %i.04.i, !dbg !1365
  %cmp.i = icmp slt i32 %add.i, 6144, !dbg !1365
  br i1 %cmp.i, label %for.body.i, label %_Z11clearMemoryPA256_j.exit, !dbg !1365

_Z11clearMemoryPA256_j.exit:                      ; preds = %for.body.i, %entry
  tail call void @__syncthreads(), !dbg !1368
  %4 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 1), align 4, !dbg !1369, !tbaa !1237
  %cmp = icmp eq i32 %4, 0, !dbg !1369
  %cmp244 = icmp ult i32 %add1, %num_elements, !dbg !1370
  br i1 %cmp, label %while.cond.preheader, label %while.cond6.preheader, !dbg !1369

while.cond6.preheader:                            ; preds = %_Z11clearMemoryPA256_j.exit
  br i1 %cmp244, label %while.body8, label %if.end, !dbg !1371

while.cond.preheader:                             ; preds = %_Z11clearMemoryPA256_j.exit
  br i1 %cmp244, label %while.body, label %if.end, !dbg !1370

while.body:                                       ; preds = %while.cond.backedge, %while.cond.preheader
  %local_scan_load.045 = phi i32 [ %add4, %while.cond.backedge ], [ %add1, %while.cond.preheader ]
  %idxprom = zext i32 %local_scan_load.045 to i64, !dbg !1372
  %5 = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom, i32 0, !dbg !1372
  %sm.sroa.0.0..cast = bitcast i8* %5 to i32*, !dbg !1372
  %sm.sroa.0.0.copyload = load i32* %sm.sroa.0.0..cast, align 4, !dbg !1372
  %6 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1373, !tbaa !1237
  %7 = load i32* getelementptr inbounds (%struct.dim3* @gridDim, i64 0, i32 0), align 4, !dbg !1373, !tbaa !1237
  %mul3 = mul i32 %7, %6, !dbg !1373
  %add4 = add i32 %mul3, %local_scan_load.045, !dbg !1373
  %sm.sroa.1.1.extract.shift.i1 = lshr i32 %sm.sroa.0.0.copyload, 8
  %sm.sroa.2.2.extract.shift.i2 = lshr i32 %sm.sroa.0.0.copyload, 16
  %sm.sroa.3.3.extract.shift.i3 = lshr i32 %sm.sroa.0.0.copyload, 24
  %conv.i4 = and i32 %sm.sroa.0.0.copyload, 255, !dbg !1374
  %conv1.i5 = and i32 %sm.sroa.1.1.extract.shift.i1, 255, !dbg !1376
  %conv2.i6 = and i32 %sm.sroa.2.2.extract.shift.i2, 255, !dbg !1377
  %cmp.i7 = icmp eq i32 %conv.i4, %add, !dbg !1378
  br i1 %cmp.i7, label %if.then.i13, label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit, !dbg !1378

if.then.i13:                                      ; preds = %while.body
  %shl.i8 = shl i32 1, %sm.sroa.3.3.extract.shift.i3, !dbg !1379
  %idxprom.i9 = zext i32 %conv2.i6 to i64, !dbg !1380
  %idxprom4.i = zext i32 %conv1.i5 to i64, !dbg !1380
  %arrayidx5.i = getelementptr inbounds [256 x i32]* getelementptr inbounds ([24 x [256 x i32]]* @_ZZ17histo_main_kernelP6uchar4jjjjjPjS1_S1_E9sub_histo, i64 0, i64 0), i64 %idxprom4.i, i64 %idxprom.i9, !dbg !1380
  %call.i.i10 = tail call i32 @__uAtomicAdd(i32* %arrayidx5.i, i32 %shl.i8), !dbg !1381
  %shr.i11 = lshr i32 %call.i.i10, %sm.sroa.3.3.extract.shift.i3, !dbg !1382
  %and.i = and i32 %shr.i11, 255, !dbg !1382
  %cmp6.i12 = icmp eq i32 %and.i, 255, !dbg !1383
  br i1 %cmp6.i12, label %if.then7.i, label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit, !dbg !1383

if.then7.i:                                       ; preds = %if.then.i13
  %mul.i14 = mul i32 %add, 24576, !dbg !1384
  %div.i = lshr i32 %sm.sroa.0.0.copyload, 27, !dbg !1384
  %add8.i = or i32 %mul.i14, %div.i, !dbg !1384
  %shl9.i = shl nuw nsw i32 %conv2.i6, 2, !dbg !1384
  %add10.i = add i32 %add8.i, %shl9.i, !dbg !1384
  %shl11.i = shl nuw nsw i32 %conv1.i5, 10, !dbg !1384
  %add12.i = add i32 %add10.i, %shl11.i, !dbg !1384
  %cmp13.i = icmp ult i32 %sm.sroa.0.0.copyload, 402653184, !dbg !1385
  %cmp14.i = icmp ult i32 %sm.sroa.0.0.copyload, 268435456, !dbg !1386
  %cmp17.i = icmp ult i32 %sm.sroa.0.0.copyload, 134217728, !dbg !1387
  %add20.i = add i32 %sm.sroa.3.3.extract.shift.i3, 8, !dbg !1388
  %shr21.i = lshr i32 %call.i.i10, %add20.i, !dbg !1388
  %and22.i = and i32 %shr21.i, 255, !dbg !1388
  %add23.i = add i32 %sm.sroa.3.3.extract.shift.i3, 16, !dbg !1389
  %shr24.i = lshr i32 %call.i.i10, %add23.i, !dbg !1389
  %and25.i = and i32 %shr24.i, 255, !dbg !1389
  %add26.i = add i32 %sm.sroa.3.3.extract.shift.i3, 24, !dbg !1390
  %shr27.i = lshr i32 %call.i.i10, %add26.i, !dbg !1390
  %and28.i = and i32 %shr27.i, 255, !dbg !1390
  %cmp33.i = icmp eq i32 %and22.i, 255, !dbg !1391
  %or.cond.i15 = and i1 %cmp14.i, %cmp33.i, !dbg !1391
  %cmp38.i = icmp eq i32 %and25.i, 255, !dbg !1392
  %or.cond108.i = and i1 %cmp17.i, %cmp38.i, !dbg !1392
  br i1 %cmp13.i, label %if.then42.i, label %if.end.thread.i, !dbg !1393

if.end.thread.i:                                  ; preds = %if.then7.i
  br i1 %or.cond.i15, label %if.then47.i, label %if.end50.i, !dbg !1394

if.then42.i:                                      ; preds = %if.then7.i
  %cmp43.i = icmp ne i32 %and22.i, 255, !dbg !1395
  %cond44.i = select i1 %cmp43.i, i32 -1, i32 255, !dbg !1395
  br i1 %or.cond.i15, label %if.then47.i, label %if.end50.i, !dbg !1394

if.then47.i:                                      ; preds = %if.then42.i, %if.end.thread.i
  %bin_plus_1_add.0131.i = phi i32 [ %cond44.i, %if.then42.i ], [ undef, %if.end.thread.i ]
  %overflow_into_bin_plus_1.0121129.i = phi i1 [ true, %if.then42.i ], [ false, %if.end.thread.i ]
  %cmp48.i = icmp ne i32 %and25.i, 255, !dbg !1394
  %cond49.i = select i1 %cmp48.i, i32 -1, i32 255, !dbg !1394
  br i1 %or.cond108.i, label %if.then52.i, label %if.end55.i, !dbg !1396

if.end50.i:                                       ; preds = %if.then42.i, %if.end.thread.i
  %bin_plus_1_add.0130.i = phi i32 [ %cond44.i, %if.then42.i ], [ undef, %if.end.thread.i ]
  %overflow_into_bin_plus_1.0121128.i = phi i1 [ true, %if.then42.i ], [ false, %if.end.thread.i ]
  br i1 %or.cond108.i, label %if.then52.i, label %if.end55.i, !dbg !1396

if.then52.i:                                      ; preds = %if.end50.i, %if.then47.i
  %bin_plus_2_add.0141.i = phi i32 [ %cond49.i, %if.then47.i ], [ undef, %if.end50.i ]
  %.109122126137.i = phi i1 [ true, %if.then47.i ], [ false, %if.end50.i ]
  %overflow_into_bin_plus_1.0121128135.i = phi i1 [ %overflow_into_bin_plus_1.0121129.i, %if.then47.i ], [ %overflow_into_bin_plus_1.0121128.i, %if.end50.i ]
  %bin_plus_1_add.0130133.i = phi i32 [ %bin_plus_1_add.0131.i, %if.then47.i ], [ %bin_plus_1_add.0130.i, %if.end50.i ]
  %cmp53.i = icmp ne i32 %and28.i, 255, !dbg !1396
  %cond54.i = select i1 %cmp53.i, i32 -1, i32 255, !dbg !1396
  %idxprom56142.i = zext i32 %add12.i to i64, !dbg !1397
  %arrayidx57143.i = getelementptr inbounds i32* %global_overflow, i64 %idxprom56142.i, !dbg !1397
  %call.i111144.i = tail call i32 @__uAtomicAdd(i32* %arrayidx57143.i, i32 256), !dbg !1398
  br i1 %overflow_into_bin_plus_1.0121128135.i, label %if.then60.i, label %if.end65.i, !dbg !1399

if.end55.i:                                       ; preds = %if.end50.i, %if.then47.i
  %bin_plus_2_add.0140.i = phi i32 [ undef, %if.end50.i ], [ %cond49.i, %if.then47.i ]
  %.109122126136.i = phi i1 [ false, %if.end50.i ], [ true, %if.then47.i ]
  %overflow_into_bin_plus_1.0121128134.i = phi i1 [ %overflow_into_bin_plus_1.0121128.i, %if.end50.i ], [ %overflow_into_bin_plus_1.0121129.i, %if.then47.i ]
  %bin_plus_1_add.0130132.i = phi i32 [ %bin_plus_1_add.0130.i, %if.end50.i ], [ %bin_plus_1_add.0131.i, %if.then47.i ]
  %idxprom56.i = zext i32 %add12.i to i64, !dbg !1397
  %arrayidx57.i = getelementptr inbounds i32* %global_overflow, i64 %idxprom56.i, !dbg !1397
  %call.i111.i = tail call i32 @__uAtomicAdd(i32* %arrayidx57.i, i32 256), !dbg !1398
  br i1 %overflow_into_bin_plus_1.0121128134.i, label %if.then60.i, label %if.end65.i, !dbg !1399

if.then60.i:                                      ; preds = %if.end55.i, %if.then52.i
  %bin_plus_3_add.0153.i = phi i32 [ %cond54.i, %if.then52.i ], [ undef, %if.end55.i ]
  %bin_plus_1_add.0130132151.i = phi i32 [ %bin_plus_1_add.0130133.i, %if.then52.i ], [ %bin_plus_1_add.0130132.i, %if.end55.i ]
  %.109122126136150.i = phi i1 [ %.109122126137.i, %if.then52.i ], [ %.109122126136.i, %if.end55.i ]
  %.110123124138148.i = phi i1 [ true, %if.then52.i ], [ false, %if.end55.i ]
  %bin_plus_2_add.0140146.i = phi i32 [ %bin_plus_2_add.0141.i, %if.then52.i ], [ %bin_plus_2_add.0140.i, %if.end55.i ]
  %add61.i = add i32 %add12.i, 1, !dbg !1399
  %idxprom62.i = zext i32 %add61.i to i64, !dbg !1399
  %arrayidx63.i = getelementptr inbounds i32* %global_overflow, i64 %idxprom62.i, !dbg !1399
  %call.i112.i = tail call i32 @__uAtomicAdd(i32* %arrayidx63.i, i32 %bin_plus_1_add.0130132151.i), !dbg !1400
  br i1 %.109122126136150.i, label %if.then67.i, label %if.end72.i, !dbg !1401

if.end65.i:                                       ; preds = %if.end55.i, %if.then52.i
  %bin_plus_3_add.0152.i = phi i32 [ %cond54.i, %if.then52.i ], [ undef, %if.end55.i ]
  %.109122126136149.i = phi i1 [ %.109122126137.i, %if.then52.i ], [ %.109122126136.i, %if.end55.i ]
  %.110123124138147.i = phi i1 [ true, %if.then52.i ], [ false, %if.end55.i ]
  %bin_plus_2_add.0140145.i = phi i32 [ %bin_plus_2_add.0141.i, %if.then52.i ], [ %bin_plus_2_add.0140.i, %if.end55.i ]
  br i1 %.109122126136149.i, label %if.then67.i, label %if.end72.i, !dbg !1401

if.then67.i:                                      ; preds = %if.end65.i, %if.then60.i
  %bin_plus_2_add.0140145158.i = phi i32 [ %bin_plus_2_add.0140146.i, %if.then60.i ], [ %bin_plus_2_add.0140145.i, %if.end65.i ]
  %.110123124138147157.i = phi i1 [ %.110123124138148.i, %if.then60.i ], [ %.110123124138147.i, %if.end65.i ]
  %bin_plus_3_add.0152155.i = phi i32 [ %bin_plus_3_add.0153.i, %if.then60.i ], [ %bin_plus_3_add.0152.i, %if.end65.i ]
  %add68.i = add i32 %add12.i, 2, !dbg !1401
  %idxprom69.i = zext i32 %add68.i to i64, !dbg !1401
  %arrayidx70.i = getelementptr inbounds i32* %global_overflow, i64 %idxprom69.i, !dbg !1401
  %call.i113.i = tail call i32 @__uAtomicAdd(i32* %arrayidx70.i, i32 %bin_plus_2_add.0140145158.i), !dbg !1402
  br i1 %.110123124138147157.i, label %if.then74.i, label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit, !dbg !1403

if.end72.i:                                       ; preds = %if.end65.i, %if.then60.i
  %.110123124138147156.i = phi i1 [ %.110123124138148.i, %if.then60.i ], [ %.110123124138147.i, %if.end65.i ]
  %bin_plus_3_add.0152154.i = phi i32 [ %bin_plus_3_add.0153.i, %if.then60.i ], [ %bin_plus_3_add.0152.i, %if.end65.i ]
  br i1 %.110123124138147156.i, label %if.then74.i, label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit, !dbg !1403

if.then74.i:                                      ; preds = %if.end72.i, %if.then67.i
  %bin_plus_3_add.0152154159.i = phi i32 [ %bin_plus_3_add.0152155.i, %if.then67.i ], [ %bin_plus_3_add.0152154.i, %if.end72.i ]
  %add75.i = add i32 %add12.i, 3, !dbg !1403
  %idxprom76.i = zext i32 %add75.i to i64, !dbg !1403
  %arrayidx77.i = getelementptr inbounds i32* %global_overflow, i64 %idxprom76.i, !dbg !1403
  %call.i114.i = tail call i32 @__uAtomicAdd(i32* %arrayidx77.i, i32 %bin_plus_3_add.0152154159.i), !dbg !1404
  br label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit, !dbg !1403

_Z18testIncrementLocalPjPA256_jj6uchar4.exit:     ; preds = %if.then74.i, %if.end72.i, %if.then67.i, %if.then.i13, %while.body
  %conv.i = and i32 %sm.sroa.0.0.copyload, 255, !dbg !1405
  %cmp.i40 = icmp ult i32 %conv.i, %sm_range_min, !dbg !1407
  %cmp4.i = icmp ugt i32 %conv.i, %sm_range_max, !dbg !1407
  %or.cond.i = or i1 %cmp.i40, %cmp4.i, !dbg !1407
  br i1 %or.cond.i, label %if.then.i, label %while.cond.backedge, !dbg !1407

while.cond.backedge:                              ; preds = %if.then13.i, %if.then.i, %_Z18testIncrementLocalPjPA256_jj6uchar4.exit
  %cmp2 = icmp ult i32 %add4, %num_elements, !dbg !1370
  br i1 %cmp2, label %while.body, label %if.end, !dbg !1370

if.then.i:                                        ; preds = %_Z18testIncrementLocalPjPA256_jj6uchar4.exit
  %sm.sroa.3.3.extract.shift.i = lshr i32 %sm.sroa.0.0.copyload, 27
  %sm.sroa.2.2.extract.shift.i = lshr i32 %sm.sroa.0.0.copyload, 16
  %sm.sroa.1.1.extract.shift.i = lshr i32 %sm.sroa.0.0.copyload, 8
  %mul.i = mul i32 %conv.i, 24576, !dbg !1408
  %add.i41 = or i32 %mul.i, %sm.sroa.3.3.extract.shift.i, !dbg !1408
  %conv2.i = shl nuw nsw i32 %sm.sroa.2.2.extract.shift.i, 2, !dbg !1408
  %shl.i = and i32 %conv2.i, 1020, !dbg !1408
  %add5.i = add i32 %add.i41, %shl.i, !dbg !1408
  %conv1.i = shl i32 %sm.sroa.1.1.extract.shift.i, 10, !dbg !1408
  %shl6.i = and i32 %conv1.i, 261120, !dbg !1408
  %add7.i = add i32 %add5.i, %shl6.i, !dbg !1408
  %div8.i = lshr i32 %add7.i, 1, !dbg !1409
  %rem.i = shl nsw i32 %add7.i, 4, !dbg !1410
  %8 = and i32 %rem.i, 16, !dbg !1410
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str1, i64 0, i64 0), i32 %conv.i, i32 %add7.i, i32 %div8.i), !dbg !1411
  %idxprom.i42 = zext i32 %div8.i to i64, !dbg !1412
  %arrayidx.i43 = getelementptr inbounds i32* %global_histo, i64 %idxprom.i42, !dbg !1412
  %9 = load i32* %arrayidx.i43, align 4, !dbg !1412, !tbaa !1237
  %shr.i = lshr i32 %9, %8, !dbg !1413
  %conv11.i = and i32 %shr.i, 65535, !dbg !1414
  %cmp12.i = icmp ult i32 %conv11.i, 255, !dbg !1414
  br i1 %cmp12.i, label %if.then13.i, label %while.cond.backedge, !dbg !1414

if.then13.i:                                      ; preds = %if.then.i
  %shl16.i = shl i32 1, %8, !dbg !1415
  %call.i.i = tail call i32 @__uAtomicAdd(i32* %arrayidx.i43, i32 %shl16.i), !dbg !1416
  br label %while.cond.backedge, !dbg !1417

while.body8:                                      ; preds = %_Z18testIncrementLocalPjPA256_jj6uchar4.exit118, %while.cond6.preheader
  %local_scan_load.148 = phi i32 [ %add13, %_Z18testIncrementLocalPjPA256_jj6uchar4.exit118 ], [ %add1, %while.cond6.preheader ]
  %idxprom10 = zext i32 %local_scan_load.148 to i64, !dbg !1418
  %10 = getelementptr inbounds %struct.uchar4* %sm_mappings, i64 %idxprom10, i32 0, !dbg !1418
  %sm9.sroa.0.0..cast = bitcast i8* %10 to i32*, !dbg !1418
  %sm9.sroa.0.0.copyload = load i32* %sm9.sroa.0.0..cast, align 4, !dbg !1418
  %11 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1419, !tbaa !1237
  %12 = load i32* getelementptr inbounds (%struct.dim3* @gridDim, i64 0, i32 0), align 4, !dbg !1419, !tbaa !1237
  %mul12 = mul i32 %12, %11, !dbg !1419
  %add13 = add i32 %mul12, %local_scan_load.148, !dbg !1419
  %sm.sroa.1.1.extract.shift.i16 = lshr i32 %sm9.sroa.0.0.copyload, 8
  %sm.sroa.2.2.extract.shift.i17 = lshr i32 %sm9.sroa.0.0.copyload, 16
  %sm.sroa.3.3.extract.shift.i18 = lshr i32 %sm9.sroa.0.0.copyload, 24
  %conv.i19 = and i32 %sm9.sroa.0.0.copyload, 255, !dbg !1420
  %conv1.i20 = and i32 %sm.sroa.1.1.extract.shift.i16, 255, !dbg !1422
  %conv2.i21 = and i32 %sm.sroa.2.2.extract.shift.i17, 255, !dbg !1423
  %cmp.i22 = icmp eq i32 %conv.i19, %add, !dbg !1424
  br i1 %cmp.i22, label %if.then.i31, label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit118, !dbg !1424

if.then.i31:                                      ; preds = %while.body8
  %shl.i23 = shl i32 1, %sm.sroa.3.3.extract.shift.i18, !dbg !1425
  %idxprom.i24 = zext i32 %conv2.i21 to i64, !dbg !1426
  %idxprom4.i25 = zext i32 %conv1.i20 to i64, !dbg !1426
  %arrayidx5.i26 = getelementptr inbounds [256 x i32]* getelementptr inbounds ([24 x [256 x i32]]* @_ZZ17histo_main_kernelP6uchar4jjjjjPjS1_S1_E9sub_histo, i64 0, i64 0), i64 %idxprom4.i25, i64 %idxprom.i24, !dbg !1426
  %call.i.i27 = tail call i32 @__uAtomicAdd(i32* %arrayidx5.i26, i32 %shl.i23), !dbg !1427
  %shr.i28 = lshr i32 %call.i.i27, %sm.sroa.3.3.extract.shift.i18, !dbg !1428
  %and.i29 = and i32 %shr.i28, 255, !dbg !1428
  %cmp6.i30 = icmp eq i32 %and.i29, 255, !dbg !1429
  br i1 %cmp6.i30, label %if.then7.i55, label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit118, !dbg !1429

if.then7.i55:                                     ; preds = %if.then.i31
  %mul.i32 = mul i32 %add, 24576, !dbg !1430
  %div.i33 = lshr i32 %sm9.sroa.0.0.copyload, 27, !dbg !1430
  %add8.i34 = or i32 %mul.i32, %div.i33, !dbg !1430
  %shl9.i35 = shl nuw nsw i32 %conv2.i21, 2, !dbg !1430
  %add10.i36 = add i32 %add8.i34, %shl9.i35, !dbg !1430
  %shl11.i37 = shl nuw nsw i32 %conv1.i20, 10, !dbg !1430
  %add12.i38 = add i32 %add10.i36, %shl11.i37, !dbg !1430
  %cmp13.i39 = icmp ult i32 %sm9.sroa.0.0.copyload, 402653184, !dbg !1431
  %cmp14.i40 = icmp ult i32 %sm9.sroa.0.0.copyload, 268435456, !dbg !1432
  %cmp17.i41 = icmp ult i32 %sm9.sroa.0.0.copyload, 134217728, !dbg !1433
  %add20.i42 = add i32 %sm.sroa.3.3.extract.shift.i18, 8, !dbg !1434
  %shr21.i43 = lshr i32 %call.i.i27, %add20.i42, !dbg !1434
  %and22.i44 = and i32 %shr21.i43, 255, !dbg !1434
  %add23.i45 = add i32 %sm.sroa.3.3.extract.shift.i18, 16, !dbg !1435
  %shr24.i46 = lshr i32 %call.i.i27, %add23.i45, !dbg !1435
  %and25.i47 = and i32 %shr24.i46, 255, !dbg !1435
  %add26.i48 = add i32 %sm.sroa.3.3.extract.shift.i18, 24, !dbg !1436
  %shr27.i49 = lshr i32 %call.i.i27, %add26.i48, !dbg !1436
  %and28.i50 = and i32 %shr27.i49, 255, !dbg !1436
  %cmp33.i51 = icmp eq i32 %and22.i44, 255, !dbg !1437
  %or.cond.i52 = and i1 %cmp14.i40, %cmp33.i51, !dbg !1437
  %cmp38.i53 = icmp eq i32 %and25.i47, 255, !dbg !1438
  %or.cond108.i54 = and i1 %cmp17.i41, %cmp38.i53, !dbg !1438
  br i1 %cmp13.i39, label %if.then42.i59, label %if.end.thread.i56, !dbg !1439

if.end.thread.i56:                                ; preds = %if.then7.i55
  br i1 %or.cond.i52, label %if.then47.i64, label %if.end50.i67, !dbg !1440

if.then42.i59:                                    ; preds = %if.then7.i55
  %cmp43.i57 = icmp ne i32 %and22.i44, 255, !dbg !1441
  %cond44.i58 = select i1 %cmp43.i57, i32 -1, i32 255, !dbg !1441
  br i1 %or.cond.i52, label %if.then47.i64, label %if.end50.i67, !dbg !1440

if.then47.i64:                                    ; preds = %if.then42.i59, %if.end.thread.i56
  %bin_plus_1_add.0131.i60 = phi i32 [ %cond44.i58, %if.then42.i59 ], [ undef, %if.end.thread.i56 ]
  %overflow_into_bin_plus_1.0121129.i61 = phi i1 [ true, %if.then42.i59 ], [ false, %if.end.thread.i56 ]
  %cmp48.i62 = icmp ne i32 %and25.i47, 255, !dbg !1440
  %cond49.i63 = select i1 %cmp48.i62, i32 -1, i32 255, !dbg !1440
  br i1 %or.cond108.i54, label %if.then52.i77, label %if.end55.i85, !dbg !1442

if.end50.i67:                                     ; preds = %if.then42.i59, %if.end.thread.i56
  %bin_plus_1_add.0130.i65 = phi i32 [ %cond44.i58, %if.then42.i59 ], [ undef, %if.end.thread.i56 ]
  %overflow_into_bin_plus_1.0121128.i66 = phi i1 [ true, %if.then42.i59 ], [ false, %if.end.thread.i56 ]
  br i1 %or.cond108.i54, label %if.then52.i77, label %if.end55.i85, !dbg !1442

if.then52.i77:                                    ; preds = %if.end50.i67, %if.then47.i64
  %bin_plus_2_add.0141.i68 = phi i32 [ %cond49.i63, %if.then47.i64 ], [ undef, %if.end50.i67 ]
  %.109122126137.i69 = phi i1 [ true, %if.then47.i64 ], [ false, %if.end50.i67 ]
  %overflow_into_bin_plus_1.0121128135.i70 = phi i1 [ %overflow_into_bin_plus_1.0121129.i61, %if.then47.i64 ], [ %overflow_into_bin_plus_1.0121128.i66, %if.end50.i67 ]
  %bin_plus_1_add.0130133.i71 = phi i32 [ %bin_plus_1_add.0131.i60, %if.then47.i64 ], [ %bin_plus_1_add.0130.i65, %if.end50.i67 ]
  %cmp53.i72 = icmp ne i32 %and28.i50, 255, !dbg !1442
  %cond54.i73 = select i1 %cmp53.i72, i32 -1, i32 255, !dbg !1442
  %idxprom56142.i74 = zext i32 %add12.i38 to i64, !dbg !1443
  %arrayidx57143.i75 = getelementptr inbounds i32* %global_overflow, i64 %idxprom56142.i74, !dbg !1443
  %call.i111144.i76 = tail call i32 @__uAtomicAdd(i32* %arrayidx57143.i75, i32 256), !dbg !1444
  br i1 %overflow_into_bin_plus_1.0121128135.i70, label %if.then60.i95, label %if.end65.i100, !dbg !1445

if.end55.i85:                                     ; preds = %if.end50.i67, %if.then47.i64
  %bin_plus_2_add.0140.i78 = phi i32 [ undef, %if.end50.i67 ], [ %cond49.i63, %if.then47.i64 ]
  %.109122126136.i79 = phi i1 [ false, %if.end50.i67 ], [ true, %if.then47.i64 ]
  %overflow_into_bin_plus_1.0121128134.i80 = phi i1 [ %overflow_into_bin_plus_1.0121128.i66, %if.end50.i67 ], [ %overflow_into_bin_plus_1.0121129.i61, %if.then47.i64 ]
  %bin_plus_1_add.0130132.i81 = phi i32 [ %bin_plus_1_add.0130.i65, %if.end50.i67 ], [ %bin_plus_1_add.0131.i60, %if.then47.i64 ]
  %idxprom56.i82 = zext i32 %add12.i38 to i64, !dbg !1443
  %arrayidx57.i83 = getelementptr inbounds i32* %global_overflow, i64 %idxprom56.i82, !dbg !1443
  %call.i111.i84 = tail call i32 @__uAtomicAdd(i32* %arrayidx57.i83, i32 256), !dbg !1444
  br i1 %overflow_into_bin_plus_1.0121128134.i80, label %if.then60.i95, label %if.end65.i100, !dbg !1445

if.then60.i95:                                    ; preds = %if.end55.i85, %if.then52.i77
  %bin_plus_3_add.0153.i86 = phi i32 [ %cond54.i73, %if.then52.i77 ], [ undef, %if.end55.i85 ]
  %bin_plus_1_add.0130132151.i87 = phi i32 [ %bin_plus_1_add.0130133.i71, %if.then52.i77 ], [ %bin_plus_1_add.0130132.i81, %if.end55.i85 ]
  %.109122126136150.i88 = phi i1 [ %.109122126137.i69, %if.then52.i77 ], [ %.109122126136.i79, %if.end55.i85 ]
  %.110123124138148.i89 = phi i1 [ true, %if.then52.i77 ], [ false, %if.end55.i85 ]
  %bin_plus_2_add.0140146.i90 = phi i32 [ %bin_plus_2_add.0141.i68, %if.then52.i77 ], [ %bin_plus_2_add.0140.i78, %if.end55.i85 ]
  %add61.i91 = add i32 %add12.i38, 1, !dbg !1445
  %idxprom62.i92 = zext i32 %add61.i91 to i64, !dbg !1445
  %arrayidx63.i93 = getelementptr inbounds i32* %global_overflow, i64 %idxprom62.i92, !dbg !1445
  %call.i112.i94 = tail call i32 @__uAtomicAdd(i32* %arrayidx63.i93, i32 %bin_plus_1_add.0130132151.i87), !dbg !1446
  br i1 %.109122126136150.i88, label %if.then67.i108, label %if.end72.i111, !dbg !1447

if.end65.i100:                                    ; preds = %if.end55.i85, %if.then52.i77
  %bin_plus_3_add.0152.i96 = phi i32 [ %cond54.i73, %if.then52.i77 ], [ undef, %if.end55.i85 ]
  %.109122126136149.i97 = phi i1 [ %.109122126137.i69, %if.then52.i77 ], [ %.109122126136.i79, %if.end55.i85 ]
  %.110123124138147.i98 = phi i1 [ true, %if.then52.i77 ], [ false, %if.end55.i85 ]
  %bin_plus_2_add.0140145.i99 = phi i32 [ %bin_plus_2_add.0141.i68, %if.then52.i77 ], [ %bin_plus_2_add.0140.i78, %if.end55.i85 ]
  br i1 %.109122126136149.i97, label %if.then67.i108, label %if.end72.i111, !dbg !1447

if.then67.i108:                                   ; preds = %if.end65.i100, %if.then60.i95
  %bin_plus_2_add.0140145158.i101 = phi i32 [ %bin_plus_2_add.0140146.i90, %if.then60.i95 ], [ %bin_plus_2_add.0140145.i99, %if.end65.i100 ]
  %.110123124138147157.i102 = phi i1 [ %.110123124138148.i89, %if.then60.i95 ], [ %.110123124138147.i98, %if.end65.i100 ]
  %bin_plus_3_add.0152155.i103 = phi i32 [ %bin_plus_3_add.0153.i86, %if.then60.i95 ], [ %bin_plus_3_add.0152.i96, %if.end65.i100 ]
  %add68.i104 = add i32 %add12.i38, 2, !dbg !1447
  %idxprom69.i105 = zext i32 %add68.i104 to i64, !dbg !1447
  %arrayidx70.i106 = getelementptr inbounds i32* %global_overflow, i64 %idxprom69.i105, !dbg !1447
  %call.i113.i107 = tail call i32 @__uAtomicAdd(i32* %arrayidx70.i106, i32 %bin_plus_2_add.0140145158.i101), !dbg !1448
  br i1 %.110123124138147157.i102, label %if.then74.i117, label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit118, !dbg !1449

if.end72.i111:                                    ; preds = %if.end65.i100, %if.then60.i95
  %.110123124138147156.i109 = phi i1 [ %.110123124138148.i89, %if.then60.i95 ], [ %.110123124138147.i98, %if.end65.i100 ]
  %bin_plus_3_add.0152154.i110 = phi i32 [ %bin_plus_3_add.0153.i86, %if.then60.i95 ], [ %bin_plus_3_add.0152.i96, %if.end65.i100 ]
  br i1 %.110123124138147156.i109, label %if.then74.i117, label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit118, !dbg !1449

if.then74.i117:                                   ; preds = %if.end72.i111, %if.then67.i108
  %bin_plus_3_add.0152154159.i112 = phi i32 [ %bin_plus_3_add.0152155.i103, %if.then67.i108 ], [ %bin_plus_3_add.0152154.i110, %if.end72.i111 ]
  %add75.i113 = add i32 %add12.i38, 3, !dbg !1449
  %idxprom76.i114 = zext i32 %add75.i113 to i64, !dbg !1449
  %arrayidx77.i115 = getelementptr inbounds i32* %global_overflow, i64 %idxprom76.i114, !dbg !1449
  %call.i114.i116 = tail call i32 @__uAtomicAdd(i32* %arrayidx77.i115, i32 %bin_plus_3_add.0152154159.i112), !dbg !1450
  br label %_Z18testIncrementLocalPjPA256_jj6uchar4.exit118, !dbg !1449

_Z18testIncrementLocalPjPA256_jj6uchar4.exit118:  ; preds = %if.then74.i117, %if.end72.i111, %if.then67.i108, %if.then.i31, %while.body8
  %cmp7 = icmp ult i32 %add13, %num_elements, !dbg !1371
  br i1 %cmp7, label %while.body8, label %if.end, !dbg !1371

if.end:                                           ; preds = %_Z18testIncrementLocalPjPA256_jj6uchar4.exit118, %while.cond.backedge, %while.cond.preheader, %while.cond6.preheader
  %13 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1451, !tbaa !1237
  %mul16 = mul i32 %histo_width, %histo_height, !dbg !1451
  %div = lshr i32 %mul16, 2, !dbg !1451
  %mul17 = mul i32 %13, %div, !dbg !1451
  %mul18 = mul i32 %add, 24576, !dbg !1451
  %div19 = lshr exact i32 %mul18, 2, !dbg !1451
  %add20 = add i32 %mul17, %div19, !dbg !1451
  tail call void @__syncthreads(), !dbg !1452
  %idxprom21 = zext i32 %add20 to i64, !dbg !1453
  %14 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1454, !tbaa !1237
  %cmp6.i = icmp slt i32 %14, 6144, !dbg !1454
  br i1 %cmp6.i, label %for.body.i39, label %_Z10copyMemoryPjPA256_j.exit, !dbg !1454

for.body.i39:                                     ; preds = %for.body.i39, %if.end
  %i.07.i = phi i32 [ %add.i37, %for.body.i39 ], [ %14, %if.end ]
  %idxprom.i35 = sext i32 %i.07.i to i64, !dbg !1455
  %arrayidx.i36 = getelementptr inbounds [24 x [256 x i32]]* @_ZZ17histo_main_kernelP6uchar4jjjjjPjS1_S1_E9sub_histo, i64 0, i64 0, i64 %idxprom.i35, !dbg !1455
  %15 = load i32* %arrayidx.i36, align 4, !dbg !1455, !tbaa !1237
  %arrayidx22.sum = add i64 %idxprom.i35, %idxprom21, !dbg !1455
  %arrayidx2.i = getelementptr inbounds i32* %global_subhisto, i64 %arrayidx22.sum, !dbg !1455
  store i32 %15, i32* %arrayidx2.i, align 4, !dbg !1455, !tbaa !1237
  %16 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1454, !tbaa !1237
  %add.i37 = add i32 %16, %i.07.i, !dbg !1454
  %cmp.i38 = icmp slt i32 %add.i37, 6144, !dbg !1454
  br i1 %cmp.i38, label %for.body.i39, label %_Z10copyMemoryPjPA256_j.exit, !dbg !1454

_Z10copyMemoryPjPA256_j.exit:                     ; preds = %for.body.i39, %if.end
  ret void, !dbg !1456
}

declare void @__syncthreads() section "__device__"

declare i32 @__uAtomicAdd(i32*, i32) section "__device__"

define void @_Z20histo_prescan_kernelPjiS_(i32* nocapture %input, i32 %size, i32* %minmax) uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @gridDim, i64 0, i32 0), align 4, !dbg !1457, !tbaa !1237
  %int_cast_to_i64 = zext i32 %0 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %div = udiv i32 %size, %0, !dbg !1457
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1458, !tbaa !1237
  %mul = mul i32 %1, %div, !dbg !1458
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1458, !tbaa !1237
  %add = add i32 %mul, %2, !dbg !1458
  %int_cast_to_i641 = zext i32 8 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641)
  %div2 = sdiv i32 %div, 8, !dbg !1459
  %add3 = add i32 %div2, %mul, !dbg !1459
  %cmp168 = icmp slt i32 %add, %add3, !dbg !1460
  br i1 %cmp168, label %while.body.lr.ph, label %while.end.thread, !dbg !1460, !br-S-S !1461

while.end.thread:                                 ; preds = %entry
  %idxprom8175 = zext i32 %2 to i64, !dbg !1462
  %arrayidx9176 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom8175, !dbg !1462
  store float 0x7FF8000000000000, float* %arrayidx9176, align 4, !dbg !1462, !tbaa !1463
  br label %while.end25, !dbg !1464

while.body.lr.ph:                                 ; preds = %entry
  %3 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1465, !tbaa !1237
  br label %while.body, !dbg !1460

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %addr.0171 = phi i32 [ %add, %while.body.lr.ph ], [ %add5, %while.body ]
  %avg.0170 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add4, %while.body ]
  %count.0169 = phi i32 [ 0, %while.body.lr.ph ], [ %inc, %while.body ]
  %idxprom = sext i32 %addr.0171 to i64, !dbg !1467
  %arrayidx = getelementptr inbounds i32* %input, i64 %idxprom, !dbg !1467
  %4 = load i32* %arrayidx, align 4, !dbg !1467, !tbaa !1237
  %conv = uitofp i32 %4 to float, !dbg !1467
  %add4 = fadd float %avg.0170, %conv, !dbg !1467
  %inc = add i32 %count.0169, 1, !dbg !1468
  %add5 = add i32 %3, %addr.0171, !dbg !1465
  %cmp = icmp slt i32 %add5, %add3, !dbg !1460
  br i1 %cmp, label %while.body, label %while.end, !dbg !1460, !br-S-S-ite !1461

while.end:                                        ; preds = %while.body
  %phitmp = uitofp i32 %inc to float, !dbg !1460
  %div7 = fdiv float %add4, %phitmp, !dbg !1469
  %idxprom8 = zext i32 %2 to i64, !dbg !1462
  %arrayidx9 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom8, !dbg !1462
  store float %div7, float* %arrayidx9, align 4, !dbg !1462, !tbaa !1463
  br i1 %cmp168, label %while.body14.lr.ph, label %while.end25, !dbg !1464, !br-S-S !1461

while.body14.lr.ph:                               ; preds = %while.end
  %5 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1470, !tbaa !1237
  br label %while.body14, !dbg !1464

while.body14:                                     ; preds = %while.body14, %while.body14.lr.ph
  %stddev.0167 = phi float [ 0.000000e+00, %while.body14.lr.ph ], [ %add23, %while.body14 ]
  %addr2.0166 = phi i32 [ %add, %while.body14.lr.ph ], [ %add24, %while.body14 ]
  %idxprom15 = sext i32 %addr2.0166 to i64, !dbg !1472
  %arrayidx16 = getelementptr inbounds i32* %input, i64 %idxprom15, !dbg !1472
  %6 = load i32* %arrayidx16, align 4, !dbg !1472, !tbaa !1237
  %conv17 = uitofp i32 %6 to float, !dbg !1472
  %sub = fsub float %conv17, %div7, !dbg !1472
  %mul22 = fmul float %sub, %sub, !dbg !1472
  %add23 = fadd float %stddev.0167, %mul22, !dbg !1472
  %add24 = add i32 %5, %addr2.0166, !dbg !1470
  %cmp13 = icmp slt i32 %add24, %add3, !dbg !1464
  br i1 %cmp13, label %while.body14, label %while.end25, !dbg !1464, !br-S-S-ite !1461

while.end25:                                      ; preds = %while.body14, %while.end, %while.end.thread
  %count.0.lcssa177 = phi float [ %phitmp, %while.end ], [ 0.000000e+00, %while.end.thread ], [ %phitmp, %while.body14 ]
  %stddev.0.lcssa = phi float [ 0.000000e+00, %while.end ], [ 0.000000e+00, %while.end.thread ], [ %add23, %while.body14 ]
  %div27 = fdiv float %stddev.0.lcssa, %count.0.lcssa177, !dbg !1473
  %call = tail call float @sqrtf(float %div27) nounwind, !dbg !1474
  %7 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1474, !tbaa !1237
  %idxprom28 = zext i32 %7 to i64, !dbg !1474
  %arrayidx29 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom28, !dbg !1474
  store float %call, float* %arrayidx29, align 4, !dbg !1474, !tbaa !1463
  tail call void @__syncthreads(), !dbg !1475
  %8 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1477, !tbaa !1237
  %cmp32 = icmp ult i32 %8, 256, !dbg !1477
  br i1 %cmp32, label %if.then, label %for.inc, !dbg !1477, !br-S-S !1461

if.then:                                          ; preds = %while.end25
  %add33 = add i32 %8, 256, !dbg !1478
  %idxprom34 = zext i32 %add33 to i64, !dbg !1478
  %arrayidx35 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom34, !dbg !1478
  %9 = load float* %arrayidx35, align 4, !dbg !1478, !tbaa !1463
  %idxprom36 = zext i32 %8 to i64, !dbg !1478
  %arrayidx37 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom36, !dbg !1478
  %10 = load float* %arrayidx37, align 4, !dbg !1478, !tbaa !1463
  %add38 = fadd float %9, %10, !dbg !1478
  store float %add38, float* %arrayidx37, align 4, !dbg !1478, !tbaa !1463
  %arrayidx41 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom34, !dbg !1478
  %11 = load float* %arrayidx41, align 4, !dbg !1478, !tbaa !1463
  %arrayidx43 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom36, !dbg !1478
  %12 = load float* %arrayidx43, align 4, !dbg !1478, !tbaa !1463
  %add44 = fadd float %11, %12, !dbg !1478
  store float %add44, float* %arrayidx43, align 4, !dbg !1478, !tbaa !1463
  br label %for.inc, !dbg !1478

for.inc:                                          ; preds = %if.then, %while.end25
  tail call void @__syncthreads(), !dbg !1475
  %13 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1477, !tbaa !1237
  %cmp32.1 = icmp ult i32 %13, 128, !dbg !1477
  br i1 %cmp32.1, label %if.then.1, label %for.inc.1, !dbg !1477, !br-S-S !1461

if.end59:                                         ; preds = %for.inc.3
  %add47 = add i32 %37, 16, !dbg !1480
  %idxprom48 = zext i32 %add47 to i64, !dbg !1480
  %arrayidx49 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom48, !dbg !1480
  %14 = load float* %arrayidx49, align 4, !dbg !1480, !tbaa !1463
  %idxprom50 = zext i32 %37 to i64, !dbg !1480
  %arrayidx51 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom50, !dbg !1480
  %15 = load float* %arrayidx51, align 4, !dbg !1480, !tbaa !1463
  %add52 = fadd float %14, %15, !dbg !1480
  store float %add52, float* %arrayidx51, align 4, !dbg !1480, !tbaa !1463
  %arrayidx55 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom48, !dbg !1480
  %16 = load float* %arrayidx55, align 4, !dbg !1480, !tbaa !1463
  %arrayidx57 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom50, !dbg !1480
  %17 = load float* %arrayidx57, align 4, !dbg !1480, !tbaa !1463
  %add58 = fadd float %16, %17, !dbg !1480
  store float %add58, float* %arrayidx57, align 4, !dbg !1480, !tbaa !1463
  %cmp60 = icmp ult i32 %37, 8, !dbg !1482
  br i1 %cmp60, label %if.end74, label %if.end123, !dbg !1482, !br-S-S !1461

if.end74:                                         ; preds = %if.end59
  %add62 = add i32 %37, 8, !dbg !1483
  %idxprom63 = zext i32 %add62 to i64, !dbg !1483
  %arrayidx64 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom63, !dbg !1483
  %18 = load float* %arrayidx64, align 4, !dbg !1483, !tbaa !1463
  %add67 = fadd float %18, %add52, !dbg !1483
  store float %add67, float* %arrayidx51, align 4, !dbg !1483, !tbaa !1463
  %arrayidx70 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom63, !dbg !1483
  %19 = load float* %arrayidx70, align 4, !dbg !1483, !tbaa !1463
  %add73 = fadd float %19, %add58, !dbg !1483
  store float %add73, float* %arrayidx57, align 4, !dbg !1483, !tbaa !1463
  %cmp75 = icmp ult i32 %37, 4, !dbg !1485
  br i1 %cmp75, label %if.end89, label %if.end123, !dbg !1485, !br-S-S !1461

if.end89:                                         ; preds = %if.end74
  %add77 = add i32 %37, 4, !dbg !1486
  %idxprom78 = zext i32 %add77 to i64, !dbg !1486
  %arrayidx79 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom78, !dbg !1486
  %20 = load float* %arrayidx79, align 4, !dbg !1486, !tbaa !1463
  %add82 = fadd float %20, %add67, !dbg !1486
  store float %add82, float* %arrayidx51, align 4, !dbg !1486, !tbaa !1463
  %arrayidx85 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom78, !dbg !1486
  %21 = load float* %arrayidx85, align 4, !dbg !1486, !tbaa !1463
  %add88 = fadd float %21, %add73, !dbg !1486
  store float %add88, float* %arrayidx57, align 4, !dbg !1486, !tbaa !1463
  %cmp90 = icmp ult i32 %37, 2, !dbg !1488
  br i1 %cmp90, label %if.end104, label %if.end123, !dbg !1488, !br-S-S !1461

if.end104:                                        ; preds = %if.end89
  %add92 = add i32 %37, 2, !dbg !1489
  %idxprom93 = zext i32 %add92 to i64, !dbg !1489
  %arrayidx94 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom93, !dbg !1489
  %22 = load float* %arrayidx94, align 4, !dbg !1489, !tbaa !1463
  %add97 = fadd float %22, %add82, !dbg !1489
  store float %add97, float* %arrayidx51, align 4, !dbg !1489, !tbaa !1463
  %arrayidx100 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom93, !dbg !1489
  %23 = load float* %arrayidx100, align 4, !dbg !1489, !tbaa !1463
  %add103 = fadd float %23, %add88, !dbg !1489
  store float %add103, float* %arrayidx57, align 4, !dbg !1489, !tbaa !1463
  %cmp105 = icmp eq i32 %37, 0, !dbg !1491
  br i1 %cmp105, label %if.then106, label %if.end123, !dbg !1491, !br-S-S !1461

if.then106:                                       ; preds = %if.end104
  %24 = load float* getelementptr inbounds ([512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 0), align 16, !dbg !1492, !tbaa !1463
  %25 = load float* getelementptr inbounds ([512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 1), align 4, !dbg !1492, !tbaa !1463
  %add108 = fadd float %24, %25, !dbg !1492
  %div109 = fmul float %add108, 1.953125e-03, !dbg !1493
  %26 = load float* getelementptr inbounds ([512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 0), align 16, !dbg !1494, !tbaa !1463
  %27 = load float* getelementptr inbounds ([512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 1), align 4, !dbg !1494, !tbaa !1463
  %add111 = fadd float %26, %27, !dbg !1494
  %div112 = fmul float %add111, 1.953125e-03, !dbg !1495
  %mul113 = fmul float %div112, 1.000000e+01, !dbg !1496
  %sub114 = fsub float %div109, %mul113, !dbg !1496
  %conv115 = fptoui float %sub114 to i32, !dbg !1496
  %int_cast_to_i642 = zext i32 24576 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i642)
  %div116 = udiv i32 %conv115, 24576, !dbg !1496
  %call.i = tail call i32 @__uAtomicMin(i32* %minmax, i32 %div116), !dbg !1497
  %add.ptr = getelementptr inbounds i32* %minmax, i64 1, !dbg !1499
  %add119 = fadd float %div109, %mul113, !dbg !1499
  %conv120 = fptoui float %add119 to i32, !dbg !1499
  %int_cast_to_i643 = zext i32 24576 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i643)
  %div121 = udiv i32 %conv120, 24576, !dbg !1499
  %call.i152 = tail call i32 @__uAtomicMax(i32* %add.ptr, i32 %div121), !dbg !1500
  br label %if.end123, !dbg !1502

if.end123:                                        ; preds = %for.inc.3, %for.inc.2, %if.then106, %if.end104, %if.end89, %if.end74, %if.end59
  ret void, !dbg !1503

if.then.1:                                        ; preds = %for.inc
  %add33.1 = add i32 %13, 128, !dbg !1478
  %idxprom34.1 = zext i32 %add33.1 to i64, !dbg !1478
  %arrayidx35.1 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom34.1, !dbg !1478
  %28 = load float* %arrayidx35.1, align 4, !dbg !1478, !tbaa !1463
  %idxprom36.1 = zext i32 %13 to i64, !dbg !1478
  %arrayidx37.1 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom36.1, !dbg !1478
  %29 = load float* %arrayidx37.1, align 4, !dbg !1478, !tbaa !1463
  %add38.1 = fadd float %28, %29, !dbg !1478
  store float %add38.1, float* %arrayidx37.1, align 4, !dbg !1478, !tbaa !1463
  %arrayidx41.1 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom34.1, !dbg !1478
  %30 = load float* %arrayidx41.1, align 4, !dbg !1478, !tbaa !1463
  %arrayidx43.1 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom36.1, !dbg !1478
  %31 = load float* %arrayidx43.1, align 4, !dbg !1478, !tbaa !1463
  %add44.1 = fadd float %30, %31, !dbg !1478
  store float %add44.1, float* %arrayidx43.1, align 4, !dbg !1478, !tbaa !1463
  br label %for.inc.1, !dbg !1478

for.inc.1:                                        ; preds = %if.then.1, %for.inc
  tail call void @__syncthreads(), !dbg !1475
  %32 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1477, !tbaa !1237
  %cmp32.2 = icmp ult i32 %32, 64, !dbg !1477
  br i1 %cmp32.2, label %if.then.2, label %for.inc.2, !dbg !1477, !br-S-S !1461

if.then.2:                                        ; preds = %for.inc.1
  %add33.2 = add i32 %32, 64, !dbg !1478
  %idxprom34.2 = zext i32 %add33.2 to i64, !dbg !1478
  %arrayidx35.2 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom34.2, !dbg !1478
  %33 = load float* %arrayidx35.2, align 4, !dbg !1478, !tbaa !1463
  %idxprom36.2 = zext i32 %32 to i64, !dbg !1478
  %arrayidx37.2 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom36.2, !dbg !1478
  %34 = load float* %arrayidx37.2, align 4, !dbg !1478, !tbaa !1463
  %add38.2 = fadd float %33, %34, !dbg !1478
  store float %add38.2, float* %arrayidx37.2, align 4, !dbg !1478, !tbaa !1463
  %arrayidx41.2 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom34.2, !dbg !1478
  %35 = load float* %arrayidx41.2, align 4, !dbg !1478, !tbaa !1463
  %arrayidx43.2 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom36.2, !dbg !1478
  %36 = load float* %arrayidx43.2, align 4, !dbg !1478, !tbaa !1463
  %add44.2 = fadd float %35, %36, !dbg !1478
  store float %add44.2, float* %arrayidx43.2, align 4, !dbg !1478, !tbaa !1463
  br label %for.inc.2, !dbg !1478

for.inc.2:                                        ; preds = %if.then.2, %for.inc.1
  tail call void @__syncthreads(), !dbg !1475
  %37 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1477, !tbaa !1237
  %cmp32.3 = icmp ult i32 %37, 32, !dbg !1477
  br i1 %cmp32.3, label %for.inc.3, label %if.end123, !dbg !1477, !br-S-S !1461

for.inc.3:                                        ; preds = %for.inc.2
  %add33.3 = add i32 %37, 32, !dbg !1478
  %idxprom34.3 = zext i32 %add33.3 to i64, !dbg !1478
  %arrayidx35.3 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom34.3, !dbg !1478
  %38 = load float* %arrayidx35.3, align 4, !dbg !1478, !tbaa !1463
  %idxprom36.3 = zext i32 %37 to i64, !dbg !1478
  %arrayidx37.3 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg, i64 0, i64 %idxprom36.3, !dbg !1478
  %39 = load float* %arrayidx37.3, align 4, !dbg !1478, !tbaa !1463
  %add38.3 = fadd float %38, %39, !dbg !1478
  store float %add38.3, float* %arrayidx37.3, align 4, !dbg !1478, !tbaa !1463
  %arrayidx41.3 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom34.3, !dbg !1478
  %40 = load float* %arrayidx41.3, align 4, !dbg !1478, !tbaa !1463
  %arrayidx43.3 = getelementptr inbounds [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev, i64 0, i64 %idxprom36.3, !dbg !1478
  %41 = load float* %arrayidx43.3, align 4, !dbg !1478, !tbaa !1463
  %add44.3 = fadd float %40, %41, !dbg !1478
  store float %add44.3, float* %arrayidx43.3, align 4, !dbg !1478, !tbaa !1463
  %cmp45 = icmp ult i32 %37, 16, !dbg !1504
  br i1 %cmp45, label %if.end59, label %if.end123, !dbg !1504, !br-S-S !1461
}

declare float @sqrtf(float) nounwind section "__device__"

declare i32 @__uAtomicMax(i32*, i32) section "__device__"

declare i32 @__uAtomicMin(i32*, i32) section "__device__"

define i32 @main(i32 %argc, i8** nocapture %argv) uwtable {
entry:
  %img_width = alloca i32, align 4
  %img_height = alloca i32, align 4
  %histo_width = alloca i32, align 4
  %histo_height = alloca i32, align 4
  %input = alloca i32*, align 8
  %ranges = alloca i32*, align 8
  %sm_mappings = alloca %struct.uchar4*, align 8
  %global_subhisto = alloca i32*, align 8
  %global_histo = alloca i16*, align 8
  %global_overflow = alloca i32*, align 8
  %final_histo = alloca i8*, align 8
  %ranges_h = alloca i64, align 8, !dbg !1505
  %call = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([83 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str6, i64 0, i64 0)), !dbg !1506
  %0 = bitcast i32* %img_width to i8*, !dbg !1507
  %call1 = call i64 @fread(i8* %0, i64 4, i64 1, %struct._IO_FILE* %call), !dbg !1507
  %1 = bitcast i32* %img_height to i8*, !dbg !1508
  %call3 = call i64 @fread(i8* %1, i64 4, i64 1, %struct._IO_FILE* %call), !dbg !1508
  %add5 = add i64 %call3, %call1, !dbg !1508
  %2 = bitcast i32* %histo_width to i8*, !dbg !1509
  %call7 = call i64 @fread(i8* %2, i64 4, i64 1, %struct._IO_FILE* %call), !dbg !1509
  %add9 = add i64 %add5, %call7, !dbg !1509
  %3 = bitcast i32* %histo_height to i8*, !dbg !1510
  %call11 = call i64 @fread(i8* %3, i64 4, i64 1, %struct._IO_FILE* %call), !dbg !1510
  %add13 = add i64 %add9, %call11, !dbg !1510
  %conv14 = trunc i64 %add13 to i32, !dbg !1510
  %cmp = icmp eq i32 %conv14, 4, !dbg !1511
  br i1 %cmp, label %if.end, label %if.then, !dbg !1511

if.then:                                          ; preds = %entry
  %4 = load %struct._IO_FILE** @stderr, align 8, !dbg !1512, !tbaa !1514
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([53 x i8]* @.str7, i64 0, i64 0), i64 52, i64 1, %struct._IO_FILE* %4), !dbg !1512
  br label %return, !dbg !1515

if.end:                                           ; preds = %entry
  %6 = load i32* %img_width, align 4, !dbg !1516, !tbaa !1237
  %7 = load i32* %img_height, align 4, !dbg !1516, !tbaa !1237
  %8 = load i32* %histo_width, align 4, !dbg !1516, !tbaa !1237
  %9 = load i32* %histo_height, align 4, !dbg !1516, !tbaa !1237
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([67 x i8]* @.str8, i64 0, i64 0), i32 %6, i32 %7, i32 %8, i32 %9), !dbg !1516
  %mul = mul i32 %7, %6, !dbg !1517
  %conv17 = zext i32 %mul to i64, !dbg !1517
  %mul18 = shl nuw nsw i64 %conv17, 2, !dbg !1517
  %call19 = call noalias i8* @malloc(i64 %mul18) nounwind, !dbg !1517
  %10 = bitcast i8* %call19 to i32*, !dbg !1517
  %mul20 = mul i32 %9, %8, !dbg !1518
  %conv21 = zext i32 %mul20 to i64, !dbg !1518
  %call22 = call noalias i8* @calloc(i64 %conv21, i64 1) nounwind, !dbg !1518
  %call25 = call i64 @fread(i8* %call19, i64 4, i64 %conv17, %struct._IO_FILE* %call), !dbg !1519
  %conv26 = trunc i64 %call25 to i32, !dbg !1519
  %call27 = call i32 @fclose(%struct._IO_FILE* %call), !dbg !1520
  %cmp29 = icmp eq i32 %conv26, %mul, !dbg !1521
  br i1 %cmp29, label %if.end32, label %if.then30, !dbg !1521

if.then30:                                        ; preds = %if.end
  %11 = load %struct._IO_FILE** @stderr, align 8, !dbg !1522, !tbaa !1514
  %12 = call i64 @fwrite(i8* getelementptr inbounds ([37 x i8]* @.str9, i64 0, i64 0), i64 36, i64 1, %struct._IO_FILE* %11), !dbg !1522
  br label %return, !dbg !1524

if.end32:                                         ; preds = %if.end
  %add33 = add i32 %6, 1, !dbg !1525
  %div = and i32 %add33, -2, !dbg !1525
  %13 = bitcast i32** %input to i8**, !dbg !1526
  %sub = add i32 %7, 15, !dbg !1526
  %div36 = and i32 %sub, -16, !dbg !1526
  %mul38 = mul i32 %div36, %div, !dbg !1526
  %conv39 = zext i32 %mul38 to i64, !dbg !1526
  %mul40 = shl nuw nsw i64 %conv39, 2, !dbg !1526
  %call41 = call i32 @cudaMalloc(i8** %13, i64 %mul40), !dbg !1526
  %14 = bitcast i32** %ranges to i8**, !dbg !1527
  %call42 = call i32 @cudaMalloc(i8** %14, i64 8), !dbg !1527
  %15 = bitcast %struct.uchar4** %sm_mappings to i8**, !dbg !1528
  %call46 = call i32 @cudaMalloc(i8** %15, i64 %mul18), !dbg !1528
  %16 = bitcast i32** %global_subhisto to i8**, !dbg !1529
  %mul47 = mul i32 %6, 14, !dbg !1529
  %mul48 = mul i32 %mul47, %9, !dbg !1529
  %conv49 = zext i32 %mul48 to i64, !dbg !1529
  %mul50 = shl nuw nsw i64 %conv49, 2, !dbg !1529
  %call51 = call i32 @cudaMalloc(i8** %16, i64 %mul50), !dbg !1529
  %17 = bitcast i16** %global_histo to i8**, !dbg !1530
  %mul52 = mul i32 %9, %6, !dbg !1530
  %conv53 = zext i32 %mul52 to i64, !dbg !1530
  %mul54 = shl nuw nsw i64 %conv53, 1, !dbg !1530
  %call55 = call i32 @cudaMalloc(i8** %17, i64 %mul54), !dbg !1530
  %18 = bitcast i32** %global_overflow to i8**, !dbg !1531
  %mul58 = shl nuw nsw i64 %conv53, 2, !dbg !1531
  %call59 = call i32 @cudaMalloc(i8** %18, i64 %mul58), !dbg !1531
  %call63 = call i32 @cudaMalloc(i8** %final_histo, i64 %conv53), !dbg !1532
  %19 = load i8** %final_histo, align 8, !dbg !1533, !tbaa !1514
  %call67 = call i32 @cudaMemset(i8* %19, i32 0, i64 %conv53), !dbg !1533
  %cmp68134 = icmp eq i32 %7, 0, !dbg !1534
  br i1 %cmp68134, label %for.cond76.preheader, label %for.body.lr.ph, !dbg !1534

for.body.lr.ph:                                   ; preds = %if.end32
  %conv73 = zext i32 %6 to i64, !dbg !1535
  %mul74 = shl nuw nsw i64 %conv73, 2, !dbg !1535
  br label %for.body, !dbg !1534

for.cond76.preheader:                             ; preds = %for.body, %if.end32
  %20 = phi i32 [ 0, %if.end32 ], [ %7, %for.body ]
  %21 = bitcast i64* %ranges_h to i8*, !dbg !1537
  %mul81 = mul i32 %6, %20, !dbg !1538
  store i64 4294967295, i64* %ranges_h, align 8, !dbg !1505
  %22 = load i32** %ranges, align 8, !dbg !1537, !tbaa !1514
  %23 = bitcast i32* %22 to i8*, !dbg !1537
  %call79 = call i32 @cudaMemcpy(i8* %23, i8* %21, i64 8, i32 1), !dbg !1537
  %24 = load i32** %ranges, align 8, !dbg !1540, !tbaa !1514
  %25 = bitcast i32* %24 to i8*, !dbg !1540
  call void @klee_make_symbolic(i8* %25, i64 8, i8* getelementptr inbounds ([13 x i8]* @.str10, i64 0, i64 0)), !dbg !1540
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 4294967360, i32 1, i64 4294967808, i32 1), !dbg !1541
  %26 = load i32** %input, align 8, !dbg !1538, !tbaa !1514
  %27 = load i32** %ranges, align 8, !dbg !1538, !tbaa !1514
  call void @_Z20histo_prescan_kernelPjiS_(i32* %26, i32 %mul81, i32* %27), !dbg !1538
  %28 = load i32** %ranges, align 8, !dbg !1542, !tbaa !1514
  %29 = bitcast i32* %28 to i8*, !dbg !1542
  %call83 = call i32 @cudaMemcpy(i8* %21, i8* %29, i64 8, i32 2), !dbg !1542
  %30 = load i32** %global_subhisto, align 8, !dbg !1543, !tbaa !1514
  %31 = bitcast i32* %30 to i8*, !dbg !1543
  %call87 = call i32 @cudaMemset(i8* %31, i32 0, i64 %mul58), !dbg !1543
  %32 = load i8** %final_histo, align 8, !dbg !1544, !tbaa !1514
  %call94 = call i32 @cudaMemcpy(i8* %call22, i8* %32, i64 %conv21, i32 2), !dbg !1544
  %33 = load i32** %input, align 8, !dbg !1545, !tbaa !1514
  %34 = bitcast i32* %33 to i8*, !dbg !1545
  %call95 = call i32 @cudaFree(i8* %34), !dbg !1545
  %35 = load i32** %ranges, align 8, !dbg !1546, !tbaa !1514
  %36 = bitcast i32* %35 to i8*, !dbg !1546
  %call96 = call i32 @cudaFree(i8* %36), !dbg !1546
  %37 = load %struct.uchar4** %sm_mappings, align 8, !dbg !1547, !tbaa !1514
  %38 = getelementptr inbounds %struct.uchar4* %37, i64 0, i32 0, !dbg !1547
  %call97 = call i32 @cudaFree(i8* %38), !dbg !1547
  %39 = load i32** %global_subhisto, align 8, !dbg !1548, !tbaa !1514
  %40 = bitcast i32* %39 to i8*, !dbg !1548
  %call98 = call i32 @cudaFree(i8* %40), !dbg !1548
  %41 = load i16** %global_histo, align 8, !dbg !1549, !tbaa !1514
  %42 = bitcast i16* %41 to i8*, !dbg !1549
  %call99 = call i32 @cudaFree(i8* %42), !dbg !1549
  %43 = load i32** %global_overflow, align 8, !dbg !1550, !tbaa !1514
  %44 = bitcast i32* %43 to i8*, !dbg !1550
  %call100 = call i32 @cudaFree(i8* %44), !dbg !1550
  %45 = load i8** %final_histo, align 8, !dbg !1551, !tbaa !1514
  %call101 = call i32 @cudaFree(i8* %45), !dbg !1551
  call void @free(i8* %call19) nounwind, !dbg !1552
  call void @free(i8* %call22) nounwind, !dbg !1553
  %putchar = call i32 @putchar(i32 10), !dbg !1554
  br label %return, !dbg !1555

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.body ]
  %46 = trunc i64 %indvars.iv to i32, !dbg !1535
  %mul69 = mul nsw i32 %46, %div, !dbg !1535
  %idxprom = sext i32 %mul69 to i64, !dbg !1535
  %47 = load i32** %input, align 8, !dbg !1535, !tbaa !1514
  %arrayidx = getelementptr inbounds i32* %47, i64 %idxprom, !dbg !1535
  %48 = bitcast i32* %arrayidx to i8*, !dbg !1535
  %mul70 = mul i32 %6, %46, !dbg !1535
  %idxprom71 = zext i32 %mul70 to i64, !dbg !1535
  %arrayidx72 = getelementptr inbounds i32* %10, i64 %idxprom71, !dbg !1535
  %49 = bitcast i32* %arrayidx72 to i8*, !dbg !1535
  %call75 = call i32 @cudaMemcpy(i8* %48, i8* %49, i64 %mul74, i32 1), !dbg !1535
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !1534
  %50 = trunc i64 %indvars.iv.next to i32, !dbg !1534
  %cmp68 = icmp ult i32 %50, %7, !dbg !1534
  br i1 %cmp68, label %for.body, label %for.cond76.preheader, !dbg !1534

return:                                           ; preds = %for.cond76.preheader, %if.then30, %if.then
  %retval.0 = phi i32 [ -1, %if.then ], [ -1, %if.then30 ], [ 0, %for.cond76.preheader ]
  ret i32 %retval.0, !dbg !1556
}

declare noalias %struct._IO_FILE* @fopen(i8* nocapture, i8* nocapture) nounwind

declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) nounwind

declare noalias i8* @malloc(i64) nounwind

declare noalias i8* @calloc(i64, i64) nounwind

declare i32 @fclose(%struct._IO_FILE* nocapture) nounwind

declare void @klee_make_symbolic(i8*, i64, i8*)

declare void @__set_CUDAConfig(i64, i32, i64, i32, ...)

declare void @free(i8* nocapture) nounwind

declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) nounwind

declare i32 @putchar(i32)

define void @klee_div_zero_check(i64 %z) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %z, 0, !dbg !1557
  br i1 %cmp, label %if.then, label %if.end, !dbg !1557

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([65 x i8]* @.str2, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str13, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str24, i64 0, i64 0)) noreturn nounwind, !dbg
  unreachable, !dbg !1559

if.end:                                           ; preds = %entry
  ret void, !dbg !1560
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !1561
  br i1 %cmp3, label %while.end, label %while.body, !dbg !1561

while.body:                                       ; preds = %while.body, %entry
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %srcaddr, %entry ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %destaddr, %entry ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %len, %entry ]
  %dec = add i64 %len.addr.04, -1, !dbg !1561
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !1562
  %0 = load i8* %src.06, align 1, !dbg !1562, !tbaa !1238
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !1562
  store i8 %0, i8* %dest.05, align 1, !dbg !1562, !tbaa !1238
  %cmp = icmp eq i64 %dec, 0, !dbg !1561
  br i1 %cmp, label %while.end, label %while.body, !dbg !1561

while.end:                                        ; preds = %while.body, %entry
  ret i8* %destaddr, !dbg !1563
}

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
entry:
  %cmp2 = icmp eq i64 %count, 0, !dbg !1564
  br i1 %cmp2, label %while.end, label %while.body.lr.ph, !dbg !1564

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %s to i8, !dbg !1565
  br label %while.body, !dbg !1564

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %a.04 = phi i8* [ %dst, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %count.addr.03 = phi i64 [ %count, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i64 %count.addr.03, -1, !dbg !1564
  %incdec.ptr = getelementptr inbounds i8* %a.04, i64 1, !dbg !1565
  store volatile i8 %conv, i8* %a.04, align 1, !dbg !1565, !tbaa !1238
  %cmp = icmp eq i64 %dec, 0, !dbg !1564
  br i1 %cmp, label %while.end, label %while.body, !dbg !1564

while.end:                                        ; preds = %while.body, %entry
  ret i8* %dst, !dbg !1566
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1567
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
entry:
  tail call void @free(i8* %devPtr) nounwind, !dbg !1569
  ret i32 0, !dbg !1571
}

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
entry:
  %0 = bitcast %struct.cudaArray* %array to i8*, !dbg !1572
  tail call void @free(i8* %0) nounwind, !dbg !1572
  ret i32 0, !dbg !1574
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
entry:
  tail call void @free(i8* %ptr) nounwind, !dbg !1575
  ret i32 0, !dbg !1577
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1578
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1580
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1582
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1584
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1586
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1588
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1590
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
entry:
  tail call void @__set_device(), !dbg !1592
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1594
  store i8* %call, i8** %devPtr, align 8, !dbg !1594, !tbaa !1514
  tail call void @__clear_device(), !dbg !1595
  ret i32 0, !dbg !1596
}

declare void @__set_device()

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1597
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1599
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1601
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
entry:
  tail call void @__set_host(), !dbg !1603
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !1605
  store i8* %call, i8** %ptr, align 8, !dbg !1605, !tbaa !1514
  tail call void @__clear_host(), !dbg !1606
  ret i32 0, !dbg !1607
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1608
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1610
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1612
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1614
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1616
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1618
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1620
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1622
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1624
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1626
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1628
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1630
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1632
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1634
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1636
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1638
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1640
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1642
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1644
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1646
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !1648
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1650
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1652
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
entry:
  %add.ptr = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !1654
  %0 = call i8* @memcpy(i8* %add.ptr, i8* %src, i64 %count)
  ret i32 0, !dbg !1656
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1657
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1659
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
entry:
  %0 = trunc i32 %value to i8, !dbg !1661
  %1 = zext i8 %0 to i32
  %2 = call i8* @memset(i8* %devPtr, i32 %1, i64 %count)
  ret i32 0, !dbg !1663
}

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1664
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1666
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1668
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1670
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1672
}

!llvm.dbg.cu = !{!0, !129, !209, !349, !392, !579, !590, !610, !626, !643}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"histo_final.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32 0, 
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !115}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"histo_final_kernel", metadata !"histo_final_kernel", metadata !"_Z18histo_final_kerneljjjjPjS_S_S_", metadata !6, i32 7, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void
!6 = metadata !{i32 786473, metadata !"histo_final.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!8 = metadata !{null, metadata !9, metadata !9, metadata !9, metadata !9, metadata !10, metadata !10, metadata !10, metadata !10}
!9 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!10 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !9} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!11 = metadata !{metadata !12}
!12 = metadata !{metadata !13, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !19, metadata !20, metadata !21, metadata !23, metadata !24, metadata !25, metadata !26, metadata !28, metadata !55, metadata !78, metadata !80,
!13 = metadata !{i32 786689, metadata !5, metadata !"sm_range_min", metadata !6, i32 16777224, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm_range_min] [line 8]
!14 = metadata !{i32 786689, metadata !5, metadata !"sm_range_max", metadata !6, i32 33554441, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm_range_max] [line 9]
!15 = metadata !{i32 786689, metadata !5, metadata !"histo_height", metadata !6, i32 50331658, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [histo_height] [line 10]
!16 = metadata !{i32 786689, metadata !5, metadata !"histo_width", metadata !6, i32 67108875, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [histo_width] [line 11]
!17 = metadata !{i32 786689, metadata !5, metadata !"global_subhisto", metadata !6, i32 83886092, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [global_subhisto] [line 12]
!18 = metadata !{i32 786689, metadata !5, metadata !"global_histo", metadata !6, i32 100663309, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [global_histo] [line 13]
!19 = metadata !{i32 786689, metadata !5, metadata !"global_overflow", metadata !6, i32 117440526, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [global_overflow] [line 14]
!20 = metadata !{i32 786689, metadata !5, metadata !"final_histo", metadata !6, i32 134217743, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [final_histo] [line 15]
!21 = metadata !{i32 786688, metadata !22, metadata !"start_offset", metadata !6, i32 17, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [start_offset] [line 17]
!22 = metadata !{i32 786443, metadata !5, i32 16, i32 0, metadata !6, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_final.cpp]
!23 = metadata !{i32 786688, metadata !22, metadata !"size_low_histo", metadata !6, i32 21, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_low_histo] [line 21]
!24 = metadata !{i32 786688, metadata !22, metadata !"size_mid_histo", metadata !6, i32 22, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_mid_histo] [line 22]
!25 = metadata !{i32 786688, metadata !22, metadata !"j", metadata !6, i32 25, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 25]
!26 = metadata !{i32 786688, metadata !27, metadata !"i", metadata !6, i32 26, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 26]
!27 = metadata !{i32 786443, metadata !22, i32 26, i32 0, metadata !6, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_final.cpp]
!28 = metadata !{i32 786688, metadata !29, metadata !"global_histo_data", metadata !6, i32 29, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [global_histo_data] [line 29]
!29 = metadata !{i32 786443, metadata !27, i32 27, i32 0, metadata !6, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_final.cpp]
!30 = metadata !{i32 786454, null, metadata !"ushort4", metadata !6, i32 375, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_typedef ] [ushort4] [line 375, size 0, align 0, offset 0] [from ushort4]
!31 = metadata !{i32 786451, null, metadata !"ushort4", metadata !32, i32 168, i64 64, i64 64, i32 0, i32 0, null, metadata !33, i32 0, null, null} ; [ DW_TAG_structure_type ] [ushort4] [line 168, size 64, align 64, offset 0] [from ]
!32 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!33 = metadata !{metadata !34, metadata !36, metadata !37, metadata !38, metadata !39, metadata !45, metadata !50, metadata !51}
!34 = metadata !{i32 786445, metadata !31, metadata !"x", metadata !32, i32 168, i64 16, i64 16, i64 0, i32 0, metadata !35} ; [ DW_TAG_member ] [x] [line 168, size 16, align 16, offset 0] [from unsigned short]
!35 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!36 = metadata !{i32 786445, metadata !31, metadata !"y", metadata !32, i32 168, i64 16, i64 16, i64 16, i32 0, metadata !35} ; [ DW_TAG_member ] [y] [line 168, size 16, align 16, offset 16] [from unsigned short]
!37 = metadata !{i32 786445, metadata !31, metadata !"z", metadata !32, i32 168, i64 16, i64 16, i64 32, i32 0, metadata !35} ; [ DW_TAG_member ] [z] [line 168, size 16, align 16, offset 32] [from unsigned short]
!38 = metadata !{i32 786445, metadata !31, metadata !"w", metadata !32, i32 168, i64 16, i64 16, i64 48, i32 0, metadata !35} ; [ DW_TAG_member ] [w] [line 168, size 16, align 16, offset 48] [from unsigned short]
!39 = metadata !{i32 786478, i32 0, metadata !31, metadata !"ushort4", metadata !"ushort4", metadata !"", metadata !32, i32 168, metadata !40, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 168} ; [ DW_TAG_
!40 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !41, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!41 = metadata !{null, metadata !42}
!42 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !31} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ushort4]
!43 = metadata !{metadata !44}
!44 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!45 = metadata !{i32 786478, i32 0, metadata !31, metadata !"ushort4", metadata !"ushort4", metadata !"", metadata !32, i32 168, metadata !46, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 168} ; [ DW_TAG_
!46 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !47, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!47 = metadata !{null, metadata !42, metadata !48}
!48 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !49} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!49 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ushort4]
!50 = metadata !{i32 786478, i32 0, metadata !31, metadata !"~ushort4", metadata !"~ushort4", metadata !"", metadata !32, i32 168, metadata !40, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 168} ; [ DW_TA
!51 = metadata !{i32 786478, i32 0, metadata !31, metadata !"operator=", metadata !"operator=", metadata !"_ZN7ushort4aSERKS_", metadata !32, i32 168, metadata !52, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43
!52 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !53, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!53 = metadata !{metadata !54, metadata !42, metadata !48}
!54 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !31} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ushort4]
!55 = metadata !{i32 786688, metadata !29, metadata !"final_histo_data", metadata !6, i32 37, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [final_histo_data] [line 37]
!56 = metadata !{i32 786454, null, metadata !"uchar4", metadata !6, i32 367, i64 0, i64 0, i64 0, i32 0, metadata !57} ; [ DW_TAG_typedef ] [uchar4] [line 367, size 0, align 0, offset 0] [from uchar4]
!57 = metadata !{i32 786451, null, metadata !"uchar4", metadata !32, i32 132, i64 32, i64 32, i32 0, i32 0, null, metadata !58, i32 0, null, null} ; [ DW_TAG_structure_type ] [uchar4] [line 132, size 32, align 32, offset 0] [from ]
!58 = metadata !{metadata !59, metadata !61, metadata !62, metadata !63, metadata !64, metadata !68, metadata !73, metadata !74}
!59 = metadata !{i32 786445, metadata !57, metadata !"x", metadata !32, i32 134, i64 8, i64 8, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ] [x] [line 134, size 8, align 8, offset 0] [from unsigned char]
!60 = metadata !{i32 786468, null, metadata !"unsigned char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 8} ; [ DW_TAG_base_type ] [unsigned char] [line 0, size 8, align 8, offset 0, enc DW_ATE_unsigned_char]
!61 = metadata !{i32 786445, metadata !57, metadata !"y", metadata !32, i32 134, i64 8, i64 8, i64 8, i32 0, metadata !60} ; [ DW_TAG_member ] [y] [line 134, size 8, align 8, offset 8] [from unsigned char]
!62 = metadata !{i32 786445, metadata !57, metadata !"z", metadata !32, i32 134, i64 8, i64 8, i64 16, i32 0, metadata !60} ; [ DW_TAG_member ] [z] [line 134, size 8, align 8, offset 16] [from unsigned char]
!63 = metadata !{i32 786445, metadata !57, metadata !"w", metadata !32, i32 134, i64 8, i64 8, i64 24, i32 0, metadata !60} ; [ DW_TAG_member ] [w] [line 134, size 8, align 8, offset 24] [from unsigned char]
!64 = metadata !{i32 786478, i32 0, metadata !57, metadata !"uchar4", metadata !"uchar4", metadata !"", metadata !32, i32 132, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_TAG_su
!65 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!66 = metadata !{null, metadata !67}
!67 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !57} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uchar4]
!68 = metadata !{i32 786478, i32 0, metadata !57, metadata !"uchar4", metadata !"uchar4", metadata !"", metadata !32, i32 132, metadata !69, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_TAG_su
!69 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !70, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!70 = metadata !{null, metadata !67, metadata !71}
!71 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !72} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!72 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !57} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uchar4]
!73 = metadata !{i32 786478, i32 0, metadata !57, metadata !"~uchar4", metadata !"~uchar4", metadata !"", metadata !32, i32 132, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_TAG_
!74 = metadata !{i32 786478, i32 0, metadata !57, metadata !"operator=", metadata !"operator=", metadata !"_ZN6uchar4aSERKS_", metadata !32, i32 132, metadata !75, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43,
!75 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !76, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!76 = metadata !{metadata !77, metadata !67, metadata !71}
!77 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !57} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from uchar4]
!78 = metadata !{i32 786688, metadata !79, metadata !"i", metadata !6, i32 48, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 48]
!79 = metadata !{i32 786443, metadata !22, i32 48, i32 0, metadata !6, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_final.cpp]
!80 = metadata !{i32 786688, metadata !81, metadata !"global_histo_data", metadata !6, i32 50, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [global_histo_data] [line 50]
!81 = metadata !{i32 786443, metadata !79, i32 49, i32 0, metadata !6, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_final.cpp]
!82 = metadata !{i32 786454, null, metadata !"uint4", metadata !6, i32 383, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_typedef ] [uint4] [line 383, size 0, align 0, offset 0] [from uint4]
!83 = metadata !{i32 786451, null, metadata !"uint4", metadata !32, i32 198, i64 128, i64 128, i32 0, i32 0, null, metadata !84, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint4] [line 198, size 128, align 128, offset 0] [from ]
!84 = metadata !{metadata !85, metadata !86, metadata !87, metadata !88, metadata !89, metadata !93, metadata !98, metadata !99}
!85 = metadata !{i32 786445, metadata !83, metadata !"x", metadata !32, i32 200, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [x] [line 200, size 32, align 32, offset 0] [from unsigned int]
!86 = metadata !{i32 786445, metadata !83, metadata !"y", metadata !32, i32 200, i64 32, i64 32, i64 32, i32 0, metadata !9} ; [ DW_TAG_member ] [y] [line 200, size 32, align 32, offset 32] [from unsigned int]
!87 = metadata !{i32 786445, metadata !83, metadata !"z", metadata !32, i32 200, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ] [z] [line 200, size 32, align 32, offset 64] [from unsigned int]
!88 = metadata !{i32 786445, metadata !83, metadata !"w", metadata !32, i32 200, i64 32, i64 32, i64 96, i32 0, metadata !9} ; [ DW_TAG_member ] [w] [line 200, size 32, align 32, offset 96] [from unsigned int]
!89 = metadata !{i32 786478, i32 0, metadata !83, metadata !"uint4", metadata !"uint4", metadata !"", metadata !32, i32 198, metadata !90, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 198} ; [ DW_TAG_subp
!90 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !91, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!91 = metadata !{null, metadata !92}
!92 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !83} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint4]
!93 = metadata !{i32 786478, i32 0, metadata !83, metadata !"uint4", metadata !"uint4", metadata !"", metadata !32, i32 198, metadata !94, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 198} ; [ DW_TAG_subp
!94 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !95, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!95 = metadata !{null, metadata !92, metadata !96}
!96 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !97} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!97 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint4]
!98 = metadata !{i32 786478, i32 0, metadata !83, metadata !"~uint4", metadata !"~uint4", metadata !"", metadata !32, i32 198, metadata !90, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 198} ; [ DW_TAG_su
!99 = metadata !{i32 786478, i32 0, metadata !83, metadata !"operator=", metadata !"operator=", metadata !"_ZN5uint4aSERKS_", metadata !32, i32 198, metadata !100, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43,
!100 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{metadata !102, metadata !92, metadata !96}
!102 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !83} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from uint4]
!103 = metadata !{i32 786688, metadata !81, metadata !"internal_histo_data", metadata !6, i32 53, metadata !82, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [internal_histo_data] [line 53]
!104 = metadata !{i32 786688, metadata !105, metadata !"j", metadata !6, i32 61, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 61]
!105 = metadata !{i32 786443, metadata !81, i32 61, i32 0, metadata !6, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_final.cpp]
!106 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!107 = metadata !{i32 786688, metadata !108, metadata !"bin4in", metadata !6, i32 63, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bin4in] [line 63]
!108 = metadata !{i32 786443, metadata !105, i32 62, i32 0, metadata !6, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_final.cpp]
!109 = metadata !{i32 786688, metadata !81, metadata !"final_histo_data", metadata !6, i32 75, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [final_histo_data] [line 75]
!110 = metadata !{i32 786688, metadata !111, metadata !"i", metadata !6, i32 86, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 86]
!111 = metadata !{i32 786443, metadata !22, i32 86, i32 0, metadata !6, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_final.cpp]
!112 = metadata !{i32 786688, metadata !113, metadata !"global_histo_data", metadata !6, i32 88, metadata !30, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [global_histo_data] [line 88]
!113 = metadata !{i32 786443, metadata !111, i32 87, i32 0, metadata !6, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_final.cpp]
!114 = metadata !{i32 786688, metadata !113, metadata !"final_histo_data", metadata !6, i32 96, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [final_histo_data] [line 96]
!115 = metadata !{i32 786478, i32 0, metadata !116, metadata !"min", metadata !"min", metadata !"_ZL3minji", metadata !116, i32 8135, metadata !117, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !119, i32 8136} ; [ DW
!116 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/math_functions.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!117 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !118, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!118 = metadata !{metadata !9, metadata !9, metadata !106}
!119 = metadata !{metadata !120}
!120 = metadata !{metadata !121, metadata !122}
!121 = metadata !{i32 786689, metadata !115, metadata !"a", metadata !116, i32 16785351, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 8135]
!122 = metadata !{i32 786689, metadata !115, metadata !"b", metadata !116, i32 33562567, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 8135]
!123 = metadata !{metadata !124}
!124 = metadata !{metadata !125, metadata !127}
!125 = metadata !{i32 786484, i32 0, metadata !5, metadata !"zero_short", metadata !"zero_short", metadata !"", metadata !6, i32 18, metadata !126, i32 1, i32 1, null} ; [ DW_TAG_variable ] [zero_short] [line 18] [local] [def]
!126 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !30} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ushort4]
!127 = metadata !{i32 786484, i32 0, metadata !5, metadata !"zero_int", metadata !"zero_int", metadata !"", metadata !6, i32 19, metadata !128, i32 1, i32 1, null} ; [ DW_TAG_variable ] [zero_int] [line 19] [local] [def]
!128 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !82} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint4]
!129 = metadata !{i32 786449, i32 0, i32 4, metadata !"histo_intermediates.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"
!130 = metadata !{metadata !131}
!131 = metadata !{metadata !132, metadata !169}
!132 = metadata !{i32 786478, i32 0, metadata !133, metadata !"calculateBin", metadata !"calculateBin", metadata !"_Z12calculateBinjP6uchar4", metadata !133, i32 8, metadata !134, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32, %struc
!133 = metadata !{i32 786473, metadata !"histo_intermediates.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!134 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !135, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!135 = metadata !{null, metadata !136, metadata !137}
!136 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned int]
!137 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !138} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uchar4]
!138 = metadata !{i32 786454, null, metadata !"uchar4", metadata !133, i32 367, i64 0, i64 0, i64 0, i32 0, metadata !139} ; [ DW_TAG_typedef ] [uchar4] [line 367, size 0, align 0, offset 0] [from uchar4]
!139 = metadata !{i32 786451, null, metadata !"uchar4", metadata !32, i32 132, i64 32, i64 32, i32 0, i32 0, null, metadata !140, i32 0, null, null} ; [ DW_TAG_structure_type ] [uchar4] [line 132, size 32, align 32, offset 0] [from ]
!140 = metadata !{metadata !141, metadata !142, metadata !143, metadata !144, metadata !145, metadata !149, metadata !154, metadata !155}
!141 = metadata !{i32 786445, metadata !139, metadata !"x", metadata !32, i32 134, i64 8, i64 8, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ] [x] [line 134, size 8, align 8, offset 0] [from unsigned char]
!142 = metadata !{i32 786445, metadata !139, metadata !"y", metadata !32, i32 134, i64 8, i64 8, i64 8, i32 0, metadata !60} ; [ DW_TAG_member ] [y] [line 134, size 8, align 8, offset 8] [from unsigned char]
!143 = metadata !{i32 786445, metadata !139, metadata !"z", metadata !32, i32 134, i64 8, i64 8, i64 16, i32 0, metadata !60} ; [ DW_TAG_member ] [z] [line 134, size 8, align 8, offset 16] [from unsigned char]
!144 = metadata !{i32 786445, metadata !139, metadata !"w", metadata !32, i32 134, i64 8, i64 8, i64 24, i32 0, metadata !60} ; [ DW_TAG_member ] [w] [line 134, size 8, align 8, offset 24] [from unsigned char]
!145 = metadata !{i32 786478, i32 0, metadata !139, metadata !"uchar4", metadata !"uchar4", metadata !"", metadata !32, i32 132, metadata !146, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_TAG
!146 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !147, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!147 = metadata !{null, metadata !148}
!148 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !139} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uchar4]
!149 = metadata !{i32 786478, i32 0, metadata !139, metadata !"uchar4", metadata !"uchar4", metadata !"", metadata !32, i32 132, metadata !150, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_TAG
!150 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !151, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!151 = metadata !{null, metadata !148, metadata !152}
!152 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !153} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!153 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !139} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uchar4]
!154 = metadata !{i32 786478, i32 0, metadata !139, metadata !"~uchar4", metadata !"~uchar4", metadata !"", metadata !32, i32 132, metadata !146, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_T
!155 = metadata !{i32 786478, i32 0, metadata !139, metadata !"operator=", metadata !"operator=", metadata !"_ZN6uchar4aSERKS_", metadata !32, i32 132, metadata !156, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !
!156 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !157, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!157 = metadata !{metadata !158, metadata !148, metadata !152}
!158 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !139} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from uchar4]
!159 = metadata !{metadata !160}
!160 = metadata !{metadata !161, metadata !162, metadata !163, metadata !165, metadata !166, metadata !167, metadata !168}
!161 = metadata !{i32 786689, metadata !132, metadata !"bin", metadata !133, i32 16777225, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [bin] [line 9]
!162 = metadata !{i32 786689, metadata !132, metadata !"sm_mapping", metadata !133, i32 33554442, metadata !137, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm_mapping] [line 10]
!163 = metadata !{i32 786688, metadata !164, metadata !"offset", metadata !133, i32 12, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [offset] [line 12]
!164 = metadata !{i32 786443, metadata !132, i32 11, i32 0, metadata !133, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_intermediates.cpp]
!165 = metadata !{i32 786688, metadata !164, metadata !"indexlo", metadata !133, i32 13, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [indexlo] [line 13]
!166 = metadata !{i32 786688, metadata !164, metadata !"indexhi", metadata !133, i32 14, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [indexhi] [line 14]
!167 = metadata !{i32 786688, metadata !164, metadata !"block", metadata !133, i32 15, metadata !60, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [block] [line 15]
!168 = metadata !{i32 786688, metadata !164, metadata !"sm", metadata !133, i32 19, metadata !138, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sm] [line 19]
!169 = metadata !{i32 786478, i32 0, metadata !133, metadata !"histo_intermediates_kernel", metadata !"histo_intermediates_kernel", metadata !"_Z26histo_intermediates_kernelP5uint2jjjP6uchar4", metadata !133, i32 28, metadata !170, i1 false, i1 true, i32
!170 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !171, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!171 = metadata !{null, metadata !172, metadata !9, metadata !9, metadata !9, metadata !137}
!172 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !173} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint2]
!173 = metadata !{i32 786454, null, metadata !"uint2", metadata !133, i32 379, i64 0, i64 0, i64 0, i32 0, metadata !174} ; [ DW_TAG_typedef ] [uint2] [line 379, size 0, align 0, offset 0] [from uint2]
!174 = metadata !{i32 786451, null, metadata !"uint2", metadata !32, i32 181, i64 64, i64 64, i32 0, i32 0, null, metadata !175, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint2] [line 181, size 64, align 64, offset 0] [from ]
!175 = metadata !{metadata !176, metadata !177, metadata !178, metadata !182, metadata !187, metadata !188}
!176 = metadata !{i32 786445, metadata !174, metadata !"x", metadata !32, i32 181, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [x] [line 181, size 32, align 32, offset 0] [from unsigned int]
!177 = metadata !{i32 786445, metadata !174, metadata !"y", metadata !32, i32 181, i64 32, i64 32, i64 32, i32 0, metadata !9} ; [ DW_TAG_member ] [y] [line 181, size 32, align 32, offset 32] [from unsigned int]
!178 = metadata !{i32 786478, i32 0, metadata !174, metadata !"uint2", metadata !"uint2", metadata !"", metadata !32, i32 181, metadata !179, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 181} ; [ DW_TAG_s
!179 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !180, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!180 = metadata !{null, metadata !181}
!181 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !174} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint2]
!182 = metadata !{i32 786478, i32 0, metadata !174, metadata !"uint2", metadata !"uint2", metadata !"", metadata !32, i32 181, metadata !183, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 181} ; [ DW_TAG_s
!183 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !184, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!184 = metadata !{null, metadata !181, metadata !185}
!185 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !186} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!186 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !174} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint2]
!187 = metadata !{i32 786478, i32 0, metadata !174, metadata !"~uint2", metadata !"~uint2", metadata !"", metadata !32, i32 181, metadata !179, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 181} ; [ DW_TAG
!188 = metadata !{i32 786478, i32 0, metadata !174, metadata !"operator=", metadata !"operator=", metadata !"_ZN5uint2aSERKS_", metadata !32, i32 181, metadata !189, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !4
!189 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !190, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!190 = metadata !{metadata !191, metadata !181, metadata !185}
!191 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !174} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from uint2]
!192 = metadata !{metadata !193}
!193 = metadata !{metadata !194, metadata !195, metadata !196, metadata !197, metadata !198, metadata !199, metadata !201, metadata !202, metadata !203, metadata !205, metadata !207}
!194 = metadata !{i32 786689, metadata !169, metadata !"input", metadata !133, i32 16777245, metadata !172, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [input] [line 29]
!195 = metadata !{i32 786689, metadata !169, metadata !"height", metadata !133, i32 33554462, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 30]
!196 = metadata !{i32 786689, metadata !169, metadata !"width", metadata !133, i32 50331679, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 31]
!197 = metadata !{i32 786689, metadata !169, metadata !"input_pitch", metadata !133, i32 67108896, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [input_pitch] [line 32]
!198 = metadata !{i32 786689, metadata !169, metadata !"sm_mappings", metadata !133, i32 83886113, metadata !137, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm_mappings] [line 33]
!199 = metadata !{i32 786688, metadata !200, metadata !"line", metadata !133, i32 35, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [line] [line 35]
!200 = metadata !{i32 786443, metadata !169, i32 34, i32 0, metadata !133, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_intermediates.cpp]
!201 = metadata !{i32 786688, metadata !200, metadata !"load_bin", metadata !133, i32 37, metadata !172, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [load_bin] [line 37]
!202 = metadata !{i32 786688, metadata !200, metadata !"store", metadata !133, i32 39, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [store] [line 39]
!203 = metadata !{i32 786688, metadata !200, metadata !"skip", metadata !133, i32 40, metadata !204, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [skip] [line 40]
!204 = metadata !{i32 786468, null, metadata !"bool", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 2} ; [ DW_TAG_base_type ] [bool] [line 0, size 8, align 8, offset 0, enc DW_ATE_boolean]
!205 = metadata !{i32 786688, metadata !206, metadata !"i", metadata !133, i32 43, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 43]
!206 = metadata !{i32 786443, metadata !200, i32 43, i32 0, metadata !133, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_intermediates.cpp]
!207 = metadata !{i32 786688, metadata !208, metadata !"bin_value", metadata !133, i32 45, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bin_value] [line 45]
!208 = metadata !{i32 786443, metadata !206, i32 44, i32 0, metadata !133, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_intermediates.cpp]
!209 = metadata !{i32 786449, i32 0, i32 4, metadata !"histo_main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32 0,
!210 = metadata !{metadata !211}
!211 = metadata !{metadata !212, metadata !255, metadata !291, metadata !300, metadata !310, metadata !335}
!212 = metadata !{i32 786478, i32 0, metadata !213, metadata !"testIncrementGlobal", metadata !"testIncrementGlobal", metadata !"_Z19testIncrementGlobalPjjj6uchar4", metadata !213, i32 8, metadata !214, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 
!213 = metadata !{i32 786473, metadata !"histo_main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!214 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !215, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!215 = metadata !{null, metadata !10, metadata !9, metadata !9, metadata !216}
!216 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !217} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uchar4]
!217 = metadata !{i32 786454, null, metadata !"uchar4", metadata !213, i32 367, i64 0, i64 0, i64 0, i32 0, metadata !218} ; [ DW_TAG_typedef ] [uchar4] [line 367, size 0, align 0, offset 0] [from uchar4]
!218 = metadata !{i32 786451, null, metadata !"uchar4", metadata !32, i32 132, i64 32, i64 32, i32 0, i32 0, null, metadata !219, i32 0, null, null} ; [ DW_TAG_structure_type ] [uchar4] [line 132, size 32, align 32, offset 0] [from ]
!219 = metadata !{metadata !220, metadata !221, metadata !222, metadata !223, metadata !224, metadata !228, metadata !233, metadata !234}
!220 = metadata !{i32 786445, metadata !218, metadata !"x", metadata !32, i32 134, i64 8, i64 8, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ] [x] [line 134, size 8, align 8, offset 0] [from unsigned char]
!221 = metadata !{i32 786445, metadata !218, metadata !"y", metadata !32, i32 134, i64 8, i64 8, i64 8, i32 0, metadata !60} ; [ DW_TAG_member ] [y] [line 134, size 8, align 8, offset 8] [from unsigned char]
!222 = metadata !{i32 786445, metadata !218, metadata !"z", metadata !32, i32 134, i64 8, i64 8, i64 16, i32 0, metadata !60} ; [ DW_TAG_member ] [z] [line 134, size 8, align 8, offset 16] [from unsigned char]
!223 = metadata !{i32 786445, metadata !218, metadata !"w", metadata !32, i32 134, i64 8, i64 8, i64 24, i32 0, metadata !60} ; [ DW_TAG_member ] [w] [line 134, size 8, align 8, offset 24] [from unsigned char]
!224 = metadata !{i32 786478, i32 0, metadata !218, metadata !"uchar4", metadata !"uchar4", metadata !"", metadata !32, i32 132, metadata !225, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_TAG
!225 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !226, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!226 = metadata !{null, metadata !227}
!227 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !218} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uchar4]
!228 = metadata !{i32 786478, i32 0, metadata !218, metadata !"uchar4", metadata !"uchar4", metadata !"", metadata !32, i32 132, metadata !229, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_TAG
!229 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !230, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!230 = metadata !{null, metadata !227, metadata !231}
!231 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !232} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!232 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !218} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uchar4]
!233 = metadata !{i32 786478, i32 0, metadata !218, metadata !"~uchar4", metadata !"~uchar4", metadata !"", metadata !32, i32 132, metadata !225, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_T
!234 = metadata !{i32 786478, i32 0, metadata !218, metadata !"operator=", metadata !"operator=", metadata !"_ZN6uchar4aSERKS_", metadata !32, i32 132, metadata !235, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !
!235 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !236, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!236 = metadata !{metadata !237, metadata !227, metadata !231}
!237 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !218} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from uchar4]
!238 = metadata !{metadata !239}
!239 = metadata !{metadata !240, metadata !241, metadata !242, metadata !243, metadata !244, metadata !246, metadata !247, metadata !248, metadata !249, metadata !251, metadata !252, metadata !253, metadata !254}
!240 = metadata !{i32 786689, metadata !212, metadata !"global_histo", metadata !213, i32 16777225, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [global_histo] [line 9]
!241 = metadata !{i32 786689, metadata !212, metadata !"sm_range_min", metadata !213, i32 33554442, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm_range_min] [line 10]
!242 = metadata !{i32 786689, metadata !212, metadata !"sm_range_max", metadata !213, i32 50331659, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm_range_max] [line 11]
!243 = metadata !{i32 786689, metadata !212, metadata !"sm", metadata !213, i32 67108876, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm] [line 12]
!244 = metadata !{i32 786688, metadata !245, metadata !"range", metadata !213, i32 14, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 14]
!245 = metadata !{i32 786443, metadata !212, i32 13, i32 0, metadata !213, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!246 = metadata !{i32 786688, metadata !245, metadata !"indexhi", metadata !213, i32 15, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [indexhi] [line 15]
!247 = metadata !{i32 786688, metadata !245, metadata !"indexlo", metadata !213, i32 16, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [indexlo] [line 16]
!248 = metadata !{i32 786688, metadata !245, metadata !"offset", metadata !213, i32 17, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [offset] [line 17]
!249 = metadata !{i32 786688, metadata !250, metadata !"bin", metadata !213, i32 22, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bin] [line 22]
!250 = metadata !{i32 786443, metadata !245, i32 21, i32 0, metadata !213, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!251 = metadata !{i32 786688, metadata !250, metadata !"bin_div2", metadata !213, i32 23, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bin_div2] [line 23]
!252 = metadata !{i32 786688, metadata !250, metadata !"bin_offset", metadata !213, i32 24, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bin_offset] [line 24]
!253 = metadata !{i32 786688, metadata !250, metadata !"old_val", metadata !213, i32 27, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_val] [line 27]
!254 = metadata !{i32 786688, metadata !250, metadata !"old_bin", metadata !213, i32 28, metadata !35, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_bin] [line 28]
!255 = metadata !{i32 786478, i32 0, metadata !213, metadata !"testIncrementLocal", metadata !"testIncrementLocal", metadata !"_Z18testIncrementLocalPjPA256_jj6uchar4", metadata !213, i32 37, metadata !256, i1 false, i1 true, i32 0, i32 0, null, i32 256,
!256 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !257, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!257 = metadata !{null, metadata !10, metadata !258, metadata !136, metadata !216}
!258 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !259} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!259 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !9, metadata !260, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8192, align 32, offset 0] [from unsigned int]
!260 = metadata !{metadata !261}
!261 = metadata !{i32 786465, i64 0, i64 255}     ; [ DW_TAG_subrange_type ] [0, 255]
!262 = metadata !{metadata !263}
!263 = metadata !{metadata !264, metadata !265, metadata !266, metadata !267, metadata !268, metadata !270, metadata !271, metadata !272, metadata !273, metadata !275, metadata !276, metadata !277, metadata !279, metadata !280, metadata !281, metadata !2
!264 = metadata !{i32 786689, metadata !255, metadata !"global_overflow", metadata !213, i32 16777254, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [global_overflow] [line 38]
!265 = metadata !{i32 786689, metadata !255, metadata !"smem", metadata !213, i32 33554471, metadata !258, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [smem] [line 39]
!266 = metadata !{i32 786689, metadata !255, metadata !"myRange", metadata !213, i32 50331688, metadata !136, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [myRange] [line 40]
!267 = metadata !{i32 786689, metadata !255, metadata !"sm", metadata !213, i32 67108905, metadata !216, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm] [line 41]
!268 = metadata !{i32 786688, metadata !269, metadata !"range", metadata !213, i32 43, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [range] [line 43]
!269 = metadata !{i32 786443, metadata !255, i32 42, i32 0, metadata !213, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!270 = metadata !{i32 786688, metadata !269, metadata !"indexhi", metadata !213, i32 44, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [indexhi] [line 44]
!271 = metadata !{i32 786688, metadata !269, metadata !"indexlo", metadata !213, i32 45, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [indexlo] [line 45]
!272 = metadata !{i32 786688, metadata !269, metadata !"offset", metadata !213, i32 46, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [offset] [line 46]
!273 = metadata !{i32 786688, metadata !274, metadata !"add", metadata !213, i32 52, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [add] [line 52]
!274 = metadata !{i32 786443, metadata !269, i32 50, i32 0, metadata !213, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!275 = metadata !{i32 786688, metadata !274, metadata !"prev", metadata !213, i32 53, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev] [line 53]
!276 = metadata !{i32 786688, metadata !274, metadata !"prev_bin_val", metadata !213, i32 56, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev_bin_val] [line 56]
!277 = metadata !{i32 786688, metadata !278, metadata !"bin", metadata !213, i32 61, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bin] [line 61]
!278 = metadata !{i32 786443, metadata !274, i32 60, i32 0, metadata !213, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!279 = metadata !{i32 786688, metadata !278, metadata !"can_overflow_to_bin_plus_1", metadata !213, i32 65, metadata !204, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [can_overflow_to_bin_plus_1] [line 65]
!280 = metadata !{i32 786688, metadata !278, metadata !"can_overflow_to_bin_plus_2", metadata !213, i32 66, metadata !204, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [can_overflow_to_bin_plus_2] [line 66]
!281 = metadata !{i32 786688, metadata !278, metadata !"can_overflow_to_bin_plus_3", metadata !213, i32 67, metadata !204, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [can_overflow_to_bin_plus_3] [line 67]
!282 = metadata !{i32 786688, metadata !278, metadata !"overflow_into_bin_plus_1", metadata !213, i32 69, metadata !204, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [overflow_into_bin_plus_1] [line 69]
!283 = metadata !{i32 786688, metadata !278, metadata !"overflow_into_bin_plus_2", metadata !213, i32 70, metadata !204, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [overflow_into_bin_plus_2] [line 70]
!284 = metadata !{i32 786688, metadata !278, metadata !"overflow_into_bin_plus_3", metadata !213, i32 71, metadata !204, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [overflow_into_bin_plus_3] [line 71]
!285 = metadata !{i32 786688, metadata !278, metadata !"prev_bin_plus_1_val", metadata !213, i32 73, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev_bin_plus_1_val] [line 73]
!286 = metadata !{i32 786688, metadata !278, metadata !"prev_bin_plus_2_val", metadata !213, i32 74, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev_bin_plus_2_val] [line 74]
!287 = metadata !{i32 786688, metadata !278, metadata !"prev_bin_plus_3_val", metadata !213, i32 75, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prev_bin_plus_3_val] [line 75]
!288 = metadata !{i32 786688, metadata !278, metadata !"bin_plus_1_add", metadata !213, i32 81, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bin_plus_1_add] [line 81]
!289 = metadata !{i32 786688, metadata !278, metadata !"bin_plus_2_add", metadata !213, i32 82, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bin_plus_2_add] [line 82]
!290 = metadata !{i32 786688, metadata !278, metadata !"bin_plus_3_add", metadata !213, i32 83, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bin_plus_3_add] [line 83]
!291 = metadata !{i32 786478, i32 0, metadata !213, metadata !"clearMemory", metadata !"clearMemory", metadata !"_Z11clearMemoryPA256_j", metadata !213, i32 97, metadata !292, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void ([256 x i32]*)* 
!292 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !293, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!293 = metadata !{null, metadata !258}
!294 = metadata !{metadata !295}
!295 = metadata !{metadata !296, metadata !297}
!296 = metadata !{i32 786689, metadata !291, metadata !"smem", metadata !213, i32 16777313, metadata !258, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [smem] [line 97]
!297 = metadata !{i32 786688, metadata !298, metadata !"i", metadata !213, i32 99, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 99]
!298 = metadata !{i32 786443, metadata !299, i32 99, i32 0, metadata !213, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!299 = metadata !{i32 786443, metadata !291, i32 98, i32 0, metadata !213, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!300 = metadata !{i32 786478, i32 0, metadata !213, metadata !"copyMemory", metadata !"copyMemory", metadata !"_Z10copyMemoryPjPA256_j", metadata !213, i32 105, metadata !301, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i32*, [256 x i3
!301 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !302, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!302 = metadata !{null, metadata !10, metadata !258}
!303 = metadata !{metadata !304}
!304 = metadata !{metadata !305, metadata !306, metadata !307}
!305 = metadata !{i32 786689, metadata !300, metadata !"dst", metadata !213, i32 16777321, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 105]
!306 = metadata !{i32 786689, metadata !300, metadata !"src", metadata !213, i32 33554537, metadata !258, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 105]
!307 = metadata !{i32 786688, metadata !308, metadata !"i", metadata !213, i32 107, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 107]
!308 = metadata !{i32 786443, metadata !309, i32 107, i32 0, metadata !213, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!309 = metadata !{i32 786443, metadata !300, i32 106, i32 0, metadata !213, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!310 = metadata !{i32 786478, i32 0, metadata !213, metadata !"histo_main_kernel", metadata !"histo_main_kernel", metadata !"_Z17histo_main_kernelP6uchar4jjjjjPjS1_S1_", metadata !213, i32 113, metadata !311, i1 false, i1 true, i32 0, i32 0, null, i32 25
!311 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !312, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!312 = metadata !{null, metadata !313, metadata !9, metadata !9, metadata !9, metadata !9, metadata !9, metadata !10, metadata !10, metadata !10}
!313 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !217} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uchar4]
!314 = metadata !{metadata !315}
!315 = metadata !{metadata !316, metadata !317, metadata !318, metadata !319, metadata !320, metadata !321, metadata !322, metadata !323, metadata !324, metadata !325, metadata !327, metadata !328, metadata !331, metadata !334}
!316 = metadata !{i32 786689, metadata !310, metadata !"sm_mappings", metadata !213, i32 16777330, metadata !313, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm_mappings] [line 114]
!317 = metadata !{i32 786689, metadata !310, metadata !"num_elements", metadata !213, i32 33554547, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [num_elements] [line 115]
!318 = metadata !{i32 786689, metadata !310, metadata !"sm_range_min", metadata !213, i32 50331764, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm_range_min] [line 116]
!319 = metadata !{i32 786689, metadata !310, metadata !"sm_range_max", metadata !213, i32 67108981, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sm_range_max] [line 117]
!320 = metadata !{i32 786689, metadata !310, metadata !"histo_height", metadata !213, i32 83886198, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [histo_height] [line 118]
!321 = metadata !{i32 786689, metadata !310, metadata !"histo_width", metadata !213, i32 100663415, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [histo_width] [line 119]
!322 = metadata !{i32 786689, metadata !310, metadata !"global_subhisto", metadata !213, i32 117440632, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [global_subhisto] [line 120]
!323 = metadata !{i32 786689, metadata !310, metadata !"global_histo", metadata !213, i32 134217849, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [global_histo] [line 121]
!324 = metadata !{i32 786689, metadata !310, metadata !"global_overflow", metadata !213, i32 150995066, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [global_overflow] [line 122]
!325 = metadata !{i32 786688, metadata !326, metadata !"local_scan_range", metadata !213, i32 128, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [local_scan_range] [line 128]
!326 = metadata !{i32 786443, metadata !310, i32 123, i32 0, metadata !213, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!327 = metadata !{i32 786688, metadata !326, metadata !"local_scan_load", metadata !213, i32 129, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [local_scan_load] [line 129]
!328 = metadata !{i32 786688, metadata !329, metadata !"sm", metadata !213, i32 140, metadata !217, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sm] [line 140]
!329 = metadata !{i32 786443, metadata !330, i32 138, i32 0, metadata !213, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!330 = metadata !{i32 786443, metadata !326, i32 135, i32 0, metadata !213, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!331 = metadata !{i32 786688, metadata !332, metadata !"sm", metadata !213, i32 164, metadata !217, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sm] [line 164]
!332 = metadata !{i32 786443, metadata !333, i32 162, i32 0, metadata !213, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!333 = metadata !{i32 786443, metadata !326, i32 159, i32 0, metadata !213, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!334 = metadata !{i32 786688, metadata !326, metadata !"store_index", metadata !213, i32 178, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [store_index] [line 178]
!335 = metadata !{i32 786478, i32 0, metadata !336, metadata !"atomicAdd", metadata !"atomicAdd", metadata !"_ZL9atomicAddPjj", metadata !336, i32 101, metadata !337, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !339
!336 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_functions.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!337 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !338, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!338 = metadata !{metadata !9, metadata !10, metadata !9}
!339 = metadata !{metadata !340}
!340 = metadata !{metadata !341, metadata !342}
!341 = metadata !{i32 786689, metadata !335, metadata !"address", metadata !336, i32 16777317, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [address] [line 101]
!342 = metadata !{i32 786689, metadata !335, metadata !"val", metadata !336, i32 33554533, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 101]
!343 = metadata !{metadata !344}
!344 = metadata !{metadata !345}
!345 = metadata !{i32 786484, i32 0, metadata !310, metadata !"sub_histo", metadata !"sub_histo", metadata !"", metadata !213, i32 125, metadata !346, i32 1, i32 1, [24 x [256 x i32]]* @_ZZ17histo_main_kernelP6uchar4jjjjjPjS1_S1_E9sub_histo} ; [ DW_TAG_v
!346 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 196608, i64 32, i32 0, i32 0, metadata !9, metadata !347, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 196608, align 32, offset 0] [from unsigned int]
!347 = metadata !{metadata !348, metadata !261}
!348 = metadata !{i32 786465, i64 0, i64 23}      ; [ DW_TAG_subrange_type ] [0, 23]
!349 = metadata !{i32 786449, i32 0, i32 4, metadata !"histo_prescan.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32
!350 = metadata !{metadata !351}
!351 = metadata !{metadata !352, metadata !375, metadata !380}
!352 = metadata !{i32 786478, i32 0, metadata !353, metadata !"histo_prescan_kernel", metadata !"histo_prescan_kernel", metadata !"_Z20histo_prescan_kernelPjiS_", metadata !353, i32 9, metadata !354, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 tru
!353 = metadata !{i32 786473, metadata !"histo_prescan.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!354 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !355, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!355 = metadata !{null, metadata !10, metadata !106, metadata !10}
!356 = metadata !{metadata !357}
!357 = metadata !{metadata !358, metadata !359, metadata !360, metadata !361, metadata !363, metadata !364, metadata !365, metadata !367, metadata !368, metadata !369, metadata !370, metadata !372, metadata !374}
!358 = metadata !{i32 786689, metadata !352, metadata !"input", metadata !353, i32 16777225, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [input] [line 9]
!359 = metadata !{i32 786689, metadata !352, metadata !"size", metadata !353, i32 33554441, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 9]
!360 = metadata !{i32 786689, metadata !352, metadata !"minmax", metadata !353, i32 50331657, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [minmax] [line 9]
!361 = metadata !{i32 786688, metadata !362, metadata !"stride", metadata !353, i32 14, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stride] [line 14]
!362 = metadata !{i32 786443, metadata !352, i32 10, i32 0, metadata !353, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!363 = metadata !{i32 786688, metadata !362, metadata !"addr", metadata !353, i32 15, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [addr] [line 15]
!364 = metadata !{i32 786688, metadata !362, metadata !"end", metadata !353, i32 16, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 16]
!365 = metadata !{i32 786688, metadata !362, metadata !"avg", metadata !353, i32 19, metadata !366, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [avg] [line 19]
!366 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!367 = metadata !{i32 786688, metadata !362, metadata !"count", metadata !353, i32 20, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 20]
!368 = metadata !{i32 786688, metadata !362, metadata !"addr2", metadata !353, i32 30, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [addr2] [line 30]
!369 = metadata !{i32 786688, metadata !362, metadata !"stddev", metadata !353, i32 31, metadata !366, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stddev] [line 31]
!370 = metadata !{i32 786688, metadata !371, metadata !"stride", metadata !353, i32 49, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stride] [line 49]
!371 = metadata !{i32 786443, metadata !362, i32 49, i32 0, metadata !353, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!372 = metadata !{i32 786688, metadata !373, metadata !"avg", metadata !353, i32 73, metadata !366, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [avg] [line 73]
!373 = metadata !{i32 786443, metadata !362, i32 72, i32 0, metadata !353, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!374 = metadata !{i32 786688, metadata !373, metadata !"stddev", metadata !353, i32 75, metadata !366, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [stddev] [line 75]
!375 = metadata !{i32 786478, i32 0, metadata !336, metadata !"atomicMax", metadata !"atomicMax", metadata !"_ZL9atomicMaxPjj", metadata !336, i32 146, metadata !337, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !376
!376 = metadata !{metadata !377}
!377 = metadata !{metadata !378, metadata !379}
!378 = metadata !{i32 786689, metadata !375, metadata !"address", metadata !336, i32 16777362, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [address] [line 146]
!379 = metadata !{i32 786689, metadata !375, metadata !"val", metadata !336, i32 33554578, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 146]
!380 = metadata !{i32 786478, i32 0, metadata !336, metadata !"atomicMin", metadata !"atomicMin", metadata !"_ZL9atomicMinPjj", metadata !336, i32 136, metadata !337, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !381
!381 = metadata !{metadata !382}
!382 = metadata !{metadata !383, metadata !384}
!383 = metadata !{i32 786689, metadata !380, metadata !"address", metadata !336, i32 16777352, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [address] [line 136]
!384 = metadata !{i32 786689, metadata !380, metadata !"val", metadata !336, i32 33554568, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 136]
!385 = metadata !{metadata !386}
!386 = metadata !{metadata !387, metadata !391}
!387 = metadata !{i32 786484, i32 0, metadata !352, metadata !"Avg", metadata !"Avg", metadata !"", metadata !353, i32 11, metadata !388, i32 1, i32 1, [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E3Avg} ; [ DW_TAG_variable ] [Avg] [line 11] [local] [de
!388 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 16384, i64 32, i32 0, i32 0, metadata !366, metadata !389, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 16384, align 32, offset 0] [from float]
!389 = metadata !{metadata !390}
!390 = metadata !{i32 786465, i64 0, i64 511}     ; [ DW_TAG_subrange_type ] [0, 511]
!391 = metadata !{i32 786484, i32 0, metadata !352, metadata !"StdDev", metadata !"StdDev", metadata !"", metadata !353, i32 12, metadata !388, i32 1, i32 1, [512 x float]* @_ZZ20histo_prescan_kernelPjiS_E6StdDev} ; [ DW_TAG_variable ] [StdDev] [line 12]
!392 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32 0, metad
!393 = metadata !{metadata !394}
!394 = metadata !{metadata !395}
!395 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !396, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !397, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!396 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!397 = metadata !{metadata !398, metadata !399, metadata !400, metadata !401, metadata !402}
!398 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!399 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!400 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!401 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!402 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!403 = metadata !{metadata !404}
!404 = metadata !{metadata !405, metadata !526, metadata !572}
!405 = metadata !{i32 786478, i32 0, metadata !406, metadata !"main", metadata !"main", metadata !"", metadata !406, i32 47, metadata !407, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !412, i32 47
!406 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!407 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !408, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!408 = metadata !{metadata !106, metadata !106, metadata !409}
!409 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !410} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!410 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !411} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!411 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!412 = metadata !{metadata !413}
!413 = metadata !{metadata !414, metadata !415, metadata !416, metadata !418, metadata !419, metadata !420, metadata !421, metadata !422, metadata !423, metadata !424, metadata !425, metadata !426, metadata !427, metadata !482, metadata !483, metadata !4
!414 = metadata !{i32 786689, metadata !405, metadata !"argc", metadata !406, i32 16777263, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 47]
!415 = metadata !{i32 786689, metadata !405, metadata !"argv", metadata !406, i32 33554479, metadata !409, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 47]
!416 = metadata !{i32 786688, metadata !417, metadata !"prescans", metadata !406, i32 57, metadata !410, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [prescans] [line 57]
!417 = metadata !{i32 786443, metadata !405, i32 47, i32 0, metadata !406, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/main.cpp]
!418 = metadata !{i32 786688, metadata !417, metadata !"postpremems", metadata !406, i32 58, metadata !410, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [postpremems] [line 58]
!419 = metadata !{i32 786688, metadata !417, metadata !"intermediates", metadata !406, i32 59, metadata !410, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [intermediates] [line 59]
!420 = metadata !{i32 786688, metadata !417, metadata !"mains", metadata !406, i32 60, metadata !410, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [mains] [line 60]
!421 = metadata !{i32 786688, metadata !417, metadata !"finals", metadata !406, i32 61, metadata !410, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [finals] [line 61]
!422 = metadata !{i32 786688, metadata !417, metadata !"numIterations", metadata !406, i32 73, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [numIterations] [line 73]
!423 = metadata !{i32 786688, metadata !417, metadata !"img_width", metadata !406, i32 76, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [img_width] [line 76]
!424 = metadata !{i32 786688, metadata !417, metadata !"img_height", metadata !406, i32 76, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [img_height] [line 76]
!425 = metadata !{i32 786688, metadata !417, metadata !"histo_width", metadata !406, i32 77, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [histo_width] [line 77]
!426 = metadata !{i32 786688, metadata !417, metadata !"histo_height", metadata !406, i32 77, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [histo_height] [line 77]
!427 = metadata !{i32 786688, metadata !417, metadata !"f", metadata !406, i32 81, metadata !428, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [f] [line 81]
!428 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !429} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!429 = metadata !{i32 786454, null, metadata !"FILE", metadata !406, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !430} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!430 = metadata !{i32 786451, null, metadata !"_IO_FILE", metadata !431, i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !432, i32 0, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [from ]
!431 = metadata !{i32 786473, metadata !"/usr/include/libio.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan", null} ; [ DW_TAG_file_type ]
!432 = metadata !{metadata !433, metadata !434, metadata !435, metadata !436, metadata !437, metadata !438, metadata !439, metadata !440, metadata !441, metadata !442, metadata !443, metadata !444, metadata !445, metadata !453, metadata !454, metadata !4
!433 = metadata !{i32 786445, metadata !430, metadata !"_flags", metadata !431, i32 246, i64 32, i64 32, i64 0, i32 0, metadata !106} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!434 = metadata !{i32 786445, metadata !430, metadata !"_IO_read_ptr", metadata !431, i32 251, i64 64, i64 64, i64 64, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!435 = metadata !{i32 786445, metadata !430, metadata !"_IO_read_end", metadata !431, i32 252, i64 64, i64 64, i64 128, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!436 = metadata !{i32 786445, metadata !430, metadata !"_IO_read_base", metadata !431, i32 253, i64 64, i64 64, i64 192, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!437 = metadata !{i32 786445, metadata !430, metadata !"_IO_write_base", metadata !431, i32 254, i64 64, i64 64, i64 256, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!438 = metadata !{i32 786445, metadata !430, metadata !"_IO_write_ptr", metadata !431, i32 255, i64 64, i64 64, i64 320, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!439 = metadata !{i32 786445, metadata !430, metadata !"_IO_write_end", metadata !431, i32 256, i64 64, i64 64, i64 384, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!440 = metadata !{i32 786445, metadata !430, metadata !"_IO_buf_base", metadata !431, i32 257, i64 64, i64 64, i64 448, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!441 = metadata !{i32 786445, metadata !430, metadata !"_IO_buf_end", metadata !431, i32 258, i64 64, i64 64, i64 512, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!442 = metadata !{i32 786445, metadata !430, metadata !"_IO_save_base", metadata !431, i32 260, i64 64, i64 64, i64 576, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!443 = metadata !{i32 786445, metadata !430, metadata !"_IO_backup_base", metadata !431, i32 261, i64 64, i64 64, i64 640, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!444 = metadata !{i32 786445, metadata !430, metadata !"_IO_save_end", metadata !431, i32 262, i64 64, i64 64, i64 704, i32 0, metadata !410} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!445 = metadata !{i32 786445, metadata !430, metadata !"_markers", metadata !431, i32 264, i64 64, i64 64, i64 768, i32 0, metadata !446} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!446 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !447} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!447 = metadata !{i32 786451, null, metadata !"_IO_marker", metadata !431, i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !448, i32 0, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [from ]
!448 = metadata !{metadata !449, metadata !450, metadata !452}
!449 = metadata !{i32 786445, metadata !447, metadata !"_next", metadata !431, i32 161, i64 64, i64 64, i64 0, i32 0, metadata !446} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!450 = metadata !{i32 786445, metadata !447, metadata !"_sbuf", metadata !431, i32 162, i64 64, i64 64, i64 64, i32 0, metadata !451} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!451 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !430} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!452 = metadata !{i32 786445, metadata !447, metadata !"_pos", metadata !431, i32 166, i64 32, i64 32, i64 128, i32 0, metadata !106} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!453 = metadata !{i32 786445, metadata !430, metadata !"_chain", metadata !431, i32 266, i64 64, i64 64, i64 832, i32 0, metadata !451} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!454 = metadata !{i32 786445, metadata !430, metadata !"_fileno", metadata !431, i32 268, i64 32, i64 32, i64 896, i32 0, metadata !106} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!455 = metadata !{i32 786445, metadata !430, metadata !"_flags2", metadata !431, i32 272, i64 32, i64 32, i64 928, i32 0, metadata !106} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!456 = metadata !{i32 786445, metadata !430, metadata !"_old_offset", metadata !431, i32 274, i64 64, i64 64, i64 960, i32 0, metadata !457} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!457 = metadata !{i32 786454, null, metadata !"__off_t", metadata !431, i32 131, i64 0, i64 0, i64 0, i32 0, metadata !458} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!458 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!459 = metadata !{i32 786445, metadata !430, metadata !"_cur_column", metadata !431, i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !35} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!460 = metadata !{i32 786445, metadata !430, metadata !"_vtable_offset", metadata !431, i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !461} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!461 = metadata !{i32 786468, null, metadata !"signed char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!462 = metadata !{i32 786445, metadata !430, metadata !"_shortbuf", metadata !431, i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !463} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!463 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !411, metadata !464, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!464 = metadata !{metadata !465}
!465 = metadata !{i32 786465, i64 0, i64 0}       ; [ DW_TAG_subrange_type ] [0, 0]
!466 = metadata !{i32 786445, metadata !430, metadata !"_lock", metadata !431, i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !467} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!467 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!468 = metadata !{i32 786445, metadata !430, metadata !"_offset", metadata !431, i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !469} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!469 = metadata !{i32 786454, null, metadata !"__off64_t", metadata !431, i32 132, i64 0, i64 0, i64 0, i32 0, metadata !458} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!470 = metadata !{i32 786445, metadata !430, metadata !"__pad1", metadata !431, i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !467} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!471 = metadata !{i32 786445, metadata !430, metadata !"__pad2", metadata !431, i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !467} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!472 = metadata !{i32 786445, metadata !430, metadata !"__pad3", metadata !431, i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !467} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!473 = metadata !{i32 786445, metadata !430, metadata !"__pad4", metadata !431, i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !467} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!474 = metadata !{i32 786445, metadata !430, metadata !"__pad5", metadata !431, i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !475} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!475 = metadata !{i32 786454, null, metadata !"size_t", metadata !431, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !476} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!476 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!477 = metadata !{i32 786445, metadata !430, metadata !"_mode", metadata !431, i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !106} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!478 = metadata !{i32 786445, metadata !430, metadata !"_unused2", metadata !431, i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !479} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!479 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 160, i64 8, i32 0, i32 0, metadata !411, metadata !480, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!480 = metadata !{metadata !481}
!481 = metadata !{i32 786465, i64 0, i64 19}      ; [ DW_TAG_subrange_type ] [0, 19]
!482 = metadata !{i32 786688, metadata !417, metadata !"result", metadata !406, i32 82, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [result] [line 82]
!483 = metadata !{i32 786688, metadata !417, metadata !"img", metadata !406, i32 96, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [img] [line 96]
!484 = metadata !{i32 786688, metadata !417, metadata !"histo", metadata !406, i32 97, metadata !485, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [histo] [line 97]
!485 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !60} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned char]
!486 = metadata !{i32 786688, metadata !417, metadata !"even_width", metadata !406, i32 108, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [even_width] [line 108]
!487 = metadata !{i32 786688, metadata !417, metadata !"input", metadata !406, i32 109, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [input] [line 109]
!488 = metadata !{i32 786688, metadata !417, metadata !"ranges", metadata !406, i32 110, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ranges] [line 110]
!489 = metadata !{i32 786688, metadata !417, metadata !"sm_mappings", metadata !406, i32 111, metadata !490, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sm_mappings] [line 111]
!490 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !491} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uchar4]
!491 = metadata !{i32 786454, null, metadata !"uchar4", metadata !406, i32 367, i64 0, i64 0, i64 0, i32 0, metadata !492} ; [ DW_TAG_typedef ] [uchar4] [line 367, size 0, align 0, offset 0] [from uchar4]
!492 = metadata !{i32 786451, null, metadata !"uchar4", metadata !32, i32 132, i64 32, i64 32, i32 0, i32 0, null, metadata !493, i32 0, null, null} ; [ DW_TAG_structure_type ] [uchar4] [line 132, size 32, align 32, offset 0] [from ]
!493 = metadata !{metadata !494, metadata !495, metadata !496, metadata !497, metadata !498, metadata !502, metadata !507, metadata !508}
!494 = metadata !{i32 786445, metadata !492, metadata !"x", metadata !32, i32 134, i64 8, i64 8, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ] [x] [line 134, size 8, align 8, offset 0] [from unsigned char]
!495 = metadata !{i32 786445, metadata !492, metadata !"y", metadata !32, i32 134, i64 8, i64 8, i64 8, i32 0, metadata !60} ; [ DW_TAG_member ] [y] [line 134, size 8, align 8, offset 8] [from unsigned char]
!496 = metadata !{i32 786445, metadata !492, metadata !"z", metadata !32, i32 134, i64 8, i64 8, i64 16, i32 0, metadata !60} ; [ DW_TAG_member ] [z] [line 134, size 8, align 8, offset 16] [from unsigned char]
!497 = metadata !{i32 786445, metadata !492, metadata !"w", metadata !32, i32 134, i64 8, i64 8, i64 24, i32 0, metadata !60} ; [ DW_TAG_member ] [w] [line 134, size 8, align 8, offset 24] [from unsigned char]
!498 = metadata !{i32 786478, i32 0, metadata !492, metadata !"uchar4", metadata !"uchar4", metadata !"", metadata !32, i32 132, metadata !499, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_TAG
!499 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !500, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!500 = metadata !{null, metadata !501}
!501 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !492} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uchar4]
!502 = metadata !{i32 786478, i32 0, metadata !492, metadata !"uchar4", metadata !"uchar4", metadata !"", metadata !32, i32 132, metadata !503, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_TAG
!503 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !504, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!504 = metadata !{null, metadata !501, metadata !505}
!505 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !506} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!506 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !492} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uchar4]
!507 = metadata !{i32 786478, i32 0, metadata !492, metadata !"~uchar4", metadata !"~uchar4", metadata !"", metadata !32, i32 132, metadata !499, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 132} ; [ DW_T
!508 = metadata !{i32 786478, i32 0, metadata !492, metadata !"operator=", metadata !"operator=", metadata !"_ZN6uchar4aSERKS_", metadata !32, i32 132, metadata !509, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !
!509 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !510, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!510 = metadata !{metadata !511, metadata !501, metadata !505}
!511 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !492} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from uchar4]
!512 = metadata !{i32 786688, metadata !417, metadata !"global_subhisto", metadata !406, i32 112, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [global_subhisto] [line 112]
!513 = metadata !{i32 786688, metadata !417, metadata !"global_histo", metadata !406, i32 113, metadata !514, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [global_histo] [line 113]
!514 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !35} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned short]
!515 = metadata !{i32 786688, metadata !417, metadata !"global_overflow", metadata !406, i32 114, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [global_overflow] [line 114]
!516 = metadata !{i32 786688, metadata !417, metadata !"final_histo", metadata !406, i32 115, metadata !485, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [final_histo] [line 115]
!517 = metadata !{i32 786688, metadata !518, metadata !"y", metadata !406, i32 127, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 127]
!518 = metadata !{i32 786443, metadata !417, i32 127, i32 0, metadata !406, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/main.cpp]
!519 = metadata !{i32 786688, metadata !520, metadata !"iter", metadata !406, i32 133, metadata !106, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [iter] [line 133]
!520 = metadata !{i32 786443, metadata !417, i32 133, i32 0, metadata !406, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/main.cpp]
!521 = metadata !{i32 786688, metadata !522, metadata !"ranges_h", metadata !406, i32 134, metadata !523, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ranges_h] [line 134]
!522 = metadata !{i32 786443, metadata !520, i32 133, i32 0, metadata !406, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/main.cpp]
!523 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 32, i32 0, i32 0, metadata !9, metadata !524, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from unsigned int]
!524 = metadata !{metadata !525}
!525 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 1]
!526 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !32, i32 419, metadata !527, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !535, metadata !565, i32 419} ;
!527 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !528, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!528 = metadata !{null, metadata !529, metadata !9, metadata !9, metadata !9}
!529 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !530} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!530 = metadata !{i32 786451, null, metadata !"dim3", metadata !32, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !531, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!531 = metadata !{metadata !532, metadata !533, metadata !534, metadata !535, metadata !536, metadata !554, metadata !557, metadata !562}
!532 = metadata !{i32 786445, metadata !530, metadata !"x", metadata !32, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!533 = metadata !{i32 786445, metadata !530, metadata !"y", metadata !32, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !9} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!534 = metadata !{i32 786445, metadata !530, metadata !"z", metadata !32, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!535 = metadata !{i32 786478, i32 0, metadata !530, metadata !"dim3", metadata !"dim3", metadata !"", metadata !32, i32 419, metadata !527, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !43, i32 419} ; [ DW_TAG_sub
!536 = metadata !{i32 786478, i32 0, metadata !530, metadata !"dim3", metadata !"dim3", metadata !"", metadata !32, i32 420, metadata !537, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !43, i32 420} ; [ DW_TAG_sub
!537 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !538, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!538 = metadata !{null, metadata !529, metadata !539}
!539 = metadata !{i32 786454, null, metadata !"uint3", metadata !32, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !540} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!540 = metadata !{i32 786451, null, metadata !"uint3", metadata !32, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !541, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!541 = metadata !{metadata !542, metadata !543, metadata !544, metadata !545, metadata !549}
!542 = metadata !{i32 786445, metadata !540, metadata !"x", metadata !32, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !9} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!543 = metadata !{i32 786445, metadata !540, metadata !"y", metadata !32, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !9} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!544 = metadata !{i32 786445, metadata !540, metadata !"z", metadata !32, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !9} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!545 = metadata !{i32 786478, i32 0, metadata !540, metadata !"uint3", metadata !"uint3", metadata !"", metadata !32, i32 188, metadata !546, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 188} ; [ DW_TAG_s
!546 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !547, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!547 = metadata !{null, metadata !548}
!548 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !540} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!549 = metadata !{i32 786478, i32 0, metadata !540, metadata !"uint3", metadata !"uint3", metadata !"", metadata !32, i32 188, metadata !550, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 188} ; [ DW_TAG_s
!550 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !551, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!551 = metadata !{null, metadata !548, metadata !552}
!552 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !553} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!553 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !540} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!554 = metadata !{i32 786478, i32 0, metadata !530, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !32, i32 421, metadata !555, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0,
!555 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !556, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!556 = metadata !{metadata !539, metadata !529}
!557 = metadata !{i32 786478, i32 0, metadata !530, metadata !"dim3", metadata !"dim3", metadata !"", metadata !32, i32 415, metadata !558, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 415} ; [ DW_TAG_sub
!558 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !559, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!559 = metadata !{null, metadata !529, metadata !560}
!560 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !561} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!561 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !530} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!562 = metadata !{i32 786478, i32 0, metadata !530, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !32, i32 415, metadata !563, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !43, i32 415} ; [ DW_TAG_s
!563 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !564, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!564 = metadata !{null, metadata !529}
!565 = metadata !{metadata !566}
!566 = metadata !{metadata !567, metadata !569, metadata !570, metadata !571}
!567 = metadata !{i32 786689, metadata !526, metadata !"this", metadata !32, i32 16777635, metadata !568, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!568 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !530} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!569 = metadata !{i32 786689, metadata !526, metadata !"vx", metadata !32, i32 33554851, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!570 = metadata !{i32 786689, metadata !526, metadata !"vy", metadata !32, i32 50332067, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!571 = metadata !{i32 786689, metadata !526, metadata !"vz", metadata !32, i32 67109283, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!572 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !32, i32 419, metadata !527, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !535, metadata !573, i32 419} ;
!573 = metadata !{metadata !574}
!574 = metadata !{metadata !575, metadata !576, metadata !577, metadata !578}
!575 = metadata !{i32 786689, metadata !572, metadata !"this", metadata !32, i32 16777635, metadata !568, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!576 = metadata !{i32 786689, metadata !572, metadata !"vx", metadata !32, i32 33554851, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!577 = metadata !{i32 786689, metadata !572, metadata !"vy", metadata !32, i32 50332067, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!578 = metadata !{i32 786689, metadata !572, metadata !"vz", metadata !32, i32 67109283, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!579 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!580 = metadata !{metadata !581}
!581 = metadata !{metadata !582}
!582 = metadata !{i32 786478, i32 0, metadata !583, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", metadata !583, i32 12, metadata !584, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_
!583 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!584 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !585, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!585 = metadata !{null, metadata !586}
!586 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!587 = metadata !{metadata !588}
!588 = metadata !{metadata !589}
!589 = metadata !{i32 786689, metadata !582, metadata !"z", metadata !583, i32 16777228, metadata !586, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!590 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!591 = metadata !{metadata !592}
!592 = metadata !{metadata !593}
!593 = metadata !{i32 786478, i32 0, metadata !594, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !594, i32 12, metadata !595, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !6
!594 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!595 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !596, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!596 = metadata !{metadata !467, metadata !467, metadata !597, metadata !599}
!597 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !598} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!598 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!599 = metadata !{i32 786454, null, metadata !"size_t", metadata !594, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !476} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!600 = metadata !{metadata !601}
!601 = metadata !{metadata !602, metadata !603, metadata !604, metadata !605, metadata !607}
!602 = metadata !{i32 786689, metadata !593, metadata !"destaddr", metadata !594, i32 16777228, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!603 = metadata !{i32 786689, metadata !593, metadata !"srcaddr", metadata !594, i32 33554444, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!604 = metadata !{i32 786689, metadata !593, metadata !"len", metadata !594, i32 50331660, metadata !599, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!605 = metadata !{i32 786688, metadata !606, metadata !"dest", metadata !594, i32 13, metadata !410, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!606 = metadata !{i32 786443, metadata !593, i32 12, i32 0, metadata !594, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c]
!607 = metadata !{i32 786688, metadata !606, metadata !"src", metadata !594, i32 14, metadata !608, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!608 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !609} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!609 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !411} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!610 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata 
!611 = metadata !{metadata !612}
!612 = metadata !{metadata !613}
!613 = metadata !{i32 786478, i32 0, metadata !614, metadata !"memmove", metadata !"memmove", metadata !"", metadata !614, i32 12, metadata !615, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !618, i32 12} ; [ DW_TAG
!614 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!615 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !616, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!616 = metadata !{metadata !467, metadata !467, metadata !597, metadata !617}
!617 = metadata !{i32 786454, null, metadata !"size_t", metadata !614, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !476} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!618 = metadata !{metadata !619}
!619 = metadata !{metadata !620, metadata !621, metadata !622, metadata !623, metadata !625}
!620 = metadata !{i32 786689, metadata !613, metadata !"dst", metadata !614, i32 16777228, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!621 = metadata !{i32 786689, metadata !613, metadata !"src", metadata !614, i32 33554444, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!622 = metadata !{i32 786689, metadata !613, metadata !"count", metadata !614, i32 50331660, metadata !617, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!623 = metadata !{i32 786688, metadata !624, metadata !"a", metadata !614, i32 14, metadata !410, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!624 = metadata !{i32 786443, metadata !613, i32 12, i32 0, metadata !614, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c]
!625 = metadata !{i32 786688, metadata !624, metadata !"b", metadata !614, i32 15, metadata !608, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!626 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!627 = metadata !{metadata !628}
!628 = metadata !{metadata !629}
!629 = metadata !{i32 786478, i32 0, metadata !630, metadata !"memset", metadata !"memset", metadata !"", metadata !630, i32 12, metadata !631, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !6
!630 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!631 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !632, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!632 = metadata !{metadata !467, metadata !467, metadata !106, metadata !633}
!633 = metadata !{i32 786454, null, metadata !"size_t", metadata !630, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !476} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!634 = metadata !{metadata !635}
!635 = metadata !{metadata !636, metadata !637, metadata !638, metadata !639}
!636 = metadata !{i32 786689, metadata !629, metadata !"dst", metadata !630, i32 16777228, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!637 = metadata !{i32 786689, metadata !629, metadata !"s", metadata !630, i32 33554444, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!638 = metadata !{i32 786689, metadata !629, metadata !"count", metadata !630, i32 50331660, metadata !633, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!639 = metadata !{i32 786688, metadata !640, metadata !"a", metadata !630, i32 13, metadata !641, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!640 = metadata !{i32 786443, metadata !629, i32 12, i32 0, metadata !630, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c]
!641 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !642} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!642 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !411} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!643 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!644 = metadata !{metadata !645}
!645 = metadata !{metadata !646, metadata !721, metadata !727}
!646 = metadata !{i32 786436, null, metadata !"cudaError", metadata !647, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !648, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!647 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!648 = metadata !{metadata !649, metadata !650, metadata !651, metadata !652, metadata !653, metadata !654, metadata !655, metadata !656, metadata !657, metadata !658, metadata !659, metadata !660, metadata !661, metadata !662, metadata !663, metadata !6
!649 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!650 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!651 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!652 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!653 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!654 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!655 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!656 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!657 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!658 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!659 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!660 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!661 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!662 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!663 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!664 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!665 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!666 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!667 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!668 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!669 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!670 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!671 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!672 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!673 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!674 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!675 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!676 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!677 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!678 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!679 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!680 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!681 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!682 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!683 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!684 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!685 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!686 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!687 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!688 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!689 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!690 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!691 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!692 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!693 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!694 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!695 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!696 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!697 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!698 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!699 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!700 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!701 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!702 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!703 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!704 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!705 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!706 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!707 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!708 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!709 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!710 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!711 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!712 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!713 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!714 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!715 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!716 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!717 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!718 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!719 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!720 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!721 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !647, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !722, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!722 = metadata !{metadata !723, metadata !724, metadata !725, metadata !726}
!723 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!724 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!725 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!726 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!727 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !647, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !397, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!728 = metadata !{metadata !729}
!729 = metadata !{metadata !730, metadata !758, metadata !764, metadata !770, metadata !774, metadata !782, metadata !790, metadata !798, metadata !806, metadata !813, metadata !821, metadata !825, metadata !832, metadata !846, metadata !856, metadata !8
!730 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !731, i32 24, metadata !732, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!731 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!732 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !733, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!733 = metadata !{metadata !734, metadata !735, metadata !743, metadata !10, metadata !750}
!734 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !731, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !646} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!735 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !736} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!736 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !647, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !737, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!737 = metadata !{metadata !738, metadata !739, metadata !740, metadata !741, metadata !742}
!738 = metadata !{i32 786445, metadata !736, metadata !"x", metadata !647, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !106} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!739 = metadata !{i32 786445, metadata !736, metadata !"y", metadata !647, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !106} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!740 = metadata !{i32 786445, metadata !736, metadata !"z", metadata !647, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !106} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!741 = metadata !{i32 786445, metadata !736, metadata !"w", metadata !647, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !106} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!742 = metadata !{i32 786445, metadata !736, metadata !"f", metadata !647, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !721} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!743 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !744} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!744 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !647, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !745, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!745 = metadata !{metadata !746, metadata !748, metadata !749}
!746 = metadata !{i32 786445, metadata !744, metadata !"width", metadata !647, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !747} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!747 = metadata !{i32 786454, null, metadata !"size_t", metadata !647, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !476} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!748 = metadata !{i32 786445, metadata !744, metadata !"height", metadata !647, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !747} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!749 = metadata !{i32 786445, metadata !744, metadata !"depth", metadata !647, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !747} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!750 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !751} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!751 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !647, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!752 = metadata !{metadata !753}
!753 = metadata !{metadata !754, metadata !755, metadata !756, metadata !757}
!754 = metadata !{i32 786689, metadata !730, metadata !"desc", metadata !731, i32 16777240, metadata !735, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!755 = metadata !{i32 786689, metadata !730, metadata !"extent", metadata !731, i32 33554456, metadata !743, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!756 = metadata !{i32 786689, metadata !730, metadata !"flags", metadata !731, i32 50331673, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!757 = metadata !{i32 786689, metadata !730, metadata !"array", metadata !731, i32 67108889, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!758 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !731, i32 29, metadata !759, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !761, 
!759 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !760, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!760 = metadata !{metadata !734, metadata !467}
!761 = metadata !{metadata !762}
!762 = metadata !{metadata !763}
!763 = metadata !{i32 786689, metadata !758, metadata !"devPtr", metadata !731, i32 16777245, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!764 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !731, i32 34, metadata !765, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!765 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !766, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!766 = metadata !{metadata !734, metadata !750}
!767 = metadata !{metadata !768}
!768 = metadata !{metadata !769}
!769 = metadata !{i32 786689, metadata !764, metadata !"array", metadata !731, i32 16777250, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!770 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !731, i32 39, metadata !759, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!771 = metadata !{metadata !772}
!772 = metadata !{metadata !773}
!773 = metadata !{i32 786689, metadata !770, metadata !"ptr", metadata !731, i32 16777255, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!774 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !731, i32 44, metadata !775, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!775 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !776, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!776 = metadata !{metadata !734, metadata !777, metadata !608}
!777 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !467} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!778 = metadata !{metadata !779}
!779 = metadata !{metadata !780, metadata !781}
!780 = metadata !{i32 786689, metadata !774, metadata !"devPtr", metadata !731, i32 16777260, metadata !777, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!781 = metadata !{i32 786689, metadata !774, metadata !"symbol", metadata !731, i32 33554476, metadata !608, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!782 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !731, i32 48, metadata !783, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!783 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !784, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!784 = metadata !{metadata !734, metadata !785, metadata !608}
!785 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !747} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!786 = metadata !{metadata !787}
!787 = metadata !{metadata !788, metadata !789}
!788 = metadata !{i32 786689, metadata !782, metadata !"size", metadata !731, i32 16777264, metadata !785, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!789 = metadata !{i32 786689, metadata !782, metadata !"symbol", metadata !731, i32 33554480, metadata !608, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!790 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !731, i32 52, metadata !791, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!791 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !792, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!792 = metadata !{metadata !734, metadata !777, metadata !747, metadata !9}
!793 = metadata !{metadata !794}
!794 = metadata !{metadata !795, metadata !796, metadata !797}
!795 = metadata !{i32 786689, metadata !790, metadata !"pHost", metadata !731, i32 16777268, metadata !777, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!796 = metadata !{i32 786689, metadata !790, metadata !"size", metadata !731, i32 33554484, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!797 = metadata !{i32 786689, metadata !790, metadata !"flags", metadata !731, i32 50331700, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!798 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !731, i32 56, metadata !799, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!799 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !800, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!800 = metadata !{metadata !734, metadata !777, metadata !467, metadata !9}
!801 = metadata !{metadata !802}
!802 = metadata !{metadata !803, metadata !804, metadata !805}
!803 = metadata !{i32 786689, metadata !798, metadata !"pDevice", metadata !731, i32 16777272, metadata !777, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!804 = metadata !{i32 786689, metadata !798, metadata !"pHost", metadata !731, i32 33554488, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!805 = metadata !{i32 786689, metadata !798, metadata !"flags", metadata !731, i32 50331704, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!806 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !731, i32 60, metadata !807, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!807 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !808, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!808 = metadata !{metadata !734, metadata !10, metadata !467}
!809 = metadata !{metadata !810}
!810 = metadata !{metadata !811, metadata !812}
!811 = metadata !{i32 786689, metadata !806, metadata !"pFlags", metadata !731, i32 16777276, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!812 = metadata !{i32 786689, metadata !806, metadata !"pHost", metadata !731, i32 33554492, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!813 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !731, i32 64, metadata !814, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!814 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !815, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!815 = metadata !{metadata !734, metadata !467, metadata !747, metadata !9}
!816 = metadata !{metadata !817}
!817 = metadata !{metadata !818, metadata !819, metadata !820}
!818 = metadata !{i32 786689, metadata !813, metadata !"ptr", metadata !731, i32 16777280, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!819 = metadata !{i32 786689, metadata !813, metadata !"size", metadata !731, i32 33554496, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!820 = metadata !{i32 786689, metadata !813, metadata !"flags", metadata !731, i32 50331712, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!821 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !731, i32 68, metadata !759, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!822 = metadata !{metadata !823}
!823 = metadata !{metadata !824}
!824 = metadata !{i32 786689, metadata !821, metadata !"ptr", metadata !731, i32 16777284, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!825 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !731, i32 72, metadata !826, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, met
!826 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !827, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!827 = metadata !{metadata !734, metadata !777, metadata !747}
!828 = metadata !{metadata !829}
!829 = metadata !{metadata !830, metadata !831}
!830 = metadata !{i32 786689, metadata !825, metadata !"devPtr", metadata !731, i32 16777288, metadata !777, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!831 = metadata !{i32 786689, metadata !825, metadata !"size", metadata !731, i32 33554504, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!832 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !731, i32 80, metadata !833, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.cud
!833 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !834, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!834 = metadata !{metadata !734, metadata !835, metadata !744}
!835 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !836} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!836 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !647, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !837, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!837 = metadata !{metadata !838, metadata !839, metadata !840, metadata !841}
!838 = metadata !{i32 786445, metadata !836, metadata !"ptr", metadata !647, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !467} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!839 = metadata !{i32 786445, metadata !836, metadata !"pitch", metadata !647, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !747} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!840 = metadata !{i32 786445, metadata !836, metadata !"xsize", metadata !647, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !747} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!841 = metadata !{i32 786445, metadata !836, metadata !"ysize", metadata !647, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !747} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!842 = metadata !{metadata !843}
!843 = metadata !{metadata !844, metadata !845}
!844 = metadata !{i32 786689, metadata !832, metadata !"pitchedDevPtr", metadata !731, i32 16777296, metadata !835, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!845 = metadata !{i32 786689, metadata !832, metadata !"extent", metadata !731, i32 33554512, metadata !744, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!846 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !731, i32 84, metadata !847, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %stru
!847 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !848, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!848 = metadata !{metadata !734, metadata !849, metadata !735, metadata !744, metadata !9}
!849 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !750} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!850 = metadata !{metadata !851}
!851 = metadata !{metadata !852, metadata !853, metadata !854, metadata !855}
!852 = metadata !{i32 786689, metadata !846, metadata !"array", metadata !731, i32 16777300, metadata !849, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!853 = metadata !{i32 786689, metadata !846, metadata !"desc", metadata !731, i32 33554516, metadata !735, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!854 = metadata !{i32 786689, metadata !846, metadata !"extent", metadata !731, i32 50331733, metadata !744, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!855 = metadata !{i32 786689, metadata !846, metadata !"flags", metadata !731, i32 67108949, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!856 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !731, i32 89, metadata !857, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct.c
!857 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !858, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!858 = metadata !{metadata !734, metadata !849, metadata !735, metadata !747, metadata !747, metadata !9}
!859 = metadata !{metadata !860}
!860 = metadata !{metadata !861, metadata !862, metadata !863, metadata !864, metadata !865}
!861 = metadata !{i32 786689, metadata !856, metadata !"array", metadata !731, i32 16777305, metadata !849, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!862 = metadata !{i32 786689, metadata !856, metadata !"desc", metadata !731, i32 33554521, metadata !735, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!863 = metadata !{i32 786689, metadata !856, metadata !"width", metadata !731, i32 50331738, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!864 = metadata !{i32 786689, metadata !856, metadata !"height", metadata !731, i32 67108954, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!865 = metadata !{i32 786689, metadata !856, metadata !"flags", metadata !731, i32 83886170, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!866 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !731, i32 94, metadata !826, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, nul
!867 = metadata !{metadata !868}
!868 = metadata !{metadata !869, metadata !870}
!869 = metadata !{i32 786689, metadata !866, metadata !"ptr", metadata !731, i32 16777310, metadata !777, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!870 = metadata !{i32 786689, metadata !866, metadata !"size", metadata !731, i32 33554526, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!871 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !731, i32 102, metadata !872, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cudaM
!872 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !873, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!873 = metadata !{metadata !734, metadata !777, metadata !785, metadata !747, metadata !747}
!874 = metadata !{metadata !875}
!875 = metadata !{metadata !876, metadata !877, metadata !878, metadata !879}
!876 = metadata !{i32 786689, metadata !871, metadata !"devPtr", metadata !731, i32 16777318, metadata !777, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!877 = metadata !{i32 786689, metadata !871, metadata !"pitch", metadata !731, i32 33554534, metadata !785, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!878 = metadata !{i32 786689, metadata !871, metadata !"width", metadata !731, i32 50331750, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!879 = metadata !{i32 786689, metadata !871, metadata !"height", metadata !731, i32 67108966, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!880 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !731, i32 106, metadata !881, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, null,
!881 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !882, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!882 = metadata !{metadata !734, metadata !467, metadata !597, metadata !747, metadata !727}
!883 = metadata !{metadata !884}
!884 = metadata !{metadata !885, metadata !886, metadata !887, metadata !888}
!885 = metadata !{i32 786689, metadata !880, metadata !"dst", metadata !731, i32 16777322, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!886 = metadata !{i32 786689, metadata !880, metadata !"src", metadata !731, i32 33554538, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!887 = metadata !{i32 786689, metadata !880, metadata !"count", metadata !731, i32 50331754, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!888 = metadata !{i32 786689, metadata !880, metadata !"kind", metadata !731, i32 67108970, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!889 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !731, i32 111, metadata !890, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32)*
!890 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !891, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!891 = metadata !{metadata !734, metadata !467, metadata !747, metadata !597, metadata !747, metadata !747, metadata !747, metadata !727}
!892 = metadata !{metadata !893}
!893 = metadata !{metadata !894, metadata !895, metadata !896, metadata !897, metadata !898, metadata !899, metadata !900}
!894 = metadata !{i32 786689, metadata !889, metadata !"dst", metadata !731, i32 16777327, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!895 = metadata !{i32 786689, metadata !889, metadata !"dpitch", metadata !731, i32 33554543, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!896 = metadata !{i32 786689, metadata !889, metadata !"src", metadata !731, i32 50331759, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!897 = metadata !{i32 786689, metadata !889, metadata !"spitch", metadata !731, i32 67108975, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!898 = metadata !{i32 786689, metadata !889, metadata !"width", metadata !731, i32 83886192, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!899 = metadata !{i32 786689, metadata !889, metadata !"height", metadata !731, i32 100663408, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!900 = metadata !{i32 786689, metadata !889, metadata !"kind", metadata !731, i32 117440624, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!901 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !731, i32 116, metadata !902, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!902 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !903, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!903 = metadata !{metadata !734, metadata !750, metadata !747, metadata !747, metadata !750, metadata !747, metadata !747, metadata !747, metadata !747, metadata !727}
!904 = metadata !{metadata !905}
!905 = metadata !{metadata !906, metadata !907, metadata !908, metadata !909, metadata !910, metadata !911, metadata !912, metadata !913, metadata !914}
!906 = metadata !{i32 786689, metadata !901, metadata !"dst", metadata !731, i32 16777332, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!907 = metadata !{i32 786689, metadata !901, metadata !"wOffsetDst", metadata !731, i32 33554548, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!908 = metadata !{i32 786689, metadata !901, metadata !"hOffsetDst", metadata !731, i32 50331764, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!909 = metadata !{i32 786689, metadata !901, metadata !"src", metadata !731, i32 67108981, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!910 = metadata !{i32 786689, metadata !901, metadata !"wOffsetSrc", metadata !731, i32 83886197, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!911 = metadata !{i32 786689, metadata !901, metadata !"hOffsetSrc", metadata !731, i32 100663413, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!912 = metadata !{i32 786689, metadata !901, metadata !"width", metadata !731, i32 117440630, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!913 = metadata !{i32 786689, metadata !901, metadata !"height", metadata !731, i32 134217846, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!914 = metadata !{i32 786689, metadata !901, metadata !"kind", metadata !731, i32 150995062, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!915 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !731, i32 122, metadata !916, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, 
!916 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !917, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!917 = metadata !{metadata !734, metadata !467, metadata !747, metadata !597, metadata !747, metadata !747, metadata !747, metadata !727, metadata !918}
!918 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !731, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !919} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!919 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !920} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!920 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !647, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!921 = metadata !{metadata !922}
!922 = metadata !{metadata !923, metadata !924, metadata !925, metadata !926, metadata !927, metadata !928, metadata !929, metadata !930}
!923 = metadata !{i32 786689, metadata !915, metadata !"dst", metadata !731, i32 16777338, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!924 = metadata !{i32 786689, metadata !915, metadata !"dpitch", metadata !731, i32 33554554, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!925 = metadata !{i32 786689, metadata !915, metadata !"src", metadata !731, i32 50331770, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!926 = metadata !{i32 786689, metadata !915, metadata !"spitch", metadata !731, i32 67108986, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!927 = metadata !{i32 786689, metadata !915, metadata !"width", metadata !731, i32 83886203, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!928 = metadata !{i32 786689, metadata !915, metadata !"height", metadata !731, i32 100663419, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!929 = metadata !{i32 786689, metadata !915, metadata !"kind", metadata !731, i32 117440635, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!930 = metadata !{i32 786689, metadata !915, metadata !"stream", metadata !731, i32 134217852, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!931 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !731, i32 128, metadata !932, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %struct
!932 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !933, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!933 = metadata !{metadata !734, metadata !467, metadata !747, metadata !750, metadata !747, metadata !747, metadata !747, metadata !747, metadata !727}
!934 = metadata !{metadata !935}
!935 = metadata !{metadata !936, metadata !937, metadata !938, metadata !939, metadata !940, metadata !941, metadata !942, metadata !943}
!936 = metadata !{i32 786689, metadata !931, metadata !"dst", metadata !731, i32 16777344, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!937 = metadata !{i32 786689, metadata !931, metadata !"dpitch", metadata !731, i32 33554560, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!938 = metadata !{i32 786689, metadata !931, metadata !"src", metadata !731, i32 50331776, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!939 = metadata !{i32 786689, metadata !931, metadata !"wOffset", metadata !731, i32 67108993, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!940 = metadata !{i32 786689, metadata !931, metadata !"hOffset", metadata !731, i32 83886209, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!941 = metadata !{i32 786689, metadata !931, metadata !"width", metadata !731, i32 100663425, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!942 = metadata !{i32 786689, metadata !931, metadata !"height", metadata !731, i32 117440641, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!943 = metadata !{i32 786689, metadata !931, metadata !"kind", metadata !731, i32 134217858, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!944 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !731, i32 134, metadata !945, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i6
!945 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !946, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!946 = metadata !{metadata !734, metadata !467, metadata !747, metadata !750, metadata !747, metadata !747, metadata !747, metadata !747, metadata !727, metadata !918}
!947 = metadata !{metadata !948}
!948 = metadata !{metadata !949, metadata !950, metadata !951, metadata !952, metadata !953, metadata !954, metadata !955, metadata !956, metadata !957}
!949 = metadata !{i32 786689, metadata !944, metadata !"dst", metadata !731, i32 16777350, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!950 = metadata !{i32 786689, metadata !944, metadata !"dpitch", metadata !731, i32 33554566, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!951 = metadata !{i32 786689, metadata !944, metadata !"src", metadata !731, i32 50331782, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!952 = metadata !{i32 786689, metadata !944, metadata !"wOffset", metadata !731, i32 67108999, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!953 = metadata !{i32 786689, metadata !944, metadata !"hOffset", metadata !731, i32 83886215, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!954 = metadata !{i32 786689, metadata !944, metadata !"width", metadata !731, i32 100663431, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!955 = metadata !{i32 786689, metadata !944, metadata !"height", metadata !731, i32 117440647, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!956 = metadata !{i32 786689, metadata !944, metadata !"kind", metadata !731, i32 134217864, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!957 = metadata !{i32 786689, metadata !944, metadata !"stream", metadata !731, i32 150995080, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!958 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !731, i32 140, metadata !959, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i
!959 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !960, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!960 = metadata !{metadata !734, metadata !750, metadata !747, metadata !747, metadata !597, metadata !747, metadata !747, metadata !747, metadata !727}
!961 = metadata !{metadata !962}
!962 = metadata !{metadata !963, metadata !964, metadata !965, metadata !966, metadata !967, metadata !968, metadata !969, metadata !970}
!963 = metadata !{i32 786689, metadata !958, metadata !"dst", metadata !731, i32 16777356, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!964 = metadata !{i32 786689, metadata !958, metadata !"wOffset", metadata !731, i32 33554572, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!965 = metadata !{i32 786689, metadata !958, metadata !"hOffset", metadata !731, i32 50331788, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!966 = metadata !{i32 786689, metadata !958, metadata !"src", metadata !731, i32 67109005, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!967 = metadata !{i32 786689, metadata !958, metadata !"spitch", metadata !731, i32 83886221, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!968 = metadata !{i32 786689, metadata !958, metadata !"width", metadata !731, i32 100663437, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!969 = metadata !{i32 786689, metadata !958, metadata !"height", metadata !731, i32 117440653, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!970 = metadata !{i32 786689, metadata !958, metadata !"kind", metadata !731, i32 134217870, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!971 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !731, i32 146, metadata !972, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cud
!972 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !973, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!973 = metadata !{metadata !734, metadata !750, metadata !747, metadata !747, metadata !597, metadata !747, metadata !747, metadata !747, metadata !727, metadata !918}
!974 = metadata !{metadata !975}
!975 = metadata !{metadata !976, metadata !977, metadata !978, metadata !979, metadata !980, metadata !981, metadata !982, metadata !983, metadata !984}
!976 = metadata !{i32 786689, metadata !971, metadata !"dst", metadata !731, i32 16777362, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!977 = metadata !{i32 786689, metadata !971, metadata !"wOffset", metadata !731, i32 33554578, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!978 = metadata !{i32 786689, metadata !971, metadata !"hOffset", metadata !731, i32 50331794, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!979 = metadata !{i32 786689, metadata !971, metadata !"src", metadata !731, i32 67109011, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!980 = metadata !{i32 786689, metadata !971, metadata !"spitch", metadata !731, i32 83886227, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!981 = metadata !{i32 786689, metadata !971, metadata !"width", metadata !731, i32 100663443, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!982 = metadata !{i32 786689, metadata !971, metadata !"height", metadata !731, i32 117440659, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!983 = metadata !{i32 786689, metadata !971, metadata !"kind", metadata !731, i32 134217876, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!984 = metadata !{i32 786689, metadata !971, metadata !"stream", metadata !731, i32 150995092, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!985 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !731, i32 152, metadata !986, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cudaM
!986 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !987, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!987 = metadata !{metadata !734, metadata !988}
!988 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !989} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!989 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !990} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!990 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !647, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !991, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0] [
!991 = metadata !{metadata !992, metadata !994, metadata !1000, metadata !1001, metadata !1002, metadata !1003, metadata !1004, metadata !1005}
!992 = metadata !{i32 786445, metadata !990, metadata !"srcArray", metadata !647, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !993} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!993 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !647, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !750} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!994 = metadata !{i32 786445, metadata !990, metadata !"srcPos", metadata !647, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !995} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!995 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !647, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !996, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!996 = metadata !{metadata !997, metadata !998, metadata !999}
!997 = metadata !{i32 786445, metadata !995, metadata !"x", metadata !647, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !747} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!998 = metadata !{i32 786445, metadata !995, metadata !"y", metadata !647, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !747} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!999 = metadata !{i32 786445, metadata !995, metadata !"z", metadata !647, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !747} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!1000 = metadata !{i32 786445, metadata !990, metadata !"srcPtr", metadata !647, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !836} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!1001 = metadata !{i32 786445, metadata !990, metadata !"dstArray", metadata !647, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !993} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!1002 = metadata !{i32 786445, metadata !990, metadata !"dstPos", metadata !647, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !995} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!1003 = metadata !{i32 786445, metadata !990, metadata !"dstPtr", metadata !647, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !836} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!1004 = metadata !{i32 786445, metadata !990, metadata !"extent", metadata !647, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !744} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!1005 = metadata !{i32 786445, metadata !990, metadata !"kind", metadata !647, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !727} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!1006 = metadata !{metadata !1007}
!1007 = metadata !{metadata !1008}
!1008 = metadata !{i32 786689, metadata !985, metadata !"p", metadata !731, i32 16777368, metadata !988, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!1009 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !731, i32 156, metadata !1010, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPar
!1010 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1011, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1011 = metadata !{metadata !734, metadata !988, metadata !918}
!1012 = metadata !{metadata !1013}
!1013 = metadata !{metadata !1014, metadata !1015}
!1014 = metadata !{i32 786689, metadata !1009, metadata !"p", metadata !731, i32 16777372, metadata !988, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!1015 = metadata !{i32 786689, metadata !1009, metadata !"stream", metadata !731, i32 33554588, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!1016 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !731, i32 160, metadata !1017, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerP
!1017 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1018, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1018 = metadata !{metadata !734, metadata !1019}
!1019 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1020} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1020 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1021} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!1021 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !647, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !1022, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, o
!1022 = metadata !{metadata !1023, metadata !1024, metadata !1025, metadata !1026, metadata !1027, metadata !1028, metadata !1029, metadata !1030, metadata !1031}
!1023 = metadata !{i32 786445, metadata !1021, metadata !"srcArray", metadata !647, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !993} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!1024 = metadata !{i32 786445, metadata !1021, metadata !"srcPos", metadata !647, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !995} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!1025 = metadata !{i32 786445, metadata !1021, metadata !"srcPtr", metadata !647, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !836} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!1026 = metadata !{i32 786445, metadata !1021, metadata !"srcDevice", metadata !647, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !106} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!1027 = metadata !{i32 786445, metadata !1021, metadata !"dstArray", metadata !647, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !993} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!1028 = metadata !{i32 786445, metadata !1021, metadata !"dstPos", metadata !647, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !995} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!1029 = metadata !{i32 786445, metadata !1021, metadata !"dstPtr", metadata !647, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !836} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!1030 = metadata !{i32 786445, metadata !1021, metadata !"dstDevice", metadata !647, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !106} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!1031 = metadata !{i32 786445, metadata !1021, metadata !"extent", metadata !647, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !744} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!1032 = metadata !{metadata !1033}
!1033 = metadata !{metadata !1034}
!1034 = metadata !{i32 786689, metadata !1016, metadata !"p", metadata !731, i32 16777376, metadata !1019, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!1035 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !731, i32 164, metadata !1036, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMem
!1036 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1037, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1037 = metadata !{metadata !734, metadata !1019, metadata !918}
!1038 = metadata !{metadata !1039}
!1039 = metadata !{metadata !1040, metadata !1041}
!1040 = metadata !{i32 786689, metadata !1035, metadata !"p", metadata !731, i32 16777380, metadata !1019, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!1041 = metadata !{i32 786689, metadata !1035, metadata !"stream", metadata !731, i32 33554596, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!1042 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !731, i32 168, metadata !1043, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaA
!1043 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1044, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1044 = metadata !{metadata !734, metadata !750, metadata !747, metadata !747, metadata !750, metadata !747, metadata !747, metadata !747, metadata !727}
!1045 = metadata !{metadata !1046}
!1046 = metadata !{metadata !1047, metadata !1048, metadata !1049, metadata !1050, metadata !1051, metadata !1052, metadata !1053, metadata !1054}
!1047 = metadata !{i32 786689, metadata !1042, metadata !"dst", metadata !731, i32 16777384, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!1048 = metadata !{i32 786689, metadata !1042, metadata !"wOffsetDst", metadata !731, i32 33554600, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!1049 = metadata !{i32 786689, metadata !1042, metadata !"hOffsetDst", metadata !731, i32 50331816, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!1050 = metadata !{i32 786689, metadata !1042, metadata !"src", metadata !731, i32 67109033, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!1051 = metadata !{i32 786689, metadata !1042, metadata !"wOffsetSrc", metadata !731, i32 83886249, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!1052 = metadata !{i32 786689, metadata !1042, metadata !"hOffsetSrc", metadata !731, i32 100663465, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!1053 = metadata !{i32 786689, metadata !1042, metadata !"count", metadata !731, i32 117440682, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!1054 = metadata !{i32 786689, metadata !1042, metadata !"kind", metadata !731, i32 134217898, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!1055 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !731, i32 174, metadata !1056, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct
!1056 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1057, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1057 = metadata !{metadata !734, metadata !467, metadata !597, metadata !747, metadata !727, metadata !918}
!1058 = metadata !{metadata !1059}
!1059 = metadata !{metadata !1060, metadata !1061, metadata !1062, metadata !1063, metadata !1064}
!1060 = metadata !{i32 786689, metadata !1055, metadata !"dst", metadata !731, i32 16777390, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!1061 = metadata !{i32 786689, metadata !1055, metadata !"src", metadata !731, i32 33554606, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!1062 = metadata !{i32 786689, metadata !1055, metadata !"count", metadata !731, i32 50331822, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!1063 = metadata !{i32 786689, metadata !1055, metadata !"kind", metadata !731, i32 67109039, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!1064 = metadata !{i32 786689, metadata !1055, metadata !"stream", metadata !731, i32 83886255, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!1065 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !731, i32 179, metadata !1066, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaAr
!1066 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1067, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1067 = metadata !{metadata !734, metadata !467, metadata !750, metadata !747, metadata !747, metadata !747, metadata !727}
!1068 = metadata !{metadata !1069}
!1069 = metadata !{metadata !1070, metadata !1071, metadata !1072, metadata !1073, metadata !1074, metadata !1075}
!1070 = metadata !{i32 786689, metadata !1065, metadata !"dst", metadata !731, i32 16777395, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!1071 = metadata !{i32 786689, metadata !1065, metadata !"src", metadata !731, i32 33554611, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!1072 = metadata !{i32 786689, metadata !1065, metadata !"wOffset", metadata !731, i32 50331827, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!1073 = metadata !{i32 786689, metadata !1065, metadata !"hOffset", metadata !731, i32 67109044, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!1074 = metadata !{i32 786689, metadata !1065, metadata !"count", metadata !731, i32 83886260, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!1075 = metadata !{i32 786689, metadata !1065, metadata !"kind", metadata !731, i32 100663476, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!1076 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !731, i32 184, metadata !1077, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %str
!1077 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1078, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1078 = metadata !{metadata !734, metadata !467, metadata !750, metadata !747, metadata !747, metadata !747, metadata !727, metadata !918}
!1079 = metadata !{metadata !1080}
!1080 = metadata !{metadata !1081, metadata !1082, metadata !1083, metadata !1084, metadata !1085, metadata !1086, metadata !1087}
!1081 = metadata !{i32 786689, metadata !1076, metadata !"dst", metadata !731, i32 16777400, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!1082 = metadata !{i32 786689, metadata !1076, metadata !"src", metadata !731, i32 33554616, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!1083 = metadata !{i32 786689, metadata !1076, metadata !"wOffset", metadata !731, i32 50331832, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!1084 = metadata !{i32 786689, metadata !1076, metadata !"hOffset", metadata !731, i32 67109049, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!1085 = metadata !{i32 786689, metadata !1076, metadata !"count", metadata !731, i32 83886265, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!1086 = metadata !{i32 786689, metadata !1076, metadata !"kind", metadata !731, i32 100663481, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!1087 = metadata !{i32 786689, metadata !1076, metadata !"stream", metadata !731, i32 117440698, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!1088 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !731, i32 190, metadata !1089, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i6
!1089 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1090, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1090 = metadata !{metadata !734, metadata !467, metadata !608, metadata !747, metadata !747, metadata !727}
!1091 = metadata !{metadata !1092}
!1092 = metadata !{metadata !1093, metadata !1094, metadata !1095, metadata !1096, metadata !1097}
!1093 = metadata !{i32 786689, metadata !1088, metadata !"dst", metadata !731, i32 16777406, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!1094 = metadata !{i32 786689, metadata !1088, metadata !"symbol", metadata !731, i32 33554622, metadata !608, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!1095 = metadata !{i32 786689, metadata !1088, metadata !"count", metadata !731, i32 50331838, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!1096 = metadata !{i32 786689, metadata !1088, metadata !"offset", metadata !731, i32 67109055, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!1097 = metadata !{i32 786689, metadata !1088, metadata !"kind", metadata !731, i32 83886271, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!1098 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !731, i32 195, metadata !1099, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8
!1099 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1100, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1100 = metadata !{metadata !734, metadata !467, metadata !608, metadata !747, metadata !747, metadata !727, metadata !918}
!1101 = metadata !{metadata !1102}
!1102 = metadata !{metadata !1103, metadata !1104, metadata !1105, metadata !1106, metadata !1107, metadata !1108}
!1103 = metadata !{i32 786689, metadata !1098, metadata !"dst", metadata !731, i32 16777411, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!1104 = metadata !{i32 786689, metadata !1098, metadata !"symbol", metadata !731, i32 33554627, metadata !608, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!1105 = metadata !{i32 786689, metadata !1098, metadata !"count", metadata !731, i32 50331843, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!1106 = metadata !{i32 786689, metadata !1098, metadata !"offset", metadata !731, i32 67109060, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!1107 = metadata !{i32 786689, metadata !1098, metadata !"kind", metadata !731, i32 83886276, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!1108 = metadata !{i32 786689, metadata !1098, metadata !"stream", metadata !731, i32 100663493, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!1109 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !731, i32 201, metadata !1110, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cu
!1110 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1111, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1111 = metadata !{metadata !734, metadata !467, metadata !106, metadata !597, metadata !106, metadata !747}
!1112 = metadata !{metadata !1113}
!1113 = metadata !{metadata !1114, metadata !1115, metadata !1116, metadata !1117, metadata !1118}
!1114 = metadata !{i32 786689, metadata !1109, metadata !"dst", metadata !731, i32 16777417, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!1115 = metadata !{i32 786689, metadata !1109, metadata !"dstDevice", metadata !731, i32 33554633, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!1116 = metadata !{i32 786689, metadata !1109, metadata !"src", metadata !731, i32 50331849, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!1117 = metadata !{i32 786689, metadata !1109, metadata !"srcDevice", metadata !731, i32 67109065, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!1118 = metadata !{i32 786689, metadata !1109, metadata !"count", metadata !731, i32 83886281, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!1119 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !731, i32 206, metadata !1120, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32,
!1120 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1121, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1121 = metadata !{metadata !734, metadata !467, metadata !106, metadata !597, metadata !106, metadata !747, metadata !918}
!1122 = metadata !{metadata !1123}
!1123 = metadata !{metadata !1124, metadata !1125, metadata !1126, metadata !1127, metadata !1128, metadata !1129}
!1124 = metadata !{i32 786689, metadata !1119, metadata !"dst", metadata !731, i32 16777422, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!1125 = metadata !{i32 786689, metadata !1119, metadata !"dstDevice", metadata !731, i32 33554638, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!1126 = metadata !{i32 786689, metadata !1119, metadata !"src", metadata !731, i32 50331854, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!1127 = metadata !{i32 786689, metadata !1119, metadata !"srcDevice", metadata !731, i32 67109070, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!1128 = metadata !{i32 786689, metadata !1119, metadata !"count", metadata !731, i32 83886287, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!1129 = metadata !{i32 786689, metadata !1119, metadata !"stream", metadata !731, i32 100663503, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!1130 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !731, i32 212, metadata !1131, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64
!1131 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1132, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1132 = metadata !{metadata !734, metadata !750, metadata !747, metadata !747, metadata !597, metadata !747, metadata !727}
!1133 = metadata !{metadata !1134}
!1134 = metadata !{metadata !1135, metadata !1136, metadata !1137, metadata !1138, metadata !1139, metadata !1140}
!1135 = metadata !{i32 786689, metadata !1130, metadata !"dst", metadata !731, i32 16777428, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!1136 = metadata !{i32 786689, metadata !1130, metadata !"wOffset", metadata !731, i32 33554644, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!1137 = metadata !{i32 786689, metadata !1130, metadata !"hOffset", metadata !731, i32 50331860, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!1138 = metadata !{i32 786689, metadata !1130, metadata !"src", metadata !731, i32 67109077, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!1139 = metadata !{i32 786689, metadata !1130, metadata !"count", metadata !731, i32 83886293, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!1140 = metadata !{i32 786689, metadata !1130, metadata !"kind", metadata !731, i32 100663509, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!1141 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !731, i32 217, metadata !1142, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaA
!1142 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1143, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1143 = metadata !{metadata !734, metadata !750, metadata !747, metadata !747, metadata !597, metadata !747, metadata !727, metadata !918}
!1144 = metadata !{metadata !1145}
!1145 = metadata !{metadata !1146, metadata !1147, metadata !1148, metadata !1149, metadata !1150, metadata !1151, metadata !1152}
!1146 = metadata !{i32 786689, metadata !1141, metadata !"dst", metadata !731, i32 16777433, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!1147 = metadata !{i32 786689, metadata !1141, metadata !"wOffset", metadata !731, i32 33554649, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!1148 = metadata !{i32 786689, metadata !1141, metadata !"hOffset", metadata !731, i32 50331865, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!1149 = metadata !{i32 786689, metadata !1141, metadata !"src", metadata !731, i32 67109082, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!1150 = metadata !{i32 786689, metadata !1141, metadata !"count", metadata !731, i32 83886298, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!1151 = metadata !{i32 786689, metadata !1141, metadata !"kind", metadata !731, i32 100663514, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!1152 = metadata !{i32 786689, metadata !1141, metadata !"stream", metadata !731, i32 117440731, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!1153 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !731, i32 223, metadata !1154, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i
!1154 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1155, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1155 = metadata !{metadata !734, metadata !410, metadata !597, metadata !747, metadata !747, metadata !727}
!1156 = metadata !{metadata !1157}
!1157 = metadata !{metadata !1158, metadata !1159, metadata !1160, metadata !1161, metadata !1162}
!1158 = metadata !{i32 786689, metadata !1153, metadata !"symbol", metadata !731, i32 16777439, metadata !410, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!1159 = metadata !{i32 786689, metadata !1153, metadata !"src", metadata !731, i32 33554655, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!1160 = metadata !{i32 786689, metadata !1153, metadata !"count", metadata !731, i32 50331871, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!1161 = metadata !{i32 786689, metadata !1153, metadata !"offset", metadata !731, i32 67109088, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!1162 = metadata !{i32 786689, metadata !1153, metadata !"kind", metadata !731, i32 83886304, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!1163 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !731, i32 229, metadata !1164, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i
!1164 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1165, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1165 = metadata !{metadata !734, metadata !608, metadata !597, metadata !747, metadata !747, metadata !727, metadata !918}
!1166 = metadata !{metadata !1167}
!1167 = metadata !{metadata !1168, metadata !1169, metadata !1170, metadata !1171, metadata !1172, metadata !1173}
!1168 = metadata !{i32 786689, metadata !1163, metadata !"symbol", metadata !731, i32 16777445, metadata !608, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!1169 = metadata !{i32 786689, metadata !1163, metadata !"src", metadata !731, i32 33554661, metadata !597, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!1170 = metadata !{i32 786689, metadata !1163, metadata !"count", metadata !731, i32 50331877, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!1171 = metadata !{i32 786689, metadata !1163, metadata !"offset", metadata !731, i32 67109093, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!1172 = metadata !{i32 786689, metadata !1163, metadata !"kind", metadata !731, i32 83886310, metadata !727, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!1173 = metadata !{i32 786689, metadata !1163, metadata !"stream", metadata !731, i32 100663526, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!1174 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !731, i32 234, metadata !1175, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo,
!1175 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1176, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1176 = metadata !{metadata !734, metadata !785, metadata !785}
!1177 = metadata !{metadata !1178}
!1178 = metadata !{metadata !1179, metadata !1180}
!1179 = metadata !{i32 786689, metadata !1174, metadata !"free", metadata !731, i32 16777450, metadata !785, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!1180 = metadata !{i32 786689, metadata !1174, metadata !"total", metadata !731, i32 33554666, metadata !785, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!1181 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !731, i32 238, metadata !1182, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, nu
!1182 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1183, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1183 = metadata !{metadata !734, metadata !467, metadata !106, metadata !747}
!1184 = metadata !{metadata !1185}
!1185 = metadata !{metadata !1186, metadata !1187, metadata !1188}
!1186 = metadata !{i32 786689, metadata !1181, metadata !"devPtr", metadata !731, i32 16777454, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!1187 = metadata !{i32 786689, metadata !1181, metadata !"value", metadata !731, i32 33554670, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!1188 = metadata !{i32 786689, metadata !1181, metadata !"count", metadata !731, i32 50331886, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!1189 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !731, i32 243, metadata !1190, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMe
!1190 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1191, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1191 = metadata !{metadata !734, metadata !467, metadata !747, metadata !106, metadata !747, metadata !747}
!1192 = metadata !{metadata !1193}
!1193 = metadata !{metadata !1194, metadata !1195, metadata !1196, metadata !1197, metadata !1198}
!1194 = metadata !{i32 786689, metadata !1189, metadata !"devPtr", metadata !731, i32 16777459, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!1195 = metadata !{i32 786689, metadata !1189, metadata !"pitch", metadata !731, i32 33554675, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!1196 = metadata !{i32 786689, metadata !1189, metadata !"value", metadata !731, i32 50331891, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!1197 = metadata !{i32 786689, metadata !1189, metadata !"width", metadata !731, i32 67109108, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!1198 = metadata !{i32 786689, metadata !1189, metadata !"height", metadata !731, i32 83886324, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!1199 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !731, i32 248, metadata !1200, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64
!1200 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1201, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1201 = metadata !{metadata !734, metadata !467, metadata !747, metadata !106, metadata !747, metadata !747, metadata !918}
!1202 = metadata !{metadata !1203}
!1203 = metadata !{metadata !1204, metadata !1205, metadata !1206, metadata !1207, metadata !1208, metadata !1209}
!1204 = metadata !{i32 786689, metadata !1199, metadata !"devPtr", metadata !731, i32 16777464, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!1205 = metadata !{i32 786689, metadata !1199, metadata !"pitch", metadata !731, i32 33554680, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!1206 = metadata !{i32 786689, metadata !1199, metadata !"value", metadata !731, i32 50331896, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!1207 = metadata !{i32 786689, metadata !1199, metadata !"width", metadata !731, i32 67109113, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!1208 = metadata !{i32 786689, metadata !1199, metadata !"height", metadata !731, i32 83886329, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!1209 = metadata !{i32 786689, metadata !1199, metadata !"stream", metadata !731, i32 100663545, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!1210 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !731, i32 253, metadata !1211, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %st
!1211 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1212, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1212 = metadata !{metadata !734, metadata !836, metadata !106, metadata !744}
!1213 = metadata !{metadata !1214}
!1214 = metadata !{metadata !1215, metadata !1216, metadata !1217}
!1215 = metadata !{i32 786689, metadata !1210, metadata !"pitchedDevPtr", metadata !731, i32 16777469, metadata !836, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!1216 = metadata !{i32 786689, metadata !1210, metadata !"value", metadata !731, i32 33554685, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!1217 = metadata !{i32 786689, metadata !1210, metadata !"extent", metadata !731, i32 50331902, metadata !744, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!1218 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !731, i32 258, metadata !1219, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*
!1219 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1220, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1220 = metadata !{metadata !734, metadata !836, metadata !106, metadata !744, metadata !918}
!1221 = metadata !{metadata !1222}
!1222 = metadata !{metadata !1223, metadata !1224, metadata !1225, metadata !1226}
!1223 = metadata !{i32 786689, metadata !1218, metadata !"pitchedDevPtr", metadata !731, i32 16777474, metadata !836, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!1224 = metadata !{i32 786689, metadata !1218, metadata !"value", metadata !731, i32 33554690, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!1225 = metadata !{i32 786689, metadata !1218, metadata !"extent", metadata !731, i32 50331907, metadata !744, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!1226 = metadata !{i32 786689, metadata !1218, metadata !"stream", metadata !731, i32 67109123, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!1227 = metadata !{i32 786478, i32 0, metadata !731, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !731, i32 263, metadata !1228, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUst
!1228 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1229, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1229 = metadata !{metadata !734, metadata !467, metadata !106, metadata !747, metadata !918}
!1230 = metadata !{metadata !1231}
!1231 = metadata !{metadata !1232, metadata !1233, metadata !1234, metadata !1235}
!1232 = metadata !{i32 786689, metadata !1227, metadata !"devPtr", metadata !731, i32 16777479, metadata !467, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!1233 = metadata !{i32 786689, metadata !1227, metadata !"value", metadata !731, i32 33554695, metadata !106, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!1234 = metadata !{i32 786689, metadata !1227, metadata !"count", metadata !731, i32 50331911, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!1235 = metadata !{i32 786689, metadata !1227, metadata !"stream", metadata !731, i32 67109127, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!1236 = metadata !{i32 17, i32 0, metadata !22, null}
!1237 = metadata !{metadata !"int", metadata !1238}
!1238 = metadata !{metadata !"omnipotent char", metadata !1239}
!1239 = metadata !{metadata !"Simple C/C++ TBAA"}
!1240 = metadata !{i32 21, i32 0, metadata !22, null}
!1241 = metadata !{i32 22, i32 0, metadata !22, null}
!1242 = metadata !{i32 26, i32 0, metadata !27, null}
!1243 = metadata !{i32 29, i32 0, metadata !29, null}
!1244 = metadata !{i32 28, i32 0, metadata !29, null}
!1245 = metadata !{i32 30, i32 0, metadata !29, null}
!1246 = metadata !{i32 32, i32 0, metadata !29, null}
!1247 = metadata !{i32 33, i32 0, metadata !29, null}
!1248 = metadata !{i32 34, i32 0, metadata !29, null}
!1249 = metadata !{i32 35, i32 0, metadata !29, null}
!1250 = metadata !{i32 42, i32 0, metadata !29, null}
!1251 = metadata !{i32 44, i32 0, metadata !29, null}
!1252 = metadata !{i32 48, i32 0, metadata !79, null}
!1253 = metadata !{i32 86, i32 0, metadata !111, null}
!1254 = metadata !{i32 50, i32 0, metadata !81, null}
!1255 = metadata !{i32 63, i32 0, metadata !108, null}
!1256 = metadata !{i32 51, i32 0, metadata !81, null}
!1257 = metadata !{i32 61, i32 0, metadata !105, null}
!1258 = metadata !{i32 64, i32 0, metadata !108, null}
!1259 = metadata !{i32 65, i32 0, metadata !108, null}
!1260 = metadata !{i32 66, i32 0, metadata !108, null}
!1261 = metadata !{i32 67, i32 0, metadata !108, null}
!1262 = metadata !{i32 8137, i32 0, metadata !1263, metadata !1264}
!1263 = metadata !{i32 786443, metadata !115, i32 8136, i32 0, metadata !116, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan//home/sawaya/Gklee/Gklee/include/cuda/math_functions.h]
!1264 = metadata !{i32 70, i32 0, metadata !81, null}
!1265 = metadata !{i32 8137, i32 0, metadata !1263, metadata !1266}
!1266 = metadata !{i32 71, i32 0, metadata !81, null}
!1267 = metadata !{i32 8137, i32 0, metadata !1263, metadata !1268}
!1268 = metadata !{i32 72, i32 0, metadata !81, null}
!1269 = metadata !{i32 8137, i32 0, metadata !1263, metadata !1270}
!1270 = metadata !{i32 73, i32 0, metadata !81, null}
!1271 = metadata !{i32 80, i32 0, metadata !81, null}
!1272 = metadata !{i32 82, i32 0, metadata !81, null}
!1273 = metadata !{i32 88, i32 0, metadata !113, null}
!1274 = metadata !{i32 89, i32 0, metadata !113, null}
!1275 = metadata !{i32 91, i32 0, metadata !113, null}
!1276 = metadata !{i32 92, i32 0, metadata !113, null}
!1277 = metadata !{i32 93, i32 0, metadata !113, null}
!1278 = metadata !{i32 94, i32 0, metadata !113, null}
!1279 = metadata !{i32 101, i32 0, metadata !113, null}
!1280 = metadata !{i32 103, i32 0, metadata !113, null}
!1281 = metadata !{i32 105, i32 0, metadata !22, null}
!1282 = metadata !{i32 13, i32 0, metadata !164, null}
!1283 = metadata !{i32 14, i32 0, metadata !164, null}
!1284 = metadata !{i32 15, i32 0, metadata !164, null}
!1285 = metadata !{i32 17, i32 0, metadata !164, null}
!1286 = metadata !{i32 25, i32 0, metadata !164, null}
!1287 = metadata !{i32 26, i32 0, metadata !164, null}
!1288 = metadata !{i32 35, i32 0, metadata !200, null}
!1289 = metadata !{i32 37, i32 0, metadata !200, null}
!1290 = metadata !{i32 39, i32 0, metadata !200, null}
!1291 = metadata !{i32 40, i32 0, metadata !200, null}
!1292 = metadata !{i32 57, i32 0, metadata !208, null}
!1293 = metadata !{i32 43, i32 0, metadata !206, null}
!1294 = metadata !{i32 45, i32 0, metadata !208, null}
!1295 = metadata !{i32 47, i32 0, metadata !208, null}
!1296 = metadata !{i32 13, i32 0, metadata !164, metadata !1295}
!1297 = metadata !{i32 14, i32 0, metadata !164, metadata !1295}
!1298 = metadata !{i32 15, i32 0, metadata !164, metadata !1295}
!1299 = metadata !{i32 17, i32 0, metadata !164, metadata !1295}
!1300 = metadata !{i32 25, i32 0, metadata !164, metadata !1295}
!1301 = metadata !{i32 58, i32 0, metadata !208, null}
!1302 = metadata !{i32 52, i32 0, metadata !208, null}
!1303 = metadata !{i32 13, i32 0, metadata !164, metadata !1302}
!1304 = metadata !{i32 14, i32 0, metadata !164, metadata !1302}
!1305 = metadata !{i32 15, i32 0, metadata !164, metadata !1302}
!1306 = metadata !{i32 17, i32 0, metadata !164, metadata !1302}
!1307 = metadata !{i32 25, i32 0, metadata !164, metadata !1302}
!1308 = metadata !{i32 60, i32 0, metadata !200, null}
!1309 = metadata !{i32 14, i32 0, metadata !245, null}
!1310 = metadata !{i32 20, i32 0, metadata !245, null}
!1311 = metadata !{i32 22, i32 0, metadata !250, null}
!1312 = metadata !{i32 23, i32 0, metadata !250, null}
!1313 = metadata !{i32 24, i32 0, metadata !250, null}
!1314 = metadata !{i32 26, i32 0, metadata !250, null}
!1315 = metadata !{i32 27, i32 0, metadata !250, null}
!1316 = metadata !{i32 28, i32 0, metadata !250, null}
!1317 = metadata !{i32 30, i32 0, metadata !250, null}
!1318 = metadata !{i32 32, i32 0, metadata !1319, null}
!1319 = metadata !{i32 786443, metadata !250, i32 31, i32 0, metadata !213, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!1320 = metadata !{i32 103, i32 0, metadata !1321, metadata !1318}
!1321 = metadata !{i32 786443, metadata !335, i32 102, i32 0, metadata !336, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan//home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_functions.h]
!1322 = metadata !{i32 33, i32 0, metadata !1319, null}
!1323 = metadata !{i32 35, i32 0, metadata !245, null}
!1324 = metadata !{i32 43, i32 0, metadata !269, null}
!1325 = metadata !{i32 44, i32 0, metadata !269, null}
!1326 = metadata !{i32 45, i32 0, metadata !269, null}
!1327 = metadata !{i32 49, i32 0, metadata !269, null}
!1328 = metadata !{i32 52, i32 0, metadata !274, null}
!1329 = metadata !{i32 53, i32 0, metadata !274, null}
!1330 = metadata !{i32 103, i32 0, metadata !1321, metadata !1329}
!1331 = metadata !{i32 56, i32 0, metadata !274, null}
!1332 = metadata !{i32 59, i32 0, metadata !274, null}
!1333 = metadata !{i32 63, i32 0, metadata !278, null}
!1334 = metadata !{i32 65, i32 0, metadata !278, null}
!1335 = metadata !{i32 66, i32 0, metadata !278, null}
!1336 = metadata !{i32 67, i32 0, metadata !278, null}
!1337 = metadata !{i32 73, i32 0, metadata !278, null}
!1338 = metadata !{i32 74, i32 0, metadata !278, null}
!1339 = metadata !{i32 75, i32 0, metadata !278, null}
!1340 = metadata !{i32 78, i32 0, metadata !278, null}
!1341 = metadata !{i32 79, i32 0, metadata !278, null}
!1342 = metadata !{i32 77, i32 0, metadata !278, null}
!1343 = metadata !{i32 86, i32 0, metadata !278, null}
!1344 = metadata !{i32 85, i32 0, metadata !278, null}
!1345 = metadata !{i32 87, i32 0, metadata !278, null}
!1346 = metadata !{i32 89, i32 0, metadata !278, null}
!1347 = metadata !{i32 103, i32 0, metadata !1321, metadata !1346}
!1348 = metadata !{i32 90, i32 0, metadata !278, null}
!1349 = metadata !{i32 103, i32 0, metadata !1321, metadata !1348}
!1350 = metadata !{i32 91, i32 0, metadata !278, null}
!1351 = metadata !{i32 103, i32 0, metadata !1321, metadata !1350}
!1352 = metadata !{i32 92, i32 0, metadata !278, null}
!1353 = metadata !{i32 103, i32 0, metadata !1321, metadata !1352}
!1354 = metadata !{i32 95, i32 0, metadata !269, null}
!1355 = metadata !{i32 99, i32 0, metadata !298, null}
!1356 = metadata !{i32 101, i32 0, metadata !1357, null}
!1357 = metadata !{i32 786443, metadata !298, i32 100, i32 0, metadata !213, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!1358 = metadata !{i32 103, i32 0, metadata !299, null}
!1359 = metadata !{i32 107, i32 0, metadata !308, null}
!1360 = metadata !{i32 109, i32 0, metadata !1361, null}
!1361 = metadata !{i32 786443, metadata !308, i32 108, i32 0, metadata !213, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_main.cpp]
!1362 = metadata !{i32 111, i32 0, metadata !309, null}
!1363 = metadata !{i32 128, i32 0, metadata !326, null}
!1364 = metadata !{i32 129, i32 0, metadata !326, null}
!1365 = metadata !{i32 99, i32 0, metadata !298, metadata !1366}
!1366 = metadata !{i32 131, i32 0, metadata !326, null}
!1367 = metadata !{i32 101, i32 0, metadata !1357, metadata !1366}
!1368 = metadata !{i32 132, i32 0, metadata !326, null}
!1369 = metadata !{i32 134, i32 0, metadata !326, null}
!1370 = metadata !{i32 137, i32 0, metadata !330, null}
!1371 = metadata !{i32 161, i32 0, metadata !333, null}
!1372 = metadata !{i32 140, i32 0, metadata !329, null}
!1373 = metadata !{i32 141, i32 0, metadata !329, null}
!1374 = metadata !{i32 43, i32 0, metadata !269, metadata !1375}
!1375 = metadata !{i32 144, i32 0, metadata !329, null}
!1376 = metadata !{i32 44, i32 0, metadata !269, metadata !1375}
!1377 = metadata !{i32 45, i32 0, metadata !269, metadata !1375}
!1378 = metadata !{i32 49, i32 0, metadata !269, metadata !1375}
!1379 = metadata !{i32 52, i32 0, metadata !274, metadata !1375}
!1380 = metadata !{i32 53, i32 0, metadata !274, metadata !1375}
!1381 = metadata !{i32 103, i32 0, metadata !1321, metadata !1380}
!1382 = metadata !{i32 56, i32 0, metadata !274, metadata !1375}
!1383 = metadata !{i32 59, i32 0, metadata !274, metadata !1375}
!1384 = metadata !{i32 63, i32 0, metadata !278, metadata !1375}
!1385 = metadata !{i32 65, i32 0, metadata !278, metadata !1375}
!1386 = metadata !{i32 66, i32 0, metadata !278, metadata !1375}
!1387 = metadata !{i32 67, i32 0, metadata !278, metadata !1375}
!1388 = metadata !{i32 73, i32 0, metadata !278, metadata !1375}
!1389 = metadata !{i32 74, i32 0, metadata !278, metadata !1375}
!1390 = metadata !{i32 75, i32 0, metadata !278, metadata !1375}
!1391 = metadata !{i32 78, i32 0, metadata !278, metadata !1375}
!1392 = metadata !{i32 79, i32 0, metadata !278, metadata !1375}
!1393 = metadata !{i32 77, i32 0, metadata !278, metadata !1375}
!1394 = metadata !{i32 86, i32 0, metadata !278, metadata !1375}
!1395 = metadata !{i32 85, i32 0, metadata !278, metadata !1375}
!1396 = metadata !{i32 87, i32 0, metadata !278, metadata !1375}
!1397 = metadata !{i32 89, i32 0, metadata !278, metadata !1375}
!1398 = metadata !{i32 103, i32 0, metadata !1321, metadata !1397}
!1399 = metadata !{i32 90, i32 0, metadata !278, metadata !1375}
!1400 = metadata !{i32 103, i32 0, metadata !1321, metadata !1399}
!1401 = metadata !{i32 91, i32 0, metadata !278, metadata !1375}
!1402 = metadata !{i32 103, i32 0, metadata !1321, metadata !1401}
!1403 = metadata !{i32 92, i32 0, metadata !278, metadata !1375}
!1404 = metadata !{i32 103, i32 0, metadata !1321, metadata !1403}
!1405 = metadata !{i32 14, i32 0, metadata !245, metadata !1406}
!1406 = metadata !{i32 150, i32 0, metadata !329, null}
!1407 = metadata !{i32 20, i32 0, metadata !245, metadata !1406}
!1408 = metadata !{i32 22, i32 0, metadata !250, metadata !1406}
!1409 = metadata !{i32 23, i32 0, metadata !250, metadata !1406}
!1410 = metadata !{i32 24, i32 0, metadata !250, metadata !1406}
!1411 = metadata !{i32 26, i32 0, metadata !250, metadata !1406}
!1412 = metadata !{i32 27, i32 0, metadata !250, metadata !1406}
!1413 = metadata !{i32 28, i32 0, metadata !250, metadata !1406}
!1414 = metadata !{i32 30, i32 0, metadata !250, metadata !1406}
!1415 = metadata !{i32 32, i32 0, metadata !1319, metadata !1406}
!1416 = metadata !{i32 103, i32 0, metadata !1321, metadata !1415}
!1417 = metadata !{i32 33, i32 0, metadata !1319, metadata !1406}
!1418 = metadata !{i32 164, i32 0, metadata !332, null}
!1419 = metadata !{i32 165, i32 0, metadata !332, null}
!1420 = metadata !{i32 43, i32 0, metadata !269, metadata !1421}
!1421 = metadata !{i32 168, i32 0, metadata !332, null}
!1422 = metadata !{i32 44, i32 0, metadata !269, metadata !1421}
!1423 = metadata !{i32 45, i32 0, metadata !269, metadata !1421}
!1424 = metadata !{i32 49, i32 0, metadata !269, metadata !1421}
!1425 = metadata !{i32 52, i32 0, metadata !274, metadata !1421}
!1426 = metadata !{i32 53, i32 0, metadata !274, metadata !1421}
!1427 = metadata !{i32 103, i32 0, metadata !1321, metadata !1426}
!1428 = metadata !{i32 56, i32 0, metadata !274, metadata !1421}
!1429 = metadata !{i32 59, i32 0, metadata !274, metadata !1421}
!1430 = metadata !{i32 63, i32 0, metadata !278, metadata !1421}
!1431 = metadata !{i32 65, i32 0, metadata !278, metadata !1421}
!1432 = metadata !{i32 66, i32 0, metadata !278, metadata !1421}
!1433 = metadata !{i32 67, i32 0, metadata !278, metadata !1421}
!1434 = metadata !{i32 73, i32 0, metadata !278, metadata !1421}
!1435 = metadata !{i32 74, i32 0, metadata !278, metadata !1421}
!1436 = metadata !{i32 75, i32 0, metadata !278, metadata !1421}
!1437 = metadata !{i32 78, i32 0, metadata !278, metadata !1421}
!1438 = metadata !{i32 79, i32 0, metadata !278, metadata !1421}
!1439 = metadata !{i32 77, i32 0, metadata !278, metadata !1421}
!1440 = metadata !{i32 86, i32 0, metadata !278, metadata !1421}
!1441 = metadata !{i32 85, i32 0, metadata !278, metadata !1421}
!1442 = metadata !{i32 87, i32 0, metadata !278, metadata !1421}
!1443 = metadata !{i32 89, i32 0, metadata !278, metadata !1421}
!1444 = metadata !{i32 103, i32 0, metadata !1321, metadata !1443}
!1445 = metadata !{i32 90, i32 0, metadata !278, metadata !1421}
!1446 = metadata !{i32 103, i32 0, metadata !1321, metadata !1445}
!1447 = metadata !{i32 91, i32 0, metadata !278, metadata !1421}
!1448 = metadata !{i32 103, i32 0, metadata !1321, metadata !1447}
!1449 = metadata !{i32 92, i32 0, metadata !278, metadata !1421}
!1450 = metadata !{i32 103, i32 0, metadata !1321, metadata !1449}
!1451 = metadata !{i32 178, i32 0, metadata !326, null}
!1452 = metadata !{i32 180, i32 0, metadata !326, null}
!1453 = metadata !{i32 181, i32 0, metadata !326, null}
!1454 = metadata !{i32 107, i32 0, metadata !308, metadata !1453}
!1455 = metadata !{i32 109, i32 0, metadata !1361, metadata !1453}
!1456 = metadata !{i32 182, i32 0, metadata !326, null}
!1457 = metadata !{i32 14, i32 0, metadata !362, null}
!1458 = metadata !{i32 15, i32 0, metadata !362, null}
!1459 = metadata !{i32 16, i32 0, metadata !362, null}
!1460 = metadata !{i32 21, i32 0, metadata !362, null}
!1461 = metadata !{metadata !"brprop"}
!1462 = metadata !{i32 27, i32 0, metadata !362, null}
!1463 = metadata !{metadata !"float", metadata !1238}
!1464 = metadata !{i32 32, i32 0, metadata !362, null}
!1465 = metadata !{i32 24, i32 0, metadata !1466, null}
!1466 = metadata !{i32 786443, metadata !362, i32 21, i32 0, metadata !353, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!1467 = metadata !{i32 22, i32 0, metadata !1466, null}
!1468 = metadata !{i32 23, i32 0, metadata !1466, null}
!1469 = metadata !{i32 26, i32 0, metadata !362, null}
!1470 = metadata !{i32 34, i32 0, metadata !1471, null}
!1471 = metadata !{i32 786443, metadata !362, i32 32, i32 0, metadata !353, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!1472 = metadata !{i32 33, i32 0, metadata !1471, null}
!1473 = metadata !{i32 36, i32 0, metadata !362, null}
!1474 = metadata !{i32 37, i32 0, metadata !362, null}
!1475 = metadata !{i32 50, i32 0, metadata !1476, null}
!1476 = metadata !{i32 786443, metadata !371, i32 49, i32 0, metadata !353, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!1477 = metadata !{i32 51, i32 0, metadata !1476, null}
!1478 = metadata !{i32 51, i32 0, metadata !1479, null}
!1479 = metadata !{i32 786443, metadata !1476, i32 51, i32 0, metadata !353, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!1480 = metadata !{i32 56, i32 0, metadata !1481, null}
!1481 = metadata !{i32 786443, metadata !362, i32 56, i32 0, metadata !353, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!1482 = metadata !{i32 60, i32 0, metadata !362, null}
!1483 = metadata !{i32 60, i32 0, metadata !1484, null}
!1484 = metadata !{i32 786443, metadata !362, i32 60, i32 0, metadata !353, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!1485 = metadata !{i32 64, i32 0, metadata !362, null}
!1486 = metadata !{i32 64, i32 0, metadata !1487, null}
!1487 = metadata !{i32 786443, metadata !362, i32 64, i32 0, metadata !353, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!1488 = metadata !{i32 68, i32 0, metadata !362, null}
!1489 = metadata !{i32 68, i32 0, metadata !1490, null}
!1490 = metadata !{i32 786443, metadata !362, i32 68, i32 0, metadata !353, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/histo_prescan.cpp]
!1491 = metadata !{i32 72, i32 0, metadata !362, null}
!1492 = metadata !{i32 73, i32 0, metadata !373, null}
!1493 = metadata !{i32 74, i32 0, metadata !373, null}
!1494 = metadata !{i32 75, i32 0, metadata !373, null}
!1495 = metadata !{i32 76, i32 0, metadata !373, null}
!1496 = metadata !{i32 81, i32 0, metadata !373, null}
!1497 = metadata !{i32 138, i32 0, metadata !1498, metadata !1496}
!1498 = metadata !{i32 786443, metadata !380, i32 137, i32 0, metadata !336, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan//home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_functions.h]
!1499 = metadata !{i32 82, i32 0, metadata !373, null}
!1500 = metadata !{i32 148, i32 0, metadata !1501, metadata !1499}
!1501 = metadata !{i32 786443, metadata !375, i32 147, i32 0, metadata !336, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan//home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_functions.h]
!1502 = metadata !{i32 83, i32 0, metadata !373, null}
!1503 = metadata !{i32 84, i32 0, metadata !362, null}
!1504 = metadata !{i32 56, i32 0, metadata !362, null}
!1505 = metadata !{i32 134, i32 0, metadata !522, null}
!1506 = metadata !{i32 81, i32 0, metadata !417, null}
!1507 = metadata !{i32 84, i32 0, metadata !417, null}
!1508 = metadata !{i32 85, i32 0, metadata !417, null}
!1509 = metadata !{i32 86, i32 0, metadata !417, null}
!1510 = metadata !{i32 87, i32 0, metadata !417, null}
!1511 = metadata !{i32 89, i32 0, metadata !417, null}
!1512 = metadata !{i32 90, i32 0, metadata !1513, null}
!1513 = metadata !{i32 786443, metadata !417, i32 89, i32 0, metadata !406, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/main.cpp]
!1514 = metadata !{metadata !"any pointer", metadata !1238}
!1515 = metadata !{i32 91, i32 0, metadata !1513, null}
!1516 = metadata !{i32 94, i32 0, metadata !417, null}
!1517 = metadata !{i32 96, i32 0, metadata !417, null}
!1518 = metadata !{i32 97, i32 0, metadata !417, null}
!1519 = metadata !{i32 99, i32 0, metadata !417, null}
!1520 = metadata !{i32 101, i32 0, metadata !417, null}
!1521 = metadata !{i32 103, i32 0, metadata !417, null}
!1522 = metadata !{i32 104, i32 0, metadata !1523, null}
!1523 = metadata !{i32 786443, metadata !417, i32 103, i32 0, metadata !406, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/main.cpp]
!1524 = metadata !{i32 105, i32 0, metadata !1523, null}
!1525 = metadata !{i32 108, i32 0, metadata !417, null}
!1526 = metadata !{i32 117, i32 0, metadata !417, null}
!1527 = metadata !{i32 118, i32 0, metadata !417, null}
!1528 = metadata !{i32 119, i32 0, metadata !417, null}
!1529 = metadata !{i32 120, i32 0, metadata !417, null}
!1530 = metadata !{i32 121, i32 0, metadata !417, null}
!1531 = metadata !{i32 122, i32 0, metadata !417, null}
!1532 = metadata !{i32 123, i32 0, metadata !417, null}
!1533 = metadata !{i32 125, i32 0, metadata !417, null}
!1534 = metadata !{i32 127, i32 0, metadata !518, null}
!1535 = metadata !{i32 128, i32 0, metadata !1536, null}
!1536 = metadata !{i32 786443, metadata !518, i32 127, i32 0, metadata !406, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/main.cpp]
!1537 = metadata !{i32 136, i32 0, metadata !522, null}
!1538 = metadata !{i32 145, i32 0, metadata !1539, null}
!1539 = metadata !{i32 786443, metadata !522, i32 143, i32 0, metadata !406, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/histo/histo_prescan/main.cpp]
!1540 = metadata !{i32 141, i32 0, metadata !522, null}
!1541 = metadata !{i32 143, i32 0, metadata !1539, null}
!1542 = metadata !{i32 150, i32 0, metadata !522, null}
!1543 = metadata !{i32 153, i32 0, metadata !522, null}
!1544 = metadata !{i32 214, i32 0, metadata !417, null}
!1545 = metadata !{i32 216, i32 0, metadata !417, null}
!1546 = metadata !{i32 217, i32 0, metadata !417, null}
!1547 = metadata !{i32 218, i32 0, metadata !417, null}
!1548 = metadata !{i32 219, i32 0, metadata !417, null}
!1549 = metadata !{i32 220, i32 0, metadata !417, null}
!1550 = metadata !{i32 221, i32 0, metadata !417, null}
!1551 = metadata !{i32 222, i32 0, metadata !417, null}
!1552 = metadata !{i32 228, i32 0, metadata !417, null}
!1553 = metadata !{i32 229, i32 0, metadata !417, null}
!1554 = metadata !{i32 233, i32 0, metadata !417, null}
!1555 = metadata !{i32 239, i32 0, metadata !417, null}
!1556 = metadata !{i32 240, i32 0, metadata !417, null}
!1557 = metadata !{i32 13, i32 0, metadata !1558, null}
!1558 = metadata !{i32 786443, metadata !582, i32 12, i32 0, metadata !583, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c]
!1559 = metadata !{i32 14, i32 0, metadata !1558, null}
!1560 = metadata !{i32 15, i32 0, metadata !1558, null}
!1561 = metadata !{i32 16, i32 0, metadata !606, null}
!1562 = metadata !{i32 17, i32 0, metadata !606, null}
!1563 = metadata !{i32 18, i32 0, metadata !606, null}
!1564 = metadata !{i32 14, i32 0, metadata !640, null}
!1565 = metadata !{i32 15, i32 0, metadata !640, null}
!1566 = metadata !{i32 16, i32 0, metadata !640, null}
!1567 = metadata !{i32 26, i32 0, metadata !1568, null}
!1568 = metadata !{i32 786443, metadata !730, i32 25, i32 0, metadata !731, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1569 = metadata !{i32 30, i32 0, metadata !1570, null}
!1570 = metadata !{i32 786443, metadata !758, i32 29, i32 0, metadata !731, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1571 = metadata !{i32 31, i32 0, metadata !1570, null}
!1572 = metadata !{i32 35, i32 0, metadata !1573, null}
!1573 = metadata !{i32 786443, metadata !764, i32 34, i32 0, metadata !731, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1574 = metadata !{i32 36, i32 0, metadata !1573, null}
!1575 = metadata !{i32 40, i32 0, metadata !1576, null}
!1576 = metadata !{i32 786443, metadata !770, i32 39, i32 0, metadata !731, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1577 = metadata !{i32 41, i32 0, metadata !1576, null}
!1578 = metadata !{i32 45, i32 0, metadata !1579, null}
!1579 = metadata !{i32 786443, metadata !774, i32 44, i32 0, metadata !731, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1580 = metadata !{i32 49, i32 0, metadata !1581, null}
!1581 = metadata !{i32 786443, metadata !782, i32 48, i32 0, metadata !731, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1582 = metadata !{i32 53, i32 0, metadata !1583, null}
!1583 = metadata !{i32 786443, metadata !790, i32 52, i32 0, metadata !731, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1584 = metadata !{i32 57, i32 0, metadata !1585, null}
!1585 = metadata !{i32 786443, metadata !798, i32 56, i32 0, metadata !731, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1586 = metadata !{i32 61, i32 0, metadata !1587, null}
!1587 = metadata !{i32 786443, metadata !806, i32 60, i32 0, metadata !731, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1588 = metadata !{i32 65, i32 0, metadata !1589, null}
!1589 = metadata !{i32 786443, metadata !813, i32 64, i32 0, metadata !731, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1590 = metadata !{i32 69, i32 0, metadata !1591, null}
!1591 = metadata !{i32 786443, metadata !821, i32 68, i32 0, metadata !731, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1592 = metadata !{i32 73, i32 0, metadata !1593, null}
!1593 = metadata !{i32 786443, metadata !825, i32 72, i32 0, metadata !731, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1594 = metadata !{i32 74, i32 0, metadata !1593, null}
!1595 = metadata !{i32 75, i32 0, metadata !1593, null}
!1596 = metadata !{i32 77, i32 0, metadata !1593, null}
!1597 = metadata !{i32 81, i32 0, metadata !1598, null}
!1598 = metadata !{i32 786443, metadata !832, i32 80, i32 0, metadata !731, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1599 = metadata !{i32 86, i32 0, metadata !1600, null}
!1600 = metadata !{i32 786443, metadata !846, i32 85, i32 0, metadata !731, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1601 = metadata !{i32 91, i32 0, metadata !1602, null}
!1602 = metadata !{i32 786443, metadata !856, i32 90, i32 0, metadata !731, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1603 = metadata !{i32 95, i32 0, metadata !1604, null}
!1604 = metadata !{i32 786443, metadata !866, i32 94, i32 0, metadata !731, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1605 = metadata !{i32 96, i32 0, metadata !1604, null}
!1606 = metadata !{i32 97, i32 0, metadata !1604, null}
!1607 = metadata !{i32 99, i32 0, metadata !1604, null}
!1608 = metadata !{i32 103, i32 0, metadata !1609, null}
!1609 = metadata !{i32 786443, metadata !871, i32 102, i32 0, metadata !731, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1610 = metadata !{i32 108, i32 0, metadata !1611, null}
!1611 = metadata !{i32 786443, metadata !880, i32 106, i32 0, metadata !731, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1612 = metadata !{i32 113, i32 0, metadata !1613, null}
!1613 = metadata !{i32 786443, metadata !889, i32 112, i32 0, metadata !731, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1614 = metadata !{i32 119, i32 0, metadata !1615, null}
!1615 = metadata !{i32 786443, metadata !901, i32 118, i32 0, metadata !731, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1616 = metadata !{i32 125, i32 0, metadata !1617, null}
!1617 = metadata !{i32 786443, metadata !915, i32 124, i32 0, metadata !731, i32 20} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1618 = metadata !{i32 131, i32 0, metadata !1619, null}
!1619 = metadata !{i32 786443, metadata !931, i32 130, i32 0, metadata !731, i32 21} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1620 = metadata !{i32 137, i32 0, metadata !1621, null}
!1621 = metadata !{i32 786443, metadata !944, i32 136, i32 0, metadata !731, i32 22} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1622 = metadata !{i32 143, i32 0, metadata !1623, null}
!1623 = metadata !{i32 786443, metadata !958, i32 142, i32 0, metadata !731, i32 23} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1624 = metadata !{i32 149, i32 0, metadata !1625, null}
!1625 = metadata !{i32 786443, metadata !971, i32 148, i32 0, metadata !731, i32 24} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1626 = metadata !{i32 153, i32 0, metadata !1627, null}
!1627 = metadata !{i32 786443, metadata !985, i32 152, i32 0, metadata !731, i32 25} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1628 = metadata !{i32 157, i32 0, metadata !1629, null}
!1629 = metadata !{i32 786443, metadata !1009, i32 156, i32 0, metadata !731, i32 26} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1630 = metadata !{i32 161, i32 0, metadata !1631, null}
!1631 = metadata !{i32 786443, metadata !1016, i32 160, i32 0, metadata !731, i32 27} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1632 = metadata !{i32 165, i32 0, metadata !1633, null}
!1633 = metadata !{i32 786443, metadata !1035, i32 164, i32 0, metadata !731, i32 28} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1634 = metadata !{i32 171, i32 0, metadata !1635, null}
!1635 = metadata !{i32 786443, metadata !1042, i32 170, i32 0, metadata !731, i32 29} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1636 = metadata !{i32 176, i32 0, metadata !1637, null}
!1637 = metadata !{i32 786443, metadata !1055, i32 175, i32 0, metadata !731, i32 30} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1638 = metadata !{i32 181, i32 0, metadata !1639, null}
!1639 = metadata !{i32 786443, metadata !1065, i32 180, i32 0, metadata !731, i32 31} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1640 = metadata !{i32 187, i32 0, metadata !1641, null}
!1641 = metadata !{i32 786443, metadata !1076, i32 186, i32 0, metadata !731, i32 32} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1642 = metadata !{i32 192, i32 0, metadata !1643, null}
!1643 = metadata !{i32 786443, metadata !1088, i32 191, i32 0, metadata !731, i32 33} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1644 = metadata !{i32 198, i32 0, metadata !1645, null}
!1645 = metadata !{i32 786443, metadata !1098, i32 197, i32 0, metadata !731, i32 34} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1646 = metadata !{i32 203, i32 0, metadata !1647, null}
!1647 = metadata !{i32 786443, metadata !1109, i32 201, i32 0, metadata !731, i32 35} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1648 = metadata !{i32 209, i32 0, metadata !1649, null}
!1649 = metadata !{i32 786443, metadata !1119, i32 207, i32 0, metadata !731, i32 36} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1650 = metadata !{i32 214, i32 0, metadata !1651, null}
!1651 = metadata !{i32 786443, metadata !1130, i32 213, i32 0, metadata !731, i32 37} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1652 = metadata !{i32 220, i32 0, metadata !1653, null}
!1653 = metadata !{i32 786443, metadata !1141, i32 219, i32 0, metadata !731, i32 38} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1654 = metadata !{i32 225, i32 0, metadata !1655, null}
!1655 = metadata !{i32 786443, metadata !1153, i32 224, i32 0, metadata !731, i32 39} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1656 = metadata !{i32 226, i32 0, metadata !1655, null}
!1657 = metadata !{i32 231, i32 0, metadata !1658, null}
!1658 = metadata !{i32 786443, metadata !1163, i32 230, i32 0, metadata !731, i32 40} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1659 = metadata !{i32 235, i32 0, metadata !1660, null}
!1660 = metadata !{i32 786443, metadata !1174, i32 234, i32 0, metadata !731, i32 41} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1661 = metadata !{i32 239, i32 0, metadata !1662, null}
!1662 = metadata !{i32 786443, metadata !1181, i32 238, i32 0, metadata !731, i32 42} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1663 = metadata !{i32 240, i32 0, metadata !1662, null}
!1664 = metadata !{i32 245, i32 0, metadata !1665, null}
!1665 = metadata !{i32 786443, metadata !1189, i32 244, i32 0, metadata !731, i32 43} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1666 = metadata !{i32 250, i32 0, metadata !1667, null}
!1667 = metadata !{i32 786443, metadata !1199, i32 249, i32 0, metadata !731, i32 44} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1668 = metadata !{i32 255, i32 0, metadata !1669, null}
!1669 = metadata !{i32 786443, metadata !1210, i32 254, i32 0, metadata !731, i32 45} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1670 = metadata !{i32 260, i32 0, metadata !1671, null}
!1671 = metadata !{i32 786443, metadata !1218, i32 259, i32 0, metadata !731, i32 46} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1672 = metadata !{i32 264, i32 0, metadata !1673, null}
!1673 = metadata !{i32 786443, metadata !1227, i32 263, i32 0, metadata !731, i32 47} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
