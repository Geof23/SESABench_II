; ModuleID = 'mri-gridding'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.parameters = type { i32, [3 x i32], [3 x i32], [3 x float], [3 x i32], float, float, i32, i32 }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [
%struct.ReconstructionSample = type { float, float, float, float, float, float }
%struct.pb_TimerSet = type { i32, %struct.pb_async_time_marker_list*, i64, i64, [8 x %struct.pb_Timer], [8 x %struct.pb_SubTimerList*] }
%struct.pb_async_time_marker_list = type { i8*, i32, i8*, %struct.pb_async_time_marker_list* }
%struct.pb_Timer = type { i32, i64, i64 }
%struct.pb_SubTimerList = type { %struct.pb_SubTimer*, %struct.pb_SubTimer* }
%struct.pb_SubTimer = type { i8*, %struct.pb_Timer, %struct.pb_SubTimer* }
%struct.cmplx = type { float, float }
%struct.float2 = type { float, float }
%struct.float4 = type { float, float, float, float }
%struct.cudaChannelFormatDesc = type { i32, i32, i32, i32, i32 }
%struct.cudaExtent = type { i64, i64, i64 }
%struct.cudaArray = type opaque
%struct.cudaPitchedPtr = type { i8*, i64, i64, i64 }
%struct.CUstream_st = type opaque
%struct.cudaMemcpy3DParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, %struct.cudaExtent, i32 }
%struct.cudaPos = type { i64, i64, i64 }
%struct.cudaMemcpy3DPeerParms = type { %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaArray*, %struct.cudaPos, %struct.cudaPitchedPtr, i32, %struct.cudaExtent }
%struct.cudaIpcEventHandle_st = type { [64 x i8] }
%struct.CUevent_st = type opaque
%struct.cudaIpcMemHandle_st = type { [64 x i8] }

@.str = private unnamed_addr constant [26 x i8] c"aquisition.numsamples=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"aquisition.kmax=%f %f %f\0A\00", align 1
@.str2 = private unnamed_addr constant [32 x i8] c"aquisition.matrixSize=%d %d %d\0A\00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"reconstruction.matrixSize=%d %d %d\0A\00", align 1
@.str4 = private unnamed_addr constant [30 x i8] c"gridding.matrixSize=%d %d %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"gridding.oversampling=%f\0A\00", align 1
@.str6 = private unnamed_addr constant [17 x i8] c"kernel.width=%f\0A\00", align 1
@.str7 = private unnamed_addr constant [18 x i8] c"kernel.useLUT=%d\0A\00", align 1
@.str8 = private unnamed_addr constant [42 x i8] c"  Total amount of GPU memory: %llu bytes\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"  Number of samples = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [24 x i8] c"  Grid Size = %dx%dx%d\0A\00", align 1
@.str12 = private unnamed_addr constant [32 x i8] c"  Input Matrix Size = %dx%dx%d\0A\00", align 1
@.str13 = private unnamed_addr constant [32 x i8] c"  Recon Matrix Size = %dx%dx%d\0A\00", align 1
@.str14 = private unnamed_addr constant [21 x i8] c"  Kernel Width = %f\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"  KMax = %.2f %.2f %.2f\0A\00", align 1
@.str16 = private unnamed_addr constant [21 x i8] c"  Oversampling = %f\0A\00", align 1
@.str17 = private unnamed_addr constant [20 x i8] c"  GPU Binsize = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [16 x i8] c"  Use LUT = %s\0A\00", align 1
@.str19 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@.str20 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@.str21 = private unnamed_addr constant [16 x i8] c"input/small.uks\00", align 1
@.str22 = private unnamed_addr constant [6 x i8] c".data\00", align 1
@.str23 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str24 = private unnamed_addr constant [26 x i8] c"ERROR: Could not open %s\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"CUDA error: %s, line %d\0A\00", align 1
@.str31 = private unnamed_addr constant [19 x i8] c"gridNumElems: %d \0A\00", align 1
@str = private unnamed_addr constant [52 x i8] c"  Need at least 3GB of GPU memory for large dataset\00"
@str35 = private unnamed_addr constant [20 x i8] c"\0AReading parameters\00"
@str36 = private unnamed_addr constant [48 x i8] c"ERROR: Unable to allocate memory for input data\00"
@str37 = private unnamed_addr constant [32 x i8] c"ERROR: Could not open data file\00"
@str38 = private unnamed_addr constant [30 x i8] c"Reading input data from files\00"
@str39 = private unnamed_addr constant [37 x i8] c"Finish reading input data from files\00"
@str40 = private unnamed_addr constant [49 x i8] c"ERROR: Unable to allocate memory for output data\00"
@str41 = private unnamed_addr constant [21 x i8] c"Running CUDA version\00"
@blockIdx = external global %struct.dim3
@blockDim = external global %struct.dim3
@threadIdx = external global %struct.dim3
@.str10 = private unnamed_addr constant [60 x i8] c"binning_kernel n: %u, n*sizeof(ReconstructionSample): %lu \0A\00", align 1
@_ZL9size_xy_c = internal global i32 0, section "__constant__", align 4
@_ZL10gridSize_c = internal global [3 x i32] zeroinitializer, section "__constant__", align 4
@_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6real_s = internal unnamed_addr global [64 x float] zeroinitializer, section "__shared__", align 16
@_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6imag_s = internal unnamed_addr global [64 x float] zeroinitializer, section "__shared__", align 16
@_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kx_s = internal unnamed_addr global [64 x float] zeroinitializer, section "__shared__", align 16
@_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4ky_s = internal unnamed_addr global [64 x float] zeroinitializer, section "__shared__", align 16
@_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kz_s = internal unnamed_addr global [64 x float] zeroinitializer, section "__shared__", align 16
@_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE5sdc_s = internal unnamed_addr global [64 x float] zeroinitializer, section "__shared__", align 16
@_ZL8cutoff_c = internal global float 0.000000e+00, section "__constant__", align 4
@_ZL9cutoff2_c = internal global float 0.000000e+00, section "__constant__", align 4
@_ZL15_1overCutoff2_c = internal global float 0.000000e+00, section "__constant__", align 4
@.str111 = private unnamed_addr constant [25 x i8] c"CUDA error: %s, line %d\0A\00", align 1
@.str212 = private unnamed_addr constant [15 x i8] c"sample_d_input\00", align 1
@.str25 = private unnamed_addr constant [65 x i8] c"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str126 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str227 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str150 = private unnamed_addr constant [11 x i8] c"GPU device\00", align 1
@cudaGetErrorString.tmp = private unnamed_addr constant [20 x i8] c"No Error Message\00\00\00\00", align 16
@msg = internal global [25 x i8] zeroinitializer, align 16

define void @_Z13setParametersP8_IO_FILEP10parameters(%struct._IO_FILE* nocapture %file, %struct.parameters* %p) uwtable {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %numSamples = getelementptr inbounds %struct.parameters* %p, i64 0, i32 0, !dbg !1658
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([26 x i8]* @.str, i64 0, i64 0), i32* %numSamples), !dbg !1658
  %arrayidx = getelementptr inbounds %struct.parameters* %p, i64 0, i32 3, i64 0, !dbg !1659
  %arrayidx2 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 3, i64 1, !dbg !1659
  %arrayidx4 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 3, i64 2, !dbg !1659
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), float* %arrayidx, float* %arrayidx2, float* %arrayidx4), !dbg !1659
  %arrayidx6 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 1, i64 0, !dbg !1660
  %arrayidx8 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 1, i64 1, !dbg !1660
  %arrayidx10 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 1, i64 2, !dbg !1660
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([32 x i8]* @.str2, i64 0, i64 0), i32* %arrayidx6, i32* %arrayidx8, i32* %arrayidx10), !dbg !1660
  %arrayidx12 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 2, i64 0, !dbg !1661
  %arrayidx14 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 2, i64 1, !dbg !1661
  %arrayidx16 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 2, i64 2, !dbg !1661
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([36 x i8]* @.str3, i64 0, i64 0), i32* %arrayidx12, i32* %arrayidx14, i32* %arrayidx16), !dbg !1661
  %arrayidx18 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 4, i64 0, !dbg !1662
  %arrayidx20 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 4, i64 1, !dbg !1662
  %arrayidx22 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 4, i64 2, !dbg !1662
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([30 x i8]* @.str4, i64 0, i64 0), i32* %arrayidx18, i32* %arrayidx20, i32* %arrayidx22), !dbg !1662
  %oversample = getelementptr inbounds %struct.parameters* %p, i64 0, i32 5, !dbg !1663
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([26 x i8]* @.str5, i64 0, i64 0), float* %oversample), !dbg !1663
  %kernelWidth = getelementptr inbounds %struct.parameters* %p, i64 0, i32 6, !dbg !1664
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([17 x i8]* @.str6, i64 0, i64 0), float* %kernelWidth), !dbg !1664
  %useLUT = getelementptr inbounds %struct.parameters* %p, i64 0, i32 8, !dbg !1665
  %call26 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([18 x i8]* @.str7, i64 0, i64 0), i32* %useLUT), !dbg !1665
  %call27 = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %deviceProp, i32 0), !dbg !1666
  %totalGlobalMem = getelementptr inbounds %struct.cudaDeviceProp* %deviceProp, i64 0, i32 1, !dbg !1667
  %0 = load i64* %totalGlobalMem, align 8, !dbg !1667, !tbaa !1668
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str8, i64 0, i64 0), i64 %0), !dbg !1667
  %1 = load i32* %numSamples, align 4, !dbg !1671, !tbaa !1672
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i64 0, i64 0), i32 %1), !dbg !1671
  %2 = load i32* %numSamples, align 4, !dbg !1673, !tbaa !1672
  %cmp = icmp sgt i32 %2, 10000000, !dbg !1673
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !1673

land.lhs.true:                                    ; preds = %entry
  %3 = load i64* %totalGlobalMem, align 8, !dbg !1673, !tbaa !1668
  %cmp34 = icmp ult i64 %3, 3145728000, !dbg !1673
  br i1 %cmp34, label %if.then, label %if.end, !dbg !1673

if.then:                                          ; preds = %land.lhs.true
  %puts = call i32 @puts(i8* getelementptr inbounds ([52 x i8]* @str, i64 0, i64 0)), !dbg !1674
  call void @exit(i32 1) noreturn nounwind, !dbg !1676
  unreachable, !dbg !1676

if.end:                                           ; preds = %land.lhs.true, %entry
  %4 = load i32* %arrayidx18, align 4, !dbg !1677, !tbaa !1672
  %5 = load i32* %arrayidx20, align 4, !dbg !1677, !tbaa !1672
  %6 = load i32* %arrayidx22, align 4, !dbg !1677, !tbaa !1672
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str11, i64 0, i64 0), i32 %4, i32 %5, i32 %6), !dbg !1677
  %7 = load i32* %arrayidx6, align 4, !dbg !1678, !tbaa !1672
  %8 = load i32* %arrayidx8, align 4, !dbg !1678, !tbaa !1672
  %9 = load i32* %arrayidx10, align 4, !dbg !1678, !tbaa !1672
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str12, i64 0, i64 0), i32 %7, i32 %8, i32 %9), !dbg !1678
  %10 = load i32* %arrayidx12, align 4, !dbg !1679, !tbaa !1672
  %11 = load i32* %arrayidx14, align 4, !dbg !1679, !tbaa !1672
  %12 = load i32* %arrayidx16, align 4, !dbg !1679, !tbaa !1672
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str13, i64 0, i64 0), i32 %10, i32 %11, i32 %12), !dbg !1679
  %13 = load float* %kernelWidth, align 4, !dbg !1680, !tbaa !1681
  %conv = fpext float %13 to double, !dbg !1680
  %call58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str14, i64 0, i64 0), double %conv), !dbg !1680
  %14 = load float* %arrayidx, align 4, !dbg !1682, !tbaa !1681
  %conv61 = fpext float %14 to double, !dbg !1682
  %15 = load float* %arrayidx2, align 4, !dbg !1682, !tbaa !1681
  %conv64 = fpext float %15 to double, !dbg !1682
  %16 = load float* %arrayidx4, align 4, !dbg !1682, !tbaa !1681
  %conv67 = fpext float %16 to double, !dbg !1682
  %call68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i64 0, i64 0), double %conv61, double %conv64, double %conv67), !dbg !1682
  %17 = load float* %oversample, align 4, !dbg !1683, !tbaa !1681
  %conv70 = fpext float %17 to double, !dbg !1683
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str16, i64 0, i64 0), double %conv70), !dbg !1683
  %binsize = getelementptr inbounds %struct.parameters* %p, i64 0, i32 7, !dbg !1684
  %18 = load i32* %binsize, align 4, !dbg !1684, !tbaa !1672
  %call72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str17, i64 0, i64 0), i32 %18), !dbg !1684
  %19 = load i32* %useLUT, align 4, !dbg !1685, !tbaa !1672
  %tobool = icmp ne i32 %19, 0, !dbg !1685
  %cond = select i1 %tobool, i8* getelementptr inbounds ([4 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str20, i64 0, i64 0), !dbg !1685
  %call74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str18, i64 0, i64 0), i8* %cond), !dbg !1685
  ret void, !dbg !1686
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

declare i32 @fscanf(%struct._IO_FILE* nocapture, i8* nocapture, ...) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @exit(i32) noreturn nounwind

define i32 @_Z14readSampleData10parametersP8_IO_FILEP20ReconstructionSample(%struct.parameters* nocapture byval align 8 %params, %struct._IO_FILE* nocapture %uksdata_f, %struct.ReconstructionSample* nocapture %samples) nounwind uwtable {
entry:
  %0 = bitcast %struct.parameters* %params to i64*, !dbg !1687
  %1 = load i64* %0, align 8, !dbg !1687
  %2 = trunc i64 %1 to i32, !dbg !1687
  %cmp123 = icmp eq i32 %2, 0, !dbg !1687
  %3 = lshr i64 %1, 32
  %4 = trunc i64 %3 to i32
  br i1 %cmp123, label %for.end, label %for.body, !dbg !1687

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %if.end ], [ 0, %entry ]
  %i.0124 = phi i32 [ %inc, %if.end ], [ 0, %entry ]
  %call = tail call i32 @feof(%struct._IO_FILE* %uksdata_f) nounwind, !dbg !1689
  %tobool = icmp eq i32 %call, 0, !dbg !1689
  br i1 %tobool, label %if.end, label %for.end, !dbg !1689

if.end:                                           ; preds = %for.body
  %arrayidx = getelementptr inbounds %struct.ReconstructionSample* %samples, i64 %indvars.iv126, !dbg !1691
  %5 = bitcast %struct.ReconstructionSample* %arrayidx to i8*, !dbg !1691
  %call1 = tail call i64 @fread(i8* %5, i64 24, i64 1, %struct._IO_FILE* %uksdata_f), !dbg !1691
  %indvars.iv.next127 = add i64 %indvars.iv126, 1, !dbg !1687
  %inc = add i32 %i.0124, 1, !dbg !1687
  %6 = trunc i64 %indvars.iv.next127 to i32, !dbg !1687
  %cmp = icmp ult i32 %6, %2, !dbg !1687
  br i1 %cmp, label %for.body, label %for.end, !dbg !1687

for.end:                                          ; preds = %if.end, %for.body, %entry
  %i.0.lcssa = phi i32 [ 0, %entry ], [ %i.0124, %for.body ], [ %inc, %if.end ]
  %conv = sitofp i32 %4 to float, !dbg !1692
  %arrayidx3 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 2, i64 0, !dbg !1692
  %7 = bitcast i32* %arrayidx3 to i64*, !dbg !1692
  %8 = load i64* %7, align 8, !dbg !1692
  %9 = trunc i64 %8 to i32, !dbg !1692
  %conv4 = sitofp i32 %9 to float, !dbg !1692
  %arrayidx5 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 3, i64 0, !dbg !1692
  %10 = load float* %arrayidx5, align 4, !dbg !1692, !tbaa !1681
  %mul = fmul float %conv4, %10, !dbg !1692
  %div = fdiv float %conv, %mul, !dbg !1692
  %arrayidx8 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 1, i64 1, !dbg !1693
  %11 = load i32* %arrayidx8, align 4, !dbg !1693, !tbaa !1672
  %conv9 = sitofp i32 %11 to float, !dbg !1693
  %12 = lshr i64 %8, 32
  %13 = trunc i64 %12 to i32
  %conv12 = sitofp i32 %13 to float, !dbg !1693
  %arrayidx14 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 3, i64 1, !dbg !1693
  %14 = load float* %arrayidx14, align 4, !dbg !1693, !tbaa !1681
  %mul15 = fmul float %conv12, %14, !dbg !1693
  %div16 = fdiv float %conv9, %mul15, !dbg !1693
  %arrayidx19 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 1, i64 2, !dbg !1694
  %15 = load i32* %arrayidx19, align 4, !dbg !1694, !tbaa !1672
  %conv20 = sitofp i32 %15 to float, !dbg !1694
  %arrayidx22 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 2, i64 2, !dbg !1694
  %16 = load i32* %arrayidx22, align 8, !dbg !1694, !tbaa !1672
  %conv23 = sitofp i32 %16 to float, !dbg !1694
  %arrayidx25 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 3, i64 2, !dbg !1694
  %17 = load float* %arrayidx25, align 4, !dbg !1694, !tbaa !1681
  %mul26 = fmul float %conv23, %17, !dbg !1694
  %div27 = fdiv float %conv20, %mul26, !dbg !1694
  %arrayidx29 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 0, !dbg !1695
  %18 = bitcast i32* %arrayidx29 to i64*, !dbg !1695
  %19 = load i64* %18, align 8, !dbg !1695
  %20 = trunc i64 %19 to i32, !dbg !1695
  %21 = lshr i64 %19, 32
  %22 = trunc i64 %21 to i32
  %arrayidx33 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 2, !dbg !1696
  %23 = load i32* %arrayidx33, align 8, !dbg !1696, !tbaa !1672
  %sub = add nsw i32 %20, -1, !dbg !1697
  %conv35 = sitofp i32 %sub to float, !dbg !1697
  %mul36 = fmul float %div, %conv35, !dbg !1697
  %conv39 = fmul float %mul36, 5.000000e-01, !dbg !1697
  %conv44 = fmul float %conv35, 5.000000e-01, !dbg !1698
  %sub46 = add nsw i32 %22, -1, !dbg !1699
  %conv47 = sitofp i32 %sub46 to float, !dbg !1699
  %mul48 = fmul float %div16, %conv47, !dbg !1699
  %conv51 = fmul float %mul48, 5.000000e-01, !dbg !1699
  %conv56 = fmul float %conv47, 5.000000e-01, !dbg !1700
  %sub58 = add nsw i32 %23, -1, !dbg !1701
  %conv59 = sitofp i32 %sub58 to float, !dbg !1701
  %mul60 = fmul float %div27, %conv59, !dbg !1701
  %conv63 = fmul float %mul60, 5.000000e-01, !dbg !1701
  %conv68 = fmul float %conv59, 5.000000e-01, !dbg !1702
  %cmp70121 = icmp eq i32 %i.0.lcssa, 0, !dbg !1703
  br i1 %cmp70121, label %for.end97, label %for.body71, !dbg !1703

for.body71:                                       ; preds = %for.body71, %for.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body71 ], [ 0, %for.end ]
  %kX = getelementptr inbounds %struct.ReconstructionSample* %samples, i64 %indvars.iv, i32 2, !dbg !1704
  %24 = load float* %kX, align 4, !dbg !1704, !tbaa !1681
  %mul74 = fmul float %conv39, %24, !dbg !1704
  %add = fadd float %conv44, %mul74, !dbg !1704
  %call.i = tail call float @floorf(float %add) nounwind readnone, !dbg !1706
  store float %call.i, float* %kX, align 4, !dbg !1704, !tbaa !1681
  %kY = getelementptr inbounds %struct.ReconstructionSample* %samples, i64 %indvars.iv, i32 3, !dbg !1708
  %25 = load float* %kY, align 4, !dbg !1708, !tbaa !1681
  %mul81 = fmul float %conv51, %25, !dbg !1708
  %add82 = fadd float %conv56, %mul81, !dbg !1708
  %call.i119 = tail call float @floorf(float %add82) nounwind readnone, !dbg !1709
  store float %call.i119, float* %kY, align 4, !dbg !1708, !tbaa !1681
  %kZ = getelementptr inbounds %struct.ReconstructionSample* %samples, i64 %indvars.iv, i32 4, !dbg !1710
  %26 = load float* %kZ, align 4, !dbg !1710, !tbaa !1681
  %mul89 = fmul float %conv63, %26, !dbg !1710
  %add90 = fadd float %conv68, %mul89, !dbg !1710
  %call.i120 = tail call float @floorf(float %add90) nounwind readnone, !dbg !1711
  store float %call.i120, float* %kZ, align 4, !dbg !1710, !tbaa !1681
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !1703
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !1703
  %exitcond = icmp eq i32 %lftr.wideiv, %i.0.lcssa, !dbg !1703
  br i1 %exitcond, label %for.end97, label %for.body71, !dbg !1703

for.end97:                                        ; preds = %for.body71, %for.end
  ret i32 %i.0.lcssa, !dbg !1712
}

declare i32 @feof(%struct._IO_FILE* nocapture) nounwind

declare i64 @fread(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) uwtable {
entry:
  %timers = alloca %struct.pb_TimerSet, align 8
  %uksdata = alloca [250 x i8], align 16
  %params = alloca %struct.parameters, align 8
  %samples = alloca %struct.ReconstructionSample*, align 8
  %gridData = alloca %struct.cmplx*, align 8
  %sampleDensity = alloca float*, align 8
  %arraydecay = getelementptr inbounds [250 x i8]* %uksdata, i64 0, i64 0, !dbg !1713
  %0 = call i8* @memcpy(i8* %arraydecay, i8* getelementptr inbounds ([16 x i8]* @.str21, i64 0, i64 0), i64 16)
  %strlen = call i64 @strlen(i8* %arraydecay), !dbg !1714
  %endptr = getelementptr [250 x i8]* %uksdata, i64 0, i64 %strlen, !dbg !1714
  %1 = call i8* @memcpy(i8* %endptr, i8* getelementptr inbounds ([6 x i8]* @.str22, i64 0, i64 0), i64 6)
  %call3 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([16 x i8]* @.str21, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0)), !dbg !1715
  %cmp = icmp eq %struct._IO_FILE* %call3, null, !dbg !1716
  br i1 %cmp, label %if.then, label %if.end, !dbg !1716

if.then:                                          ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str24, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str21, i64 0, i64 0)), !dbg !1717
  br label %if.end, !dbg !1719

if.end:                                           ; preds = %if.then, %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str35, i64 0, i64 0)), !dbg !1720
  %binsize = getelementptr inbounds %struct.parameters* %params, i64 0, i32 7, !dbg !1721
  store i32 128, i32* %binsize, align 4, !dbg !1721, !tbaa !1672
  call void @_Z13setParametersP8_IO_FILEP10parameters(%struct._IO_FILE* %call3, %struct.parameters* %params), !dbg !1722
  %2 = bitcast %struct.ReconstructionSample** %samples to i8**, !dbg !1723
  %numSamples = getelementptr inbounds %struct.parameters* %params, i64 0, i32 0, !dbg !1723
  %3 = load i32* %numSamples, align 8, !dbg !1723, !tbaa !1672
  %conv = sext i32 %3 to i64, !dbg !1723
  %mul = mul i64 %conv, 24, !dbg !1723
  %call6 = call i32 @cudaMallocHost(i8** %2, i64 %mul), !dbg !1723
  %call7 = call i32 @cudaGetLastError(), !dbg !1724
  %cmp8 = icmp eq i32 %call7, 0, !dbg !1724
  br i1 %cmp8, label %do.end, label %if.then9, !dbg !1724

if.then9:                                         ; preds = %if.end
  %call10 = call i8* @cudaGetErrorString(i32 %call7), !dbg !1725
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i64 0, i64 0), i8* %call10, i32 143), !dbg !1725
  br label %return, !dbg !1725

do.end:                                           ; preds = %if.end
  %4 = load %struct.ReconstructionSample** %samples, align 8, !dbg !1727, !tbaa !1728
  %cmp13 = icmp eq %struct.ReconstructionSample* %4, null, !dbg !1727
  br i1 %cmp13, label %if.then14, label %if.end16, !dbg !1727

if.then14:                                        ; preds = %do.end
  %puts68 = call i32 @puts(i8* getelementptr inbounds ([48 x i8]* @str36, i64 0, i64 0)), !dbg !1729
  call void @exit(i32 1) noreturn nounwind, !dbg !1731
  unreachable, !dbg !1731

if.end16:                                         ; preds = %do.end
  %call18 = call %struct._IO_FILE* @fopen(i8* %arraydecay, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0)), !dbg !1732
  %cmp19 = icmp eq %struct._IO_FILE* %call18, null, !dbg !1733
  br i1 %cmp19, label %if.then20, label %if.end22, !dbg !1733

if.then20:                                        ; preds = %if.end16
  %puts69 = call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str37, i64 0, i64 0)), !dbg !1734
  call void @exit(i32 1) noreturn nounwind, !dbg !1736
  unreachable, !dbg !1736

if.end22:                                         ; preds = %if.end16
  %puts70 = call i32 @puts(i8* getelementptr inbounds ([30 x i8]* @str38, i64 0, i64 0)), !dbg !1737
  %5 = load %struct.ReconstructionSample** %samples, align 8, !dbg !1738, !tbaa !1728
  %call24 = call i32 @_Z14readSampleData10parametersP8_IO_FILEP20ReconstructionSample(%struct.parameters* byval align 8 %params, %struct._IO_FILE* %call18, %struct.ReconstructionSample* %5), !dbg !1738
  %call25 = call i32 @fclose(%struct._IO_FILE* %call18), !dbg !1739
  %puts71 = call i32 @puts(i8* getelementptr inbounds ([37 x i8]* @str39, i64 0, i64 0)), !dbg !1740
  %arrayidx = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 0, !dbg !1741
  %6 = load i32* %arrayidx, align 8, !dbg !1741, !tbaa !1672
  %arrayidx28 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 1, !dbg !1741
  %7 = load i32* %arrayidx28, align 4, !dbg !1741, !tbaa !1672
  %mul29 = mul nsw i32 %7, %6, !dbg !1741
  %arrayidx31 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 2, !dbg !1741
  %8 = load i32* %arrayidx31, align 8, !dbg !1741, !tbaa !1672
  %mul32 = mul nsw i32 %mul29, %8, !dbg !1741
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str31, i64 0, i64 0), i32 %mul32), !dbg !1742
  %9 = bitcast %struct.cmplx** %gridData to i8**, !dbg !1743
  %conv34 = sext i32 %mul32 to i64, !dbg !1743
  %mul35 = shl nsw i64 %conv34, 3, !dbg !1743
  %call36 = call i32 @cudaMallocHost(i8** %9, i64 %mul35), !dbg !1743
  %10 = bitcast float** %sampleDensity to i8**, !dbg !1744
  %mul38 = shl nsw i64 %conv34, 2, !dbg !1744
  %call39 = call i32 @cudaMallocHost(i8** %10, i64 %mul38), !dbg !1744
  %call42 = call i32 @cudaGetLastError(), !dbg !1745
  %cmp43 = icmp eq i32 %call42, 0, !dbg !1745
  br i1 %cmp43, label %do.end48, label %if.then44, !dbg !1745

if.then44:                                        ; preds = %if.end22
  %call45 = call i8* @cudaGetErrorString(i32 %call42), !dbg !1746
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i64 0, i64 0), i8* %call45, i32 188), !dbg !1746
  br label %return, !dbg !1746

do.end48:                                         ; preds = %if.end22
  %11 = load float** %sampleDensity, align 8, !dbg !1748, !tbaa !1728
  %cmp49 = icmp eq float* %11, null, !dbg !1748
  br i1 %cmp49, label %if.then51, label %lor.lhs.false, !dbg !1748

lor.lhs.false:                                    ; preds = %do.end48
  %12 = load %struct.cmplx** %gridData, align 8, !dbg !1748, !tbaa !1728
  %cmp50 = icmp eq %struct.cmplx* %12, null, !dbg !1748
  br i1 %cmp50, label %if.then51, label %if.end53, !dbg !1748

if.then51:                                        ; preds = %lor.lhs.false, %do.end48
  %puts72 = call i32 @puts(i8* getelementptr inbounds ([49 x i8]* @str40, i64 0, i64 0)), !dbg !1749
  call void @exit(i32 1) noreturn nounwind, !dbg !1751
  unreachable, !dbg !1751

if.end53:                                         ; preds = %lor.lhs.false
  %puts73 = call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str41, i64 0, i64 0)), !dbg !1752
  %13 = load %struct.ReconstructionSample** %samples, align 8, !dbg !1753, !tbaa !1728
  %14 = load %struct.cmplx** %gridData, align 8, !dbg !1753, !tbaa !1728
  %15 = load float** %sampleDensity, align 8, !dbg !1753, !tbaa !1728
  call void @_Z14CUDA_interfaceP11pb_TimerSetj10parametersP20ReconstructionSamplePfiP5cmplxS4_(%struct.pb_TimerSet* %timers, i32 %call24, %struct.parameters* byval align 8 %params, %struct.ReconstructionSample* %13, float* undef, i32 undef, %struct.cmplx
  %16 = load %struct.ReconstructionSample** %samples, align 8, !dbg !1754, !tbaa !1728
  %17 = bitcast %struct.ReconstructionSample* %16 to i8*, !dbg !1754
  %call58 = call i32 @cudaFreeHost(i8* %17), !dbg !1754
  %18 = load %struct.cmplx** %gridData, align 8, !dbg !1755, !tbaa !1728
  %19 = bitcast %struct.cmplx* %18 to i8*, !dbg !1755
  %call59 = call i32 @cudaFreeHost(i8* %19), !dbg !1755
  %20 = load float** %sampleDensity, align 8, !dbg !1756, !tbaa !1728
  %21 = bitcast float* %20 to i8*, !dbg !1756
  %call60 = call i32 @cudaFreeHost(i8* %21), !dbg !1756
  %putchar = call i32 @putchar(i32 10), !dbg !1757
  br label %return, !dbg !1758

return:                                           ; preds = %if.end53, %if.then44, %if.then9
  ret i32 0, !dbg !1759
}

declare noalias %struct._IO_FILE* @fopen(i8* nocapture, i8* nocapture) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @fclose(%struct._IO_FILE* nocapture) nounwind

declare float @floorf(float) nounwind readnone

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare i64 @strlen(i8* nocapture) nounwind readonly

declare i32 @puts(i8* nocapture) nounwind

declare i32 @putchar(i32)

define void @_Z14binning_kerneljP20ReconstructionSamplePjS1_S1_jj(i32 %n, %struct.ReconstructionSample* nocapture %sample_g, i32* nocapture %idxKey_g, i32* nocapture %idxValue_g, i32* %binCount_g, i32 %binsize, i32 %gridNumElems) uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1760, !tbaa !1672
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1760, !tbaa !1672
  %mul = mul i32 %1, %0, !dbg !1760
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1760, !tbaa !1672
  %add = add i32 %mul, %2, !dbg !1760
  %conv = zext i32 %n to i64, !dbg !1761
  %mul1 = mul i64 %conv, 24, !dbg !1761
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([60 x i8]* @.str10, i64 0, i64 0), i32 %n, i64 %mul1), !dbg !1761
  %cmp = icmp ult i32 %add, %n, !dbg !1762
  br i1 %cmp, label %if.then, label %if.end25, !dbg !1762

if.then:                                          ; preds = %entry
  %idxprom = zext i32 %add to i64, !dbg !1763
  %pt.sroa.1.8..idx29 = getelementptr inbounds %struct.ReconstructionSample* %sample_g, i64 %idxprom, i32 2, !dbg !1763
  %pt.sroa.1.8.copyload = load float* %pt.sroa.1.8..idx29, align 4, !dbg !1763
  %pt.sroa.2.12..idx30 = getelementptr inbounds %struct.ReconstructionSample* %sample_g, i64 %idxprom, i32 3, !dbg !1763
  %pt.sroa.2.12.copyload = load float* %pt.sroa.2.12..idx30, align 4, !dbg !1763
  %pt.sroa.3.16..idx31 = getelementptr inbounds %struct.ReconstructionSample* %sample_g, i64 %idxprom, i32 4, !dbg !1763
  %pt.sroa.3.16.copyload = load float* %pt.sroa.3.16..idx31, align 4, !dbg !1763
  %conv2 = fptoui float %pt.sroa.3.16.copyload to i32, !dbg !1765
  %3 = load i32* @_ZL9size_xy_c, align 4, !dbg !1765, !tbaa !1672
  %mul3 = mul i32 %conv2, %3, !dbg !1765
  %conv4 = fptoui float %pt.sroa.2.12.copyload to i32, !dbg !1765
  %4 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 0), align 4, !dbg !1765, !tbaa !1672
  %mul5 = mul i32 %4, %conv4, !dbg !1765
  %conv7 = fptoui float %pt.sroa.1.8.copyload to i32, !dbg !1765
  %add6 = add i32 %mul3, %conv7, !dbg !1765
  %add8 = add i32 %add6, %mul5, !dbg !1765
  %idxprom9 = zext i32 %add8 to i64, !dbg !1766
  %arrayidx10 = getelementptr inbounds i32* %binCount_g, i64 %idxprom9, !dbg !1766
  %5 = load i32* %arrayidx10, align 4, !dbg !1766, !tbaa !1672
  %cmp11 = icmp ult i32 %5, %binsize, !dbg !1766
  br i1 %cmp11, label %if.then12, label %if.end20, !dbg !1766

if.then12:                                        ; preds = %if.then
  %call.i = tail call i32 @__uAtomicAdd(i32* %arrayidx10, i32 1), !dbg !1767
  %cmp14 = icmp ult i32 %call.i, %binsize, !dbg !1771
  br i1 %cmp14, label %if.end20, label %if.else, !dbg !1771

if.else:                                          ; preds = %if.then12
  %call.i43 = tail call i32 @__uAtomicAdd(i32* %arrayidx10, i32 -1), !dbg !1772
  br label %if.end20

if.end20:                                         ; preds = %if.else, %if.then12, %if.then
  %key.0 = phi i32 [ %gridNumElems, %if.else ], [ %add8, %if.then12 ], [ %gridNumElems, %if.then ]
  %arrayidx22 = getelementptr inbounds i32* %idxKey_g, i64 %idxprom, !dbg !1776
  store i32 %key.0, i32* %arrayidx22, align 4, !dbg !1776, !tbaa !1672
  %arrayidx24 = getelementptr inbounds i32* %idxValue_g, i64 %idxprom, !dbg !1777
  store i32 %add, i32* %arrayidx24, align 4, !dbg !1777, !tbaa !1672
  br label %if.end25, !dbg !1778

if.end25:                                         ; preds = %if.end20, %entry
  ret void, !dbg !1779
}

define void @_Z14reorder_kerneliPjP20ReconstructionSample17sampleArrayStruct(i32 %n, i32* nocapture %idxValue_g, %struct.ReconstructionSample* nocapture %samples_g, %struct.float2* nocapture %sortedSampleSoA_g.coerce0, %struct.float4* nocapture %sortedSa
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1780, !tbaa !1672
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1780, !tbaa !1672
  %mul = mul i32 %1, %0, !dbg !1780
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1780, !tbaa !1672
  %add = add i32 %mul, %2, !dbg !1780
  %cmp = icmp ult i32 %add, %n, !dbg !1781
  br i1 %cmp, label %if.then, label %if.end, !dbg !1781

if.then:                                          ; preds = %entry
  %idxprom = zext i32 %add to i64, !dbg !1782
  %arrayidx = getelementptr inbounds i32* %idxValue_g, i64 %idxprom, !dbg !1782
  %3 = load i32* %arrayidx, align 4, !dbg !1782, !tbaa !1672
  %idxprom1 = zext i32 %3 to i64, !dbg !1783
  %pt.sroa.0.0..idx = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 0, !dbg !1783
  %pt.sroa.0.0.copyload = load float* %pt.sroa.0.0..idx, align 4, !dbg !1783
  %pt.sroa.1.4..idx15 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 1, !dbg !1783
  %pt.sroa.1.4.copyload = load float* %pt.sroa.1.4..idx15, align 4, !dbg !1783
  %pt.sroa.2.8..idx16 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 2, !dbg !1783
  %pt.sroa.2.8.copyload = load float* %pt.sroa.2.8..idx16, align 4, !dbg !1783
  %pt.sroa.3.12..idx17 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 3, !dbg !1783
  %pt.sroa.3.12.copyload = load float* %pt.sroa.3.12..idx17, align 4, !dbg !1783
  %pt.sroa.4.16..idx18 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 4, !dbg !1783
  %pt.sroa.4.16.copyload = load float* %pt.sroa.4.16..idx18, align 4, !dbg !1783
  %pt.sroa.5.20..idx19 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 5, !dbg !1783
  %pt.sroa.5.20.copyload = load float* %pt.sroa.5.20..idx19, align 4, !dbg !1783
  %data.sroa.0.0..idx = getelementptr inbounds %struct.float2* %sortedSampleSoA_g.coerce0, i64 %idxprom, i32 0, !dbg !1784
  store float %pt.sroa.0.0.copyload, float* %data.sroa.0.0..idx, align 8, !dbg !1784
  %data.sroa.1.4..idx14 = getelementptr inbounds %struct.float2* %sortedSampleSoA_g.coerce0, i64 %idxprom, i32 1, !dbg !1784
  store float %pt.sroa.1.4.copyload, float* %data.sroa.1.4..idx14, align 4, !dbg !1784
  %loc.sroa.0.0..idx = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 0, !dbg !1785
  store float %pt.sroa.2.8.copyload, float* %loc.sroa.0.0..idx, align 16, !dbg !1785
  %loc.sroa.1.4..idx11 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 1, !dbg !1785
  store float %pt.sroa.3.12.copyload, float* %loc.sroa.1.4..idx11, align 4, !dbg !1785
  %loc.sroa.2.8..idx12 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 2, !dbg !1785
  store float %pt.sroa.4.16.copyload, float* %loc.sroa.2.8..idx12, align 8, !dbg !1785
  %loc.sroa.3.12..idx13 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 3, !dbg !1785
  store float %pt.sroa.5.20.copyload, float* %loc.sroa.3.12..idx13, align 4, !dbg !1785
  br label %if.end, !dbg !1786

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !1787
}

define float @_Z12kernel_valuef(float %v) uwtable section "__device__" {
entry:
  %mul = fmul float %v, %v, !dbg !1788
  %mul1 = fmul float %mul, 0x3B39752860000000, !dbg !1789
  %add = fadd float %mul1, 0x3BE67934C0000000, !dbg !1789
  %mul2 = fmul float %mul, %add, !dbg !1789
  %add3 = fadd float %mul2, 0x3C8BA34A20000000, !dbg !1789
  %mul4 = fmul float %mul, %add3, !dbg !1789
  %add5 = fadd float %mul4, 0x3D287ED380000000, !dbg !1789
  %mul6 = fmul float %mul, %add5, !dbg !1789
  %add7 = fadd float %mul6, 0x3DC08B3AA0000000, !dbg !1789
  %mul8 = fmul float %mul, %add7, !dbg !1789
  %add9 = fadd float %mul8, 0x3E51343900000000, !dbg !1789
  %mul10 = fmul float %mul, %add9, !dbg !1789
  %add11 = fadd float %mul10, 0x3EDB777D00000000, !dbg !1789
  %mul12 = fmul float %mul, %add11, !dbg !1789
  %add13 = fadd float %mul12, 0x3F6098A4A0000000, !dbg !1789
  %mul14 = fmul float %mul, %add13, !dbg !1789
  %add15 = fadd float %mul14, 0x3FDDA30AC0000000, !dbg !1789
  %mul16 = fmul float %mul, %add15, !dbg !1789
  %add17 = fadd float %mul16, 0x4052DBC240000000, !dbg !1789
  %mul18 = fmul float %mul, %add17, !dbg !1789
  %add19 = fadd float %mul18, 0x40C039F680000000, !dbg !1789
  %mul20 = fmul float %mul, %add19, !dbg !1789
  %add21 = fadd float %mul20, 0x4121721A40000000, !dbg !1789
  %mul22 = fmul float %mul, %add21, !dbg !1789
  %add23 = fadd float %mul22, 0x4174A39560000000, !dbg !1789
  %mul24 = fmul float %mul, %add23, !dbg !1789
  %add25 = fadd float %mul24, 0x41B541F680000000, !dbg !1789
  %mul26 = fmul float %mul, %add25, !dbg !1789
  %add27 = fadd float %mul26, 0x41D57701A0000000, !dbg !1789
  %sub = fadd float %mul, 0xC0A808F040000000, !dbg !1790
  %mul28 = fmul float %mul, %sub, !dbg !1790
  %add29 = fadd float %mul28, 0x414A8593A0000000, !dbg !1790
  %mul30 = fmul float %mul, %add29, !dbg !1790
  %sub31 = fadd float %mul30, 0xC1D57701A0000000, !dbg !1790
  %sub32 = fsub float -0.000000e+00, %add27, !dbg !1791
  %call = tail call float @__fdividef(float %sub32, float %sub31), !dbg !1791
  ret float %call, !dbg !1792
}

declare float @__fdividef(float, float) section "__device__"

define void @_Z12gridding_GPU17sampleArrayStructPjP6float2Pff(%struct.float2* nocapture %sortedSampleSoA_g.coerce0, %struct.float4* nocapture %sortedSampleSoA_g.coerce1, i32* nocapture %binStartAddr_g, %struct.float2* nocapture %gridData_g, float* nocapt
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 2), align 4, !dbg !1793, !tbaa !1672
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 1), align 4, !dbg !1793, !tbaa !1672
  %mul = mul i32 %1, %0, !dbg !1793
  %2 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1793, !tbaa !1672
  %3 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 1), align 4, !dbg !1793, !tbaa !1672
  %mul1436 = add i32 %3, %mul, !dbg !1793
  %add = mul i32 %mul1436, %2, !dbg !1793
  %4 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1793, !tbaa !1672
  %add3 = add i32 %add, %4, !dbg !1793
  %5 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 2), align 4, !dbg !1794, !tbaa !1672
  %mul4 = shl i32 %5, 2, !dbg !1794
  %6 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 1), align 4, !dbg !1794, !tbaa !1672
  %7 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 1), align 4, !dbg !1794, !tbaa !1672
  %int_cast_to_i64 = zext i32 %1 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %div = udiv i32 %7, %1, !dbg !1794
  %int_cast_to_i641 = zext i32 %div to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641)
  %div5 = udiv i32 %6, %div, !dbg !1794
  %mul6 = mul i32 %div5, %mul4, !dbg !1794
  %int_cast_to_i642 = zext i32 %div to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i642)
  %rem = urem i32 %6, %div, !dbg !1795
  %mul8 = mul i32 %rem, %1, !dbg !1795
  %8 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1796, !tbaa !1672
  %mul9 = mul i32 %8, %2, !dbg !1796
  %add10 = add i32 %mul9, %4, !dbg !1797
  %add11 = add i32 %mul8, %3, !dbg !1798
  %add12 = add i32 %mul6, %0, !dbg !1799
  %add13 = add i32 %add12, %5, !dbg !1800
  %add14 = add i32 %add13, %5, !dbg !1801
  %conv = sitofp i32 %mul9 to float, !dbg !1802
  %9 = load float* @_ZL8cutoff_c, align 4, !dbg !1802, !tbaa !1681
  %call.i = tail call float @ceilf(float %9) nounwind readnone, !dbg !1803
  %sub = fsub float %conv, %call.i, !dbg !1802
  %conv16 = fptosi float %sub to i32, !dbg !1802
  %add17 = add i32 %mul9, %2, !dbg !1805
  %conv18 = uitofp i32 %add17 to float, !dbg !1805
  %add19 = fadd float %9, %conv18, !dbg !1805
  %conv20 = fptosi float %add19 to i32, !dbg !1805
  %10 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 0), align 4, !dbg !1806, !tbaa !1672
  %conv27 = sitofp i32 %mul8 to float, !dbg !1807
  %sub29 = fsub float %conv27, %call.i, !dbg !1807
  %conv30 = fptosi float %sub29 to i32, !dbg !1807
  %cmp31 = icmp slt i32 %conv30, 0, !dbg !1808
  %cond35 = select i1 %cmp31, i32 0, i32 %conv30, !dbg !1808
  %add36 = add i32 %mul8, %1, !dbg !1809
  %conv37 = uitofp i32 %add36 to float, !dbg !1809
  %add38 = fadd float %9, %conv37, !dbg !1809
  %conv39 = fptosi float %add38 to i32, !dbg !1809
  %cmp40 = icmp slt i32 %conv39, %7, !dbg !1810
  %sub42 = add nsw i32 %7, -1, !dbg !1810
  %cond45 = select i1 %cmp40, i32 %conv39, i32 %sub42, !dbg !1810
  %conv46 = sitofp i32 %mul6 to float, !dbg !1811
  %sub48 = fsub float %conv46, %call.i, !dbg !1811
  %conv49 = fptosi float %sub48 to i32, !dbg !1811
  %cmp50 = icmp slt i32 %conv49, 0, !dbg !1812
  %cond54 = select i1 %cmp50, i32 0, i32 %conv49, !dbg !1812
  %add56 = add i32 %mul6, %mul4, !dbg !1813
  %conv57 = uitofp i32 %add56 to float, !dbg !1813
  %add58 = fadd float %conv57, %9, !dbg !1813
  %conv59 = fptosi float %add58 to i32, !dbg !1813
  %11 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 2), align 4, !dbg !1814, !tbaa !1672
  %cmp60 = icmp slt i32 %conv59, %11, !dbg !1814
  %sub62 = add nsw i32 %11, -1, !dbg !1814
  %cond65 = select i1 %cmp60, i32 %conv59, i32 %sub62, !dbg !1814
  %12 = load i32* @_ZL9size_xy_c, align 4, !dbg !1815, !tbaa !1672
  %mul66 = mul nsw i32 %12, %add12, !dbg !1815
  %mul67 = mul nsw i32 %10, %add11, !dbg !1815
  %add68 = add i32 %mul67, %add10, !dbg !1815
  %add69 = add i32 %add68, %mul66, !dbg !1815
  %mul70 = mul i32 %12, %5, !dbg !1816
  %add71 = add i32 %add69, %mul70, !dbg !1816
  %add73 = add i32 %add71, %mul70, !dbg !1817
  %add75 = add i32 %add73, %mul70, !dbg !1818
  %cmp82627 = icmp sgt i32 %cond54, %cond65, !dbg !1819
  br i1 %cmp82627, label %for.end305, label %for.cond84.preheader.lr.ph, !dbg !1819

for.cond84.preheader.lr.ph:                       ; preds = %entry
  %sub23 = add nsw i32 %10, -1, !dbg !1806
  %cmp21 = icmp slt i32 %conv20, %10, !dbg !1806
  %cond26 = select i1 %cmp21, i32 %conv20, i32 %sub23, !dbg !1806
  %cmp = icmp slt i32 %conv16, 0, !dbg !1820
  %add15 = add i32 %add14, %5, !dbg !1821
  %cmp85601 = icmp sgt i32 %cond35, %cond45, !dbg !1822
  %13 = sext i32 %conv16 to i64, !dbg !1823
  %idx.ext91 = select i1 %cmp, i64 0, i64 %13, !dbg !1823
  %idx.ext93 = sext i32 %cond26 to i64, !dbg !1824
  %add.ptr90.sum437 = add i64 %idx.ext93, 1, !dbg !1824
  %idxprom121 = sext i32 %add3 to i64, !dbg !1825
  %arrayidx122 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6real_s, i64 0, i64 %idxprom121, !dbg !1825
  %arrayidx125 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6imag_s, i64 0, i64 %idxprom121, !dbg !1826
  %arrayidx128 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kx_s, i64 0, i64 %idxprom121, !dbg !1827
  %arrayidx131 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4ky_s, i64 0, i64 %idxprom121, !dbg !1828
  %arrayidx134 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kz_s, i64 0, i64 %idxprom121, !dbg !1829
  %arrayidx136 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE5sdc_s, i64 0, i64 %idxprom121, !dbg !1830
  %conv155 = sitofp i32 %add10 to float, !dbg !1831
  %conv164 = sitofp i32 %add11 to float, !dbg !1832
  %conv174 = sitofp i32 %add12 to float, !dbg !1833
  %conv205 = sitofp i32 %add13 to float, !dbg !1834
  %conv236 = sitofp i32 %add14 to float, !dbg !1835
  %conv267 = sitofp i32 %add15 to float, !dbg !1836
  br label %for.cond84.preheader, !dbg !1819

for.cond84.preheader:                             ; preds = %for.inc303, %for.cond84.preheader.lr.ph
  %pt.sroa.1.0641 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %pt.sroa.1.1.lcssa, %for.inc303 ]
  %pt.sroa.0.0640 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %pt.sroa.0.1.lcssa, %for.inc303 ]
  %density.0639 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %density.1.lcssa, %for.inc303 ]
  %pt1.sroa.1.0638 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %pt1.sroa.1.1.lcssa, %for.inc303 ]
  %pt1.sroa.0.0637 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %pt1.sroa.0.1.lcssa, %for.inc303 ]
  %density1.0636 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %density1.1.lcssa, %for.inc303 ]
  %pt2.sroa.1.0635 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %pt2.sroa.1.1.lcssa, %for.inc303 ]
  %pt2.sroa.0.0634 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %pt2.sroa.0.1.lcssa, %for.inc303 ]
  %density2.0633 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %density2.1.lcssa, %for.inc303 ]
  %pt3.sroa.1.0632 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %pt3.sroa.1.1.lcssa, %for.inc303 ]
  %pt3.sroa.0.0631 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %pt3.sroa.0.1.lcssa, %for.inc303 ]
  %density3.0630 = phi float [ 0.000000e+00, %for.cond84.preheader.lr.ph ], [ %density3.1.lcssa, %for.inc303 ]
  %z.0628 = phi i32 [ %cond54, %for.cond84.preheader.lr.ph ], [ %inc304, %for.inc303 ]
  br i1 %cmp85601, label %for.inc303, label %for.body86, !dbg !1822

for.body86:                                       ; preds = %for.inc300, %for.cond84.preheader
  %pt.sroa.1.1614 = phi float [ %pt.sroa.1.0641, %for.cond84.preheader ], [ %pt.sroa.1.2.lcssa, %for.inc300 ]
  %pt.sroa.0.1613 = phi float [ %pt.sroa.0.0640, %for.cond84.preheader ], [ %pt.sroa.0.2.lcssa, %for.inc300 ]
  %density.1612 = phi float [ %density.0639, %for.cond84.preheader ], [ %density.2.lcssa, %for.inc300 ]
  %pt1.sroa.1.1611 = phi float [ %pt1.sroa.1.0638, %for.cond84.preheader ], [ %pt1.sroa.1.2.lcssa, %for.inc300 ]
  %pt1.sroa.0.1610 = phi float [ %pt1.sroa.0.0637, %for.cond84.preheader ], [ %pt1.sroa.0.2.lcssa, %for.inc300 ]
  %density1.1609 = phi float [ %density1.0636, %for.cond84.preheader ], [ %density1.2.lcssa, %for.inc300 ]
  %pt2.sroa.1.1608 = phi float [ %pt2.sroa.1.0635, %for.cond84.preheader ], [ %pt2.sroa.1.2.lcssa, %for.inc300 ]
  %pt2.sroa.0.1607 = phi float [ %pt2.sroa.0.0634, %for.cond84.preheader ], [ %pt2.sroa.0.2.lcssa, %for.inc300 ]
  %density2.1606 = phi float [ %density2.0633, %for.cond84.preheader ], [ %density2.2.lcssa, %for.inc300 ]
  %pt3.sroa.1.1605 = phi float [ %pt3.sroa.1.0632, %for.cond84.preheader ], [ %pt3.sroa.1.2.lcssa, %for.inc300 ]
  %pt3.sroa.0.1604 = phi float [ %pt3.sroa.0.0631, %for.cond84.preheader ], [ %pt3.sroa.0.2.lcssa, %for.inc300 ]
  %density3.1603 = phi float [ %density3.0630, %for.cond84.preheader ], [ %density3.2.lcssa, %for.inc300 ]
  %y83.0602 = phi i32 [ %cond35, %for.cond84.preheader ], [ %inc301, %for.inc300 ]
  %14 = load i32* @_ZL9size_xy_c, align 4, !dbg !1837, !tbaa !1672
  %mul87 = mul nsw i32 %14, %z.0628, !dbg !1837
  %idx.ext = sext i32 %mul87 to i64, !dbg !1837
  %15 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 0), align 4, !dbg !1837, !tbaa !1672
  %mul88 = mul nsw i32 %15, %y83.0602, !dbg !1837
  %idx.ext89 = sext i32 %mul88 to i64, !dbg !1837
  %add.ptr.sum = add i64 %idx.ext89, %idx.ext, !dbg !1837
  %add.ptr90.sum = add i64 %add.ptr.sum, %idx.ext91, !dbg !1823
  %add.ptr92 = getelementptr inbounds i32* %binStartAddr_g, i64 %add.ptr90.sum, !dbg !1823
  %16 = load i32* %add.ptr92, align 4, !dbg !1823, !tbaa !1672
  %add.ptr94.sum = add i64 %add.ptr90.sum437, %add.ptr.sum, !dbg !1824
  %add.ptr95 = getelementptr inbounds i32* %binStartAddr_g, i64 %add.ptr94.sum, !dbg !1824
  %17 = load i32* %add.ptr95, align 4, !dbg !1824, !tbaa !1672
  %sub96 = sub i32 %17, %16, !dbg !1838
  %sub100 = add i32 %sub96, 63, !dbg !1839
  %shr = lshr i32 %sub100, 6, !dbg !1839
  %cmp101575 = icmp eq i32 %shr, 0, !dbg !1839
  br i1 %cmp101575, label %for.inc300, label %for.body102.lr.ph, !dbg !1839

for.body102.lr.ph:                                ; preds = %for.body86
  %add112 = add i32 %16, %add3, !dbg !1840
  %18 = add i32 %16, -1, !dbg !1839
  %19 = sub i32 %18, %17, !dbg !1839
  br label %for.body102, !dbg !1839

for.body102:                                      ; preds = %for.inc297, %for.body102.lr.ph
  %indvars.iv656 = phi i64 [ 0, %for.body102.lr.ph ], [ %indvars.iv.next657, %for.inc297 ]
  %indvars.iv654 = phi i32 [ %19, %for.body102.lr.ph ], [ %indvars.iv.next655, %for.inc297 ], !dbg !1841
  %pt.sroa.1.2588 = phi float [ %pt.sroa.1.1614, %for.body102.lr.ph ], [ %pt.sroa.1.3.lcssa, %for.inc297 ]
  %pt.sroa.0.2587 = phi float [ %pt.sroa.0.1613, %for.body102.lr.ph ], [ %pt.sroa.0.3.lcssa, %for.inc297 ]
  %density.2586 = phi float [ %density.1612, %for.body102.lr.ph ], [ %density.3.lcssa, %for.inc297 ]
  %pt1.sroa.1.2585 = phi float [ %pt1.sroa.1.1611, %for.body102.lr.ph ], [ %pt1.sroa.1.3.lcssa, %for.inc297 ]
  %pt1.sroa.0.2584 = phi float [ %pt1.sroa.0.1610, %for.body102.lr.ph ], [ %pt1.sroa.0.3.lcssa, %for.inc297 ]
  %density1.2583 = phi float [ %density1.1609, %for.body102.lr.ph ], [ %density1.3.lcssa, %for.inc297 ]
  %pt2.sroa.1.2582 = phi float [ %pt2.sroa.1.1608, %for.body102.lr.ph ], [ %pt2.sroa.1.3.lcssa, %for.inc297 ]
  %pt2.sroa.0.2581 = phi float [ %pt2.sroa.0.1607, %for.body102.lr.ph ], [ %pt2.sroa.0.3.lcssa, %for.inc297 ]
  %density2.2580 = phi float [ %density2.1606, %for.body102.lr.ph ], [ %density2.3.lcssa, %for.inc297 ]
  %pt3.sroa.1.2579 = phi float [ %pt3.sroa.1.1605, %for.body102.lr.ph ], [ %pt3.sroa.1.3.lcssa, %for.inc297 ]
  %pt3.sroa.0.2578 = phi float [ %pt3.sroa.0.1604, %for.body102.lr.ph ], [ %pt3.sroa.0.3.lcssa, %for.inc297 ]
  %density3.2577 = phi float [ %density3.1603, %for.body102.lr.ph ], [ %density3.3.lcssa, %for.inc297 ]
  %20 = icmp ugt i32 %indvars.iv654, -65, !dbg !1839
  %indvars.iv654.op = xor i32 %indvars.iv654, -1, !dbg !1842
  %21 = select i1 %20, i32 %indvars.iv654.op, i32 64, !dbg !1842
  %22 = shl i64 %indvars.iv656, 6, !dbg !1842
  %23 = trunc i64 %22 to i32, !dbg !1842
  %sub103 = sub i32 %sub96, %23, !dbg !1842
  %cmp104 = icmp ugt i32 %sub103, 64, !dbg !1842
  %.sub103 = select i1 %cmp104, i32 64, i32 %sub103, !dbg !1842
  tail call void @__syncthreads(), !dbg !1843
  %cmp113 = icmp slt i32 %add3, %.sub103, !dbg !1844
  br i1 %cmp113, label %if.then, label %if.end, !dbg !1844

if.then:                                          ; preds = %for.body102
  %add114 = add i32 %add112, %23, !dbg !1845
  %idxprom = zext i32 %add114 to i64, !dbg !1845
  %data.sroa.0.0..idx = getelementptr inbounds %struct.float2* %sortedSampleSoA_g.coerce0, i64 %idxprom, i32 0, !dbg !1845
  %data.sroa.0.0.copyload = load float* %data.sroa.0.0..idx, align 8, !dbg !1845
  %data.sroa.1.4..idx365 = getelementptr inbounds %struct.float2* %sortedSampleSoA_g.coerce0, i64 %idxprom, i32 1, !dbg !1845
  %data.sroa.1.4.copyload = load float* %data.sroa.1.4..idx365, align 4, !dbg !1845
  %loc.sroa.0.0..idx = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 0, !dbg !1846
  %loc.sroa.0.0.copyload = load float* %loc.sroa.0.0..idx, align 16, !dbg !1846
  %loc.sroa.1.4..idx362 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 1, !dbg !1846
  %loc.sroa.1.4.copyload = load float* %loc.sroa.1.4..idx362, align 4, !dbg !1846
  %loc.sroa.2.8..idx363 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 2, !dbg !1846
  %loc.sroa.2.8.copyload = load float* %loc.sroa.2.8..idx363, align 8, !dbg !1846
  %loc.sroa.3.12..idx364 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 3, !dbg !1846
  %loc.sroa.3.12.copyload = load float* %loc.sroa.3.12..idx364, align 4, !dbg !1846
  store float %data.sroa.0.0.copyload, float* %arrayidx122, align 4, !dbg !1825, !tbaa !1681
  store float %data.sroa.1.4.copyload, float* %arrayidx125, align 4, !dbg !1826, !tbaa !1681
  store float %loc.sroa.0.0.copyload, float* %arrayidx128, align 4, !dbg !1827, !tbaa !1681
  store float %loc.sroa.1.4.copyload, float* %arrayidx131, align 4, !dbg !1828, !tbaa !1681
  store float %loc.sroa.2.8.copyload, float* %arrayidx134, align 4, !dbg !1829, !tbaa !1681
  store float %loc.sroa.3.12.copyload, float* %arrayidx136, align 4, !dbg !1830, !tbaa !1681
  br label %if.end, !dbg !1847

if.end:                                           ; preds = %if.then, %for.body102
  tail call void @__syncthreads(), !dbg !1848
  %cmp138550 = icmp sgt i32 %.sub103, 0, !dbg !1841
  br i1 %cmp138550, label %for.body139, label %for.inc297, !dbg !1841

for.body139:                                      ; preds = %for.inc, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %if.end ]
  %pt.sroa.1.3563 = phi float [ %pt.sroa.1.5, %for.inc ], [ %pt.sroa.1.2588, %if.end ]
  %pt.sroa.0.3562 = phi float [ %pt.sroa.0.5, %for.inc ], [ %pt.sroa.0.2587, %if.end ]
  %density.3561 = phi float [ %density.5, %for.inc ], [ %density.2586, %if.end ]
  %pt1.sroa.1.3560 = phi float [ %pt1.sroa.1.5, %for.inc ], [ %pt1.sroa.1.2585, %if.end ]
  %pt1.sroa.0.3559 = phi float [ %pt1.sroa.0.5, %for.inc ], [ %pt1.sroa.0.2584, %if.end ]
  %density1.3558 = phi float [ %density1.5, %for.inc ], [ %density1.2583, %if.end ]
  %pt2.sroa.1.3557 = phi float [ %pt2.sroa.1.5, %for.inc ], [ %pt2.sroa.1.2582, %if.end ]
  %pt2.sroa.0.3556 = phi float [ %pt2.sroa.0.5, %for.inc ], [ %pt2.sroa.0.2581, %if.end ]
  %density2.3555 = phi float [ %density2.5, %for.inc ], [ %density2.2580, %if.end ]
  %pt3.sroa.1.3554 = phi float [ %pt3.sroa.1.4, %for.inc ], [ %pt3.sroa.1.2579, %if.end ]
  %pt3.sroa.0.3553 = phi float [ %pt3.sroa.0.4, %for.inc ], [ %pt3.sroa.0.2578, %if.end ]
  %density3.3551 = phi float [ %density3.4, %for.inc ], [ %density3.2577, %if.end ]
  %arrayidx141 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6real_s, i64 0, i64 %indvars.iv, !dbg !1849
  %24 = load float* %arrayidx141, align 4, !dbg !1849, !tbaa !1681
  %arrayidx143 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6imag_s, i64 0, i64 %indvars.iv, !dbg !1850
  %25 = load float* %arrayidx143, align 4, !dbg !1850, !tbaa !1681
  %arrayidx145 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE5sdc_s, i64 0, i64 %indvars.iv, !dbg !1851
  %26 = load float* %arrayidx145, align 4, !dbg !1851, !tbaa !1681
  %cmp147 = fcmp une float %24, 0.000000e+00, !dbg !1852
  %cmp149 = fcmp une float %25, 0.000000e+00, !dbg !1852
  %or.cond = or i1 %cmp147, %cmp149, !dbg !1852
  %cmp151 = fcmp une float %26, 0.000000e+00, !dbg !1852
  %or.cond438 = and i1 %or.cond, %cmp151, !dbg !1852
  br i1 %or.cond438, label %if.then152, label %for.inc, !dbg !1852

if.then152:                                       ; preds = %for.body139
  %arrayidx154 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kx_s, i64 0, i64 %indvars.iv, !dbg !1831
  %27 = load float* %arrayidx154, align 4, !dbg !1831, !tbaa !1681
  %sub156 = fsub float %27, %conv155, !dbg !1831
  %mul161 = fmul float %sub156, %sub156, !dbg !1831
  %arrayidx163 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4ky_s, i64 0, i64 %indvars.iv, !dbg !1832
  %28 = load float* %arrayidx163, align 4, !dbg !1832, !tbaa !1681
  %sub165 = fsub float %28, %conv164, !dbg !1832
  %mul170 = fmul float %sub165, %sub165, !dbg !1832
  %add171 = fadd float %mul161, %mul170, !dbg !1832
  %arrayidx173 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kz_s, i64 0, i64 %indvars.iv, !dbg !1833
  %29 = load float* %arrayidx173, align 4, !dbg !1833, !tbaa !1681
  %sub175 = fsub float %29, %conv174, !dbg !1833
  %mul180 = fmul float %sub175, %sub175, !dbg !1833
  %add181 = fadd float %add171, %mul180, !dbg !1833
  %30 = load float* @_ZL9cutoff2_c, align 4, !dbg !1853, !tbaa !1681
  %cmp182 = fcmp olt float %add181, %30, !dbg !1853
  br i1 %cmp182, label %if.then183, label %if.end202, !dbg !1853

if.then183:                                       ; preds = %if.then152
  %31 = load float* @_ZL15_1overCutoff2_c, align 4, !dbg !1854, !tbaa !1681
  %mul185 = fmul float %add181, %31, !dbg !1854
  %conv188 = fsub float 1.000000e+00, %mul185, !dbg !1854
  %call189 = tail call float @sqrtf(float %conv188) nounwind, !dbg !1854
  %mul190 = fmul float %call189, %beta, !dbg !1854
  %mul.i = fmul float %mul190, %mul190, !dbg !1855
  %mul1.i = fmul float %mul.i, 0x3B39752860000000, !dbg !1856
  %add.i = fadd float %mul1.i, 0x3BE67934C0000000, !dbg !1856
  %mul2.i = fmul float %mul.i, %add.i, !dbg !1856
  %add3.i = fadd float %mul2.i, 0x3C8BA34A20000000, !dbg !1856
  %mul4.i = fmul float %mul.i, %add3.i, !dbg !1856
  %add5.i = fadd float %mul4.i, 0x3D287ED380000000, !dbg !1856
  %mul6.i = fmul float %mul.i, %add5.i, !dbg !1856
  %add7.i = fadd float %mul6.i, 0x3DC08B3AA0000000, !dbg !1856
  %mul8.i = fmul float %mul.i, %add7.i, !dbg !1856
  %add9.i = fadd float %mul8.i, 0x3E51343900000000, !dbg !1856
  %mul10.i = fmul float %mul.i, %add9.i, !dbg !1856
  %add11.i = fadd float %mul10.i, 0x3EDB777D00000000, !dbg !1856
  %mul12.i = fmul float %mul.i, %add11.i, !dbg !1856
  %add13.i = fadd float %mul12.i, 0x3F6098A4A0000000, !dbg !1856
  %mul14.i = fmul float %mul.i, %add13.i, !dbg !1856
  %add15.i = fadd float %mul14.i, 0x3FDDA30AC0000000, !dbg !1856
  %mul16.i = fmul float %mul.i, %add15.i, !dbg !1856
  %add17.i = fadd float %mul16.i, 0x4052DBC240000000, !dbg !1856
  %mul18.i = fmul float %mul.i, %add17.i, !dbg !1856
  %add19.i = fadd float %mul18.i, 0x40C039F680000000, !dbg !1856
  %mul20.i = fmul float %mul.i, %add19.i, !dbg !1856
  %add21.i = fadd float %mul20.i, 0x4121721A40000000, !dbg !1856
  %mul22.i = fmul float %mul.i, %add21.i, !dbg !1856
  %add23.i = fadd float %mul22.i, 0x4174A39560000000, !dbg !1856
  %mul24.i = fmul float %mul.i, %add23.i, !dbg !1856
  %add25.i = fadd float %mul24.i, 0x41B541F680000000, !dbg !1856
  %mul26.i = fmul float %mul.i, %add25.i, !dbg !1856
  %add27.i = fadd float %mul26.i, 0x41D57701A0000000, !dbg !1856
  %sub.i = fadd float %mul.i, 0xC0A808F040000000, !dbg !1857
  %mul28.i = fmul float %mul.i, %sub.i, !dbg !1857
  %add29.i = fadd float %mul28.i, 0x414A8593A0000000, !dbg !1857
  %mul30.i = fmul float %mul.i, %add29.i, !dbg !1857
  %sub31.i = fadd float %mul30.i, 0xC1D57701A0000000, !dbg !1857
  %sub32.i = fsub float -0.000000e+00, %add27.i, !dbg !1858
  %call.i441 = tail call float @__fdividef(float %sub32.i, float %sub31.i), !dbg !1858
  %mul192 = fmul float %26, %call.i441, !dbg !1854
  %mul193 = fmul float %24, %mul192, !dbg !1859
  %add195 = fadd float %pt.sroa.0.3562, %mul193, !dbg !1859
  %mul196 = fmul float %25, %mul192, !dbg !1860
  %add198 = fadd float %pt.sroa.1.3563, %mul196, !dbg !1860
  %conv201 = fadd float %density.3561, 1.000000e+00, !dbg !1861
  %.pre = load float* %arrayidx173, align 4, !dbg !1834, !tbaa !1681
  %.pre659 = load float* @_ZL9cutoff2_c, align 4, !dbg !1862, !tbaa !1681
  br label %if.end202, !dbg !1863

if.end202:                                        ; preds = %if.then183, %if.then152
  %32 = phi float [ %.pre659, %if.then183 ], [ %30, %if.then152 ]
  %33 = phi float [ %.pre, %if.then183 ], [ %29, %if.then152 ]
  %density.4 = phi float [ %conv201, %if.then183 ], [ %density.3561, %if.then152 ]
  %pt.sroa.0.4 = phi float [ %add195, %if.then183 ], [ %pt.sroa.0.3562, %if.then152 ]
  %pt.sroa.1.4 = phi float [ %add198, %if.then183 ], [ %pt.sroa.1.3563, %if.then152 ]
  %sub206 = fsub float %33, %conv205, !dbg !1834
  %mul211 = fmul float %sub206, %sub206, !dbg !1834
  %add212 = fadd float %add171, %mul211, !dbg !1834
  %cmp213 = fcmp olt float %add212, %32, !dbg !1862
  br i1 %cmp213, label %if.then214, label %if.end233, !dbg !1862

if.then214:                                       ; preds = %if.end202
  %34 = load float* @_ZL15_1overCutoff2_c, align 4, !dbg !1864, !tbaa !1681
  %mul216 = fmul float %add212, %34, !dbg !1864
  %conv219 = fsub float 1.000000e+00, %mul216, !dbg !1864
  %call220 = tail call float @sqrtf(float %conv219) nounwind, !dbg !1864
  %mul221 = fmul float %call220, %beta, !dbg !1864
  %mul.i442 = fmul float %mul221, %mul221, !dbg !1865
  %mul1.i443 = fmul float %mul.i442, 0x3B39752860000000, !dbg !1866
  %add.i444 = fadd float %mul1.i443, 0x3BE67934C0000000, !dbg !1866
  %mul2.i445 = fmul float %mul.i442, %add.i444, !dbg !1866
  %add3.i446 = fadd float %mul2.i445, 0x3C8BA34A20000000, !dbg !1866
  %mul4.i447 = fmul float %mul.i442, %add3.i446, !dbg !1866
  %add5.i448 = fadd float %mul4.i447, 0x3D287ED380000000, !dbg !1866
  %mul6.i449 = fmul float %mul.i442, %add5.i448, !dbg !1866
  %add7.i450 = fadd float %mul6.i449, 0x3DC08B3AA0000000, !dbg !1866
  %mul8.i451 = fmul float %mul.i442, %add7.i450, !dbg !1866
  %add9.i452 = fadd float %mul8.i451, 0x3E51343900000000, !dbg !1866
  %mul10.i453 = fmul float %mul.i442, %add9.i452, !dbg !1866
  %add11.i454 = fadd float %mul10.i453, 0x3EDB777D00000000, !dbg !1866
  %mul12.i455 = fmul float %mul.i442, %add11.i454, !dbg !1866
  %add13.i456 = fadd float %mul12.i455, 0x3F6098A4A0000000, !dbg !1866
  %mul14.i457 = fmul float %mul.i442, %add13.i456, !dbg !1866
  %add15.i458 = fadd float %mul14.i457, 0x3FDDA30AC0000000, !dbg !1866
  %mul16.i459 = fmul float %mul.i442, %add15.i458, !dbg !1866
  %add17.i460 = fadd float %mul16.i459, 0x4052DBC240000000, !dbg !1866
  %mul18.i461 = fmul float %mul.i442, %add17.i460, !dbg !1866
  %add19.i462 = fadd float %mul18.i461, 0x40C039F680000000, !dbg !1866
  %mul20.i463 = fmul float %mul.i442, %add19.i462, !dbg !1866
  %add21.i464 = fadd float %mul20.i463, 0x4121721A40000000, !dbg !1866
  %mul22.i465 = fmul float %mul.i442, %add21.i464, !dbg !1866
  %add23.i466 = fadd float %mul22.i465, 0x4174A39560000000, !dbg !1866
  %mul24.i467 = fmul float %mul.i442, %add23.i466, !dbg !1866
  %add25.i468 = fadd float %mul24.i467, 0x41B541F680000000, !dbg !1866
  %mul26.i469 = fmul float %mul.i442, %add25.i468, !dbg !1866
  %add27.i470 = fadd float %mul26.i469, 0x41D57701A0000000, !dbg !1866
  %sub.i471 = fadd float %mul.i442, 0xC0A808F040000000, !dbg !1867
  %mul28.i472 = fmul float %mul.i442, %sub.i471, !dbg !1867
  %add29.i473 = fadd float %mul28.i472, 0x414A8593A0000000, !dbg !1867
  %mul30.i474 = fmul float %mul.i442, %add29.i473, !dbg !1867
  %sub31.i475 = fadd float %mul30.i474, 0xC1D57701A0000000, !dbg !1867
  %sub32.i476 = fsub float -0.000000e+00, %add27.i470, !dbg !1868
  %call.i477 = tail call float @__fdividef(float %sub32.i476, float %sub31.i475), !dbg !1868
  %mul223 = fmul float %26, %call.i477, !dbg !1864
  %mul224 = fmul float %24, %mul223, !dbg !1869
  %add226 = fadd float %pt1.sroa.0.3559, %mul224, !dbg !1869
  %mul227 = fmul float %25, %mul223, !dbg !1870
  %add229 = fadd float %pt1.sroa.1.3560, %mul227, !dbg !1870
  %conv232 = fadd float %density1.3558, 1.000000e+00, !dbg !1871
  %.pre660 = load float* %arrayidx173, align 4, !dbg !1835, !tbaa !1681
  %.pre661 = load float* @_ZL9cutoff2_c, align 4, !dbg !1872, !tbaa !1681
  br label %if.end233, !dbg !1873

if.end233:                                        ; preds = %if.then214, %if.end202
  %35 = phi float [ %.pre661, %if.then214 ], [ %32, %if.end202 ]
  %36 = phi float [ %.pre660, %if.then214 ], [ %33, %if.end202 ]
  %density1.4 = phi float [ %conv232, %if.then214 ], [ %density1.3558, %if.end202 ]
  %pt1.sroa.0.4 = phi float [ %add226, %if.then214 ], [ %pt1.sroa.0.3559, %if.end202 ]
  %pt1.sroa.1.4 = phi float [ %add229, %if.then214 ], [ %pt1.sroa.1.3560, %if.end202 ]
  %sub237 = fsub float %36, %conv236, !dbg !1835
  %mul242 = fmul float %sub237, %sub237, !dbg !1835
  %add243 = fadd float %add171, %mul242, !dbg !1835
  %cmp244 = fcmp olt float %add243, %35, !dbg !1872
  br i1 %cmp244, label %if.then245, label %if.end264, !dbg !1872

if.then245:                                       ; preds = %if.end233
  %37 = load float* @_ZL15_1overCutoff2_c, align 4, !dbg !1874, !tbaa !1681
  %mul247 = fmul float %add243, %37, !dbg !1874
  %conv250 = fsub float 1.000000e+00, %mul247, !dbg !1874
  %call251 = tail call float @sqrtf(float %conv250) nounwind, !dbg !1874
  %mul252 = fmul float %call251, %beta, !dbg !1874
  %mul.i478 = fmul float %mul252, %mul252, !dbg !1875
  %mul1.i479 = fmul float %mul.i478, 0x3B39752860000000, !dbg !1876
  %add.i480 = fadd float %mul1.i479, 0x3BE67934C0000000, !dbg !1876
  %mul2.i481 = fmul float %mul.i478, %add.i480, !dbg !1876
  %add3.i482 = fadd float %mul2.i481, 0x3C8BA34A20000000, !dbg !1876
  %mul4.i483 = fmul float %mul.i478, %add3.i482, !dbg !1876
  %add5.i484 = fadd float %mul4.i483, 0x3D287ED380000000, !dbg !1876
  %mul6.i485 = fmul float %mul.i478, %add5.i484, !dbg !1876
  %add7.i486 = fadd float %mul6.i485, 0x3DC08B3AA0000000, !dbg !1876
  %mul8.i487 = fmul float %mul.i478, %add7.i486, !dbg !1876
  %add9.i488 = fadd float %mul8.i487, 0x3E51343900000000, !dbg !1876
  %mul10.i489 = fmul float %mul.i478, %add9.i488, !dbg !1876
  %add11.i490 = fadd float %mul10.i489, 0x3EDB777D00000000, !dbg !1876
  %mul12.i491 = fmul float %mul.i478, %add11.i490, !dbg !1876
  %add13.i492 = fadd float %mul12.i491, 0x3F6098A4A0000000, !dbg !1876
  %mul14.i493 = fmul float %mul.i478, %add13.i492, !dbg !1876
  %add15.i494 = fadd float %mul14.i493, 0x3FDDA30AC0000000, !dbg !1876
  %mul16.i495 = fmul float %mul.i478, %add15.i494, !dbg !1876
  %add17.i496 = fadd float %mul16.i495, 0x4052DBC240000000, !dbg !1876
  %mul18.i497 = fmul float %mul.i478, %add17.i496, !dbg !1876
  %add19.i498 = fadd float %mul18.i497, 0x40C039F680000000, !dbg !1876
  %mul20.i499 = fmul float %mul.i478, %add19.i498, !dbg !1876
  %add21.i500 = fadd float %mul20.i499, 0x4121721A40000000, !dbg !1876
  %mul22.i501 = fmul float %mul.i478, %add21.i500, !dbg !1876
  %add23.i502 = fadd float %mul22.i501, 0x4174A39560000000, !dbg !1876
  %mul24.i503 = fmul float %mul.i478, %add23.i502, !dbg !1876
  %add25.i504 = fadd float %mul24.i503, 0x41B541F680000000, !dbg !1876
  %mul26.i505 = fmul float %mul.i478, %add25.i504, !dbg !1876
  %add27.i506 = fadd float %mul26.i505, 0x41D57701A0000000, !dbg !1876
  %sub.i507 = fadd float %mul.i478, 0xC0A808F040000000, !dbg !1877
  %mul28.i508 = fmul float %mul.i478, %sub.i507, !dbg !1877
  %add29.i509 = fadd float %mul28.i508, 0x414A8593A0000000, !dbg !1877
  %mul30.i510 = fmul float %mul.i478, %add29.i509, !dbg !1877
  %sub31.i511 = fadd float %mul30.i510, 0xC1D57701A0000000, !dbg !1877
  %sub32.i512 = fsub float -0.000000e+00, %add27.i506, !dbg !1878
  %call.i513 = tail call float @__fdividef(float %sub32.i512, float %sub31.i511), !dbg !1878
  %mul254 = fmul float %26, %call.i513, !dbg !1874
  %mul255 = fmul float %24, %mul254, !dbg !1879
  %add257 = fadd float %pt2.sroa.0.3556, %mul255, !dbg !1879
  %mul258 = fmul float %25, %mul254, !dbg !1880
  %add260 = fadd float %pt2.sroa.1.3557, %mul258, !dbg !1880
  %conv263 = fadd float %density2.3555, 1.000000e+00, !dbg !1881
  %.pre662 = load float* %arrayidx173, align 4, !dbg !1836, !tbaa !1681
  %.pre663 = load float* @_ZL9cutoff2_c, align 4, !dbg !1882, !tbaa !1681
  br label %if.end264, !dbg !1883

if.end264:                                        ; preds = %if.then245, %if.end233
  %38 = phi float [ %.pre663, %if.then245 ], [ %35, %if.end233 ]
  %39 = phi float [ %.pre662, %if.then245 ], [ %36, %if.end233 ]
  %density2.4 = phi float [ %conv263, %if.then245 ], [ %density2.3555, %if.end233 ]
  %pt2.sroa.0.4 = phi float [ %add257, %if.then245 ], [ %pt2.sroa.0.3556, %if.end233 ]
  %pt2.sroa.1.4 = phi float [ %add260, %if.then245 ], [ %pt2.sroa.1.3557, %if.end233 ]
  %sub268 = fsub float %39, %conv267, !dbg !1836
  %mul273 = fmul float %sub268, %sub268, !dbg !1836
  %add274 = fadd float %add171, %mul273, !dbg !1836
  %cmp275 = fcmp olt float %add274, %38, !dbg !1882
  br i1 %cmp275, label %if.then276, label %for.inc, !dbg !1882

if.then276:                                       ; preds = %if.end264
  %40 = load float* @_ZL15_1overCutoff2_c, align 4, !dbg !1884, !tbaa !1681
  %mul278 = fmul float %add274, %40, !dbg !1884
  %conv281 = fsub float 1.000000e+00, %mul278, !dbg !1884
  %call282 = tail call float @sqrtf(float %conv281) nounwind, !dbg !1884
  %mul283 = fmul float %call282, %beta, !dbg !1884
  %mul.i514 = fmul float %mul283, %mul283, !dbg !1885
  %mul1.i515 = fmul float %mul.i514, 0x3B39752860000000, !dbg !1886
  %add.i516 = fadd float %mul1.i515, 0x3BE67934C0000000, !dbg !1886
  %mul2.i517 = fmul float %mul.i514, %add.i516, !dbg !1886
  %add3.i518 = fadd float %mul2.i517, 0x3C8BA34A20000000, !dbg !1886
  %mul4.i519 = fmul float %mul.i514, %add3.i518, !dbg !1886
  %add5.i520 = fadd float %mul4.i519, 0x3D287ED380000000, !dbg !1886
  %mul6.i521 = fmul float %mul.i514, %add5.i520, !dbg !1886
  %add7.i522 = fadd float %mul6.i521, 0x3DC08B3AA0000000, !dbg !1886
  %mul8.i523 = fmul float %mul.i514, %add7.i522, !dbg !1886
  %add9.i524 = fadd float %mul8.i523, 0x3E51343900000000, !dbg !1886
  %mul10.i525 = fmul float %mul.i514, %add9.i524, !dbg !1886
  %add11.i526 = fadd float %mul10.i525, 0x3EDB777D00000000, !dbg !1886
  %mul12.i527 = fmul float %mul.i514, %add11.i526, !dbg !1886
  %add13.i528 = fadd float %mul12.i527, 0x3F6098A4A0000000, !dbg !1886
  %mul14.i529 = fmul float %mul.i514, %add13.i528, !dbg !1886
  %add15.i530 = fadd float %mul14.i529, 0x3FDDA30AC0000000, !dbg !1886
  %mul16.i531 = fmul float %mul.i514, %add15.i530, !dbg !1886
  %add17.i532 = fadd float %mul16.i531, 0x4052DBC240000000, !dbg !1886
  %mul18.i533 = fmul float %mul.i514, %add17.i532, !dbg !1886
  %add19.i534 = fadd float %mul18.i533, 0x40C039F680000000, !dbg !1886
  %mul20.i535 = fmul float %mul.i514, %add19.i534, !dbg !1886
  %add21.i536 = fadd float %mul20.i535, 0x4121721A40000000, !dbg !1886
  %mul22.i537 = fmul float %mul.i514, %add21.i536, !dbg !1886
  %add23.i538 = fadd float %mul22.i537, 0x4174A39560000000, !dbg !1886
  %mul24.i539 = fmul float %mul.i514, %add23.i538, !dbg !1886
  %add25.i540 = fadd float %mul24.i539, 0x41B541F680000000, !dbg !1886
  %mul26.i541 = fmul float %mul.i514, %add25.i540, !dbg !1886
  %add27.i542 = fadd float %mul26.i541, 0x41D57701A0000000, !dbg !1886
  %sub.i543 = fadd float %mul.i514, 0xC0A808F040000000, !dbg !1887
  %mul28.i544 = fmul float %mul.i514, %sub.i543, !dbg !1887
  %add29.i545 = fadd float %mul28.i544, 0x414A8593A0000000, !dbg !1887
  %mul30.i546 = fmul float %mul.i514, %add29.i545, !dbg !1887
  %sub31.i547 = fadd float %mul30.i546, 0xC1D57701A0000000, !dbg !1887
  %sub32.i548 = fsub float -0.000000e+00, %add27.i542, !dbg !1888
  %call.i549 = tail call float @__fdividef(float %sub32.i548, float %sub31.i547), !dbg !1888
  %mul285 = fmul float %26, %call.i549, !dbg !1884
  %mul286 = fmul float %24, %mul285, !dbg !1889
  %add288 = fadd float %pt3.sroa.0.3553, %mul286, !dbg !1889
  %mul289 = fmul float %25, %mul285, !dbg !1890
  %add291 = fadd float %pt3.sroa.1.3554, %mul289, !dbg !1890
  %conv294 = fadd float %density3.3551, 1.000000e+00, !dbg !1891
  br label %for.inc, !dbg !1892

for.inc:                                          ; preds = %if.then276, %if.end264, %for.body139
  %density3.4 = phi float [ %conv294, %if.then276 ], [ %density3.3551, %if.end264 ], [ %density3.3551, %for.body139 ]
  %pt3.sroa.0.4 = phi float [ %add288, %if.then276 ], [ %pt3.sroa.0.3553, %if.end264 ], [ %pt3.sroa.0.3553, %for.body139 ]
  %pt3.sroa.1.4 = phi float [ %add291, %if.then276 ], [ %pt3.sroa.1.3554, %if.end264 ], [ %pt3.sroa.1.3554, %for.body139 ]
  %density2.5 = phi float [ %density2.4, %if.then276 ], [ %density2.4, %if.end264 ], [ %density2.3555, %for.body139 ]
  %pt2.sroa.0.5 = phi float [ %pt2.sroa.0.4, %if.then276 ], [ %pt2.sroa.0.4, %if.end264 ], [ %pt2.sroa.0.3556, %for.body139 ]
  %pt2.sroa.1.5 = phi float [ %pt2.sroa.1.4, %if.then276 ], [ %pt2.sroa.1.4, %if.end264 ], [ %pt2.sroa.1.3557, %for.body139 ]
  %density1.5 = phi float [ %density1.4, %if.then276 ], [ %density1.4, %if.end264 ], [ %density1.3558, %for.body139 ]
  %pt1.sroa.0.5 = phi float [ %pt1.sroa.0.4, %if.then276 ], [ %pt1.sroa.0.4, %if.end264 ], [ %pt1.sroa.0.3559, %for.body139 ]
  %pt1.sroa.1.5 = phi float [ %pt1.sroa.1.4, %if.then276 ], [ %pt1.sroa.1.4, %if.end264 ], [ %pt1.sroa.1.3560, %for.body139 ]
  %density.5 = phi float [ %density.4, %if.then276 ], [ %density.4, %if.end264 ], [ %density.3561, %for.body139 ]
  %pt.sroa.0.5 = phi float [ %pt.sroa.0.4, %if.then276 ], [ %pt.sroa.0.4, %if.end264 ], [ %pt.sroa.0.3562, %for.body139 ]
  %pt.sroa.1.5 = phi float [ %pt.sroa.1.4, %if.then276 ], [ %pt.sroa.1.4, %if.end264 ], [ %pt.sroa.1.3563, %for.body139 ]
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !1841
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !1841
  %exitcond = icmp eq i32 %lftr.wideiv, %21, !dbg !1841
  br i1 %exitcond, label %for.inc297, label %for.body139, !dbg !1841

for.inc297:                                       ; preds = %for.inc, %if.end
  %pt.sroa.1.3.lcssa = phi float [ %pt.sroa.1.2588, %if.end ], [ %pt.sroa.1.5, %for.inc ]
  %pt.sroa.0.3.lcssa = phi float [ %pt.sroa.0.2587, %if.end ], [ %pt.sroa.0.5, %for.inc ]
  %density.3.lcssa = phi float [ %density.2586, %if.end ], [ %density.5, %for.inc ]
  %pt1.sroa.1.3.lcssa = phi float [ %pt1.sroa.1.2585, %if.end ], [ %pt1.sroa.1.5, %for.inc ]
  %pt1.sroa.0.3.lcssa = phi float [ %pt1.sroa.0.2584, %if.end ], [ %pt1.sroa.0.5, %for.inc ]
  %density1.3.lcssa = phi float [ %density1.2583, %if.end ], [ %density1.5, %for.inc ]
  %pt2.sroa.1.3.lcssa = phi float [ %pt2.sroa.1.2582, %if.end ], [ %pt2.sroa.1.5, %for.inc ]
  %pt2.sroa.0.3.lcssa = phi float [ %pt2.sroa.0.2581, %if.end ], [ %pt2.sroa.0.5, %for.inc ]
  %density2.3.lcssa = phi float [ %density2.2580, %if.end ], [ %density2.5, %for.inc ]
  %pt3.sroa.1.3.lcssa = phi float [ %pt3.sroa.1.2579, %if.end ], [ %pt3.sroa.1.4, %for.inc ]
  %pt3.sroa.0.3.lcssa = phi float [ %pt3.sroa.0.2578, %if.end ], [ %pt3.sroa.0.4, %for.inc ]
  %density3.3.lcssa = phi float [ %density3.2577, %if.end ], [ %density3.4, %for.inc ]
  %indvars.iv.next657 = add i64 %indvars.iv656, 1, !dbg !1839
  %41 = trunc i64 %indvars.iv.next657 to i32, !dbg !1839
  %cmp101 = icmp ult i32 %41, %shr, !dbg !1839
  %indvars.iv.next655 = add i32 %indvars.iv654, 64, !dbg !1839
  br i1 %cmp101, label %for.body102, label %for.inc300, !dbg !1839

for.inc300:                                       ; preds = %for.inc297, %for.body86
  %pt.sroa.1.2.lcssa = phi float [ %pt.sroa.1.1614, %for.body86 ], [ %pt.sroa.1.3.lcssa, %for.inc297 ]
  %pt.sroa.0.2.lcssa = phi float [ %pt.sroa.0.1613, %for.body86 ], [ %pt.sroa.0.3.lcssa, %for.inc297 ]
  %density.2.lcssa = phi float [ %density.1612, %for.body86 ], [ %density.3.lcssa, %for.inc297 ]
  %pt1.sroa.1.2.lcssa = phi float [ %pt1.sroa.1.1611, %for.body86 ], [ %pt1.sroa.1.3.lcssa, %for.inc297 ]
  %pt1.sroa.0.2.lcssa = phi float [ %pt1.sroa.0.1610, %for.body86 ], [ %pt1.sroa.0.3.lcssa, %for.inc297 ]
  %density1.2.lcssa = phi float [ %density1.1609, %for.body86 ], [ %density1.3.lcssa, %for.inc297 ]
  %pt2.sroa.1.2.lcssa = phi float [ %pt2.sroa.1.1608, %for.body86 ], [ %pt2.sroa.1.3.lcssa, %for.inc297 ]
  %pt2.sroa.0.2.lcssa = phi float [ %pt2.sroa.0.1607, %for.body86 ], [ %pt2.sroa.0.3.lcssa, %for.inc297 ]
  %density2.2.lcssa = phi float [ %density2.1606, %for.body86 ], [ %density2.3.lcssa, %for.inc297 ]
  %pt3.sroa.1.2.lcssa = phi float [ %pt3.sroa.1.1605, %for.body86 ], [ %pt3.sroa.1.3.lcssa, %for.inc297 ]
  %pt3.sroa.0.2.lcssa = phi float [ %pt3.sroa.0.1604, %for.body86 ], [ %pt3.sroa.0.3.lcssa, %for.inc297 ]
  %density3.2.lcssa = phi float [ %density3.1603, %for.body86 ], [ %density3.3.lcssa, %for.inc297 ]
  %inc301 = add nsw i32 %y83.0602, 1, !dbg !1822
  %cmp85 = icmp sgt i32 %inc301, %cond45, !dbg !1822
  br i1 %cmp85, label %for.inc303, label %for.body86, !dbg !1822

for.inc303:                                       ; preds = %for.inc300, %for.cond84.preheader
  %pt.sroa.1.1.lcssa = phi float [ %pt.sroa.1.0641, %for.cond84.preheader ], [ %pt.sroa.1.2.lcssa, %for.inc300 ]
  %pt.sroa.0.1.lcssa = phi float [ %pt.sroa.0.0640, %for.cond84.preheader ], [ %pt.sroa.0.2.lcssa, %for.inc300 ]
  %density.1.lcssa = phi float [ %density.0639, %for.cond84.preheader ], [ %density.2.lcssa, %for.inc300 ]
  %pt1.sroa.1.1.lcssa = phi float [ %pt1.sroa.1.0638, %for.cond84.preheader ], [ %pt1.sroa.1.2.lcssa, %for.inc300 ]
  %pt1.sroa.0.1.lcssa = phi float [ %pt1.sroa.0.0637, %for.cond84.preheader ], [ %pt1.sroa.0.2.lcssa, %for.inc300 ]
  %density1.1.lcssa = phi float [ %density1.0636, %for.cond84.preheader ], [ %density1.2.lcssa, %for.inc300 ]
  %pt2.sroa.1.1.lcssa = phi float [ %pt2.sroa.1.0635, %for.cond84.preheader ], [ %pt2.sroa.1.2.lcssa, %for.inc300 ]
  %pt2.sroa.0.1.lcssa = phi float [ %pt2.sroa.0.0634, %for.cond84.preheader ], [ %pt2.sroa.0.2.lcssa, %for.inc300 ]
  %density2.1.lcssa = phi float [ %density2.0633, %for.cond84.preheader ], [ %density2.2.lcssa, %for.inc300 ]
  %pt3.sroa.1.1.lcssa = phi float [ %pt3.sroa.1.0632, %for.cond84.preheader ], [ %pt3.sroa.1.2.lcssa, %for.inc300 ]
  %pt3.sroa.0.1.lcssa = phi float [ %pt3.sroa.0.0631, %for.cond84.preheader ], [ %pt3.sroa.0.2.lcssa, %for.inc300 ]
  %density3.1.lcssa = phi float [ %density3.0630, %for.cond84.preheader ], [ %density3.2.lcssa, %for.inc300 ]
  %inc304 = add nsw i32 %z.0628, 1, !dbg !1819
  %cmp82 = icmp sgt i32 %inc304, %cond65, !dbg !1819
  br i1 %cmp82, label %for.end305, label %for.cond84.preheader, !dbg !1819

for.end305:                                       ; preds = %for.inc303, %entry
  %pt.sroa.1.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pt.sroa.1.1.lcssa, %for.inc303 ]
  %pt.sroa.0.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pt.sroa.0.1.lcssa, %for.inc303 ]
  %density.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %density.1.lcssa, %for.inc303 ]
  %pt1.sroa.1.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pt1.sroa.1.1.lcssa, %for.inc303 ]
  %pt1.sroa.0.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pt1.sroa.0.1.lcssa, %for.inc303 ]
  %density1.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %density1.1.lcssa, %for.inc303 ]
  %pt2.sroa.1.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pt2.sroa.1.1.lcssa, %for.inc303 ]
  %pt2.sroa.0.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pt2.sroa.0.1.lcssa, %for.inc303 ]
  %density2.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %density2.1.lcssa, %for.inc303 ]
  %pt3.sroa.1.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pt3.sroa.1.1.lcssa, %for.inc303 ]
  %pt3.sroa.0.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %pt3.sroa.0.1.lcssa, %for.inc303 ]
  %density3.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %density3.1.lcssa, %for.inc303 ]
  %idxprom306 = sext i32 %add69 to i64, !dbg !1893
  %pt.sroa.0.0..idx = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom306, i32 0, !dbg !1893
  store float %pt.sroa.0.0.lcssa, float* %pt.sroa.0.0..idx, align 8, !dbg !1893
  %pt.sroa.1.4..idx388 = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom306, i32 1, !dbg !1893
  store float %pt.sroa.1.0.lcssa, float* %pt.sroa.1.4..idx388, align 4, !dbg !1893
  %arrayidx309 = getelementptr inbounds float* %sampleDensity_g, i64 %idxprom306, !dbg !1894
  store float %density.0.lcssa, float* %arrayidx309, align 4, !dbg !1894, !tbaa !1681
  %idxprom310 = sext i32 %add71 to i64, !dbg !1895
  %pt1.sroa.0.0..idx = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom310, i32 0, !dbg !1895
  store float %pt1.sroa.0.0.lcssa, float* %pt1.sroa.0.0..idx, align 8, !dbg !1895
  %pt1.sroa.1.4..idx386 = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom310, i32 1, !dbg !1895
  store float %pt1.sroa.1.0.lcssa, float* %pt1.sroa.1.4..idx386, align 4, !dbg !1895
  %arrayidx313 = getelementptr inbounds float* %sampleDensity_g, i64 %idxprom310, !dbg !1896
  store float %density1.0.lcssa, float* %arrayidx313, align 4, !dbg !1896, !tbaa !1681
  %idxprom314 = sext i32 %add73 to i64, !dbg !1897
  %pt2.sroa.0.0..idx = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom314, i32 0, !dbg !1897
  store float %pt2.sroa.0.0.lcssa, float* %pt2.sroa.0.0..idx, align 8, !dbg !1897
  %pt2.sroa.1.4..idx384 = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom314, i32 1, !dbg !1897
  store float %pt2.sroa.1.0.lcssa, float* %pt2.sroa.1.4..idx384, align 4, !dbg !1897
  %arrayidx317 = getelementptr inbounds float* %sampleDensity_g, i64 %idxprom314, !dbg !1898
  store float %density2.0.lcssa, float* %arrayidx317, align 4, !dbg !1898, !tbaa !1681
  %idxprom318 = sext i32 %add75 to i64, !dbg !1899
  %pt3.sroa.0.0..idx = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom318, i32 0, !dbg !1899
  store float %pt3.sroa.0.0.lcssa, float* %pt3.sroa.0.0..idx, align 8, !dbg !1899
  %pt3.sroa.1.4..idx382 = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom318, i32 1, !dbg !1899
  store float %pt3.sroa.1.0.lcssa, float* %pt3.sroa.1.4..idx382, align 4, !dbg !1899
  %arrayidx321 = getelementptr inbounds float* %sampleDensity_g, i64 %idxprom318, !dbg !1900
  store float %density3.0.lcssa, float* %arrayidx321, align 4, !dbg !1900, !tbaa !1681
  ret void, !dbg !1901
}

declare void @__syncthreads() section "__device__"

declare float @sqrtf(float) nounwind section "__device__"

define i32 @_Z7comparePKvS0_(i8* nocapture %a, i8* nocapture %b) nounwind uwtable readonly {
entry:
  %0 = bitcast i8* %a to i32*, !dbg !1902
  %1 = load i32* %0, align 4, !dbg !1902, !tbaa !1672
  %2 = bitcast i8* %b to i32*, !dbg !1902
  %3 = load i32* %2, align 4, !dbg !1902, !tbaa !1672
  %sub = sub nsw i32 %1, %3, !dbg !1902
  ret i32 %sub, !dbg !1902
}

define void @_Z14CUDA_interfaceP11pb_TimerSetj10parametersP20ReconstructionSamplePfiP5cmplxS4_(%struct.pb_TimerSet* nocapture %timers, i32 %n, %struct.parameters* byval align 8 %params, %struct.ReconstructionSample* %sample, float* nocapture %LUT, i32 %s
entry:
  %size_xy = alloca i32, align 4
  %cutoff = alloca float, align 4
  %cutoff2 = alloca float, align 4
  %_1overCutoff2 = alloca float, align 4
  %sample_d = alloca %struct.ReconstructionSample*, align 8
  %sortedSample_d = alloca float*, align 8
  %gridData_d = alloca %struct.float2*, align 8
  %sampleDensity_d = alloca float*, align 8
  %idxKey_d = alloca i32*, align 8
  %idxValue_d = alloca i32*, align 8
  %binStartAddr_d = alloca i32*, align 8
  %cpuStart = alloca i32, align 4
  %CPUbin = alloca i32*, align 8
  %gridSize = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, !dbg !1904
  %0 = bitcast [3 x i32]* %gridSize to i64*, !dbg !1904
  %1 = load i64* %0, align 8, !dbg !1904
  %2 = trunc i64 %1 to i32, !dbg !1904
  %3 = lshr i64 %1, 32
  %4 = trunc i64 %3 to i32
  %arrayidx4 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 2, !dbg !1905
  %5 = bitcast i32* %arrayidx4 to i64*, !dbg !1905
  %6 = load i64* %5, align 8, !dbg !1905
  %7 = trunc i64 %6 to i32, !dbg !1905
  %mul = mul nsw i32 %4, %2, !dbg !1906
  store i32 %mul, i32* %size_xy, align 4, !dbg !1906, !tbaa !1672
  %mul6 = mul nsw i32 %mul, %7, !dbg !1907
  %kernelWidth = getelementptr inbounds %struct.parameters* %params, i64 0, i32 6, !dbg !1908
  %8 = load float* %kernelWidth, align 8, !dbg !1908, !tbaa !1681
  %mul7 = fmul float %8, 4.000000e+00, !dbg !1908
  %mul9 = fmul float %8, %mul7, !dbg !1908
  %9 = lshr i64 %6, 32
  %10 = trunc i64 %9 to i32
  %11 = bitcast i32 %10 to float
  %mul11 = fmul float %11, %11, !dbg !1908
  %div = fdiv float %mul9, %mul11, !dbg !1908
  %conv = fpext float %div to double, !dbg !1908
  %conv13 = fpext float %11 to double, !dbg !1908
  %sub = fadd double %conv13, -5.000000e-01, !dbg !1908
  %mul14 = fmul double %conv, %sub, !dbg !1908
  %mul18 = fmul double %sub, %mul14, !dbg !1908
  %sub19 = fadd double %mul18, -8.000000e-01, !dbg !1908
  %call = call double @sqrt(double %sub19) nounwind, !dbg !1908
  %conv25 = fmul float %8, 5.000000e-01, !dbg !1909
  store float %conv25, float* %cutoff, align 4, !dbg !1909, !tbaa !1681
  %mul26 = fmul float %conv25, %conv25, !dbg !1910
  store float %mul26, float* %cutoff2, align 4, !dbg !1910, !tbaa !1681
  %div27 = fdiv float 1.000000e+00, %mul26, !dbg !1911
  store float %div27, float* %_1overCutoff2, align 4, !dbg !1911, !tbaa !1681
  %rem = and i32 %n, 63, !dbg !1912
  %cmp = icmp eq i32 %rem, 0, !dbg !1912
  %sub29 = sub i32 64, %rem, !dbg !1913
  %npad.0 = select i1 %cmp, i32 0, i32 %sub29, !dbg !1912
  store %struct.ReconstructionSample* null, %struct.ReconstructionSample** %sample_d, align 8, !dbg !1915, !tbaa !1728
  store float* null, float** %sortedSample_d, align 8, !dbg !1916, !tbaa !1728
  store %struct.float2* null, %struct.float2** %gridData_d, align 8, !dbg !1917, !tbaa !1728
  store float* null, float** %sampleDensity_d, align 8, !dbg !1918, !tbaa !1728
  store i32* null, i32** %idxKey_d, align 8, !dbg !1919, !tbaa !1728
  store i32* null, i32** %idxValue_d, align 8, !dbg !1920, !tbaa !1728
  store i32* null, i32** %binStartAddr_d, align 8, !dbg !1921, !tbaa !1728
  %12 = bitcast float** %sortedSample_d to i8**, !dbg !1922
  %add = add i32 %npad.0, %n, !dbg !1922
  %conv30 = zext i32 %add to i64, !dbg !1922
  %mul31 = mul i64 %conv30, 24, !dbg !1922
  %call32 = call i32 @cudaMalloc(i8** %12, i64 %mul31), !dbg !1922
  %13 = bitcast i32** %binStartAddr_d to i8**, !dbg !1923
  %add33 = add nsw i32 %mul6, 1, !dbg !1923
  %conv34 = sext i32 %add33 to i64, !dbg !1923
  %mul35 = shl nsw i64 %conv34, 2, !dbg !1923
  %call36 = call i32 @cudaMalloc(i8** %13, i64 %mul35), !dbg !1923
  %14 = bitcast %struct.ReconstructionSample** %sample_d to i8**, !dbg !1924
  %conv37 = zext i32 %n to i64, !dbg !1924
  %mul38 = mul i64 %conv37, 24, !dbg !1924
  %call39 = call i32 @cudaMalloc(i8** %14, i64 %mul38), !dbg !1924
  %15 = bitcast i32** %idxKey_d to i8**, !dbg !1925
  %add40 = add i32 %n, 3, !dbg !1925
  %div41 = and i32 %add40, -4, !dbg !1925
  %conv43 = zext i32 %div41 to i64, !dbg !1925
  %mul44 = shl nuw nsw i64 %conv43, 2, !dbg !1925
  %call45 = call i32 @cudaMalloc(i8** %15, i64 %mul44), !dbg !1925
  %16 = bitcast i32** %idxValue_d to i8**, !dbg !1926
  %call51 = call i32 @cudaMalloc(i8** %16, i64 %mul44), !dbg !1926
  %17 = load i32** %binStartAddr_d, align 8, !dbg !1927, !tbaa !1728
  %call52 = call i32 @cudaGetLastError(), !dbg !1928
  %cmp53 = icmp eq i32 %call52, 0, !dbg !1928
  br i1 %cmp53, label %do.end, label %if.then54, !dbg !1928

if.then54:                                        ; preds = %entry
  %call55 = call i8* @cudaGetErrorString(i32 %call52), !dbg !1929
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str111, i64 0, i64 0), i8* %call55, i32 123), !dbg !1929
  br label %return, !dbg !1929

do.end:                                           ; preds = %entry
  %18 = bitcast float* %cutoff2 to i8*, !dbg !1931
  %call.i = call i32 @cudaMemcpyToSymbol(i8* bitcast (float* @_ZL9cutoff2_c to i8*), i8* %18, i64 4, i64 0, i32 1), !dbg !1932
  %19 = bitcast float* %cutoff to i8*, !dbg !1934
  %call.i162 = call i32 @cudaMemcpyToSymbol(i8* bitcast (float* @_ZL8cutoff_c to i8*), i8* %19, i64 4, i64 0, i32 1), !dbg !1935
  %20 = bitcast [3 x i32]* %gridSize to i8*, !dbg !1936
  %call.i163 = call i32 @cudaMemcpyToSymbol(i8* bitcast ([3 x i32]* @_ZL10gridSize_c to i8*), i8* %20, i64 12, i64 0, i32 1), !dbg !1937
  %21 = bitcast i32* %size_xy to i8*, !dbg !1939
  %call.i164 = call i32 @cudaMemcpyToSymbol(i8* bitcast (i32* @_ZL9size_xy_c to i8*), i8* %21, i64 4, i64 0, i32 1), !dbg !1940
  %22 = bitcast float* %_1overCutoff2 to i8*, !dbg !1942
  %call.i165 = call i32 @cudaMemcpyToSymbol(i8* bitcast (float* @_ZL15_1overCutoff2_c to i8*), i8* %22, i64 4, i64 0, i32 1), !dbg !1943
  %23 = load %struct.ReconstructionSample** %sample_d, align 8, !dbg !1944, !tbaa !1728
  %24 = bitcast %struct.ReconstructionSample* %23 to i8*, !dbg !1944
  %25 = bitcast %struct.ReconstructionSample* %sample to i8*, !dbg !1944
  %call66 = call i32 @cudaMemcpy(i8* %24, i8* %25, i64 %mul38, i32 1), !dbg !1944
  %26 = bitcast i32* %17 to i8*, !dbg !1945
  %call70 = call i32 @cudaMemset(i8* %26, i32 0, i64 %mul35), !dbg !1945
  %27 = load i32** %idxKey_d, align 8, !dbg !1946, !tbaa !1728
  %add.ptr = getelementptr inbounds i32* %27, i64 %conv37, !dbg !1946
  %28 = bitcast i32* %add.ptr to i8*, !dbg !1946
  %sub72 = sub i32 %div41, %n, !dbg !1946
  %conv73 = zext i32 %sub72 to i64, !dbg !1946
  %mul74 = shl nuw nsw i64 %conv73, 2, !dbg !1946
  %call75 = call i32 @cudaMemset(i8* %28, i32 255, i64 %mul74), !dbg !1946
  %sub81 = add i32 %n, 511, !dbg !1947
  %div82 = lshr i32 %sub81, 9, !dbg !1947
  %grid1.sroa.0.0.insert.ext = zext i32 %div82 to i64, !dbg !1948
  %grid1.sroa.0.4.insert.insert = or i64 %grid1.sroa.0.0.insert.ext, 4294967296, !dbg !1948
  %29 = load %struct.ReconstructionSample** %sample_d, align 8, !dbg !1950, !tbaa !1728
  %30 = bitcast %struct.ReconstructionSample* %29 to i8*, !dbg !1950
  call void @klee_make_symbolic(i8* %30, i64 %mul38, i8* getelementptr inbounds ([15 x i8]* @.str212, i64 0, i64 0)), !dbg !1950
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %grid1.sroa.0.4.insert.insert, i32 1, i64 4294967808, i32 1), !dbg !1951
  %31 = load %struct.ReconstructionSample** %sample_d, align 8, !dbg !1953, !tbaa !1728
  %32 = load i32** %idxKey_d, align 8, !dbg !1953, !tbaa !1728
  %33 = load i32** %idxValue_d, align 8, !dbg !1953, !tbaa !1728
  %binsize = getelementptr inbounds %struct.parameters* %params, i64 0, i32 7, !dbg !1953
  %34 = load i32* %binsize, align 4, !dbg !1953, !tbaa !1672
  call void @_Z14binning_kerneljP20ReconstructionSamplePjS1_S1_jj(i32 %n, %struct.ReconstructionSample* %31, i32* %32, i32* %33, i32* %17, i32 %34, i32 %mul6), !dbg !1953
  call void @_Z4sortijRPjS0_(i32 %n, i32 %add33, i32** %idxKey_d, i32** %idxValue_d), !dbg !1954
  %35 = load i32** %idxKey_d, align 8, !dbg !1955, !tbaa !1728
  %36 = bitcast i32* %35 to i8*, !dbg !1955
  %call87 = call i32 @cudaFree(i8* %36), !dbg !1955
  %37 = load %struct.ReconstructionSample** %sample_d, align 8, !dbg !1956, !tbaa !1728
  %38 = bitcast %struct.ReconstructionSample* %37 to i8*, !dbg !1956
  %call88 = call i32 @cudaFree(i8* %38), !dbg !1956
  %39 = bitcast i32* %cpuStart to i8*, !dbg !1957
  %idx.ext89 = sext i32 %mul6 to i64, !dbg !1957
  %add.ptr90 = getelementptr inbounds i32* %17, i64 %idx.ext89, !dbg !1957
  %40 = bitcast i32* %add.ptr90 to i8*, !dbg !1957
  %call91 = call i32 @cudaMemcpy(i8* %39, i8* %40, i64 4, i32 2), !dbg !1957
  %41 = load i32* %cpuStart, align 4, !dbg !1958, !tbaa !1672
  %sub92 = sub nsw i32 %n, %41, !dbg !1958
  %42 = bitcast i32** %CPUbin to i8**, !dbg !1959
  %conv93 = sext i32 %sub92 to i64, !dbg !1959
  %mul94 = shl nsw i64 %conv93, 2, !dbg !1959
  %call95 = call i32 @cudaMallocHost(i8** %42, i64 %mul94), !dbg !1959
  %43 = load i32** %CPUbin, align 8, !dbg !1960, !tbaa !1728
  %44 = bitcast i32* %43 to i8*, !dbg !1960
  %45 = load i32** %idxValue_d, align 8, !dbg !1960, !tbaa !1728
  %46 = load i32* %cpuStart, align 4, !dbg !1960, !tbaa !1672
  %idx.ext96 = sext i32 %46 to i64, !dbg !1960
  %add.ptr97 = getelementptr inbounds i32* %45, i64 %idx.ext96, !dbg !1960
  %47 = bitcast i32* %add.ptr97 to i8*, !dbg !1960
  %call100 = call i32 @cudaMemcpy(i8* %44, i8* %47, i64 %mul94, i32 2), !dbg !1960
  %48 = load i32** %idxValue_d, align 8, !dbg !1961, !tbaa !1728
  %49 = bitcast i32* %48 to i8*, !dbg !1961
  %call101 = call i32 @cudaFree(i8* %49), !dbg !1961
  %50 = bitcast %struct.float2** %gridData_d to i8**, !dbg !1962
  %mul103 = shl nsw i64 %idx.ext89, 3, !dbg !1962
  %call104 = call i32 @cudaMalloc(i8** %50, i64 %mul103), !dbg !1962
  %51 = bitcast float** %sampleDensity_d to i8**, !dbg !1963
  %mul106 = shl nsw i64 %idx.ext89, 2, !dbg !1963
  %call107 = call i32 @cudaMalloc(i8** %51, i64 %mul106), !dbg !1963
  %call110 = call i32 @cudaGetLastError(), !dbg !1964
  %cmp111 = icmp eq i32 %call110, 0, !dbg !1964
  br i1 %cmp111, label %do.end116, label %if.then112, !dbg !1964

if.then112:                                       ; preds = %do.end
  %call113 = call i8* @cudaGetErrorString(i32 %call110), !dbg !1965
  %call114 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str111, i64 0, i64 0), i8* %call113, i32 230), !dbg !1965
  br label %return, !dbg !1965

do.end116:                                        ; preds = %do.end
  %52 = load %struct.float2** %gridData_d, align 8, !dbg !1967, !tbaa !1728
  %53 = bitcast %struct.float2* %52 to i8*, !dbg !1967
  %call119 = call i32 @cudaMemset(i8* %53, i32 0, i64 %mul103), !dbg !1967
  %54 = load float** %sampleDensity_d, align 8, !dbg !1968, !tbaa !1728
  %55 = bitcast float* %54 to i8*, !dbg !1968
  %call122 = call i32 @cudaMemset(i8* %55, i32 0, i64 %mul106), !dbg !1968
  %56 = load i32** %CPUbin, align 8, !dbg !1969, !tbaa !1728
  %57 = bitcast i32* %56 to i8*, !dbg !1969
  %call123 = call i32 @cudaFreeHost(i8* %57), !dbg !1969
  %58 = load %struct.float2** %gridData_d, align 8, !dbg !1970, !tbaa !1728
  %59 = bitcast %struct.float2* %58 to i8*, !dbg !1970
  %call124 = call i32 @cudaFree(i8* %59), !dbg !1970
  %60 = load float** %sampleDensity_d, align 8, !dbg !1971, !tbaa !1728
  %61 = bitcast float* %60 to i8*, !dbg !1971
  %call125 = call i32 @cudaFree(i8* %61), !dbg !1971
  %call126 = call i32 @cudaFree(i8* %26), !dbg !1972
  %62 = load float** %sortedSample_d, align 8, !dbg !1973, !tbaa !1728
  %63 = bitcast float* %62 to i8*, !dbg !1973
  %call127 = call i32 @cudaFree(i8* %63), !dbg !1973
  br label %return, !dbg !1974

return:                                           ; preds = %do.end116, %if.then112, %if.then54
  ret void, !dbg !1975
}

declare double @sqrt(double) nounwind section "__device__"

declare void @klee_make_symbolic(i8*, i64, i8*)

declare void @__set_CUDAConfig(i64, i32, i64, i32, ...)

declare void @_Z4sortijRPjS0_(i32, i32, i32**, i32**)

declare float @ceilf(float) nounwind readnone

declare i32 @__uAtomicAdd(i32*, i32) section "__device__"

define void @klee_div_zero_check(i64 %z) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %z, 0, !dbg !1976
  br i1 %cmp, label %if.then, label %if.end, !dbg !1976

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([65 x i8]* @.str25, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str126, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str227, i64 0, i64 0)) noreturn nounwind, !
  unreachable, !dbg !1978

if.end:                                           ; preds = %entry
  ret void, !dbg !1979
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !1980
  br i1 %cmp3, label %while.end, label %while.body, !dbg !1980

while.body:                                       ; preds = %while.body, %entry
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %srcaddr, %entry ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %destaddr, %entry ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %len, %entry ]
  %dec = add i64 %len.addr.04, -1, !dbg !1980
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !1981
  %0 = load i8* %src.06, align 1, !dbg !1981, !tbaa !1669
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !1981
  store i8 %0, i8* %dest.05, align 1, !dbg !1981, !tbaa !1669
  %cmp = icmp eq i64 %dec, 0, !dbg !1980
  br i1 %cmp, label %while.end, label %while.body, !dbg !1980

while.end:                                        ; preds = %while.body, %entry
  ret i8* %destaddr, !dbg !1982
}

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
entry:
  %cmp2 = icmp eq i64 %count, 0, !dbg !1983
  br i1 %cmp2, label %while.end, label %while.body.lr.ph, !dbg !1983

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %s to i8, !dbg !1984
  br label %while.body, !dbg !1983

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %a.04 = phi i8* [ %dst, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %count.addr.03 = phi i64 [ %count, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i64 %count.addr.03, -1, !dbg !1983
  %incdec.ptr = getelementptr inbounds i8* %a.04, i64 1, !dbg !1984
  store volatile i8 %conv, i8* %a.04, align 1, !dbg !1984, !tbaa !1669
  %cmp = icmp eq i64 %dec, 0, !dbg !1983
  br i1 %cmp, label %while.end, label %while.body, !dbg !1983

while.end:                                        ; preds = %while.body, %entry
  ret i8* %dst, !dbg !1985
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1986
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
entry:
  tail call void @free(i8* %devPtr) nounwind, !dbg !1988
  ret i32 0, !dbg !1990
}

declare void @free(i8* nocapture) nounwind

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
entry:
  %0 = bitcast %struct.cudaArray* %array to i8*, !dbg !1991
  tail call void @free(i8* %0) nounwind, !dbg !1991
  ret i32 0, !dbg !1993
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
entry:
  tail call void @free(i8* %ptr) nounwind, !dbg !1994
  ret i32 0, !dbg !1996
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1997
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1999
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2001
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2003
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2005
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2007
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2009
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
entry:
  tail call void @__set_device(), !dbg !2011
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !2013
  store i8* %call, i8** %devPtr, align 8, !dbg !2013, !tbaa !1728
  tail call void @__clear_device(), !dbg !2014
  ret i32 0, !dbg !2015
}

declare void @__set_device()

declare noalias i8* @malloc(i64) nounwind

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2016
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2018
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2020
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
entry:
  tail call void @__set_host(), !dbg !2022
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !2024
  store i8* %call, i8** %ptr, align 8, !dbg !2024, !tbaa !1728
  tail call void @__clear_host(), !dbg !2025
  ret i32 0, !dbg !2026
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2027
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !2029
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2031
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2033
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2035
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2037
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2039
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2041
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2043
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2045
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2047
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2049
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2051
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2053
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2055
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2057
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2059
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2061
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2063
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !2065
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !2067
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2069
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2071
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
entry:
  %add.ptr = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !2073
  %0 = call i8* @memcpy(i8* %add.ptr, i8* %src, i64 %count)
  ret i32 0, !dbg !2075
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2076
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2078
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
entry:
  %0 = trunc i32 %value to i8, !dbg !2080
  %1 = zext i8 %0 to i32
  %2 = call i8* @memset(i8* %devPtr, i32 %1, i64 %count)
  ret i32 0, !dbg !2082
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2083
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2085
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2087
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2089
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2091
}

define i32 @cudaChooseDevice(i32* nocapture %device, %struct.cudaDeviceProp* nocapture %prop) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !2093, !tbaa !1672
  ret i32 0, !dbg !2095
}

define i32 @cudaDeviceGetByPCIBusId(i32* nocapture %device, i8* nocapture %pciBusId) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !2096, !tbaa !1672
  ret i32 0, !dbg !2098
}

define i32 @cudaDeviceGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2099
}

define i32 @cudaDeviceGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2101
}

define i32 @cudaDeviceGetPCIBusId(i8* nocapture %pciBusId, i32 %len, i32 %device) nounwind uwtable {
entry:
  %0 = bitcast i8* %pciBusId to i32*, !dbg !2103
  store i32 3171433, i32* %0, align 1, !dbg !2103
  ret i32 0, !dbg !2105
}

define i32 @cudaDeviceReset() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2106
}

define i32 @cudaDeviceSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2108
}

define i32 @cudaDeviceSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2110
}

define i32 @cudaDeviceSynchronize() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2112
}

define i32 @cudaGetDevice(i32* nocapture %device) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !2114, !tbaa !1672
  ret i32 0, !dbg !2116
}

define i32 @cudaGetDeviceCount(i32* nocapture %count) nounwind uwtable {
entry:
  store i32 1, i32* %count, align 4, !dbg !2117, !tbaa !1672
  ret i32 0, !dbg !2119
}

define i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nocapture %prop, i32 %device) nounwind uwtable {
entry:
  %arraydecay = getelementptr inbounds %struct.cudaDeviceProp* %prop, i64 0, i32 0, i64 0, !dbg !2120
  %0 = call i8* @memcpy(i8* %arraydecay, i8* getelementptr inbounds ([11 x i8]* @.str150, i64 0, i64 0), i64 11)
  ret i32 0, !dbg !2122
}

define i32 @cudaIpcCloseMemHandle(i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2123
}

define i32 @cudaIpcGetEventHandle(%struct.cudaIpcEventHandle_st* nocapture %handle, %struct.CUevent_st* nocapture %event) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2125
}

define i32 @cudaIpcGetMemHandle(%struct.cudaIpcMemHandle_st* nocapture %handle, i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2127
}

define i32 @cudaIpcOpenEventHandle(%struct.CUevent_st** nocapture %event, %struct.cudaIpcEventHandle_st* nocapture byval align 8 %handle) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2129
}

define i32 @cudaIpcOpenMemHandle(i8** nocapture %devPtr, %struct.cudaIpcMemHandle_st* nocapture byval align 8 %handle, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2131
}

define i32 @cudaSetDevice(i32 %device) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2133
}

define i32 @cudaSetDeviceFlags(i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2135
}

define i32 @cudaSetValidDevices(i32* nocapture %device_arr, i32 %len) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2137
}

define i8* @cudaGetErrorString(i32 %error) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* getelementptr inbounds ([25 x i8]* @msg, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @cudaGetErrorString.tmp, i64 0, i64 0), i64 17)
  ret i8* getelementptr inbounds ([25 x i8]* @msg, i64 0, i64 0), !dbg !2139
}

define i32 @cudaGetLastError() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2140
}

define i32 @cudaPeekAtLastError() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2142
}

!llvm.dbg.cu = !{!0, !378, !832, !843, !861, !877, !894, !1414, !1633}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32 0, me
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3, metadata !15, metadata !19}
!3 = metadata !{i32 786436, null, metadata !"pb_TimerID", metadata !4, i32 93, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [pb_TimerID] [line 93, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/../parboil/common/include/parboil.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type 
!5 = metadata !{metadata !6, metadata !7, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !13, metadata !14}
!6 = metadata !{i32 786472, metadata !"pb_TimerID_NONE", i64 0} ; [ DW_TAG_enumerator ] [pb_TimerID_NONE :: 0]
!7 = metadata !{i32 786472, metadata !"pb_TimerID_IO", i64 1} ; [ DW_TAG_enumerator ] [pb_TimerID_IO :: 1]
!8 = metadata !{i32 786472, metadata !"pb_TimerID_KERNEL", i64 2} ; [ DW_TAG_enumerator ] [pb_TimerID_KERNEL :: 2]
!9 = metadata !{i32 786472, metadata !"pb_TimerID_COPY", i64 3} ; [ DW_TAG_enumerator ] [pb_TimerID_COPY :: 3]
!10 = metadata !{i32 786472, metadata !"pb_TimerID_DRIVER", i64 4} ; [ DW_TAG_enumerator ] [pb_TimerID_DRIVER :: 4]
!11 = metadata !{i32 786472, metadata !"pb_TimerID_COPY_ASYNC", i64 5} ; [ DW_TAG_enumerator ] [pb_TimerID_COPY_ASYNC :: 5]
!12 = metadata !{i32 786472, metadata !"pb_TimerID_COMPUTE", i64 6} ; [ DW_TAG_enumerator ] [pb_TimerID_COMPUTE :: 6]
!13 = metadata !{i32 786472, metadata !"pb_TimerID_OVERLAP", i64 7} ; [ DW_TAG_enumerator ] [pb_TimerID_OVERLAP :: 7]
!14 = metadata !{i32 786472, metadata !"pb_TimerID_LAST", i64 8} ; [ DW_TAG_enumerator ] [pb_TimerID_LAST :: 8]
!15 = metadata !{i32 786436, null, metadata !"pb_TimerState", metadata !4, i32 53, i64 32, i64 32, i32 0, i32 0, null, metadata !16, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [pb_TimerState] [line 53, size 32, align 32, offset 0] [from ]
!16 = metadata !{metadata !17, metadata !18}
!17 = metadata !{i32 786472, metadata !"pb_Timer_STOPPED", i64 0} ; [ DW_TAG_enumerator ] [pb_Timer_STOPPED :: 0]
!18 = metadata !{i32 786472, metadata !"pb_Timer_RUNNING", i64 1} ; [ DW_TAG_enumerator ] [pb_Timer_RUNNING :: 1]
!19 = metadata !{i32 786436, null, metadata !"cudaError", metadata !20, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !21, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!20 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!21 = metadata !{metadata !22, metadata !23, metadata !24, metadata !25, metadata !26, metadata !27, metadata !28, metadata !29, metadata !30, metadata !31, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !37, metadata !38,
!22 = metadata !{i32 786472, metadata !"cudaSuccess", i64 0} ; [ DW_TAG_enumerator ] [cudaSuccess :: 0]
!23 = metadata !{i32 786472, metadata !"cudaErrorMissingConfiguration", i64 1} ; [ DW_TAG_enumerator ] [cudaErrorMissingConfiguration :: 1]
!24 = metadata !{i32 786472, metadata !"cudaErrorMemoryAllocation", i64 2} ; [ DW_TAG_enumerator ] [cudaErrorMemoryAllocation :: 2]
!25 = metadata !{i32 786472, metadata !"cudaErrorInitializationError", i64 3} ; [ DW_TAG_enumerator ] [cudaErrorInitializationError :: 3]
!26 = metadata !{i32 786472, metadata !"cudaErrorLaunchFailure", i64 4} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFailure :: 4]
!27 = metadata !{i32 786472, metadata !"cudaErrorPriorLaunchFailure", i64 5} ; [ DW_TAG_enumerator ] [cudaErrorPriorLaunchFailure :: 5]
!28 = metadata !{i32 786472, metadata !"cudaErrorLaunchTimeout", i64 6} ; [ DW_TAG_enumerator ] [cudaErrorLaunchTimeout :: 6]
!29 = metadata !{i32 786472, metadata !"cudaErrorLaunchOutOfResources", i64 7} ; [ DW_TAG_enumerator ] [cudaErrorLaunchOutOfResources :: 7]
!30 = metadata !{i32 786472, metadata !"cudaErrorInvalidDeviceFunction", i64 8} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDeviceFunction :: 8]
!31 = metadata !{i32 786472, metadata !"cudaErrorInvalidConfiguration", i64 9} ; [ DW_TAG_enumerator ] [cudaErrorInvalidConfiguration :: 9]
!32 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevice", i64 10} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevice :: 10]
!33 = metadata !{i32 786472, metadata !"cudaErrorInvalidValue", i64 11} ; [ DW_TAG_enumerator ] [cudaErrorInvalidValue :: 11]
!34 = metadata !{i32 786472, metadata !"cudaErrorInvalidPitchValue", i64 12} ; [ DW_TAG_enumerator ] [cudaErrorInvalidPitchValue :: 12]
!35 = metadata !{i32 786472, metadata !"cudaErrorInvalidSymbol", i64 13} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSymbol :: 13]
!36 = metadata !{i32 786472, metadata !"cudaErrorMapBufferObjectFailed", i64 14} ; [ DW_TAG_enumerator ] [cudaErrorMapBufferObjectFailed :: 14]
!37 = metadata !{i32 786472, metadata !"cudaErrorUnmapBufferObjectFailed", i64 15} ; [ DW_TAG_enumerator ] [cudaErrorUnmapBufferObjectFailed :: 15]
!38 = metadata !{i32 786472, metadata !"cudaErrorInvalidHostPointer", i64 16} ; [ DW_TAG_enumerator ] [cudaErrorInvalidHostPointer :: 16]
!39 = metadata !{i32 786472, metadata !"cudaErrorInvalidDevicePointer", i64 17} ; [ DW_TAG_enumerator ] [cudaErrorInvalidDevicePointer :: 17]
!40 = metadata !{i32 786472, metadata !"cudaErrorInvalidTexture", i64 18} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTexture :: 18]
!41 = metadata !{i32 786472, metadata !"cudaErrorInvalidTextureBinding", i64 19} ; [ DW_TAG_enumerator ] [cudaErrorInvalidTextureBinding :: 19]
!42 = metadata !{i32 786472, metadata !"cudaErrorInvalidChannelDescriptor", i64 20} ; [ DW_TAG_enumerator ] [cudaErrorInvalidChannelDescriptor :: 20]
!43 = metadata !{i32 786472, metadata !"cudaErrorInvalidMemcpyDirection", i64 21} ; [ DW_TAG_enumerator ] [cudaErrorInvalidMemcpyDirection :: 21]
!44 = metadata !{i32 786472, metadata !"cudaErrorAddressOfConstant", i64 22} ; [ DW_TAG_enumerator ] [cudaErrorAddressOfConstant :: 22]
!45 = metadata !{i32 786472, metadata !"cudaErrorTextureFetchFailed", i64 23} ; [ DW_TAG_enumerator ] [cudaErrorTextureFetchFailed :: 23]
!46 = metadata !{i32 786472, metadata !"cudaErrorTextureNotBound", i64 24} ; [ DW_TAG_enumerator ] [cudaErrorTextureNotBound :: 24]
!47 = metadata !{i32 786472, metadata !"cudaErrorSynchronizationError", i64 25} ; [ DW_TAG_enumerator ] [cudaErrorSynchronizationError :: 25]
!48 = metadata !{i32 786472, metadata !"cudaErrorInvalidFilterSetting", i64 26} ; [ DW_TAG_enumerator ] [cudaErrorInvalidFilterSetting :: 26]
!49 = metadata !{i32 786472, metadata !"cudaErrorInvalidNormSetting", i64 27} ; [ DW_TAG_enumerator ] [cudaErrorInvalidNormSetting :: 27]
!50 = metadata !{i32 786472, metadata !"cudaErrorMixedDeviceExecution", i64 28} ; [ DW_TAG_enumerator ] [cudaErrorMixedDeviceExecution :: 28]
!51 = metadata !{i32 786472, metadata !"cudaErrorCudartUnloading", i64 29} ; [ DW_TAG_enumerator ] [cudaErrorCudartUnloading :: 29]
!52 = metadata !{i32 786472, metadata !"cudaErrorUnknown", i64 30} ; [ DW_TAG_enumerator ] [cudaErrorUnknown :: 30]
!53 = metadata !{i32 786472, metadata !"cudaErrorNotYetImplemented", i64 31} ; [ DW_TAG_enumerator ] [cudaErrorNotYetImplemented :: 31]
!54 = metadata !{i32 786472, metadata !"cudaErrorMemoryValueTooLarge", i64 32} ; [ DW_TAG_enumerator ] [cudaErrorMemoryValueTooLarge :: 32]
!55 = metadata !{i32 786472, metadata !"cudaErrorInvalidResourceHandle", i64 33} ; [ DW_TAG_enumerator ] [cudaErrorInvalidResourceHandle :: 33]
!56 = metadata !{i32 786472, metadata !"cudaErrorNotReady", i64 34} ; [ DW_TAG_enumerator ] [cudaErrorNotReady :: 34]
!57 = metadata !{i32 786472, metadata !"cudaErrorInsufficientDriver", i64 35} ; [ DW_TAG_enumerator ] [cudaErrorInsufficientDriver :: 35]
!58 = metadata !{i32 786472, metadata !"cudaErrorSetOnActiveProcess", i64 36} ; [ DW_TAG_enumerator ] [cudaErrorSetOnActiveProcess :: 36]
!59 = metadata !{i32 786472, metadata !"cudaErrorInvalidSurface", i64 37} ; [ DW_TAG_enumerator ] [cudaErrorInvalidSurface :: 37]
!60 = metadata !{i32 786472, metadata !"cudaErrorNoDevice", i64 38} ; [ DW_TAG_enumerator ] [cudaErrorNoDevice :: 38]
!61 = metadata !{i32 786472, metadata !"cudaErrorECCUncorrectable", i64 39} ; [ DW_TAG_enumerator ] [cudaErrorECCUncorrectable :: 39]
!62 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectSymbolNotFound", i64 40} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectSymbolNotFound :: 40]
!63 = metadata !{i32 786472, metadata !"cudaErrorSharedObjectInitFailed", i64 41} ; [ DW_TAG_enumerator ] [cudaErrorSharedObjectInitFailed :: 41]
!64 = metadata !{i32 786472, metadata !"cudaErrorUnsupportedLimit", i64 42} ; [ DW_TAG_enumerator ] [cudaErrorUnsupportedLimit :: 42]
!65 = metadata !{i32 786472, metadata !"cudaErrorDuplicateVariableName", i64 43} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateVariableName :: 43]
!66 = metadata !{i32 786472, metadata !"cudaErrorDuplicateTextureName", i64 44} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateTextureName :: 44]
!67 = metadata !{i32 786472, metadata !"cudaErrorDuplicateSurfaceName", i64 45} ; [ DW_TAG_enumerator ] [cudaErrorDuplicateSurfaceName :: 45]
!68 = metadata !{i32 786472, metadata !"cudaErrorDevicesUnavailable", i64 46} ; [ DW_TAG_enumerator ] [cudaErrorDevicesUnavailable :: 46]
!69 = metadata !{i32 786472, metadata !"cudaErrorInvalidKernelImage", i64 47} ; [ DW_TAG_enumerator ] [cudaErrorInvalidKernelImage :: 47]
!70 = metadata !{i32 786472, metadata !"cudaErrorNoKernelImageForDevice", i64 48} ; [ DW_TAG_enumerator ] [cudaErrorNoKernelImageForDevice :: 48]
!71 = metadata !{i32 786472, metadata !"cudaErrorIncompatibleDriverContext", i64 49} ; [ DW_TAG_enumerator ] [cudaErrorIncompatibleDriverContext :: 49]
!72 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessAlreadyEnabled", i64 50} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessAlreadyEnabled :: 50]
!73 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessNotEnabled", i64 51} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessNotEnabled :: 51]
!74 = metadata !{i32 786472, metadata !"cudaErrorDeviceAlreadyInUse", i64 54} ; [ DW_TAG_enumerator ] [cudaErrorDeviceAlreadyInUse :: 54]
!75 = metadata !{i32 786472, metadata !"cudaErrorProfilerDisabled", i64 55} ; [ DW_TAG_enumerator ] [cudaErrorProfilerDisabled :: 55]
!76 = metadata !{i32 786472, metadata !"cudaErrorProfilerNotInitialized", i64 56} ; [ DW_TAG_enumerator ] [cudaErrorProfilerNotInitialized :: 56]
!77 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStarted", i64 57} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStarted :: 57]
!78 = metadata !{i32 786472, metadata !"cudaErrorProfilerAlreadyStopped", i64 58} ; [ DW_TAG_enumerator ] [cudaErrorProfilerAlreadyStopped :: 58]
!79 = metadata !{i32 786472, metadata !"cudaErrorAssert", i64 59} ; [ DW_TAG_enumerator ] [cudaErrorAssert :: 59]
!80 = metadata !{i32 786472, metadata !"cudaErrorTooManyPeers", i64 60} ; [ DW_TAG_enumerator ] [cudaErrorTooManyPeers :: 60]
!81 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryAlreadyRegistered", i64 61} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryAlreadyRegistered :: 61]
!82 = metadata !{i32 786472, metadata !"cudaErrorHostMemoryNotRegistered", i64 62} ; [ DW_TAG_enumerator ] [cudaErrorHostMemoryNotRegistered :: 62]
!83 = metadata !{i32 786472, metadata !"cudaErrorOperatingSystem", i64 63} ; [ DW_TAG_enumerator ] [cudaErrorOperatingSystem :: 63]
!84 = metadata !{i32 786472, metadata !"cudaErrorPeerAccessUnsupported", i64 64} ; [ DW_TAG_enumerator ] [cudaErrorPeerAccessUnsupported :: 64]
!85 = metadata !{i32 786472, metadata !"cudaErrorLaunchMaxDepthExceeded", i64 65} ; [ DW_TAG_enumerator ] [cudaErrorLaunchMaxDepthExceeded :: 65]
!86 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedTex", i64 66} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedTex :: 66]
!87 = metadata !{i32 786472, metadata !"cudaErrorLaunchFileScopedSurf", i64 67} ; [ DW_TAG_enumerator ] [cudaErrorLaunchFileScopedSurf :: 67]
!88 = metadata !{i32 786472, metadata !"cudaErrorSyncDepthExceeded", i64 68} ; [ DW_TAG_enumerator ] [cudaErrorSyncDepthExceeded :: 68]
!89 = metadata !{i32 786472, metadata !"cudaErrorLaunchPendingCountExceeded", i64 69} ; [ DW_TAG_enumerator ] [cudaErrorLaunchPendingCountExceeded :: 69]
!90 = metadata !{i32 786472, metadata !"cudaErrorNotPermitted", i64 70} ; [ DW_TAG_enumerator ] [cudaErrorNotPermitted :: 70]
!91 = metadata !{i32 786472, metadata !"cudaErrorNotSupported", i64 71} ; [ DW_TAG_enumerator ] [cudaErrorNotSupported :: 71]
!92 = metadata !{i32 786472, metadata !"cudaErrorStartupFailure", i64 127} ; [ DW_TAG_enumerator ] [cudaErrorStartupFailure :: 127]
!93 = metadata !{i32 786472, metadata !"cudaErrorApiFailureBase", i64 10000} ; [ DW_TAG_enumerator ] [cudaErrorApiFailureBase :: 10000]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 0}
!96 = metadata !{metadata !97}
!97 = metadata !{metadata !98, metadata !254, metadata !287, metadata !370}
!98 = metadata !{i32 786478, i32 0, metadata !99, metadata !"setParameters", metadata !"setParameters", metadata !"_Z13setParametersP8_IO_FILEP10parameters", metadata !99, i32 25, metadata !100, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, vo
!99 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!100 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !101, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!101 = metadata !{null, metadata !102, metadata !160}
!102 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !103} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!103 = metadata !{i32 786454, null, metadata !"FILE", metadata !99, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !104} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!104 = metadata !{i32 786451, null, metadata !"_IO_FILE", metadata !105, i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !106, i32 0, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [from ]
!105 = metadata !{i32 786473, metadata !"/usr/include/libio.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!106 = metadata !{metadata !107, metadata !109, metadata !112, metadata !113, metadata !114, metadata !115, metadata !116, metadata !117, metadata !118, metadata !119, metadata !120, metadata !121, metadata !122, metadata !130, metadata !131, metadata !1
!107 = metadata !{i32 786445, metadata !104, metadata !"_flags", metadata !105, i32 246, i64 32, i64 32, i64 0, i32 0, metadata !108} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!108 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!109 = metadata !{i32 786445, metadata !104, metadata !"_IO_read_ptr", metadata !105, i32 251, i64 64, i64 64, i64 64, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!110 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !111} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!111 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!112 = metadata !{i32 786445, metadata !104, metadata !"_IO_read_end", metadata !105, i32 252, i64 64, i64 64, i64 128, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!113 = metadata !{i32 786445, metadata !104, metadata !"_IO_read_base", metadata !105, i32 253, i64 64, i64 64, i64 192, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!114 = metadata !{i32 786445, metadata !104, metadata !"_IO_write_base", metadata !105, i32 254, i64 64, i64 64, i64 256, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!115 = metadata !{i32 786445, metadata !104, metadata !"_IO_write_ptr", metadata !105, i32 255, i64 64, i64 64, i64 320, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!116 = metadata !{i32 786445, metadata !104, metadata !"_IO_write_end", metadata !105, i32 256, i64 64, i64 64, i64 384, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!117 = metadata !{i32 786445, metadata !104, metadata !"_IO_buf_base", metadata !105, i32 257, i64 64, i64 64, i64 448, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!118 = metadata !{i32 786445, metadata !104, metadata !"_IO_buf_end", metadata !105, i32 258, i64 64, i64 64, i64 512, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!119 = metadata !{i32 786445, metadata !104, metadata !"_IO_save_base", metadata !105, i32 260, i64 64, i64 64, i64 576, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!120 = metadata !{i32 786445, metadata !104, metadata !"_IO_backup_base", metadata !105, i32 261, i64 64, i64 64, i64 640, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!121 = metadata !{i32 786445, metadata !104, metadata !"_IO_save_end", metadata !105, i32 262, i64 64, i64 64, i64 704, i32 0, metadata !110} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!122 = metadata !{i32 786445, metadata !104, metadata !"_markers", metadata !105, i32 264, i64 64, i64 64, i64 768, i32 0, metadata !123} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!123 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !124} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!124 = metadata !{i32 786451, null, metadata !"_IO_marker", metadata !105, i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !125, i32 0, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [from ]
!125 = metadata !{metadata !126, metadata !127, metadata !129}
!126 = metadata !{i32 786445, metadata !124, metadata !"_next", metadata !105, i32 161, i64 64, i64 64, i64 0, i32 0, metadata !123} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!127 = metadata !{i32 786445, metadata !124, metadata !"_sbuf", metadata !105, i32 162, i64 64, i64 64, i64 64, i32 0, metadata !128} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!128 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !104} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!129 = metadata !{i32 786445, metadata !124, metadata !"_pos", metadata !105, i32 166, i64 32, i64 32, i64 128, i32 0, metadata !108} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!130 = metadata !{i32 786445, metadata !104, metadata !"_chain", metadata !105, i32 266, i64 64, i64 64, i64 832, i32 0, metadata !128} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!131 = metadata !{i32 786445, metadata !104, metadata !"_fileno", metadata !105, i32 268, i64 32, i64 32, i64 896, i32 0, metadata !108} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!132 = metadata !{i32 786445, metadata !104, metadata !"_flags2", metadata !105, i32 272, i64 32, i64 32, i64 928, i32 0, metadata !108} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!133 = metadata !{i32 786445, metadata !104, metadata !"_old_offset", metadata !105, i32 274, i64 64, i64 64, i64 960, i32 0, metadata !134} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!134 = metadata !{i32 786454, null, metadata !"__off_t", metadata !105, i32 131, i64 0, i64 0, i64 0, i32 0, metadata !135} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!135 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!136 = metadata !{i32 786445, metadata !104, metadata !"_cur_column", metadata !105, i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !137} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!137 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!138 = metadata !{i32 786445, metadata !104, metadata !"_vtable_offset", metadata !105, i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !139} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!139 = metadata !{i32 786468, null, metadata !"signed char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!140 = metadata !{i32 786445, metadata !104, metadata !"_shortbuf", metadata !105, i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !141} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!141 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !111, metadata !142, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!142 = metadata !{metadata !143}
!143 = metadata !{i32 786465, i64 0, i64 0}       ; [ DW_TAG_subrange_type ] [0, 0]
!144 = metadata !{i32 786445, metadata !104, metadata !"_lock", metadata !105, i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !145} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!145 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!146 = metadata !{i32 786445, metadata !104, metadata !"_offset", metadata !105, i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !147} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!147 = metadata !{i32 786454, null, metadata !"__off64_t", metadata !105, i32 132, i64 0, i64 0, i64 0, i32 0, metadata !135} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!148 = metadata !{i32 786445, metadata !104, metadata !"__pad1", metadata !105, i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !145} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!149 = metadata !{i32 786445, metadata !104, metadata !"__pad2", metadata !105, i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !145} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!150 = metadata !{i32 786445, metadata !104, metadata !"__pad3", metadata !105, i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !145} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!151 = metadata !{i32 786445, metadata !104, metadata !"__pad4", metadata !105, i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !145} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!152 = metadata !{i32 786445, metadata !104, metadata !"__pad5", metadata !105, i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !153} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!153 = metadata !{i32 786454, null, metadata !"size_t", metadata !105, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !154} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!154 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!155 = metadata !{i32 786445, metadata !104, metadata !"_mode", metadata !105, i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !108} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!156 = metadata !{i32 786445, metadata !104, metadata !"_unused2", metadata !105, i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !157} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!157 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 160, i64 8, i32 0, i32 0, metadata !111, metadata !158, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!158 = metadata !{metadata !159}
!159 = metadata !{i32 786465, i64 0, i64 19}      ; [ DW_TAG_subrange_type ] [0, 19]
!160 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !161} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from parameters]
!161 = metadata !{i32 786454, null, metadata !"parameters", metadata !99, i32 22, i64 0, i64 0, i64 0, i32 0, metadata !162} ; [ DW_TAG_typedef ] [parameters] [line 22, size 0, align 0, offset 0] [from ]
!162 = metadata !{i32 786451, null, metadata !"", metadata !163, i32 12, i64 544, i64 32, i32 0, i32 0, null, metadata !164, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 12, size 544, align 32, offset 0] [from ]
!163 = metadata !{i32 786473, metadata !"./UDTypes.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!164 = metadata !{metadata !165, metadata !166, metadata !170, metadata !171, metadata !174, metadata !175, metadata !176, metadata !177, metadata !178}
!165 = metadata !{i32 786445, metadata !162, metadata !"numSamples", metadata !163, i32 13, i64 32, i64 32, i64 0, i32 0, metadata !108} ; [ DW_TAG_member ] [numSamples] [line 13, size 32, align 32, offset 0] [from int]
!166 = metadata !{i32 786445, metadata !162, metadata !"aquisitionMatrixSize", metadata !163, i32 14, i64 96, i64 32, i64 32, i32 0, metadata !167} ; [ DW_TAG_member ] [aquisitionMatrixSize] [line 14, size 96, align 32, offset 32] [from ]
!167 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !108, metadata !168, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!168 = metadata !{metadata !169}
!169 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 2]
!170 = metadata !{i32 786445, metadata !162, metadata !"reconstructionMatrixSize", metadata !163, i32 15, i64 96, i64 32, i64 128, i32 0, metadata !167} ; [ DW_TAG_member ] [reconstructionMatrixSize] [line 15, size 96, align 32, offset 128] [from ]
!171 = metadata !{i32 786445, metadata !162, metadata !"kMax", metadata !163, i32 16, i64 96, i64 32, i64 224, i32 0, metadata !172} ; [ DW_TAG_member ] [kMax] [line 16, size 96, align 32, offset 224] [from ]
!172 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !173, metadata !168, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from float]
!173 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!174 = metadata !{i32 786445, metadata !162, metadata !"gridSize", metadata !163, i32 17, i64 96, i64 32, i64 320, i32 0, metadata !167} ; [ DW_TAG_member ] [gridSize] [line 17, size 96, align 32, offset 320] [from ]
!175 = metadata !{i32 786445, metadata !162, metadata !"oversample", metadata !163, i32 18, i64 32, i64 32, i64 416, i32 0, metadata !173} ; [ DW_TAG_member ] [oversample] [line 18, size 32, align 32, offset 416] [from float]
!176 = metadata !{i32 786445, metadata !162, metadata !"kernelWidth", metadata !163, i32 19, i64 32, i64 32, i64 448, i32 0, metadata !173} ; [ DW_TAG_member ] [kernelWidth] [line 19, size 32, align 32, offset 448] [from float]
!177 = metadata !{i32 786445, metadata !162, metadata !"binsize", metadata !163, i32 20, i64 32, i64 32, i64 480, i32 0, metadata !108} ; [ DW_TAG_member ] [binsize] [line 20, size 32, align 32, offset 480] [from int]
!178 = metadata !{i32 786445, metadata !162, metadata !"useLUT", metadata !163, i32 21, i64 32, i64 32, i64 512, i32 0, metadata !108} ; [ DW_TAG_member ] [useLUT] [line 21, size 32, align 32, offset 512] [from int]
!179 = metadata !{metadata !180}
!180 = metadata !{metadata !181, metadata !182, metadata !183}
!181 = metadata !{i32 786689, metadata !98, metadata !"file", metadata !99, i32 16777241, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file] [line 25]
!182 = metadata !{i32 786689, metadata !98, metadata !"p", metadata !99, i32 33554457, metadata !160, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 25]
!183 = metadata !{i32 786688, metadata !184, metadata !"deviceProp", metadata !99, i32 35, metadata !185, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [deviceProp] [line 35]
!184 = metadata !{i32 786443, metadata !98, i32 25, i32 0, metadata !99, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!185 = metadata !{i32 786451, null, metadata !"cudaDeviceProp", metadata !20, i32 1145, i64 4800, i64 64, i32 0, i32 0, null, metadata !186, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaDeviceProp] [line 1145, size 4800, align 64, offset 0] [from 
!186 = metadata !{metadata !187, metadata !191, metadata !192, metadata !193, metadata !194, metadata !195, metadata !196, metadata !197, metadata !198, metadata !199, metadata !200, metadata !201, metadata !202, metadata !203, metadata !204, metadata !2
!187 = metadata !{i32 786445, metadata !185, metadata !"name", metadata !20, i32 1147, i64 2048, i64 8, i64 0, i32 0, metadata !188} ; [ DW_TAG_member ] [name] [line 1147, size 2048, align 8, offset 0] [from ]
!188 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !111, metadata !189, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!189 = metadata !{metadata !190}
!190 = metadata !{i32 786465, i64 0, i64 255}     ; [ DW_TAG_subrange_type ] [0, 255]
!191 = metadata !{i32 786445, metadata !185, metadata !"totalGlobalMem", metadata !20, i32 1148, i64 64, i64 64, i64 2048, i32 0, metadata !153} ; [ DW_TAG_member ] [totalGlobalMem] [line 1148, size 64, align 64, offset 2048] [from size_t]
!192 = metadata !{i32 786445, metadata !185, metadata !"sharedMemPerBlock", metadata !20, i32 1149, i64 64, i64 64, i64 2112, i32 0, metadata !153} ; [ DW_TAG_member ] [sharedMemPerBlock] [line 1149, size 64, align 64, offset 2112] [from size_t]
!193 = metadata !{i32 786445, metadata !185, metadata !"regsPerBlock", metadata !20, i32 1150, i64 32, i64 32, i64 2176, i32 0, metadata !108} ; [ DW_TAG_member ] [regsPerBlock] [line 1150, size 32, align 32, offset 2176] [from int]
!194 = metadata !{i32 786445, metadata !185, metadata !"warpSize", metadata !20, i32 1151, i64 32, i64 32, i64 2208, i32 0, metadata !108} ; [ DW_TAG_member ] [warpSize] [line 1151, size 32, align 32, offset 2208] [from int]
!195 = metadata !{i32 786445, metadata !185, metadata !"memPitch", metadata !20, i32 1152, i64 64, i64 64, i64 2240, i32 0, metadata !153} ; [ DW_TAG_member ] [memPitch] [line 1152, size 64, align 64, offset 2240] [from size_t]
!196 = metadata !{i32 786445, metadata !185, metadata !"maxThreadsPerBlock", metadata !20, i32 1153, i64 32, i64 32, i64 2304, i32 0, metadata !108} ; [ DW_TAG_member ] [maxThreadsPerBlock] [line 1153, size 32, align 32, offset 2304] [from int]
!197 = metadata !{i32 786445, metadata !185, metadata !"maxThreadsDim", metadata !20, i32 1154, i64 96, i64 32, i64 2336, i32 0, metadata !167} ; [ DW_TAG_member ] [maxThreadsDim] [line 1154, size 96, align 32, offset 2336] [from ]
!198 = metadata !{i32 786445, metadata !185, metadata !"maxGridSize", metadata !20, i32 1155, i64 96, i64 32, i64 2432, i32 0, metadata !167} ; [ DW_TAG_member ] [maxGridSize] [line 1155, size 96, align 32, offset 2432] [from ]
!199 = metadata !{i32 786445, metadata !185, metadata !"clockRate", metadata !20, i32 1156, i64 32, i64 32, i64 2528, i32 0, metadata !108} ; [ DW_TAG_member ] [clockRate] [line 1156, size 32, align 32, offset 2528] [from int]
!200 = metadata !{i32 786445, metadata !185, metadata !"totalConstMem", metadata !20, i32 1157, i64 64, i64 64, i64 2560, i32 0, metadata !153} ; [ DW_TAG_member ] [totalConstMem] [line 1157, size 64, align 64, offset 2560] [from size_t]
!201 = metadata !{i32 786445, metadata !185, metadata !"major", metadata !20, i32 1158, i64 32, i64 32, i64 2624, i32 0, metadata !108} ; [ DW_TAG_member ] [major] [line 1158, size 32, align 32, offset 2624] [from int]
!202 = metadata !{i32 786445, metadata !185, metadata !"minor", metadata !20, i32 1159, i64 32, i64 32, i64 2656, i32 0, metadata !108} ; [ DW_TAG_member ] [minor] [line 1159, size 32, align 32, offset 2656] [from int]
!203 = metadata !{i32 786445, metadata !185, metadata !"textureAlignment", metadata !20, i32 1160, i64 64, i64 64, i64 2688, i32 0, metadata !153} ; [ DW_TAG_member ] [textureAlignment] [line 1160, size 64, align 64, offset 2688] [from size_t]
!204 = metadata !{i32 786445, metadata !185, metadata !"texturePitchAlignment", metadata !20, i32 1161, i64 64, i64 64, i64 2752, i32 0, metadata !153} ; [ DW_TAG_member ] [texturePitchAlignment] [line 1161, size 64, align 64, offset 2752] [from size_t]
!205 = metadata !{i32 786445, metadata !185, metadata !"deviceOverlap", metadata !20, i32 1162, i64 32, i64 32, i64 2816, i32 0, metadata !108} ; [ DW_TAG_member ] [deviceOverlap] [line 1162, size 32, align 32, offset 2816] [from int]
!206 = metadata !{i32 786445, metadata !185, metadata !"multiProcessorCount", metadata !20, i32 1163, i64 32, i64 32, i64 2848, i32 0, metadata !108} ; [ DW_TAG_member ] [multiProcessorCount] [line 1163, size 32, align 32, offset 2848] [from int]
!207 = metadata !{i32 786445, metadata !185, metadata !"kernelExecTimeoutEnabled", metadata !20, i32 1164, i64 32, i64 32, i64 2880, i32 0, metadata !108} ; [ DW_TAG_member ] [kernelExecTimeoutEnabled] [line 1164, size 32, align 32, offset 2880] [from in
!208 = metadata !{i32 786445, metadata !185, metadata !"integrated", metadata !20, i32 1165, i64 32, i64 32, i64 2912, i32 0, metadata !108} ; [ DW_TAG_member ] [integrated] [line 1165, size 32, align 32, offset 2912] [from int]
!209 = metadata !{i32 786445, metadata !185, metadata !"canMapHostMemory", metadata !20, i32 1166, i64 32, i64 32, i64 2944, i32 0, metadata !108} ; [ DW_TAG_member ] [canMapHostMemory] [line 1166, size 32, align 32, offset 2944] [from int]
!210 = metadata !{i32 786445, metadata !185, metadata !"computeMode", metadata !20, i32 1167, i64 32, i64 32, i64 2976, i32 0, metadata !108} ; [ DW_TAG_member ] [computeMode] [line 1167, size 32, align 32, offset 2976] [from int]
!211 = metadata !{i32 786445, metadata !185, metadata !"maxTexture1D", metadata !20, i32 1168, i64 32, i64 32, i64 3008, i32 0, metadata !108} ; [ DW_TAG_member ] [maxTexture1D] [line 1168, size 32, align 32, offset 3008] [from int]
!212 = metadata !{i32 786445, metadata !185, metadata !"maxTexture1DMipmap", metadata !20, i32 1169, i64 32, i64 32, i64 3040, i32 0, metadata !108} ; [ DW_TAG_member ] [maxTexture1DMipmap] [line 1169, size 32, align 32, offset 3040] [from int]
!213 = metadata !{i32 786445, metadata !185, metadata !"maxTexture1DLinear", metadata !20, i32 1170, i64 32, i64 32, i64 3072, i32 0, metadata !108} ; [ DW_TAG_member ] [maxTexture1DLinear] [line 1170, size 32, align 32, offset 3072] [from int]
!214 = metadata !{i32 786445, metadata !185, metadata !"maxTexture2D", metadata !20, i32 1171, i64 64, i64 32, i64 3104, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTexture2D] [line 1171, size 64, align 32, offset 3104] [from ]
!215 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 32, i32 0, i32 0, metadata !108, metadata !216, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!216 = metadata !{metadata !217}
!217 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 1]
!218 = metadata !{i32 786445, metadata !185, metadata !"maxTexture2DMipmap", metadata !20, i32 1172, i64 64, i64 32, i64 3168, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTexture2DMipmap] [line 1172, size 64, align 32, offset 3168] [from ]
!219 = metadata !{i32 786445, metadata !185, metadata !"maxTexture2DLinear", metadata !20, i32 1173, i64 96, i64 32, i64 3232, i32 0, metadata !167} ; [ DW_TAG_member ] [maxTexture2DLinear] [line 1173, size 96, align 32, offset 3232] [from ]
!220 = metadata !{i32 786445, metadata !185, metadata !"maxTexture2DGather", metadata !20, i32 1174, i64 64, i64 32, i64 3328, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTexture2DGather] [line 1174, size 64, align 32, offset 3328] [from ]
!221 = metadata !{i32 786445, metadata !185, metadata !"maxTexture3D", metadata !20, i32 1175, i64 96, i64 32, i64 3392, i32 0, metadata !167} ; [ DW_TAG_member ] [maxTexture3D] [line 1175, size 96, align 32, offset 3392] [from ]
!222 = metadata !{i32 786445, metadata !185, metadata !"maxTexture3DAlt", metadata !20, i32 1176, i64 96, i64 32, i64 3488, i32 0, metadata !167} ; [ DW_TAG_member ] [maxTexture3DAlt] [line 1176, size 96, align 32, offset 3488] [from ]
!223 = metadata !{i32 786445, metadata !185, metadata !"maxTextureCubemap", metadata !20, i32 1177, i64 32, i64 32, i64 3584, i32 0, metadata !108} ; [ DW_TAG_member ] [maxTextureCubemap] [line 1177, size 32, align 32, offset 3584] [from int]
!224 = metadata !{i32 786445, metadata !185, metadata !"maxTexture1DLayered", metadata !20, i32 1178, i64 64, i64 32, i64 3616, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTexture1DLayered] [line 1178, size 64, align 32, offset 3616] [from ]
!225 = metadata !{i32 786445, metadata !185, metadata !"maxTexture2DLayered", metadata !20, i32 1179, i64 96, i64 32, i64 3680, i32 0, metadata !167} ; [ DW_TAG_member ] [maxTexture2DLayered] [line 1179, size 96, align 32, offset 3680] [from ]
!226 = metadata !{i32 786445, metadata !185, metadata !"maxTextureCubemapLayered", metadata !20, i32 1180, i64 64, i64 32, i64 3776, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTextureCubemapLayered] [line 1180, size 64, align 32, offset 3776] [from ]
!227 = metadata !{i32 786445, metadata !185, metadata !"maxSurface1D", metadata !20, i32 1181, i64 32, i64 32, i64 3840, i32 0, metadata !108} ; [ DW_TAG_member ] [maxSurface1D] [line 1181, size 32, align 32, offset 3840] [from int]
!228 = metadata !{i32 786445, metadata !185, metadata !"maxSurface2D", metadata !20, i32 1182, i64 64, i64 32, i64 3872, i32 0, metadata !215} ; [ DW_TAG_member ] [maxSurface2D] [line 1182, size 64, align 32, offset 3872] [from ]
!229 = metadata !{i32 786445, metadata !185, metadata !"maxSurface3D", metadata !20, i32 1183, i64 96, i64 32, i64 3936, i32 0, metadata !167} ; [ DW_TAG_member ] [maxSurface3D] [line 1183, size 96, align 32, offset 3936] [from ]
!230 = metadata !{i32 786445, metadata !185, metadata !"maxSurface1DLayered", metadata !20, i32 1184, i64 64, i64 32, i64 4032, i32 0, metadata !215} ; [ DW_TAG_member ] [maxSurface1DLayered] [line 1184, size 64, align 32, offset 4032] [from ]
!231 = metadata !{i32 786445, metadata !185, metadata !"maxSurface2DLayered", metadata !20, i32 1185, i64 96, i64 32, i64 4096, i32 0, metadata !167} ; [ DW_TAG_member ] [maxSurface2DLayered] [line 1185, size 96, align 32, offset 4096] [from ]
!232 = metadata !{i32 786445, metadata !185, metadata !"maxSurfaceCubemap", metadata !20, i32 1186, i64 32, i64 32, i64 4192, i32 0, metadata !108} ; [ DW_TAG_member ] [maxSurfaceCubemap] [line 1186, size 32, align 32, offset 4192] [from int]
!233 = metadata !{i32 786445, metadata !185, metadata !"maxSurfaceCubemapLayered", metadata !20, i32 1187, i64 64, i64 32, i64 4224, i32 0, metadata !215} ; [ DW_TAG_member ] [maxSurfaceCubemapLayered] [line 1187, size 64, align 32, offset 4224] [from ]
!234 = metadata !{i32 786445, metadata !185, metadata !"surfaceAlignment", metadata !20, i32 1188, i64 64, i64 64, i64 4288, i32 0, metadata !153} ; [ DW_TAG_member ] [surfaceAlignment] [line 1188, size 64, align 64, offset 4288] [from size_t]
!235 = metadata !{i32 786445, metadata !185, metadata !"concurrentKernels", metadata !20, i32 1189, i64 32, i64 32, i64 4352, i32 0, metadata !108} ; [ DW_TAG_member ] [concurrentKernels] [line 1189, size 32, align 32, offset 4352] [from int]
!236 = metadata !{i32 786445, metadata !185, metadata !"ECCEnabled", metadata !20, i32 1190, i64 32, i64 32, i64 4384, i32 0, metadata !108} ; [ DW_TAG_member ] [ECCEnabled] [line 1190, size 32, align 32, offset 4384] [from int]
!237 = metadata !{i32 786445, metadata !185, metadata !"pciBusID", metadata !20, i32 1191, i64 32, i64 32, i64 4416, i32 0, metadata !108} ; [ DW_TAG_member ] [pciBusID] [line 1191, size 32, align 32, offset 4416] [from int]
!238 = metadata !{i32 786445, metadata !185, metadata !"pciDeviceID", metadata !20, i32 1192, i64 32, i64 32, i64 4448, i32 0, metadata !108} ; [ DW_TAG_member ] [pciDeviceID] [line 1192, size 32, align 32, offset 4448] [from int]
!239 = metadata !{i32 786445, metadata !185, metadata !"pciDomainID", metadata !20, i32 1193, i64 32, i64 32, i64 4480, i32 0, metadata !108} ; [ DW_TAG_member ] [pciDomainID] [line 1193, size 32, align 32, offset 4480] [from int]
!240 = metadata !{i32 786445, metadata !185, metadata !"tccDriver", metadata !20, i32 1194, i64 32, i64 32, i64 4512, i32 0, metadata !108} ; [ DW_TAG_member ] [tccDriver] [line 1194, size 32, align 32, offset 4512] [from int]
!241 = metadata !{i32 786445, metadata !185, metadata !"asyncEngineCount", metadata !20, i32 1195, i64 32, i64 32, i64 4544, i32 0, metadata !108} ; [ DW_TAG_member ] [asyncEngineCount] [line 1195, size 32, align 32, offset 4544] [from int]
!242 = metadata !{i32 786445, metadata !185, metadata !"unifiedAddressing", metadata !20, i32 1196, i64 32, i64 32, i64 4576, i32 0, metadata !108} ; [ DW_TAG_member ] [unifiedAddressing] [line 1196, size 32, align 32, offset 4576] [from int]
!243 = metadata !{i32 786445, metadata !185, metadata !"memoryClockRate", metadata !20, i32 1197, i64 32, i64 32, i64 4608, i32 0, metadata !108} ; [ DW_TAG_member ] [memoryClockRate] [line 1197, size 32, align 32, offset 4608] [from int]
!244 = metadata !{i32 786445, metadata !185, metadata !"memoryBusWidth", metadata !20, i32 1198, i64 32, i64 32, i64 4640, i32 0, metadata !108} ; [ DW_TAG_member ] [memoryBusWidth] [line 1198, size 32, align 32, offset 4640] [from int]
!245 = metadata !{i32 786445, metadata !185, metadata !"l2CacheSize", metadata !20, i32 1199, i64 32, i64 32, i64 4672, i32 0, metadata !108} ; [ DW_TAG_member ] [l2CacheSize] [line 1199, size 32, align 32, offset 4672] [from int]
!246 = metadata !{i32 786445, metadata !185, metadata !"maxThreadsPerMultiProcessor", metadata !20, i32 1200, i64 32, i64 32, i64 4704, i32 0, metadata !108} ; [ DW_TAG_member ] [maxThreadsPerMultiProcessor] [line 1200, size 32, align 32, offset 4704] [f
!247 = metadata !{i32 786445, metadata !185, metadata !"streamPrioritiesSupported", metadata !20, i32 1201, i64 32, i64 32, i64 4736, i32 0, metadata !108} ; [ DW_TAG_member ] [streamPrioritiesSupported] [line 1201, size 32, align 32, offset 4736] [from 
!248 = metadata !{i32 786478, i32 0, metadata !185, metadata !"cudaDeviceProp", metadata !"cudaDeviceProp", metadata !"", metadata !20, i32 1145, metadata !249, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i
!249 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !250, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!250 = metadata !{null, metadata !251}
!251 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !185} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaDeviceProp]
!252 = metadata !{metadata !253}
!253 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!254 = metadata !{i32 786478, i32 0, metadata !99, metadata !"readSampleData", metadata !"readSampleData", metadata !"_Z14readSampleData10parametersP8_IO_FILEP20ReconstructionSample", metadata !99, i32 55, metadata !255, i1 false, i1 true, i32 0, i32 0, 
!255 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !256, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!256 = metadata !{metadata !257, metadata !161, metadata !102, metadata !258}
!257 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!258 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !259} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ReconstructionSample]
!259 = metadata !{i32 786454, null, metadata !"ReconstructionSample", metadata !99, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !260} ; [ DW_TAG_typedef ] [ReconstructionSample] [line 31, size 0, align 0, offset 0] [from ]
!260 = metadata !{i32 786451, null, metadata !"", metadata !163, i32 24, i64 192, i64 32, i32 0, i32 0, null, metadata !261, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 24, size 192, align 32, offset 0] [from ]
!261 = metadata !{metadata !262, metadata !263, metadata !264, metadata !265, metadata !266, metadata !267}
!262 = metadata !{i32 786445, metadata !260, metadata !"real", metadata !163, i32 25, i64 32, i64 32, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [real] [line 25, size 32, align 32, offset 0] [from float]
!263 = metadata !{i32 786445, metadata !260, metadata !"imag", metadata !163, i32 26, i64 32, i64 32, i64 32, i32 0, metadata !173} ; [ DW_TAG_member ] [imag] [line 26, size 32, align 32, offset 32] [from float]
!264 = metadata !{i32 786445, metadata !260, metadata !"kX", metadata !163, i32 27, i64 32, i64 32, i64 64, i32 0, metadata !173} ; [ DW_TAG_member ] [kX] [line 27, size 32, align 32, offset 64] [from float]
!265 = metadata !{i32 786445, metadata !260, metadata !"kY", metadata !163, i32 28, i64 32, i64 32, i64 96, i32 0, metadata !173} ; [ DW_TAG_member ] [kY] [line 28, size 32, align 32, offset 96] [from float]
!266 = metadata !{i32 786445, metadata !260, metadata !"kZ", metadata !163, i32 29, i64 32, i64 32, i64 128, i32 0, metadata !173} ; [ DW_TAG_member ] [kZ] [line 29, size 32, align 32, offset 128] [from float]
!267 = metadata !{i32 786445, metadata !260, metadata !"sdc", metadata !163, i32 30, i64 32, i64 32, i64 160, i32 0, metadata !173} ; [ DW_TAG_member ] [sdc] [line 30, size 32, align 32, offset 160] [from float]
!268 = metadata !{metadata !269}
!269 = metadata !{metadata !270, metadata !271, metadata !272, metadata !273, metadata !275, metadata !276, metadata !277, metadata !278, metadata !279, metadata !280, metadata !281, metadata !282, metadata !283, metadata !284, metadata !285}
!270 = metadata !{i32 786689, metadata !254, metadata !"params", metadata !99, i32 16777271, metadata !161, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [params] [line 55]
!271 = metadata !{i32 786689, metadata !254, metadata !"uksdata_f", metadata !99, i32 33554487, metadata !102, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [uksdata_f] [line 55]
!272 = metadata !{i32 786689, metadata !254, metadata !"samples", metadata !99, i32 50331703, metadata !258, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [samples] [line 55]
!273 = metadata !{i32 786688, metadata !274, metadata !"i", metadata !99, i32 56, metadata !257, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 56]
!274 = metadata !{i32 786443, metadata !254, i32 55, i32 0, metadata !99, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!275 = metadata !{i32 786688, metadata !274, metadata !"kScale", metadata !99, i32 65, metadata !172, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kScale] [line 65]
!276 = metadata !{i32 786688, metadata !274, metadata !"size_x", metadata !99, i32 70, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_x] [line 70]
!277 = metadata !{i32 786688, metadata !274, metadata !"size_y", metadata !99, i32 71, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_y] [line 71]
!278 = metadata !{i32 786688, metadata !274, metadata !"size_z", metadata !99, i32 72, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_z] [line 72]
!279 = metadata !{i32 786688, metadata !274, metadata !"ax", metadata !99, i32 74, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ax] [line 74]
!280 = metadata !{i32 786688, metadata !274, metadata !"bx", metadata !99, i32 75, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bx] [line 75]
!281 = metadata !{i32 786688, metadata !274, metadata !"ay", metadata !99, i32 77, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ay] [line 77]
!282 = metadata !{i32 786688, metadata !274, metadata !"by", metadata !99, i32 78, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [by] [line 78]
!283 = metadata !{i32 786688, metadata !274, metadata !"az", metadata !99, i32 80, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [az] [line 80]
!284 = metadata !{i32 786688, metadata !274, metadata !"bz", metadata !99, i32 81, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bz] [line 81]
!285 = metadata !{i32 786688, metadata !286, metadata !"n", metadata !99, i32 83, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 83]
!286 = metadata !{i32 786443, metadata !274, i32 83, i32 0, metadata !99, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!287 = metadata !{i32 786478, i32 0, metadata !99, metadata !"main", metadata !"main", metadata !"", metadata !99, i32 93, metadata !288, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !291, i32 93} 
!288 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !289, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!289 = metadata !{metadata !108, metadata !108, metadata !290}
!290 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!291 = metadata !{metadata !292}
!292 = metadata !{metadata !293, metadata !294, metadata !295, metadata !342, metadata !346, metadata !347, metadata !348, metadata !349, metadata !350, metadata !352, metadata !353, metadata !360, metadata !361, metadata !362, metadata !363, metadata !3
!293 = metadata !{i32 786689, metadata !287, metadata !"argc", metadata !99, i32 16777309, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 93]
!294 = metadata !{i32 786689, metadata !287, metadata !"argv", metadata !99, i32 33554525, metadata !290, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 93]
!295 = metadata !{i32 786688, metadata !296, metadata !"timers", metadata !99, i32 95, metadata !297, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [timers] [line 95]
!296 = metadata !{i32 786443, metadata !287, i32 93, i32 0, metadata !99, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!297 = metadata !{i32 786451, null, metadata !"pb_TimerSet", metadata !4, i32 136, i64 2304, i64 64, i32 0, i32 0, null, metadata !298, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_TimerSet] [line 136, size 2304, align 64, offset 0] [from ]
!298 = metadata !{metadata !299, metadata !300, metadata !308, metadata !311, metadata !312, metadata !325, metadata !338}
!299 = metadata !{i32 786445, metadata !297, metadata !"current", metadata !4, i32 137, i64 32, i64 32, i64 0, i32 0, metadata !3} ; [ DW_TAG_member ] [current] [line 137, size 32, align 32, offset 0] [from pb_TimerID]
!300 = metadata !{i32 786445, metadata !297, metadata !"async_markers", metadata !4, i32 138, i64 64, i64 64, i64 64, i32 0, metadata !301} ; [ DW_TAG_member ] [async_markers] [line 138, size 64, align 64, offset 64] [from ]
!301 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !302} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_async_time_marker_list]
!302 = metadata !{i32 786451, null, metadata !"pb_async_time_marker_list", metadata !4, i32 115, i64 256, i64 64, i32 0, i32 0, null, metadata !303, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_async_time_marker_list] [line 115, size 256, align 64,
!303 = metadata !{metadata !304, metadata !305, metadata !306, metadata !307}
!304 = metadata !{i32 786445, metadata !302, metadata !"label", metadata !4, i32 116, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_member ] [label] [line 116, size 64, align 64, offset 0] [from ]
!305 = metadata !{i32 786445, metadata !302, metadata !"timerID", metadata !4, i32 117, i64 32, i64 32, i64 64, i32 0, metadata !3} ; [ DW_TAG_member ] [timerID] [line 117, size 32, align 32, offset 64] [from pb_TimerID]
!306 = metadata !{i32 786445, metadata !302, metadata !"marker", metadata !4, i32 119, i64 64, i64 64, i64 128, i32 0, metadata !145} ; [ DW_TAG_member ] [marker] [line 119, size 64, align 64, offset 128] [from ]
!307 = metadata !{i32 786445, metadata !302, metadata !"next", metadata !4, i32 121, i64 64, i64 64, i64 192, i32 0, metadata !301} ; [ DW_TAG_member ] [next] [line 121, size 64, align 64, offset 192] [from ]
!308 = metadata !{i32 786445, metadata !297, metadata !"async_begin", metadata !4, i32 139, i64 64, i64 64, i64 128, i32 0, metadata !309} ; [ DW_TAG_member ] [async_begin] [line 139, size 64, align 64, offset 128] [from pb_Timestamp]
!309 = metadata !{i32 786454, null, metadata !"pb_Timestamp", metadata !4, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !310} ; [ DW_TAG_typedef ] [pb_Timestamp] [line 48, size 0, align 0, offset 0] [from long long unsigned int]
!310 = metadata !{i32 786468, null, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!311 = metadata !{i32 786445, metadata !297, metadata !"wall_begin", metadata !4, i32 140, i64 64, i64 64, i64 192, i32 0, metadata !309} ; [ DW_TAG_member ] [wall_begin] [line 140, size 64, align 64, offset 192] [from pb_Timestamp]
!312 = metadata !{i32 786445, metadata !297, metadata !"timers", metadata !4, i32 141, i64 1536, i64 64, i64 256, i32 0, metadata !313} ; [ DW_TAG_member ] [timers] [line 141, size 1536, align 64, offset 256] [from ]
!313 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1536, i64 64, i32 0, i32 0, metadata !314, metadata !323, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 1536, align 64, offset 0] [from pb_Timer]
!314 = metadata !{i32 786451, null, metadata !"pb_Timer", metadata !4, i32 58, i64 192, i64 64, i32 0, i32 0, null, metadata !315, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_Timer] [line 58, size 192, align 64, offset 0] [from ]
!315 = metadata !{metadata !316, metadata !317, metadata !318, metadata !319}
!316 = metadata !{i32 786445, metadata !314, metadata !"state", metadata !4, i32 59, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [state] [line 59, size 32, align 32, offset 0] [from pb_TimerState]
!317 = metadata !{i32 786445, metadata !314, metadata !"elapsed", metadata !4, i32 60, i64 64, i64 64, i64 64, i32 0, metadata !309} ; [ DW_TAG_member ] [elapsed] [line 60, size 64, align 64, offset 64] [from pb_Timestamp]
!318 = metadata !{i32 786445, metadata !314, metadata !"init", metadata !4, i32 61, i64 64, i64 64, i64 128, i32 0, metadata !309} ; [ DW_TAG_member ] [init] [line 61, size 64, align 64, offset 128] [from pb_Timestamp]
!319 = metadata !{i32 786478, i32 0, metadata !314, metadata !"pb_Timer", metadata !"pb_Timer", metadata !"", metadata !4, i32 58, metadata !320, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 58} ; [ DW_T
!320 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !321, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!321 = metadata !{null, metadata !322}
!322 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !314} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_Timer]
!323 = metadata !{metadata !324}
!324 = metadata !{i32 786465, i64 0, i64 7}       ; [ DW_TAG_subrange_type ] [0, 7]
!325 = metadata !{i32 786445, metadata !297, metadata !"sub_timer_list", metadata !4, i32 142, i64 512, i64 64, i64 1792, i32 0, metadata !326} ; [ DW_TAG_member ] [sub_timer_list] [line 142, size 512, align 64, offset 1792] [from ]
!326 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 64, i32 0, i32 0, metadata !327, metadata !323, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from ]
!327 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !328} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_SubTimerList]
!328 = metadata !{i32 786451, null, metadata !"pb_SubTimerList", metadata !4, i32 130, i64 128, i64 64, i32 0, i32 0, null, metadata !329, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_SubTimerList] [line 130, size 128, align 64, offset 0] [from ]
!329 = metadata !{metadata !330, metadata !337}
!330 = metadata !{i32 786445, metadata !328, metadata !"current", metadata !4, i32 131, i64 64, i64 64, i64 0, i32 0, metadata !331} ; [ DW_TAG_member ] [current] [line 131, size 64, align 64, offset 0] [from ]
!331 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !332} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_SubTimer]
!332 = metadata !{i32 786451, null, metadata !"pb_SubTimer", metadata !4, i32 124, i64 320, i64 64, i32 0, i32 0, null, metadata !333, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_SubTimer] [line 124, size 320, align 64, offset 0] [from ]
!333 = metadata !{metadata !334, metadata !335, metadata !336}
!334 = metadata !{i32 786445, metadata !332, metadata !"label", metadata !4, i32 125, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_member ] [label] [line 125, size 64, align 64, offset 0] [from ]
!335 = metadata !{i32 786445, metadata !332, metadata !"timer", metadata !4, i32 126, i64 192, i64 64, i64 64, i32 0, metadata !314} ; [ DW_TAG_member ] [timer] [line 126, size 192, align 64, offset 64] [from pb_Timer]
!336 = metadata !{i32 786445, metadata !332, metadata !"next", metadata !4, i32 127, i64 64, i64 64, i64 256, i32 0, metadata !331} ; [ DW_TAG_member ] [next] [line 127, size 64, align 64, offset 256] [from ]
!337 = metadata !{i32 786445, metadata !328, metadata !"subtimer_list", metadata !4, i32 132, i64 64, i64 64, i64 64, i32 0, metadata !331} ; [ DW_TAG_member ] [subtimer_list] [line 132, size 64, align 64, offset 64] [from ]
!338 = metadata !{i32 786478, i32 0, metadata !297, metadata !"pb_TimerSet", metadata !"pb_TimerSet", metadata !"", metadata !4, i32 136, metadata !339, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 136} 
!339 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !340, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!340 = metadata !{null, metadata !341}
!341 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !297} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_TimerSet]
!342 = metadata !{i32 786688, metadata !296, metadata !"uksdata", metadata !99, i32 102, metadata !343, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [uksdata] [line 102]
!343 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2000, i64 8, i32 0, i32 0, metadata !111, metadata !344, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2000, align 8, offset 0] [from char]
!344 = metadata !{metadata !345}
!345 = metadata !{i32 786465, i64 0, i64 249}     ; [ DW_TAG_subrange_type ] [0, 249]
!346 = metadata !{i32 786688, metadata !296, metadata !"params", metadata !99, i32 103, metadata !161, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [params] [line 103]
!347 = metadata !{i32 786688, metadata !296, metadata !"uksfile_f", metadata !99, i32 105, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [uksfile_f] [line 105]
!348 = metadata !{i32 786688, metadata !296, metadata !"uksdata_f", metadata !99, i32 106, metadata !102, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [uksdata_f] [line 106]
!349 = metadata !{i32 786688, metadata !296, metadata !"samples", metadata !99, i32 132, metadata !258, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [samples] [line 132]
!350 = metadata !{i32 786688, metadata !296, metadata !"LUT", metadata !99, i32 133, metadata !351, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [LUT] [line 133]
!351 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !173} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!352 = metadata !{i32 786688, metadata !296, metadata !"sizeLUT", metadata !99, i32 134, metadata !257, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sizeLUT] [line 134]
!353 = metadata !{i32 786688, metadata !296, metadata !"gridData", metadata !99, i32 136, metadata !354, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridData] [line 136]
!354 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !355} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cmplx]
!355 = metadata !{i32 786454, null, metadata !"cmplx", metadata !99, i32 36, i64 0, i64 0, i64 0, i32 0, metadata !356} ; [ DW_TAG_typedef ] [cmplx] [line 36, size 0, align 0, offset 0] [from ]
!356 = metadata !{i32 786451, null, metadata !"", metadata !163, i32 33, i64 64, i64 32, i32 0, i32 0, null, metadata !357, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 33, size 64, align 32, offset 0] [from ]
!357 = metadata !{metadata !358, metadata !359}
!358 = metadata !{i32 786445, metadata !356, metadata !"real", metadata !163, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [real] [line 34, size 32, align 32, offset 0] [from float]
!359 = metadata !{i32 786445, metadata !356, metadata !"imag", metadata !163, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !173} ; [ DW_TAG_member ] [imag] [line 35, size 32, align 32, offset 32] [from float]
!360 = metadata !{i32 786688, metadata !296, metadata !"sampleDensity", metadata !99, i32 137, metadata !351, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleDensity] [line 137]
!361 = metadata !{i32 786688, metadata !296, metadata !"gridData_gold", metadata !99, i32 139, metadata !354, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridData_gold] [line 139]
!362 = metadata !{i32 786688, metadata !296, metadata !"sampleDensity_gold", metadata !99, i32 140, metadata !351, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleDensity_gold] [line 140]
!363 = metadata !{i32 786688, metadata !364, metadata !"err", metadata !99, i32 143, metadata !365, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 143]
!364 = metadata !{i32 786443, metadata !296, i32 143, i32 0, metadata !99, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!365 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !99, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!366 = metadata !{i32 786688, metadata !296, metadata !"n", metadata !99, i32 158, metadata !257, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 158]
!367 = metadata !{i32 786688, metadata !296, metadata !"gridNumElems", metadata !99, i32 169, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridNumElems] [line 169]
!368 = metadata !{i32 786688, metadata !369, metadata !"err", metadata !99, i32 188, metadata !365, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 188]
!369 = metadata !{i32 786443, metadata !296, i32 188, i32 0, metadata !99, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!370 = metadata !{i32 786478, i32 0, metadata !371, metadata !"floor", metadata !"floor", metadata !"_ZSt5floorf", metadata !372, i32 278, metadata !373, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !375, i32 279} ;
!371 = metadata !{i32 786489, null, metadata !"std", metadata !372, i32 74} ; [ DW_TAG_namespace ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning//usr/lib/gcc/x86_64-linux-gnu/4.9/../../../../include/c++/4.9/cmath]
!372 = metadata !{i32 786473, metadata !"/usr/lib/gcc/x86_64-linux-gnu/4.9/../../../../include/c++/4.9/cmath", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!373 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !374, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!374 = metadata !{metadata !173, metadata !173}
!375 = metadata !{metadata !376}
!376 = metadata !{metadata !377}
!377 = metadata !{i32 786689, metadata !370, metadata !"__x", metadata !372, i32 16777494, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__x] [line 278]
!378 = metadata !{i32 786449, i32 0, i32 4, metadata !"CUDA_interface.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"
!379 = metadata !{metadata !380}
!380 = metadata !{metadata !3, metadata !15, metadata !19, metadata !381}
!381 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !20, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !382, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!382 = metadata !{metadata !383, metadata !384, metadata !385, metadata !386, metadata !387}
!383 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!384 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!385 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!386 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!387 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!388 = metadata !{metadata !389}
!389 = metadata !{metadata !390, metadata !430, metadata !494, metadata !503, metadata !592, metadata !602, metadata !741, metadata !757, metadata !771, metadata !784, metadata !792, metadata !799, metadata !803, metadata !811}
!390 = metadata !{i32 786478, i32 0, metadata !391, metadata !"binning_kernel", metadata !"binning_kernel", metadata !"_Z14binning_kerneljP20ReconstructionSamplePjS1_S1_jj", metadata !391, i32 32, metadata !392, i1 false, i1 true, i32 0, i32 0, null, i32
!391 = metadata !{i32 786473, metadata !"./GPU_kernels.cu", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!392 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !393, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!393 = metadata !{null, metadata !257, metadata !394, metadata !414, metadata !414, metadata !414, metadata !257, metadata !257}
!394 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !395} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ReconstructionSample]
!395 = metadata !{i32 786454, null, metadata !"ReconstructionSample", metadata !391, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !396} ; [ DW_TAG_typedef ] [ReconstructionSample] [line 31, size 0, align 0, offset 0] [from ]
!396 = metadata !{i32 786451, null, metadata !"", metadata !163, i32 24, i64 192, i64 32, i32 0, i32 0, null, metadata !397, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 24, size 192, align 32, offset 0] [from ]
!397 = metadata !{metadata !398, metadata !399, metadata !400, metadata !401, metadata !402, metadata !403, metadata !404, metadata !408}
!398 = metadata !{i32 786445, metadata !396, metadata !"real", metadata !163, i32 25, i64 32, i64 32, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [real] [line 25, size 32, align 32, offset 0] [from float]
!399 = metadata !{i32 786445, metadata !396, metadata !"imag", metadata !163, i32 26, i64 32, i64 32, i64 32, i32 0, metadata !173} ; [ DW_TAG_member ] [imag] [line 26, size 32, align 32, offset 32] [from float]
!400 = metadata !{i32 786445, metadata !396, metadata !"kX", metadata !163, i32 27, i64 32, i64 32, i64 64, i32 0, metadata !173} ; [ DW_TAG_member ] [kX] [line 27, size 32, align 32, offset 64] [from float]
!401 = metadata !{i32 786445, metadata !396, metadata !"kY", metadata !163, i32 28, i64 32, i64 32, i64 96, i32 0, metadata !173} ; [ DW_TAG_member ] [kY] [line 28, size 32, align 32, offset 96] [from float]
!402 = metadata !{i32 786445, metadata !396, metadata !"kZ", metadata !163, i32 29, i64 32, i64 32, i64 128, i32 0, metadata !173} ; [ DW_TAG_member ] [kZ] [line 29, size 32, align 32, offset 128] [from float]
!403 = metadata !{i32 786445, metadata !396, metadata !"sdc", metadata !163, i32 30, i64 32, i64 32, i64 160, i32 0, metadata !173} ; [ DW_TAG_member ] [sdc] [line 30, size 32, align 32, offset 160] [from float]
!404 = metadata !{i32 786478, i32 0, metadata !396, metadata !"", metadata !"", metadata !"", metadata !163, i32 24, metadata !405, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 24} ; [ DW_TAG_subprogram 
!405 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !406, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!406 = metadata !{null, metadata !407}
!407 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !396} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!408 = metadata !{i32 786478, i32 0, metadata !396, metadata !"operator=", metadata !"operator=", metadata !"_ZN20ReconstructionSampleaSERKS_", metadata !163, i32 24, metadata !409, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i3
!409 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !410, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!410 = metadata !{metadata !411, metadata !407, metadata !412}
!411 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !396} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!412 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !413} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!413 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !396} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!414 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !257} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!415 = metadata !{metadata !416}
!416 = metadata !{metadata !417, metadata !418, metadata !419, metadata !420, metadata !421, metadata !422, metadata !423, metadata !424, metadata !426, metadata !427, metadata !428, metadata !429}
!417 = metadata !{i32 786689, metadata !390, metadata !"n", metadata !391, i32 16777248, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 32]
!418 = metadata !{i32 786689, metadata !390, metadata !"sample_g", metadata !391, i32 33554464, metadata !394, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sample_g] [line 32]
!419 = metadata !{i32 786689, metadata !390, metadata !"idxKey_g", metadata !391, i32 50331680, metadata !414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idxKey_g] [line 32]
!420 = metadata !{i32 786689, metadata !390, metadata !"idxValue_g", metadata !391, i32 67108897, metadata !414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idxValue_g] [line 33]
!421 = metadata !{i32 786689, metadata !390, metadata !"binCount_g", metadata !391, i32 83886113, metadata !414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [binCount_g] [line 33]
!422 = metadata !{i32 786689, metadata !390, metadata !"binsize", metadata !391, i32 100663329, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [binsize] [line 33]
!423 = metadata !{i32 786689, metadata !390, metadata !"gridNumElems", metadata !391, i32 117440545, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [gridNumElems] [line 33]
!424 = metadata !{i32 786688, metadata !425, metadata !"key", metadata !391, i32 34, metadata !257, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [key] [line 34]
!425 = metadata !{i32 786443, metadata !390, i32 33, i32 0, metadata !391, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!426 = metadata !{i32 786688, metadata !425, metadata !"sampleIdx", metadata !391, i32 35, metadata !257, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleIdx] [line 35]
!427 = metadata !{i32 786688, metadata !425, metadata !"pt", metadata !391, i32 36, metadata !395, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt] [line 36]
!428 = metadata !{i32 786688, metadata !425, metadata !"binIdx", metadata !391, i32 37, metadata !257, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [binIdx] [line 37]
!429 = metadata !{i32 786688, metadata !425, metadata !"count", metadata !391, i32 38, metadata !257, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 38]
!430 = metadata !{i32 786478, i32 0, metadata !391, metadata !"reorder_kernel", metadata !"reorder_kernel", metadata !"_Z14reorder_kerneliPjP20ReconstructionSample17sampleArrayStruct", metadata !391, i32 62, metadata !431, i1 false, i1 true, i32 0, i32 0
!431 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !432, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!432 = metadata !{null, metadata !108, metadata !414, metadata !394, metadata !433}
!433 = metadata !{i32 786454, null, metadata !"sampleArrayStruct", metadata !391, i32 24, i64 0, i64 0, i64 0, i32 0, metadata !434} ; [ DW_TAG_typedef ] [sampleArrayStruct] [line 24, size 0, align 0, offset 0] [from ]
!434 = metadata !{i32 786451, null, metadata !"", metadata !391, i32 21, i64 128, i64 64, i32 0, i32 0, null, metadata !435, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 21, size 128, align 64, offset 0] [from ]
!435 = metadata !{metadata !436, metadata !458}
!436 = metadata !{i32 786445, metadata !434, metadata !"data", metadata !391, i32 22, i64 64, i64 64, i64 0, i32 0, metadata !437} ; [ DW_TAG_member ] [data] [line 22, size 64, align 64, offset 0] [from ]
!437 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !438} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float2]
!438 = metadata !{i32 786454, null, metadata !"float2", metadata !391, i32 393, i64 0, i64 0, i64 0, i32 0, metadata !439} ; [ DW_TAG_typedef ] [float2] [line 393, size 0, align 0, offset 0] [from float2]
!439 = metadata !{i32 786451, null, metadata !"float2", metadata !440, i32 272, i64 64, i64 64, i32 0, i32 0, null, metadata !441, i32 0, null, null} ; [ DW_TAG_structure_type ] [float2] [line 272, size 64, align 64, offset 0] [from ]
!440 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!441 = metadata !{metadata !442, metadata !443, metadata !444, metadata !448, metadata !453, metadata !454}
!442 = metadata !{i32 786445, metadata !439, metadata !"x", metadata !440, i32 272, i64 32, i64 32, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [x] [line 272, size 32, align 32, offset 0] [from float]
!443 = metadata !{i32 786445, metadata !439, metadata !"y", metadata !440, i32 272, i64 32, i64 32, i64 32, i32 0, metadata !173} ; [ DW_TAG_member ] [y] [line 272, size 32, align 32, offset 32] [from float]
!444 = metadata !{i32 786478, i32 0, metadata !439, metadata !"float2", metadata !"float2", metadata !"", metadata !440, i32 272, metadata !445, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 272} ; [ DW_T
!445 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !446, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!446 = metadata !{null, metadata !447}
!447 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !439} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float2]
!448 = metadata !{i32 786478, i32 0, metadata !439, metadata !"float2", metadata !"float2", metadata !"", metadata !440, i32 272, metadata !449, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 272} ; [ DW_T
!449 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !450, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!450 = metadata !{null, metadata !447, metadata !451}
!451 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !452} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!452 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !439} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float2]
!453 = metadata !{i32 786478, i32 0, metadata !439, metadata !"~float2", metadata !"~float2", metadata !"", metadata !440, i32 272, metadata !445, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 272} ; [ DW
!454 = metadata !{i32 786478, i32 0, metadata !439, metadata !"operator=", metadata !"operator=", metadata !"_ZN6float2aSERKS_", metadata !440, i32 272, metadata !455, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata 
!455 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !456, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!456 = metadata !{metadata !457, metadata !447, metadata !451}
!457 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !439} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from float2]
!458 = metadata !{i32 786445, metadata !434, metadata !"loc", metadata !391, i32 23, i64 64, i64 64, i64 64, i32 0, metadata !459} ; [ DW_TAG_member ] [loc] [line 23, size 64, align 64, offset 64] [from ]
!459 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !460} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float4]
!460 = metadata !{i32 786454, null, metadata !"float4", metadata !391, i32 395, i64 0, i64 0, i64 0, i32 0, metadata !461} ; [ DW_TAG_typedef ] [float4] [line 395, size 0, align 0, offset 0] [from float4]
!461 = metadata !{i32 786451, null, metadata !"float4", metadata !440, i32 282, i64 128, i64 128, i32 0, i32 0, null, metadata !462, i32 0, null, null} ; [ DW_TAG_structure_type ] [float4] [line 282, size 128, align 128, offset 0] [from ]
!462 = metadata !{metadata !463, metadata !464, metadata !465, metadata !466, metadata !467, metadata !471, metadata !476, metadata !477}
!463 = metadata !{i32 786445, metadata !461, metadata !"x", metadata !440, i32 284, i64 32, i64 32, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [x] [line 284, size 32, align 32, offset 0] [from float]
!464 = metadata !{i32 786445, metadata !461, metadata !"y", metadata !440, i32 284, i64 32, i64 32, i64 32, i32 0, metadata !173} ; [ DW_TAG_member ] [y] [line 284, size 32, align 32, offset 32] [from float]
!465 = metadata !{i32 786445, metadata !461, metadata !"z", metadata !440, i32 284, i64 32, i64 32, i64 64, i32 0, metadata !173} ; [ DW_TAG_member ] [z] [line 284, size 32, align 32, offset 64] [from float]
!466 = metadata !{i32 786445, metadata !461, metadata !"w", metadata !440, i32 284, i64 32, i64 32, i64 96, i32 0, metadata !173} ; [ DW_TAG_member ] [w] [line 284, size 32, align 32, offset 96] [from float]
!467 = metadata !{i32 786478, i32 0, metadata !461, metadata !"float4", metadata !"float4", metadata !"", metadata !440, i32 282, metadata !468, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 282} ; [ DW_T
!468 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !469, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!469 = metadata !{null, metadata !470}
!470 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !461} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float4]
!471 = metadata !{i32 786478, i32 0, metadata !461, metadata !"float4", metadata !"float4", metadata !"", metadata !440, i32 282, metadata !472, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 282} ; [ DW_T
!472 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !473, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!473 = metadata !{null, metadata !470, metadata !474}
!474 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !475} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!475 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !461} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float4]
!476 = metadata !{i32 786478, i32 0, metadata !461, metadata !"~float4", metadata !"~float4", metadata !"", metadata !440, i32 282, metadata !468, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 282} ; [ DW
!477 = metadata !{i32 786478, i32 0, metadata !461, metadata !"operator=", metadata !"operator=", metadata !"_ZN6float4aSERKS_", metadata !440, i32 282, metadata !478, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata 
!478 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !479, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!479 = metadata !{metadata !480, metadata !470, metadata !474}
!480 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !461} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from float4]
!481 = metadata !{metadata !482}
!482 = metadata !{metadata !483, metadata !484, metadata !485, metadata !486, metadata !487, metadata !489, metadata !490, metadata !491, metadata !493}
!483 = metadata !{i32 786689, metadata !430, metadata !"n", metadata !391, i32 16777278, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 62]
!484 = metadata !{i32 786689, metadata !430, metadata !"idxValue_g", metadata !391, i32 33554494, metadata !414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idxValue_g] [line 62]
!485 = metadata !{i32 786689, metadata !430, metadata !"samples_g", metadata !391, i32 50331710, metadata !394, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [samples_g] [line 62]
!486 = metadata !{i32 786689, metadata !430, metadata !"sortedSampleSoA_g", metadata !391, i32 67108926, metadata !433, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sortedSampleSoA_g] [line 62]
!487 = metadata !{i32 786688, metadata !488, metadata !"index", metadata !391, i32 63, metadata !257, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [index] [line 63]
!488 = metadata !{i32 786443, metadata !430, i32 62, i32 0, metadata !391, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!489 = metadata !{i32 786688, metadata !488, metadata !"old_index", metadata !391, i32 64, metadata !257, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_index] [line 64]
!490 = metadata !{i32 786688, metadata !488, metadata !"pt", metadata !391, i32 65, metadata !395, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt] [line 65]
!491 = metadata !{i32 786688, metadata !492, metadata !"data", metadata !391, i32 71, metadata !438, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [data] [line 71]
!492 = metadata !{i32 786443, metadata !488, i32 67, i32 0, metadata !391, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!493 = metadata !{i32 786688, metadata !492, metadata !"loc", metadata !391, i32 75, metadata !460, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loc] [line 75]
!494 = metadata !{i32 786478, i32 0, metadata !391, metadata !"kernel_value", metadata !"kernel_value", metadata !"_Z12kernel_valuef", metadata !391, i32 86, metadata !373, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, float (float)* @_Z12kern
!495 = metadata !{metadata !496}
!496 = metadata !{metadata !497, metadata !498, metadata !500, metadata !501, metadata !502}
!497 = metadata !{i32 786689, metadata !494, metadata !"v", metadata !391, i32 16777302, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 86]
!498 = metadata !{i32 786688, metadata !499, metadata !"rValue", metadata !391, i32 88, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rValue] [line 88]
!499 = metadata !{i32 786443, metadata !494, i32 86, i32 0, metadata !391, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!500 = metadata !{i32 786688, metadata !499, metadata !"z", metadata !391, i32 90, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 90]
!501 = metadata !{i32 786688, metadata !499, metadata !"num", metadata !391, i32 93, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 93]
!502 = metadata !{i32 786688, metadata !499, metadata !"den", metadata !391, i32 103, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [den] [line 103]
!503 = metadata !{i32 786478, i32 0, metadata !391, metadata !"gridding_GPU", metadata !"gridding_GPU", metadata !"_Z12gridding_GPU17sampleArrayStructPjP6float2Pff", metadata !391, i32 110, metadata !504, i1 false, i1 true, i32 0, i32 0, null, i32 256, i
!504 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !505, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!505 = metadata !{null, metadata !433, metadata !414, metadata !437, metadata !351, metadata !173}
!506 = metadata !{metadata !507}
!507 = metadata !{metadata !508, metadata !509, metadata !510, metadata !511, metadata !512, metadata !513, metadata !516, metadata !517, metadata !518, metadata !519, metadata !520, metadata !521, metadata !522, metadata !523, metadata !524, metadata !5
!508 = metadata !{i32 786689, metadata !503, metadata !"sortedSampleSoA_g", metadata !391, i32 16777326, metadata !433, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sortedSampleSoA_g] [line 110]
!509 = metadata !{i32 786689, metadata !503, metadata !"binStartAddr_g", metadata !391, i32 33554542, metadata !414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [binStartAddr_g] [line 110]
!510 = metadata !{i32 786689, metadata !503, metadata !"gridData_g", metadata !391, i32 50331758, metadata !437, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [gridData_g] [line 110]
!511 = metadata !{i32 786689, metadata !503, metadata !"sampleDensity_g", metadata !391, i32 67108974, metadata !351, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sampleDensity_g] [line 110]
!512 = metadata !{i32 786689, metadata !503, metadata !"beta", metadata !391, i32 83886190, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [beta] [line 110]
!513 = metadata !{i32 786688, metadata !514, metadata !"flatIdx", metadata !391, i32 118, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flatIdx] [line 118]
!514 = metadata !{i32 786443, metadata !503, i32 110, i32 0, metadata !391, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!515 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !108} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!516 = metadata !{i32 786688, metadata !514, metadata !"z0", metadata !391, i32 121, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z0] [line 121]
!517 = metadata !{i32 786688, metadata !514, metadata !"y0", metadata !391, i32 122, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y0] [line 122]
!518 = metadata !{i32 786688, metadata !514, metadata !"x0", metadata !391, i32 123, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0] [line 123]
!519 = metadata !{i32 786688, metadata !514, metadata !"X", metadata !391, i32 125, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X] [line 125]
!520 = metadata !{i32 786688, metadata !514, metadata !"Y", metadata !391, i32 126, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Y] [line 126]
!521 = metadata !{i32 786688, metadata !514, metadata !"Z", metadata !391, i32 127, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z] [line 127]
!522 = metadata !{i32 786688, metadata !514, metadata !"Z1", metadata !391, i32 128, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z1] [line 128]
!523 = metadata !{i32 786688, metadata !514, metadata !"Z2", metadata !391, i32 129, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z2] [line 129]
!524 = metadata !{i32 786688, metadata !514, metadata !"Z3", metadata !391, i32 130, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z3] [line 130]
!525 = metadata !{i32 786688, metadata !514, metadata !"xl", metadata !391, i32 132, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xl] [line 132]
!526 = metadata !{i32 786688, metadata !514, metadata !"xL", metadata !391, i32 133, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xL] [line 133]
!527 = metadata !{i32 786688, metadata !514, metadata !"xh", metadata !391, i32 134, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xh] [line 134]
!528 = metadata !{i32 786688, metadata !514, metadata !"xH", metadata !391, i32 135, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xH] [line 135]
!529 = metadata !{i32 786688, metadata !514, metadata !"yl", metadata !391, i32 137, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yl] [line 137]
!530 = metadata !{i32 786688, metadata !514, metadata !"yL", metadata !391, i32 138, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yL] [line 138]
!531 = metadata !{i32 786688, metadata !514, metadata !"yh", metadata !391, i32 139, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yh] [line 139]
!532 = metadata !{i32 786688, metadata !514, metadata !"yH", metadata !391, i32 140, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yH] [line 140]
!533 = metadata !{i32 786688, metadata !514, metadata !"zl", metadata !391, i32 142, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zl] [line 142]
!534 = metadata !{i32 786688, metadata !514, metadata !"zL", metadata !391, i32 143, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zL] [line 143]
!535 = metadata !{i32 786688, metadata !514, metadata !"zh", metadata !391, i32 144, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zh] [line 144]
!536 = metadata !{i32 786688, metadata !514, metadata !"zH", metadata !391, i32 145, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zH] [line 145]
!537 = metadata !{i32 786688, metadata !514, metadata !"idx", metadata !391, i32 147, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx] [line 147]
!538 = metadata !{i32 786688, metadata !514, metadata !"idx1", metadata !391, i32 148, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx1] [line 148]
!539 = metadata !{i32 786688, metadata !514, metadata !"idx2", metadata !391, i32 149, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx2] [line 149]
!540 = metadata !{i32 786688, metadata !514, metadata !"idx3", metadata !391, i32 150, metadata !515, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx3] [line 150]
!541 = metadata !{i32 786688, metadata !514, metadata !"pt", metadata !391, i32 152, metadata !438, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt] [line 152]
!542 = metadata !{i32 786688, metadata !514, metadata !"density", metadata !391, i32 155, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [density] [line 155]
!543 = metadata !{i32 786688, metadata !514, metadata !"pt1", metadata !391, i32 157, metadata !438, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt1] [line 157]
!544 = metadata !{i32 786688, metadata !514, metadata !"density1", metadata !391, i32 160, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [density1] [line 160]
!545 = metadata !{i32 786688, metadata !514, metadata !"pt2", metadata !391, i32 162, metadata !438, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt2] [line 162]
!546 = metadata !{i32 786688, metadata !514, metadata !"density2", metadata !391, i32 165, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [density2] [line 165]
!547 = metadata !{i32 786688, metadata !514, metadata !"pt3", metadata !391, i32 167, metadata !438, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt3] [line 167]
!548 = metadata !{i32 786688, metadata !514, metadata !"density3", metadata !391, i32 170, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [density3] [line 170]
!549 = metadata !{i32 786688, metadata !550, metadata !"z", metadata !391, i32 172, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 172]
!550 = metadata !{i32 786443, metadata !514, i32 172, i32 0, metadata !391, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!551 = metadata !{i32 786688, metadata !552, metadata !"y", metadata !391, i32 173, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 173]
!552 = metadata !{i32 786443, metadata !553, i32 173, i32 0, metadata !391, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!553 = metadata !{i32 786443, metadata !550, i32 172, i32 0, metadata !391, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!554 = metadata !{i32 786688, metadata !555, metadata !"addr", metadata !391, i32 174, metadata !556, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [addr] [line 174]
!555 = metadata !{i32 786443, metadata !552, i32 173, i32 0, metadata !391, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!556 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !557} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!557 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !257} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned int]
!558 = metadata !{i32 786688, metadata !555, metadata !"start", metadata !391, i32 175, metadata !557, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [start] [line 175]
!559 = metadata !{i32 786688, metadata !555, metadata !"end", metadata !391, i32 176, metadata !557, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 176]
!560 = metadata !{i32 786688, metadata !555, metadata !"delta", metadata !391, i32 177, metadata !557, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [delta] [line 177]
!561 = metadata !{i32 786688, metadata !562, metadata !"x", metadata !391, i32 178, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 178]
!562 = metadata !{i32 786443, metadata !555, i32 178, i32 0, metadata !391, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!563 = metadata !{i32 786688, metadata !564, metadata !"tileSize", metadata !391, i32 179, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tileSize] [line 179]
!564 = metadata !{i32 786443, metadata !562, i32 178, i32 0, metadata !391, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!565 = metadata !{i32 786688, metadata !564, metadata !"globalIdx", metadata !391, i32 180, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [globalIdx] [line 180]
!566 = metadata !{i32 786688, metadata !567, metadata !"data", metadata !391, i32 183, metadata !568, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [data] [line 183]
!567 = metadata !{i32 786443, metadata !564, i32 182, i32 0, metadata !391, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!568 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !438} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float2]
!569 = metadata !{i32 786688, metadata !567, metadata !"loc", metadata !391, i32 184, metadata !570, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loc] [line 184]
!570 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !460} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float4]
!571 = metadata !{i32 786688, metadata !572, metadata !"j", metadata !391, i32 195, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 195]
!572 = metadata !{i32 786443, metadata !564, i32 195, i32 0, metadata !391, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!573 = metadata !{i32 786688, metadata !574, metadata !"real", metadata !391, i32 196, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [real] [line 196]
!574 = metadata !{i32 786443, metadata !572, i32 195, i32 0, metadata !391, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!575 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !173} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float]
!576 = metadata !{i32 786688, metadata !574, metadata !"imag", metadata !391, i32 197, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imag] [line 197]
!577 = metadata !{i32 786688, metadata !574, metadata !"sdc", metadata !391, i32 198, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sdc] [line 198]
!578 = metadata !{i32 786688, metadata !579, metadata !"v0", metadata !391, i32 201, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v0] [line 201]
!579 = metadata !{i32 786443, metadata !574, i32 200, i32 0, metadata !391, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!580 = metadata !{i32 786688, metadata !579, metadata !"v", metadata !391, i32 204, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 204]
!581 = metadata !{i32 786688, metadata !582, metadata !"w", metadata !391, i32 206, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 206]
!582 = metadata !{i32 786443, metadata !579, i32 205, i32 0, metadata !391, i32 20} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!583 = metadata !{i32 786688, metadata !579, metadata !"v1", metadata !391, i32 212, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v1] [line 212]
!584 = metadata !{i32 786688, metadata !585, metadata !"w", metadata !391, i32 214, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 214]
!585 = metadata !{i32 786443, metadata !579, i32 213, i32 0, metadata !391, i32 21} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!586 = metadata !{i32 786688, metadata !579, metadata !"v2", metadata !391, i32 220, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v2] [line 220]
!587 = metadata !{i32 786688, metadata !588, metadata !"w", metadata !391, i32 222, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 222]
!588 = metadata !{i32 786443, metadata !579, i32 221, i32 0, metadata !391, i32 22} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!589 = metadata !{i32 786688, metadata !579, metadata !"v3", metadata !391, i32 228, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v3] [line 228]
!590 = metadata !{i32 786688, metadata !591, metadata !"w", metadata !391, i32 230, metadata !575, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 230]
!591 = metadata !{i32 786443, metadata !579, i32 229, i32 0, metadata !391, i32 23} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!592 = metadata !{i32 786478, i32 0, metadata !593, metadata !"compare", metadata !"compare", metadata !"_Z7comparePKvS0_", metadata !593, i32 38, metadata !594, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*)* @_Z7comparePKvS0_, 
!593 = metadata !{i32 786473, metadata !"CUDA_interface.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!594 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !595, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!595 = metadata !{metadata !108, metadata !596, metadata !596}
!596 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !597} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!597 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!598 = metadata !{metadata !599}
!599 = metadata !{metadata !600, metadata !601}
!600 = metadata !{i32 786689, metadata !592, metadata !"a", metadata !593, i32 16777254, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 38]
!601 = metadata !{i32 786689, metadata !592, metadata !"b", metadata !593, i32 33554470, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 38]
!602 = metadata !{i32 786478, i32 0, metadata !593, metadata !"CUDA_interface", metadata !"CUDA_interface", metadata !"_Z14CUDA_interfaceP11pb_TimerSetj10parametersP20ReconstructionSamplePfiP5cmplxS4_", metadata !593, i32 44, metadata !603, i1 false, i1 
!603 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !604, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!604 = metadata !{null, metadata !605, metadata !257, metadata !639, metadata !394, metadata !351, metadata !108, metadata !651, metadata !351}
!605 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !606} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_TimerSet]
!606 = metadata !{i32 786451, null, metadata !"pb_TimerSet", metadata !4, i32 136, i64 2304, i64 64, i32 0, i32 0, null, metadata !607, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_TimerSet] [line 136, size 2304, align 64, offset 0] [from ]
!607 = metadata !{metadata !608, metadata !609, metadata !617, metadata !618, metadata !619, metadata !626}
!608 = metadata !{i32 786445, metadata !606, metadata !"current", metadata !4, i32 137, i64 32, i64 32, i64 0, i32 0, metadata !3} ; [ DW_TAG_member ] [current] [line 137, size 32, align 32, offset 0] [from pb_TimerID]
!609 = metadata !{i32 786445, metadata !606, metadata !"async_markers", metadata !4, i32 138, i64 64, i64 64, i64 64, i32 0, metadata !610} ; [ DW_TAG_member ] [async_markers] [line 138, size 64, align 64, offset 64] [from ]
!610 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !611} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_async_time_marker_list]
!611 = metadata !{i32 786451, null, metadata !"pb_async_time_marker_list", metadata !4, i32 115, i64 256, i64 64, i32 0, i32 0, null, metadata !612, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_async_time_marker_list] [line 115, size 256, align 64,
!612 = metadata !{metadata !613, metadata !614, metadata !615, metadata !616}
!613 = metadata !{i32 786445, metadata !611, metadata !"label", metadata !4, i32 116, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_member ] [label] [line 116, size 64, align 64, offset 0] [from ]
!614 = metadata !{i32 786445, metadata !611, metadata !"timerID", metadata !4, i32 117, i64 32, i64 32, i64 64, i32 0, metadata !3} ; [ DW_TAG_member ] [timerID] [line 117, size 32, align 32, offset 64] [from pb_TimerID]
!615 = metadata !{i32 786445, metadata !611, metadata !"marker", metadata !4, i32 119, i64 64, i64 64, i64 128, i32 0, metadata !145} ; [ DW_TAG_member ] [marker] [line 119, size 64, align 64, offset 128] [from ]
!616 = metadata !{i32 786445, metadata !611, metadata !"next", metadata !4, i32 121, i64 64, i64 64, i64 192, i32 0, metadata !610} ; [ DW_TAG_member ] [next] [line 121, size 64, align 64, offset 192] [from ]
!617 = metadata !{i32 786445, metadata !606, metadata !"async_begin", metadata !4, i32 139, i64 64, i64 64, i64 128, i32 0, metadata !309} ; [ DW_TAG_member ] [async_begin] [line 139, size 64, align 64, offset 128] [from pb_Timestamp]
!618 = metadata !{i32 786445, metadata !606, metadata !"wall_begin", metadata !4, i32 140, i64 64, i64 64, i64 192, i32 0, metadata !309} ; [ DW_TAG_member ] [wall_begin] [line 140, size 64, align 64, offset 192] [from pb_Timestamp]
!619 = metadata !{i32 786445, metadata !606, metadata !"timers", metadata !4, i32 141, i64 1536, i64 64, i64 256, i32 0, metadata !620} ; [ DW_TAG_member ] [timers] [line 141, size 1536, align 64, offset 256] [from ]
!620 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1536, i64 64, i32 0, i32 0, metadata !621, metadata !323, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 1536, align 64, offset 0] [from pb_Timer]
!621 = metadata !{i32 786451, null, metadata !"pb_Timer", metadata !4, i32 58, i64 192, i64 64, i32 0, i32 0, null, metadata !622, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_Timer] [line 58, size 192, align 64, offset 0] [from ]
!622 = metadata !{metadata !623, metadata !624, metadata !625}
!623 = metadata !{i32 786445, metadata !621, metadata !"state", metadata !4, i32 59, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [state] [line 59, size 32, align 32, offset 0] [from pb_TimerState]
!624 = metadata !{i32 786445, metadata !621, metadata !"elapsed", metadata !4, i32 60, i64 64, i64 64, i64 64, i32 0, metadata !309} ; [ DW_TAG_member ] [elapsed] [line 60, size 64, align 64, offset 64] [from pb_Timestamp]
!625 = metadata !{i32 786445, metadata !621, metadata !"init", metadata !4, i32 61, i64 64, i64 64, i64 128, i32 0, metadata !309} ; [ DW_TAG_member ] [init] [line 61, size 64, align 64, offset 128] [from pb_Timestamp]
!626 = metadata !{i32 786445, metadata !606, metadata !"sub_timer_list", metadata !4, i32 142, i64 512, i64 64, i64 1792, i32 0, metadata !627} ; [ DW_TAG_member ] [sub_timer_list] [line 142, size 512, align 64, offset 1792] [from ]
!627 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 64, i32 0, i32 0, metadata !628, metadata !323, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from ]
!628 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !629} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_SubTimerList]
!629 = metadata !{i32 786451, null, metadata !"pb_SubTimerList", metadata !4, i32 130, i64 128, i64 64, i32 0, i32 0, null, metadata !630, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_SubTimerList] [line 130, size 128, align 64, offset 0] [from ]
!630 = metadata !{metadata !631, metadata !638}
!631 = metadata !{i32 786445, metadata !629, metadata !"current", metadata !4, i32 131, i64 64, i64 64, i64 0, i32 0, metadata !632} ; [ DW_TAG_member ] [current] [line 131, size 64, align 64, offset 0] [from ]
!632 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !633} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_SubTimer]
!633 = metadata !{i32 786451, null, metadata !"pb_SubTimer", metadata !4, i32 124, i64 320, i64 64, i32 0, i32 0, null, metadata !634, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_SubTimer] [line 124, size 320, align 64, offset 0] [from ]
!634 = metadata !{metadata !635, metadata !636, metadata !637}
!635 = metadata !{i32 786445, metadata !633, metadata !"label", metadata !4, i32 125, i64 64, i64 64, i64 0, i32 0, metadata !110} ; [ DW_TAG_member ] [label] [line 125, size 64, align 64, offset 0] [from ]
!636 = metadata !{i32 786445, metadata !633, metadata !"timer", metadata !4, i32 126, i64 192, i64 64, i64 64, i32 0, metadata !621} ; [ DW_TAG_member ] [timer] [line 126, size 192, align 64, offset 64] [from pb_Timer]
!637 = metadata !{i32 786445, metadata !633, metadata !"next", metadata !4, i32 127, i64 64, i64 64, i64 256, i32 0, metadata !632} ; [ DW_TAG_member ] [next] [line 127, size 64, align 64, offset 256] [from ]
!638 = metadata !{i32 786445, metadata !629, metadata !"subtimer_list", metadata !4, i32 132, i64 64, i64 64, i64 64, i32 0, metadata !632} ; [ DW_TAG_member ] [subtimer_list] [line 132, size 64, align 64, offset 64] [from ]
!639 = metadata !{i32 786454, null, metadata !"parameters", metadata !593, i32 22, i64 0, i64 0, i64 0, i32 0, metadata !640} ; [ DW_TAG_typedef ] [parameters] [line 22, size 0, align 0, offset 0] [from ]
!640 = metadata !{i32 786451, null, metadata !"", metadata !163, i32 12, i64 544, i64 32, i32 0, i32 0, null, metadata !641, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 12, size 544, align 32, offset 0] [from ]
!641 = metadata !{metadata !642, metadata !643, metadata !644, metadata !645, metadata !646, metadata !647, metadata !648, metadata !649, metadata !650}
!642 = metadata !{i32 786445, metadata !640, metadata !"numSamples", metadata !163, i32 13, i64 32, i64 32, i64 0, i32 0, metadata !108} ; [ DW_TAG_member ] [numSamples] [line 13, size 32, align 32, offset 0] [from int]
!643 = metadata !{i32 786445, metadata !640, metadata !"aquisitionMatrixSize", metadata !163, i32 14, i64 96, i64 32, i64 32, i32 0, metadata !167} ; [ DW_TAG_member ] [aquisitionMatrixSize] [line 14, size 96, align 32, offset 32] [from ]
!644 = metadata !{i32 786445, metadata !640, metadata !"reconstructionMatrixSize", metadata !163, i32 15, i64 96, i64 32, i64 128, i32 0, metadata !167} ; [ DW_TAG_member ] [reconstructionMatrixSize] [line 15, size 96, align 32, offset 128] [from ]
!645 = metadata !{i32 786445, metadata !640, metadata !"kMax", metadata !163, i32 16, i64 96, i64 32, i64 224, i32 0, metadata !172} ; [ DW_TAG_member ] [kMax] [line 16, size 96, align 32, offset 224] [from ]
!646 = metadata !{i32 786445, metadata !640, metadata !"gridSize", metadata !163, i32 17, i64 96, i64 32, i64 320, i32 0, metadata !167} ; [ DW_TAG_member ] [gridSize] [line 17, size 96, align 32, offset 320] [from ]
!647 = metadata !{i32 786445, metadata !640, metadata !"oversample", metadata !163, i32 18, i64 32, i64 32, i64 416, i32 0, metadata !173} ; [ DW_TAG_member ] [oversample] [line 18, size 32, align 32, offset 416] [from float]
!648 = metadata !{i32 786445, metadata !640, metadata !"kernelWidth", metadata !163, i32 19, i64 32, i64 32, i64 448, i32 0, metadata !173} ; [ DW_TAG_member ] [kernelWidth] [line 19, size 32, align 32, offset 448] [from float]
!649 = metadata !{i32 786445, metadata !640, metadata !"binsize", metadata !163, i32 20, i64 32, i64 32, i64 480, i32 0, metadata !108} ; [ DW_TAG_member ] [binsize] [line 20, size 32, align 32, offset 480] [from int]
!650 = metadata !{i32 786445, metadata !640, metadata !"useLUT", metadata !163, i32 21, i64 32, i64 32, i64 512, i32 0, metadata !108} ; [ DW_TAG_member ] [useLUT] [line 21, size 32, align 32, offset 512] [from int]
!651 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !652} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cmplx]
!652 = metadata !{i32 786454, null, metadata !"cmplx", metadata !593, i32 36, i64 0, i64 0, i64 0, i32 0, metadata !653} ; [ DW_TAG_typedef ] [cmplx] [line 36, size 0, align 0, offset 0] [from ]
!653 = metadata !{i32 786451, null, metadata !"", metadata !163, i32 33, i64 64, i64 32, i32 0, i32 0, null, metadata !654, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 33, size 64, align 32, offset 0] [from ]
!654 = metadata !{metadata !655, metadata !656}
!655 = metadata !{i32 786445, metadata !653, metadata !"real", metadata !163, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !173} ; [ DW_TAG_member ] [real] [line 34, size 32, align 32, offset 0] [from float]
!656 = metadata !{i32 786445, metadata !653, metadata !"imag", metadata !163, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !173} ; [ DW_TAG_member ] [imag] [line 35, size 32, align 32, offset 32] [from float]
!657 = metadata !{metadata !658}
!658 = metadata !{metadata !659, metadata !660, metadata !661, metadata !662, metadata !663, metadata !664, metadata !665, metadata !666, metadata !667, metadata !708, metadata !709, metadata !710, metadata !711, metadata !712, metadata !713, metadata !7
!659 = metadata !{i32 786689, metadata !602, metadata !"timers", metadata !593, i32 16777261, metadata !605, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [timers] [line 45]
!660 = metadata !{i32 786689, metadata !602, metadata !"n", metadata !593, i32 33554478, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 46]
!661 = metadata !{i32 786689, metadata !602, metadata !"params", metadata !593, i32 50331695, metadata !639, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [params] [line 47]
!662 = metadata !{i32 786689, metadata !602, metadata !"sample", metadata !593, i32 67108912, metadata !394, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sample] [line 48]
!663 = metadata !{i32 786689, metadata !602, metadata !"LUT", metadata !593, i32 83886129, metadata !351, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [LUT] [line 49]
!664 = metadata !{i32 786689, metadata !602, metadata !"sizeLUT", metadata !593, i32 100663347, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sizeLUT] [line 51]
!665 = metadata !{i32 786689, metadata !602, metadata !"gridData", metadata !593, i32 117440564, metadata !651, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [gridData] [line 52]
!666 = metadata !{i32 786689, metadata !602, metadata !"sampleDensity", metadata !593, i32 134217781, metadata !351, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sampleDensity] [line 53]
!667 = metadata !{i32 786688, metadata !668, metadata !"dims", metadata !593, i32 58, metadata !669, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dims] [line 58]
!668 = metadata !{i32 786443, metadata !602, i32 55, i32 0, metadata !593, i32 25} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/CUDA_interface.cpp]
!669 = metadata !{i32 786454, null, metadata !"dim3", metadata !593, i32 425, i64 0, i64 0, i64 0, i32 0, metadata !670} ; [ DW_TAG_typedef ] [dim3] [line 425, size 0, align 0, offset 0] [from dim3]
!670 = metadata !{i32 786451, null, metadata !"dim3", metadata !440, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !671, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!671 = metadata !{metadata !672, metadata !673, metadata !674, metadata !675, metadata !679, metadata !697, metadata !700, metadata !705}
!672 = metadata !{i32 786445, metadata !670, metadata !"x", metadata !440, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !257} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!673 = metadata !{i32 786445, metadata !670, metadata !"y", metadata !440, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !257} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!674 = metadata !{i32 786445, metadata !670, metadata !"z", metadata !440, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !257} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!675 = metadata !{i32 786478, i32 0, metadata !670, metadata !"dim3", metadata !"dim3", metadata !"", metadata !440, i32 419, metadata !676, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !252, i32 419} ; [ DW_TAG_s
!676 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !677, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!677 = metadata !{null, metadata !678, metadata !257, metadata !257, metadata !257}
!678 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !670} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!679 = metadata !{i32 786478, i32 0, metadata !670, metadata !"dim3", metadata !"dim3", metadata !"", metadata !440, i32 420, metadata !680, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !252, i32 420} ; [ DW_TAG_s
!680 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !681, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!681 = metadata !{null, metadata !678, metadata !682}
!682 = metadata !{i32 786454, null, metadata !"uint3", metadata !440, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !683} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!683 = metadata !{i32 786451, null, metadata !"uint3", metadata !440, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !684, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!684 = metadata !{metadata !685, metadata !686, metadata !687, metadata !688, metadata !692}
!685 = metadata !{i32 786445, metadata !683, metadata !"x", metadata !440, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !257} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!686 = metadata !{i32 786445, metadata !683, metadata !"y", metadata !440, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !257} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!687 = metadata !{i32 786445, metadata !683, metadata !"z", metadata !440, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !257} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!688 = metadata !{i32 786478, i32 0, metadata !683, metadata !"uint3", metadata !"uint3", metadata !"", metadata !440, i32 188, metadata !689, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 188} ; [ DW_TAG
!689 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !690, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!690 = metadata !{null, metadata !691}
!691 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !683} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!692 = metadata !{i32 786478, i32 0, metadata !683, metadata !"uint3", metadata !"uint3", metadata !"", metadata !440, i32 188, metadata !693, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 188} ; [ DW_TAG
!693 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !694, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!694 = metadata !{null, metadata !691, metadata !695}
!695 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !696} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!696 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !683} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!697 = metadata !{i32 786478, i32 0, metadata !670, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !440, i32 421, metadata !698, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0
!698 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !699, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!699 = metadata !{metadata !682, metadata !678}
!700 = metadata !{i32 786478, i32 0, metadata !670, metadata !"dim3", metadata !"dim3", metadata !"", metadata !440, i32 415, metadata !701, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 415} ; [ DW_TAG_s
!701 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !702, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!702 = metadata !{null, metadata !678, metadata !703}
!703 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !704} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!704 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !670} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!705 = metadata !{i32 786478, i32 0, metadata !670, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !440, i32 415, metadata !706, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !252, i32 415} ; [ DW_TAG
!706 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !707, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!707 = metadata !{null, metadata !678}
!708 = metadata !{i32 786688, metadata !668, metadata !"size_x", metadata !593, i32 61, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_x] [line 61]
!709 = metadata !{i32 786688, metadata !668, metadata !"size_y", metadata !593, i32 62, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_y] [line 62]
!710 = metadata !{i32 786688, metadata !668, metadata !"size_z", metadata !593, i32 63, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_z] [line 63]
!711 = metadata !{i32 786688, metadata !668, metadata !"size_xy", metadata !593, i32 64, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_xy] [line 64]
!712 = metadata !{i32 786688, metadata !668, metadata !"gridNumElems", metadata !593, i32 66, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridNumElems] [line 66]
!713 = metadata !{i32 786688, metadata !668, metadata !"beta", metadata !593, i32 68, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [beta] [line 68]
!714 = metadata !{i32 786688, metadata !668, metadata !"cutoff", metadata !593, i32 70, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutoff] [line 70]
!715 = metadata !{i32 786688, metadata !668, metadata !"cutoff2", metadata !593, i32 71, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutoff2] [line 71]
!716 = metadata !{i32 786688, metadata !668, metadata !"_1overCutoff2", metadata !593, i32 72, metadata !173, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [_1overCutoff2] [line 72]
!717 = metadata !{i32 786688, metadata !668, metadata !"npad", metadata !593, i32 75, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [npad] [line 75]
!718 = metadata !{i32 786688, metadata !668, metadata !"gridData_CPU", metadata !593, i32 81, metadata !651, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridData_CPU] [line 81]
!719 = metadata !{i32 786688, metadata !668, metadata !"sampleDensity_CPU", metadata !593, i32 82, metadata !351, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleDensity_CPU] [line 82]
!720 = metadata !{i32 786688, metadata !668, metadata !"indices_CPU", metadata !593, i32 83, metadata !721, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [indices_CPU] [line 83]
!721 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !108} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!722 = metadata !{i32 786688, metadata !668, metadata !"sample_d", metadata !593, i32 86, metadata !394, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sample_d] [line 86]
!723 = metadata !{i32 786688, metadata !668, metadata !"sortedSample_d", metadata !593, i32 87, metadata !351, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sortedSample_d] [line 87]
!724 = metadata !{i32 786688, metadata !668, metadata !"gridData_d", metadata !593, i32 90, metadata !437, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridData_d] [line 90]
!725 = metadata !{i32 786688, metadata !668, metadata !"sampleDensity_d", metadata !593, i32 91, metadata !351, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleDensity_d] [line 91]
!726 = metadata !{i32 786688, metadata !668, metadata !"idxKey_d", metadata !593, i32 92, metadata !414, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idxKey_d] [line 92]
!727 = metadata !{i32 786688, metadata !668, metadata !"idxValue_d", metadata !593, i32 95, metadata !414, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idxValue_d] [line 95]
!728 = metadata !{i32 786688, metadata !668, metadata !"sortedSampleSoA_d", metadata !593, i32 100, metadata !433, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sortedSampleSoA_d] [line 100]
!729 = metadata !{i32 786688, metadata !668, metadata !"binCount_d", metadata !593, i32 103, metadata !414, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [binCount_d] [line 103]
!730 = metadata !{i32 786688, metadata !668, metadata !"binStartAddr_d", metadata !593, i32 106, metadata !414, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [binStartAddr_d] [line 106]
!731 = metadata !{i32 786688, metadata !732, metadata !"err", metadata !593, i32 123, metadata !733, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 123]
!732 = metadata !{i32 786443, metadata !668, i32 123, i32 0, metadata !593, i32 27} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/CUDA_interface.cpp]
!733 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !593, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!734 = metadata !{i32 786688, metadata !668, metadata !"block1", metadata !593, i32 144, metadata !669, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [block1] [line 144]
!735 = metadata !{i32 786688, metadata !668, metadata !"grid1", metadata !593, i32 145, metadata !669, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [grid1] [line 145]
!736 = metadata !{i32 786688, metadata !668, metadata !"cpuStart", metadata !593, i32 213, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cpuStart] [line 213]
!737 = metadata !{i32 786688, metadata !668, metadata !"CPUbin_size", metadata !593, i32 216, metadata !108, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CPUbin_size] [line 216]
!738 = metadata !{i32 786688, metadata !668, metadata !"CPUbin", metadata !593, i32 218, metadata !721, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [CPUbin] [line 218]
!739 = metadata !{i32 786688, metadata !740, metadata !"err", metadata !593, i32 230, metadata !733, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 230]
!740 = metadata !{i32 786443, metadata !668, i32 230, i32 0, metadata !593, i32 30} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/CUDA_interface.cpp]
!741 = metadata !{i32 786478, i32 0, metadata !742, metadata !"cudaMemcpyToSymbol<int>", metadata !"cudaMemcpyToSymbol<int>", metadata !"_ZN12_GLOBAL__N_118cudaMemcpyToSymbolIiEE9cudaErrorRKT_PKvmm14cudaMemcpyKind", metadata !743, i32 320, metadata !744,
!742 = metadata !{i32 786489, null, metadata !"", metadata !743, i32 93} ; [ DW_TAG_namespace ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning//home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h]
!743 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!744 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !745, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!745 = metadata !{metadata !733, metadata !746, metadata !596, metadata !747, metadata !747, metadata !381}
!746 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !515} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!747 = metadata !{i32 786454, null, metadata !"size_t", metadata !743, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !154} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!748 = metadata !{metadata !749}
!749 = metadata !{i32 786479, null, metadata !"T", metadata !108, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!750 = metadata !{metadata !751}
!751 = metadata !{metadata !752, metadata !753, metadata !754, metadata !755, metadata !756}
!752 = metadata !{i32 786689, metadata !741, metadata !"symbol", metadata !743, i32 16777537, metadata !746, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 321]
!753 = metadata !{i32 786689, metadata !741, metadata !"src", metadata !743, i32 33554754, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 322]
!754 = metadata !{i32 786689, metadata !741, metadata !"count", metadata !743, i32 50331971, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 323]
!755 = metadata !{i32 786689, metadata !741, metadata !"offset", metadata !743, i32 67109188, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 324]
!756 = metadata !{i32 786689, metadata !741, metadata !"kind", metadata !743, i32 83886405, metadata !381, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 325]
!757 = metadata !{i32 786478, i32 0, metadata !742, metadata !"cudaMemcpyToSymbol<int [3]>", metadata !"cudaMemcpyToSymbol<int [3]>", metadata !"_ZN12_GLOBAL__N_118cudaMemcpyToSymbolIA3_iEE9cudaErrorRKT_PKvmm14cudaMemcpyKind", metadata !743, i32 320, met
!758 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !759, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!759 = metadata !{metadata !733, metadata !760, metadata !596, metadata !747, metadata !747, metadata !381}
!760 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !761} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!761 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !167} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!762 = metadata !{metadata !763}
!763 = metadata !{i32 786479, null, metadata !"T", metadata !167, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!764 = metadata !{metadata !765}
!765 = metadata !{metadata !766, metadata !767, metadata !768, metadata !769, metadata !770}
!766 = metadata !{i32 786689, metadata !757, metadata !"symbol", metadata !743, i32 16777537, metadata !760, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 321]
!767 = metadata !{i32 786689, metadata !757, metadata !"src", metadata !743, i32 33554754, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 322]
!768 = metadata !{i32 786689, metadata !757, metadata !"count", metadata !743, i32 50331971, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 323]
!769 = metadata !{i32 786689, metadata !757, metadata !"offset", metadata !743, i32 67109188, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 324]
!770 = metadata !{i32 786689, metadata !757, metadata !"kind", metadata !743, i32 83886405, metadata !381, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 325]
!771 = metadata !{i32 786478, i32 0, metadata !742, metadata !"cudaMemcpyToSymbol<float>", metadata !"cudaMemcpyToSymbol<float>", metadata !"_ZN12_GLOBAL__N_118cudaMemcpyToSymbolIfEE9cudaErrorRKT_PKvmm14cudaMemcpyKind", metadata !743, i32 320, metadata !
!772 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !773, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!773 = metadata !{metadata !733, metadata !774, metadata !596, metadata !747, metadata !747, metadata !381}
!774 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !575} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!775 = metadata !{metadata !776}
!776 = metadata !{i32 786479, null, metadata !"T", metadata !173, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!777 = metadata !{metadata !778}
!778 = metadata !{metadata !779, metadata !780, metadata !781, metadata !782, metadata !783}
!779 = metadata !{i32 786689, metadata !771, metadata !"symbol", metadata !743, i32 16777537, metadata !774, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 321]
!780 = metadata !{i32 786689, metadata !771, metadata !"src", metadata !743, i32 33554754, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 322]
!781 = metadata !{i32 786689, metadata !771, metadata !"count", metadata !743, i32 50331971, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 323]
!782 = metadata !{i32 786689, metadata !771, metadata !"offset", metadata !743, i32 67109188, metadata !747, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 324]
!783 = metadata !{i32 786689, metadata !771, metadata !"kind", metadata !743, i32 83886405, metadata !381, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 325]
!784 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !440, i32 419, metadata !676, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !675, metadata !785, i32 419} 
!785 = metadata !{metadata !786}
!786 = metadata !{metadata !787, metadata !789, metadata !790, metadata !791}
!787 = metadata !{i32 786689, metadata !784, metadata !"this", metadata !440, i32 16777635, metadata !788, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!788 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !670} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!789 = metadata !{i32 786689, metadata !784, metadata !"vx", metadata !440, i32 33554851, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!790 = metadata !{i32 786689, metadata !784, metadata !"vy", metadata !440, i32 50332067, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!791 = metadata !{i32 786689, metadata !784, metadata !"vz", metadata !440, i32 67109283, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!792 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !440, i32 419, metadata !676, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !675, metadata !793, i32 419} 
!793 = metadata !{metadata !794}
!794 = metadata !{metadata !795, metadata !796, metadata !797, metadata !798}
!795 = metadata !{i32 786689, metadata !792, metadata !"this", metadata !440, i32 16777635, metadata !788, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!796 = metadata !{i32 786689, metadata !792, metadata !"vx", metadata !440, i32 33554851, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!797 = metadata !{i32 786689, metadata !792, metadata !"vy", metadata !440, i32 50332067, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!798 = metadata !{i32 786689, metadata !792, metadata !"vz", metadata !440, i32 67109283, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!799 = metadata !{i32 786478, i32 0, metadata !371, metadata !"ceil", metadata !"ceil", metadata !"_ZSt4ceilf", metadata !372, i32 183, metadata !373, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !800, i32 184} ; [ 
!800 = metadata !{metadata !801}
!801 = metadata !{metadata !802}
!802 = metadata !{i32 786689, metadata !799, metadata !"__x", metadata !372, i32 16777399, metadata !173, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__x] [line 183]
!803 = metadata !{i32 786478, i32 0, metadata !804, metadata !"atomicSub", metadata !"atomicSub", metadata !"_ZL9atomicSubPjj", metadata !804, i32 111, metadata !805, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !807
!804 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_functions.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning", null} ; [ DW_TAG_file_type ]
!805 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !806, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!806 = metadata !{metadata !257, metadata !414, metadata !257}
!807 = metadata !{metadata !808}
!808 = metadata !{metadata !809, metadata !810}
!809 = metadata !{i32 786689, metadata !803, metadata !"address", metadata !804, i32 16777327, metadata !414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [address] [line 111]
!810 = metadata !{i32 786689, metadata !803, metadata !"val", metadata !804, i32 33554543, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 111]
!811 = metadata !{i32 786478, i32 0, metadata !804, metadata !"atomicAdd", metadata !"atomicAdd", metadata !"_ZL9atomicAddPjj", metadata !804, i32 101, metadata !805, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !812
!812 = metadata !{metadata !813}
!813 = metadata !{metadata !814, metadata !815}
!814 = metadata !{i32 786689, metadata !811, metadata !"address", metadata !804, i32 16777317, metadata !414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [address] [line 101]
!815 = metadata !{i32 786689, metadata !811, metadata !"val", metadata !804, i32 33554533, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 101]
!816 = metadata !{metadata !817}
!817 = metadata !{metadata !818, metadata !822, metadata !823, metadata !824, metadata !825, metadata !826, metadata !827, metadata !828, metadata !829, metadata !830, metadata !831}
!818 = metadata !{i32 786484, i32 0, metadata !503, metadata !"real_s", metadata !"real_s", metadata !"", metadata !391, i32 111, metadata !819, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6real_s} ; [ DW_TAG_variable ]
!819 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 32, i32 0, i32 0, metadata !173, metadata !820, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 32, offset 0] [from float]
!820 = metadata !{metadata !821}
!821 = metadata !{i32 786465, i64 0, i64 63}      ; [ DW_TAG_subrange_type ] [0, 63]
!822 = metadata !{i32 786484, i32 0, metadata !503, metadata !"imag_s", metadata !"imag_s", metadata !"", metadata !391, i32 112, metadata !819, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6imag_s} ; [ DW_TAG_variable ]
!823 = metadata !{i32 786484, i32 0, metadata !503, metadata !"kx_s", metadata !"kx_s", metadata !"", metadata !391, i32 113, metadata !819, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kx_s} ; [ DW_TAG_variable ] [kx_s
!824 = metadata !{i32 786484, i32 0, metadata !503, metadata !"ky_s", metadata !"ky_s", metadata !"", metadata !391, i32 114, metadata !819, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4ky_s} ; [ DW_TAG_variable ] [ky_s
!825 = metadata !{i32 786484, i32 0, metadata !503, metadata !"kz_s", metadata !"kz_s", metadata !"", metadata !391, i32 115, metadata !819, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kz_s} ; [ DW_TAG_variable ] [kz_s
!826 = metadata !{i32 786484, i32 0, metadata !503, metadata !"sdc_s", metadata !"sdc_s", metadata !"", metadata !391, i32 116, metadata !819, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE5sdc_s} ; [ DW_TAG_variable ] [s
!827 = metadata !{i32 786484, i32 0, null, metadata !"_1overCutoff2_c", metadata !"_1overCutoff2_c", metadata !"_ZL15_1overCutoff2_c", metadata !391, i32 30, metadata !173, i32 1, i32 1, float* @_ZL15_1overCutoff2_c} ; [ DW_TAG_variable ] [_1overCutoff2_
!828 = metadata !{i32 786484, i32 0, null, metadata !"cutoff2_c", metadata !"cutoff2_c", metadata !"_ZL9cutoff2_c", metadata !391, i32 26, metadata !173, i32 1, i32 1, float* @_ZL9cutoff2_c} ; [ DW_TAG_variable ] [cutoff2_c] [line 26] [local] [def]
!829 = metadata !{i32 786484, i32 0, null, metadata !"cutoff_c", metadata !"cutoff_c", metadata !"_ZL8cutoff_c", metadata !391, i32 27, metadata !173, i32 1, i32 1, float* @_ZL8cutoff_c} ; [ DW_TAG_variable ] [cutoff_c] [line 27] [local] [def]
!830 = metadata !{i32 786484, i32 0, null, metadata !"gridSize_c", metadata !"gridSize_c", metadata !"_ZL10gridSize_c", metadata !391, i32 28, metadata !167, i32 1, i32 1, [3 x i32]* @_ZL10gridSize_c} ; [ DW_TAG_variable ] [gridSize_c] [line 28] [local] 
!831 = metadata !{i32 786484, i32 0, null, metadata !"size_xy_c", metadata !"size_xy_c", metadata !"_ZL9size_xy_c", metadata !391, i32 29, metadata !108, i32 1, i32 1, i32* @_ZL9size_xy_c} ; [ DW_TAG_variable ] [size_xy_c] [line 29] [local] [def]
!832 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!833 = metadata !{metadata !834}
!834 = metadata !{metadata !835}
!835 = metadata !{i32 786478, i32 0, metadata !836, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", metadata !836, i32 12, metadata !837, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_
!836 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!837 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !838, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!838 = metadata !{null, metadata !839}
!839 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!840 = metadata !{metadata !841}
!841 = metadata !{metadata !842}
!842 = metadata !{i32 786689, metadata !835, metadata !"z", metadata !836, i32 16777228, metadata !839, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!843 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!844 = metadata !{metadata !845}
!845 = metadata !{metadata !846}
!846 = metadata !{i32 786478, i32 0, metadata !847, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !847, i32 12, metadata !848, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !8
!847 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!848 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !849, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!849 = metadata !{metadata !145, metadata !145, metadata !596, metadata !850}
!850 = metadata !{i32 786454, null, metadata !"size_t", metadata !847, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !154} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!851 = metadata !{metadata !852}
!852 = metadata !{metadata !853, metadata !854, metadata !855, metadata !856, metadata !858}
!853 = metadata !{i32 786689, metadata !846, metadata !"destaddr", metadata !847, i32 16777228, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!854 = metadata !{i32 786689, metadata !846, metadata !"srcaddr", metadata !847, i32 33554444, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!855 = metadata !{i32 786689, metadata !846, metadata !"len", metadata !847, i32 50331660, metadata !850, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!856 = metadata !{i32 786688, metadata !857, metadata !"dest", metadata !847, i32 13, metadata !110, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!857 = metadata !{i32 786443, metadata !846, i32 12, i32 0, metadata !847, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c]
!858 = metadata !{i32 786688, metadata !857, metadata !"src", metadata !847, i32 14, metadata !859, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!859 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !860} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!860 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !111} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!861 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata 
!862 = metadata !{metadata !863}
!863 = metadata !{metadata !864}
!864 = metadata !{i32 786478, i32 0, metadata !865, metadata !"memmove", metadata !"memmove", metadata !"", metadata !865, i32 12, metadata !866, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !869, i32 12} ; [ DW_TAG
!865 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!866 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !867, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!867 = metadata !{metadata !145, metadata !145, metadata !596, metadata !868}
!868 = metadata !{i32 786454, null, metadata !"size_t", metadata !865, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !154} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!869 = metadata !{metadata !870}
!870 = metadata !{metadata !871, metadata !872, metadata !873, metadata !874, metadata !876}
!871 = metadata !{i32 786689, metadata !864, metadata !"dst", metadata !865, i32 16777228, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!872 = metadata !{i32 786689, metadata !864, metadata !"src", metadata !865, i32 33554444, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!873 = metadata !{i32 786689, metadata !864, metadata !"count", metadata !865, i32 50331660, metadata !868, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!874 = metadata !{i32 786688, metadata !875, metadata !"a", metadata !865, i32 14, metadata !110, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!875 = metadata !{i32 786443, metadata !864, i32 12, i32 0, metadata !865, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c]
!876 = metadata !{i32 786688, metadata !875, metadata !"b", metadata !865, i32 15, metadata !859, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!877 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!878 = metadata !{metadata !879}
!879 = metadata !{metadata !880}
!880 = metadata !{i32 786478, i32 0, metadata !881, metadata !"memset", metadata !"memset", metadata !"", metadata !881, i32 12, metadata !882, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !8
!881 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!882 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !883, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!883 = metadata !{metadata !145, metadata !145, metadata !108, metadata !884}
!884 = metadata !{i32 786454, null, metadata !"size_t", metadata !881, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !154} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!885 = metadata !{metadata !886}
!886 = metadata !{metadata !887, metadata !888, metadata !889, metadata !890}
!887 = metadata !{i32 786689, metadata !880, metadata !"dst", metadata !881, i32 16777228, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!888 = metadata !{i32 786689, metadata !880, metadata !"s", metadata !881, i32 33554444, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!889 = metadata !{i32 786689, metadata !880, metadata !"count", metadata !881, i32 50331660, metadata !884, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!890 = metadata !{i32 786688, metadata !891, metadata !"a", metadata !881, i32 13, metadata !892, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!891 = metadata !{i32 786443, metadata !880, i32 12, i32 0, metadata !881, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c]
!892 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !893} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!893 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !111} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!894 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!895 = metadata !{metadata !896}
!896 = metadata !{metadata !897, metadata !899, metadata !905}
!897 = metadata !{i32 786436, null, metadata !"cudaError", metadata !898, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !21, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!898 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!899 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !898, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !900, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!900 = metadata !{metadata !901, metadata !902, metadata !903, metadata !904}
!901 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!902 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!903 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!904 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!905 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !898, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !382, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!906 = metadata !{metadata !907}
!907 = metadata !{metadata !908, metadata !936, metadata !942, metadata !948, metadata !952, metadata !960, metadata !968, metadata !976, metadata !984, metadata !991, metadata !999, metadata !1003, metadata !1010, metadata !1024, metadata !1034, metadat
!908 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !909, i32 24, metadata !910, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!909 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!910 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !911, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!911 = metadata !{metadata !912, metadata !913, metadata !921, metadata !414, metadata !928}
!912 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !909, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !897} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!913 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !914} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!914 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !898, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !915, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!915 = metadata !{metadata !916, metadata !917, metadata !918, metadata !919, metadata !920}
!916 = metadata !{i32 786445, metadata !914, metadata !"x", metadata !898, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !108} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!917 = metadata !{i32 786445, metadata !914, metadata !"y", metadata !898, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !108} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!918 = metadata !{i32 786445, metadata !914, metadata !"z", metadata !898, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !108} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!919 = metadata !{i32 786445, metadata !914, metadata !"w", metadata !898, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !108} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!920 = metadata !{i32 786445, metadata !914, metadata !"f", metadata !898, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !899} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!921 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !922} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!922 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !898, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !923, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!923 = metadata !{metadata !924, metadata !926, metadata !927}
!924 = metadata !{i32 786445, metadata !922, metadata !"width", metadata !898, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !925} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!925 = metadata !{i32 786454, null, metadata !"size_t", metadata !898, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !154} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!926 = metadata !{i32 786445, metadata !922, metadata !"height", metadata !898, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !925} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!927 = metadata !{i32 786445, metadata !922, metadata !"depth", metadata !898, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !925} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!928 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !929} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!929 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !898, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!930 = metadata !{metadata !931}
!931 = metadata !{metadata !932, metadata !933, metadata !934, metadata !935}
!932 = metadata !{i32 786689, metadata !908, metadata !"desc", metadata !909, i32 16777240, metadata !913, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!933 = metadata !{i32 786689, metadata !908, metadata !"extent", metadata !909, i32 33554456, metadata !921, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!934 = metadata !{i32 786689, metadata !908, metadata !"flags", metadata !909, i32 50331673, metadata !414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!935 = metadata !{i32 786689, metadata !908, metadata !"array", metadata !909, i32 67108889, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!936 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !909, i32 29, metadata !937, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !939, 
!937 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !938, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!938 = metadata !{metadata !912, metadata !145}
!939 = metadata !{metadata !940}
!940 = metadata !{metadata !941}
!941 = metadata !{i32 786689, metadata !936, metadata !"devPtr", metadata !909, i32 16777245, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!942 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !909, i32 34, metadata !943, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!943 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !944, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!944 = metadata !{metadata !912, metadata !928}
!945 = metadata !{metadata !946}
!946 = metadata !{metadata !947}
!947 = metadata !{i32 786689, metadata !942, metadata !"array", metadata !909, i32 16777250, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!948 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !909, i32 39, metadata !937, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!949 = metadata !{metadata !950}
!950 = metadata !{metadata !951}
!951 = metadata !{i32 786689, metadata !948, metadata !"ptr", metadata !909, i32 16777255, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!952 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !909, i32 44, metadata !953, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!953 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !954, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!954 = metadata !{metadata !912, metadata !955, metadata !859}
!955 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !145} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!956 = metadata !{metadata !957}
!957 = metadata !{metadata !958, metadata !959}
!958 = metadata !{i32 786689, metadata !952, metadata !"devPtr", metadata !909, i32 16777260, metadata !955, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!959 = metadata !{i32 786689, metadata !952, metadata !"symbol", metadata !909, i32 33554476, metadata !859, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!960 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !909, i32 48, metadata !961, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!961 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !962, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!962 = metadata !{metadata !912, metadata !963, metadata !859}
!963 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !925} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!964 = metadata !{metadata !965}
!965 = metadata !{metadata !966, metadata !967}
!966 = metadata !{i32 786689, metadata !960, metadata !"size", metadata !909, i32 16777264, metadata !963, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!967 = metadata !{i32 786689, metadata !960, metadata !"symbol", metadata !909, i32 33554480, metadata !859, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!968 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !909, i32 52, metadata !969, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!969 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !970, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!970 = metadata !{metadata !912, metadata !955, metadata !925, metadata !257}
!971 = metadata !{metadata !972}
!972 = metadata !{metadata !973, metadata !974, metadata !975}
!973 = metadata !{i32 786689, metadata !968, metadata !"pHost", metadata !909, i32 16777268, metadata !955, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!974 = metadata !{i32 786689, metadata !968, metadata !"size", metadata !909, i32 33554484, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!975 = metadata !{i32 786689, metadata !968, metadata !"flags", metadata !909, i32 50331700, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!976 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !909, i32 56, metadata !977, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!977 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !978, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!978 = metadata !{metadata !912, metadata !955, metadata !145, metadata !257}
!979 = metadata !{metadata !980}
!980 = metadata !{metadata !981, metadata !982, metadata !983}
!981 = metadata !{i32 786689, metadata !976, metadata !"pDevice", metadata !909, i32 16777272, metadata !955, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!982 = metadata !{i32 786689, metadata !976, metadata !"pHost", metadata !909, i32 33554488, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!983 = metadata !{i32 786689, metadata !976, metadata !"flags", metadata !909, i32 50331704, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!984 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !909, i32 60, metadata !985, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!985 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !986, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!986 = metadata !{metadata !912, metadata !414, metadata !145}
!987 = metadata !{metadata !988}
!988 = metadata !{metadata !989, metadata !990}
!989 = metadata !{i32 786689, metadata !984, metadata !"pFlags", metadata !909, i32 16777276, metadata !414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!990 = metadata !{i32 786689, metadata !984, metadata !"pHost", metadata !909, i32 33554492, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!991 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !909, i32 64, metadata !992, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!992 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !993, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!993 = metadata !{metadata !912, metadata !145, metadata !925, metadata !257}
!994 = metadata !{metadata !995}
!995 = metadata !{metadata !996, metadata !997, metadata !998}
!996 = metadata !{i32 786689, metadata !991, metadata !"ptr", metadata !909, i32 16777280, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!997 = metadata !{i32 786689, metadata !991, metadata !"size", metadata !909, i32 33554496, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!998 = metadata !{i32 786689, metadata !991, metadata !"flags", metadata !909, i32 50331712, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!999 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !909, i32 68, metadata !937, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!1000 = metadata !{metadata !1001}
!1001 = metadata !{metadata !1002}
!1002 = metadata !{i32 786689, metadata !999, metadata !"ptr", metadata !909, i32 16777284, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!1003 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !909, i32 72, metadata !1004, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, m
!1004 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1005, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1005 = metadata !{metadata !912, metadata !955, metadata !925}
!1006 = metadata !{metadata !1007}
!1007 = metadata !{metadata !1008, metadata !1009}
!1008 = metadata !{i32 786689, metadata !1003, metadata !"devPtr", metadata !909, i32 16777288, metadata !955, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!1009 = metadata !{i32 786689, metadata !1003, metadata !"size", metadata !909, i32 33554504, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!1010 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !909, i32 80, metadata !1011, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.c
!1011 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1012, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1012 = metadata !{metadata !912, metadata !1013, metadata !922}
!1013 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1014} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!1014 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !898, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !1015, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!1015 = metadata !{metadata !1016, metadata !1017, metadata !1018, metadata !1019}
!1016 = metadata !{i32 786445, metadata !1014, metadata !"ptr", metadata !898, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !145} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!1017 = metadata !{i32 786445, metadata !1014, metadata !"pitch", metadata !898, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !925} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!1018 = metadata !{i32 786445, metadata !1014, metadata !"xsize", metadata !898, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !925} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!1019 = metadata !{i32 786445, metadata !1014, metadata !"ysize", metadata !898, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !925} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!1020 = metadata !{metadata !1021}
!1021 = metadata !{metadata !1022, metadata !1023}
!1022 = metadata !{i32 786689, metadata !1010, metadata !"pitchedDevPtr", metadata !909, i32 16777296, metadata !1013, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!1023 = metadata !{i32 786689, metadata !1010, metadata !"extent", metadata !909, i32 33554512, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!1024 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !909, i32 84, metadata !1025, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %st
!1025 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1026, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1026 = metadata !{metadata !912, metadata !1027, metadata !913, metadata !922, metadata !257}
!1027 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !928} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1028 = metadata !{metadata !1029}
!1029 = metadata !{metadata !1030, metadata !1031, metadata !1032, metadata !1033}
!1030 = metadata !{i32 786689, metadata !1024, metadata !"array", metadata !909, i32 16777300, metadata !1027, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!1031 = metadata !{i32 786689, metadata !1024, metadata !"desc", metadata !909, i32 33554516, metadata !913, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!1032 = metadata !{i32 786689, metadata !1024, metadata !"extent", metadata !909, i32 50331733, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!1033 = metadata !{i32 786689, metadata !1024, metadata !"flags", metadata !909, i32 67108949, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!1034 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !909, i32 89, metadata !1035, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct
!1035 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1036, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1036 = metadata !{metadata !912, metadata !1027, metadata !913, metadata !925, metadata !925, metadata !257}
!1037 = metadata !{metadata !1038}
!1038 = metadata !{metadata !1039, metadata !1040, metadata !1041, metadata !1042, metadata !1043}
!1039 = metadata !{i32 786689, metadata !1034, metadata !"array", metadata !909, i32 16777305, metadata !1027, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!1040 = metadata !{i32 786689, metadata !1034, metadata !"desc", metadata !909, i32 33554521, metadata !913, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!1041 = metadata !{i32 786689, metadata !1034, metadata !"width", metadata !909, i32 50331738, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!1042 = metadata !{i32 786689, metadata !1034, metadata !"height", metadata !909, i32 67108954, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!1043 = metadata !{i32 786689, metadata !1034, metadata !"flags", metadata !909, i32 83886170, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!1044 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !909, i32 94, metadata !1004, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, n
!1045 = metadata !{metadata !1046}
!1046 = metadata !{metadata !1047, metadata !1048}
!1047 = metadata !{i32 786689, metadata !1044, metadata !"ptr", metadata !909, i32 16777310, metadata !955, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!1048 = metadata !{i32 786689, metadata !1044, metadata !"size", metadata !909, i32 33554526, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!1049 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !909, i32 102, metadata !1050, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cud
!1050 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1051, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1051 = metadata !{metadata !912, metadata !955, metadata !963, metadata !925, metadata !925}
!1052 = metadata !{metadata !1053}
!1053 = metadata !{metadata !1054, metadata !1055, metadata !1056, metadata !1057}
!1054 = metadata !{i32 786689, metadata !1049, metadata !"devPtr", metadata !909, i32 16777318, metadata !955, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!1055 = metadata !{i32 786689, metadata !1049, metadata !"pitch", metadata !909, i32 33554534, metadata !963, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!1056 = metadata !{i32 786689, metadata !1049, metadata !"width", metadata !909, i32 50331750, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!1057 = metadata !{i32 786689, metadata !1049, metadata !"height", metadata !909, i32 67108966, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!1058 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !909, i32 106, metadata !1059, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, nul
!1059 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1060, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1060 = metadata !{metadata !912, metadata !145, metadata !596, metadata !925, metadata !905}
!1061 = metadata !{metadata !1062}
!1062 = metadata !{metadata !1063, metadata !1064, metadata !1065, metadata !1066}
!1063 = metadata !{i32 786689, metadata !1058, metadata !"dst", metadata !909, i32 16777322, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!1064 = metadata !{i32 786689, metadata !1058, metadata !"src", metadata !909, i32 33554538, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!1065 = metadata !{i32 786689, metadata !1058, metadata !"count", metadata !909, i32 50331754, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!1066 = metadata !{i32 786689, metadata !1058, metadata !"kind", metadata !909, i32 67108970, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!1067 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !909, i32 111, metadata !1068, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32
!1068 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1069, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1069 = metadata !{metadata !912, metadata !145, metadata !925, metadata !596, metadata !925, metadata !925, metadata !925, metadata !905}
!1070 = metadata !{metadata !1071}
!1071 = metadata !{metadata !1072, metadata !1073, metadata !1074, metadata !1075, metadata !1076, metadata !1077, metadata !1078}
!1072 = metadata !{i32 786689, metadata !1067, metadata !"dst", metadata !909, i32 16777327, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!1073 = metadata !{i32 786689, metadata !1067, metadata !"dpitch", metadata !909, i32 33554543, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!1074 = metadata !{i32 786689, metadata !1067, metadata !"src", metadata !909, i32 50331759, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!1075 = metadata !{i32 786689, metadata !1067, metadata !"spitch", metadata !909, i32 67108975, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!1076 = metadata !{i32 786689, metadata !1067, metadata !"width", metadata !909, i32 83886192, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!1077 = metadata !{i32 786689, metadata !1067, metadata !"height", metadata !909, i32 100663408, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!1078 = metadata !{i32 786689, metadata !1067, metadata !"kind", metadata !909, i32 117440624, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!1079 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !909, i32 116, metadata !1080, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.c
!1080 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1081, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1081 = metadata !{metadata !912, metadata !928, metadata !925, metadata !925, metadata !928, metadata !925, metadata !925, metadata !925, metadata !925, metadata !905}
!1082 = metadata !{metadata !1083}
!1083 = metadata !{metadata !1084, metadata !1085, metadata !1086, metadata !1087, metadata !1088, metadata !1089, metadata !1090, metadata !1091, metadata !1092}
!1084 = metadata !{i32 786689, metadata !1079, metadata !"dst", metadata !909, i32 16777332, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!1085 = metadata !{i32 786689, metadata !1079, metadata !"wOffsetDst", metadata !909, i32 33554548, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!1086 = metadata !{i32 786689, metadata !1079, metadata !"hOffsetDst", metadata !909, i32 50331764, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!1087 = metadata !{i32 786689, metadata !1079, metadata !"src", metadata !909, i32 67108981, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!1088 = metadata !{i32 786689, metadata !1079, metadata !"wOffsetSrc", metadata !909, i32 83886197, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!1089 = metadata !{i32 786689, metadata !1079, metadata !"hOffsetSrc", metadata !909, i32 100663413, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!1090 = metadata !{i32 786689, metadata !1079, metadata !"width", metadata !909, i32 117440630, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!1091 = metadata !{i32 786689, metadata !1079, metadata !"height", metadata !909, i32 134217846, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!1092 = metadata !{i32 786689, metadata !1079, metadata !"kind", metadata !909, i32 150995062, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!1093 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !909, i32 122, metadata !1094, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64
!1094 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1095, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1095 = metadata !{metadata !912, metadata !145, metadata !925, metadata !596, metadata !925, metadata !925, metadata !925, metadata !905, metadata !1096}
!1096 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !909, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !1097} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!1097 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1098} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!1098 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !898, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!1099 = metadata !{metadata !1100}
!1100 = metadata !{metadata !1101, metadata !1102, metadata !1103, metadata !1104, metadata !1105, metadata !1106, metadata !1107, metadata !1108}
!1101 = metadata !{i32 786689, metadata !1093, metadata !"dst", metadata !909, i32 16777338, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!1102 = metadata !{i32 786689, metadata !1093, metadata !"dpitch", metadata !909, i32 33554554, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!1103 = metadata !{i32 786689, metadata !1093, metadata !"src", metadata !909, i32 50331770, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!1104 = metadata !{i32 786689, metadata !1093, metadata !"spitch", metadata !909, i32 67108986, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!1105 = metadata !{i32 786689, metadata !1093, metadata !"width", metadata !909, i32 83886203, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!1106 = metadata !{i32 786689, metadata !1093, metadata !"height", metadata !909, i32 100663419, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!1107 = metadata !{i32 786689, metadata !1093, metadata !"kind", metadata !909, i32 117440635, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!1108 = metadata !{i32 786689, metadata !1093, metadata !"stream", metadata !909, i32 134217852, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!1109 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !909, i32 128, metadata !1110, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %stru
!1110 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1111, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1111 = metadata !{metadata !912, metadata !145, metadata !925, metadata !928, metadata !925, metadata !925, metadata !925, metadata !925, metadata !905}
!1112 = metadata !{metadata !1113}
!1113 = metadata !{metadata !1114, metadata !1115, metadata !1116, metadata !1117, metadata !1118, metadata !1119, metadata !1120, metadata !1121}
!1114 = metadata !{i32 786689, metadata !1109, metadata !"dst", metadata !909, i32 16777344, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!1115 = metadata !{i32 786689, metadata !1109, metadata !"dpitch", metadata !909, i32 33554560, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!1116 = metadata !{i32 786689, metadata !1109, metadata !"src", metadata !909, i32 50331776, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!1117 = metadata !{i32 786689, metadata !1109, metadata !"wOffset", metadata !909, i32 67108993, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!1118 = metadata !{i32 786689, metadata !1109, metadata !"hOffset", metadata !909, i32 83886209, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!1119 = metadata !{i32 786689, metadata !1109, metadata !"width", metadata !909, i32 100663425, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!1120 = metadata !{i32 786689, metadata !1109, metadata !"height", metadata !909, i32 117440641, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!1121 = metadata !{i32 786689, metadata !1109, metadata !"kind", metadata !909, i32 134217858, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!1122 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !909, i32 134, metadata !1123, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, 
!1123 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1124, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1124 = metadata !{metadata !912, metadata !145, metadata !925, metadata !928, metadata !925, metadata !925, metadata !925, metadata !925, metadata !905, metadata !1096}
!1125 = metadata !{metadata !1126}
!1126 = metadata !{metadata !1127, metadata !1128, metadata !1129, metadata !1130, metadata !1131, metadata !1132, metadata !1133, metadata !1134, metadata !1135}
!1127 = metadata !{i32 786689, metadata !1122, metadata !"dst", metadata !909, i32 16777350, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!1128 = metadata !{i32 786689, metadata !1122, metadata !"dpitch", metadata !909, i32 33554566, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!1129 = metadata !{i32 786689, metadata !1122, metadata !"src", metadata !909, i32 50331782, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!1130 = metadata !{i32 786689, metadata !1122, metadata !"wOffset", metadata !909, i32 67108999, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!1131 = metadata !{i32 786689, metadata !1122, metadata !"hOffset", metadata !909, i32 83886215, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!1132 = metadata !{i32 786689, metadata !1122, metadata !"width", metadata !909, i32 100663431, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!1133 = metadata !{i32 786689, metadata !1122, metadata !"height", metadata !909, i32 117440647, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!1134 = metadata !{i32 786689, metadata !1122, metadata !"kind", metadata !909, i32 134217864, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!1135 = metadata !{i32 786689, metadata !1122, metadata !"stream", metadata !909, i32 150995080, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!1136 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !909, i32 140, metadata !1137, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*,
!1137 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1138, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1138 = metadata !{metadata !912, metadata !928, metadata !925, metadata !925, metadata !596, metadata !925, metadata !925, metadata !925, metadata !905}
!1139 = metadata !{metadata !1140}
!1140 = metadata !{metadata !1141, metadata !1142, metadata !1143, metadata !1144, metadata !1145, metadata !1146, metadata !1147, metadata !1148}
!1141 = metadata !{i32 786689, metadata !1136, metadata !"dst", metadata !909, i32 16777356, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!1142 = metadata !{i32 786689, metadata !1136, metadata !"wOffset", metadata !909, i32 33554572, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!1143 = metadata !{i32 786689, metadata !1136, metadata !"hOffset", metadata !909, i32 50331788, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!1144 = metadata !{i32 786689, metadata !1136, metadata !"src", metadata !909, i32 67109005, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!1145 = metadata !{i32 786689, metadata !1136, metadata !"spitch", metadata !909, i32 83886221, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!1146 = metadata !{i32 786689, metadata !1136, metadata !"width", metadata !909, i32 100663437, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!1147 = metadata !{i32 786689, metadata !1136, metadata !"height", metadata !909, i32 117440653, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!1148 = metadata !{i32 786689, metadata !1136, metadata !"kind", metadata !909, i32 134217870, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!1149 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !909, i32 146, metadata !1150, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.c
!1150 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1151, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1151 = metadata !{metadata !912, metadata !928, metadata !925, metadata !925, metadata !596, metadata !925, metadata !925, metadata !925, metadata !905, metadata !1096}
!1152 = metadata !{metadata !1153}
!1153 = metadata !{metadata !1154, metadata !1155, metadata !1156, metadata !1157, metadata !1158, metadata !1159, metadata !1160, metadata !1161, metadata !1162}
!1154 = metadata !{i32 786689, metadata !1149, metadata !"dst", metadata !909, i32 16777362, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!1155 = metadata !{i32 786689, metadata !1149, metadata !"wOffset", metadata !909, i32 33554578, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!1156 = metadata !{i32 786689, metadata !1149, metadata !"hOffset", metadata !909, i32 50331794, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!1157 = metadata !{i32 786689, metadata !1149, metadata !"src", metadata !909, i32 67109011, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!1158 = metadata !{i32 786689, metadata !1149, metadata !"spitch", metadata !909, i32 83886227, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!1159 = metadata !{i32 786689, metadata !1149, metadata !"width", metadata !909, i32 100663443, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!1160 = metadata !{i32 786689, metadata !1149, metadata !"height", metadata !909, i32 117440659, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!1161 = metadata !{i32 786689, metadata !1149, metadata !"kind", metadata !909, i32 134217876, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!1162 = metadata !{i32 786689, metadata !1149, metadata !"stream", metadata !909, i32 150995092, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!1163 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !909, i32 152, metadata !1164, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cud
!1164 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1165, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1165 = metadata !{metadata !912, metadata !1166}
!1166 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1167} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1167 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1168} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!1168 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !898, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !1169, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0]
!1169 = metadata !{metadata !1170, metadata !1172, metadata !1178, metadata !1179, metadata !1180, metadata !1181, metadata !1182, metadata !1183}
!1170 = metadata !{i32 786445, metadata !1168, metadata !"srcArray", metadata !898, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !1171} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!1171 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !898, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !928} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!1172 = metadata !{i32 786445, metadata !1168, metadata !"srcPos", metadata !898, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !1173} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!1173 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !898, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !1174, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!1174 = metadata !{metadata !1175, metadata !1176, metadata !1177}
!1175 = metadata !{i32 786445, metadata !1173, metadata !"x", metadata !898, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !925} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!1176 = metadata !{i32 786445, metadata !1173, metadata !"y", metadata !898, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !925} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!1177 = metadata !{i32 786445, metadata !1173, metadata !"z", metadata !898, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !925} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!1178 = metadata !{i32 786445, metadata !1168, metadata !"srcPtr", metadata !898, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !1014} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!1179 = metadata !{i32 786445, metadata !1168, metadata !"dstArray", metadata !898, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !1171} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!1180 = metadata !{i32 786445, metadata !1168, metadata !"dstPos", metadata !898, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !1173} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!1181 = metadata !{i32 786445, metadata !1168, metadata !"dstPtr", metadata !898, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !1014} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!1182 = metadata !{i32 786445, metadata !1168, metadata !"extent", metadata !898, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !922} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!1183 = metadata !{i32 786445, metadata !1168, metadata !"kind", metadata !898, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !905} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!1184 = metadata !{metadata !1185}
!1185 = metadata !{metadata !1186}
!1186 = metadata !{i32 786689, metadata !1163, metadata !"p", metadata !909, i32 16777368, metadata !1166, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!1187 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !909, i32 156, metadata !1188, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPar
!1188 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1189, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1189 = metadata !{metadata !912, metadata !1166, metadata !1096}
!1190 = metadata !{metadata !1191}
!1191 = metadata !{metadata !1192, metadata !1193}
!1192 = metadata !{i32 786689, metadata !1187, metadata !"p", metadata !909, i32 16777372, metadata !1166, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!1193 = metadata !{i32 786689, metadata !1187, metadata !"stream", metadata !909, i32 33554588, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!1194 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !909, i32 160, metadata !1195, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerP
!1195 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1196, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1196 = metadata !{metadata !912, metadata !1197}
!1197 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1198} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1198 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1199} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!1199 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !898, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !1200, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, o
!1200 = metadata !{metadata !1201, metadata !1202, metadata !1203, metadata !1204, metadata !1205, metadata !1206, metadata !1207, metadata !1208, metadata !1209}
!1201 = metadata !{i32 786445, metadata !1199, metadata !"srcArray", metadata !898, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !1171} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!1202 = metadata !{i32 786445, metadata !1199, metadata !"srcPos", metadata !898, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !1173} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!1203 = metadata !{i32 786445, metadata !1199, metadata !"srcPtr", metadata !898, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !1014} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!1204 = metadata !{i32 786445, metadata !1199, metadata !"srcDevice", metadata !898, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !108} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!1205 = metadata !{i32 786445, metadata !1199, metadata !"dstArray", metadata !898, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !1171} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!1206 = metadata !{i32 786445, metadata !1199, metadata !"dstPos", metadata !898, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !1173} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!1207 = metadata !{i32 786445, metadata !1199, metadata !"dstPtr", metadata !898, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !1014} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!1208 = metadata !{i32 786445, metadata !1199, metadata !"dstDevice", metadata !898, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !108} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!1209 = metadata !{i32 786445, metadata !1199, metadata !"extent", metadata !898, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !922} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!1210 = metadata !{metadata !1211}
!1211 = metadata !{metadata !1212}
!1212 = metadata !{i32 786689, metadata !1194, metadata !"p", metadata !909, i32 16777376, metadata !1197, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!1213 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !909, i32 164, metadata !1214, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMem
!1214 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1215, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1215 = metadata !{metadata !912, metadata !1197, metadata !1096}
!1216 = metadata !{metadata !1217}
!1217 = metadata !{metadata !1218, metadata !1219}
!1218 = metadata !{i32 786689, metadata !1213, metadata !"p", metadata !909, i32 16777380, metadata !1197, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!1219 = metadata !{i32 786689, metadata !1213, metadata !"stream", metadata !909, i32 33554596, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!1220 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !909, i32 168, metadata !1221, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaA
!1221 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1222, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1222 = metadata !{metadata !912, metadata !928, metadata !925, metadata !925, metadata !928, metadata !925, metadata !925, metadata !925, metadata !905}
!1223 = metadata !{metadata !1224}
!1224 = metadata !{metadata !1225, metadata !1226, metadata !1227, metadata !1228, metadata !1229, metadata !1230, metadata !1231, metadata !1232}
!1225 = metadata !{i32 786689, metadata !1220, metadata !"dst", metadata !909, i32 16777384, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!1226 = metadata !{i32 786689, metadata !1220, metadata !"wOffsetDst", metadata !909, i32 33554600, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!1227 = metadata !{i32 786689, metadata !1220, metadata !"hOffsetDst", metadata !909, i32 50331816, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!1228 = metadata !{i32 786689, metadata !1220, metadata !"src", metadata !909, i32 67109033, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!1229 = metadata !{i32 786689, metadata !1220, metadata !"wOffsetSrc", metadata !909, i32 83886249, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!1230 = metadata !{i32 786689, metadata !1220, metadata !"hOffsetSrc", metadata !909, i32 100663465, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!1231 = metadata !{i32 786689, metadata !1220, metadata !"count", metadata !909, i32 117440682, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!1232 = metadata !{i32 786689, metadata !1220, metadata !"kind", metadata !909, i32 134217898, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!1233 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !909, i32 174, metadata !1234, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct
!1234 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1235, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1235 = metadata !{metadata !912, metadata !145, metadata !596, metadata !925, metadata !905, metadata !1096}
!1236 = metadata !{metadata !1237}
!1237 = metadata !{metadata !1238, metadata !1239, metadata !1240, metadata !1241, metadata !1242}
!1238 = metadata !{i32 786689, metadata !1233, metadata !"dst", metadata !909, i32 16777390, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!1239 = metadata !{i32 786689, metadata !1233, metadata !"src", metadata !909, i32 33554606, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!1240 = metadata !{i32 786689, metadata !1233, metadata !"count", metadata !909, i32 50331822, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!1241 = metadata !{i32 786689, metadata !1233, metadata !"kind", metadata !909, i32 67109039, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!1242 = metadata !{i32 786689, metadata !1233, metadata !"stream", metadata !909, i32 83886255, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!1243 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !909, i32 179, metadata !1244, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaAr
!1244 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1245, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1245 = metadata !{metadata !912, metadata !145, metadata !928, metadata !925, metadata !925, metadata !925, metadata !905}
!1246 = metadata !{metadata !1247}
!1247 = metadata !{metadata !1248, metadata !1249, metadata !1250, metadata !1251, metadata !1252, metadata !1253}
!1248 = metadata !{i32 786689, metadata !1243, metadata !"dst", metadata !909, i32 16777395, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!1249 = metadata !{i32 786689, metadata !1243, metadata !"src", metadata !909, i32 33554611, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!1250 = metadata !{i32 786689, metadata !1243, metadata !"wOffset", metadata !909, i32 50331827, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!1251 = metadata !{i32 786689, metadata !1243, metadata !"hOffset", metadata !909, i32 67109044, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!1252 = metadata !{i32 786689, metadata !1243, metadata !"count", metadata !909, i32 83886260, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!1253 = metadata !{i32 786689, metadata !1243, metadata !"kind", metadata !909, i32 100663476, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!1254 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !909, i32 184, metadata !1255, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %str
!1255 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1256, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1256 = metadata !{metadata !912, metadata !145, metadata !928, metadata !925, metadata !925, metadata !925, metadata !905, metadata !1096}
!1257 = metadata !{metadata !1258}
!1258 = metadata !{metadata !1259, metadata !1260, metadata !1261, metadata !1262, metadata !1263, metadata !1264, metadata !1265}
!1259 = metadata !{i32 786689, metadata !1254, metadata !"dst", metadata !909, i32 16777400, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!1260 = metadata !{i32 786689, metadata !1254, metadata !"src", metadata !909, i32 33554616, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!1261 = metadata !{i32 786689, metadata !1254, metadata !"wOffset", metadata !909, i32 50331832, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!1262 = metadata !{i32 786689, metadata !1254, metadata !"hOffset", metadata !909, i32 67109049, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!1263 = metadata !{i32 786689, metadata !1254, metadata !"count", metadata !909, i32 83886265, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!1264 = metadata !{i32 786689, metadata !1254, metadata !"kind", metadata !909, i32 100663481, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!1265 = metadata !{i32 786689, metadata !1254, metadata !"stream", metadata !909, i32 117440698, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!1266 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !909, i32 190, metadata !1267, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i6
!1267 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1268, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1268 = metadata !{metadata !912, metadata !145, metadata !859, metadata !925, metadata !925, metadata !905}
!1269 = metadata !{metadata !1270}
!1270 = metadata !{metadata !1271, metadata !1272, metadata !1273, metadata !1274, metadata !1275}
!1271 = metadata !{i32 786689, metadata !1266, metadata !"dst", metadata !909, i32 16777406, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!1272 = metadata !{i32 786689, metadata !1266, metadata !"symbol", metadata !909, i32 33554622, metadata !859, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!1273 = metadata !{i32 786689, metadata !1266, metadata !"count", metadata !909, i32 50331838, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!1274 = metadata !{i32 786689, metadata !1266, metadata !"offset", metadata !909, i32 67109055, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!1275 = metadata !{i32 786689, metadata !1266, metadata !"kind", metadata !909, i32 83886271, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!1276 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !909, i32 195, metadata !1277, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8
!1277 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1278, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1278 = metadata !{metadata !912, metadata !145, metadata !859, metadata !925, metadata !925, metadata !905, metadata !1096}
!1279 = metadata !{metadata !1280}
!1280 = metadata !{metadata !1281, metadata !1282, metadata !1283, metadata !1284, metadata !1285, metadata !1286}
!1281 = metadata !{i32 786689, metadata !1276, metadata !"dst", metadata !909, i32 16777411, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!1282 = metadata !{i32 786689, metadata !1276, metadata !"symbol", metadata !909, i32 33554627, metadata !859, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!1283 = metadata !{i32 786689, metadata !1276, metadata !"count", metadata !909, i32 50331843, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!1284 = metadata !{i32 786689, metadata !1276, metadata !"offset", metadata !909, i32 67109060, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!1285 = metadata !{i32 786689, metadata !1276, metadata !"kind", metadata !909, i32 83886276, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!1286 = metadata !{i32 786689, metadata !1276, metadata !"stream", metadata !909, i32 100663493, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!1287 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !909, i32 201, metadata !1288, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cu
!1288 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1289, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1289 = metadata !{metadata !912, metadata !145, metadata !108, metadata !596, metadata !108, metadata !925}
!1290 = metadata !{metadata !1291}
!1291 = metadata !{metadata !1292, metadata !1293, metadata !1294, metadata !1295, metadata !1296}
!1292 = metadata !{i32 786689, metadata !1287, metadata !"dst", metadata !909, i32 16777417, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!1293 = metadata !{i32 786689, metadata !1287, metadata !"dstDevice", metadata !909, i32 33554633, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!1294 = metadata !{i32 786689, metadata !1287, metadata !"src", metadata !909, i32 50331849, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!1295 = metadata !{i32 786689, metadata !1287, metadata !"srcDevice", metadata !909, i32 67109065, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!1296 = metadata !{i32 786689, metadata !1287, metadata !"count", metadata !909, i32 83886281, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!1297 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !909, i32 206, metadata !1298, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32,
!1298 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1299, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1299 = metadata !{metadata !912, metadata !145, metadata !108, metadata !596, metadata !108, metadata !925, metadata !1096}
!1300 = metadata !{metadata !1301}
!1301 = metadata !{metadata !1302, metadata !1303, metadata !1304, metadata !1305, metadata !1306, metadata !1307}
!1302 = metadata !{i32 786689, metadata !1297, metadata !"dst", metadata !909, i32 16777422, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!1303 = metadata !{i32 786689, metadata !1297, metadata !"dstDevice", metadata !909, i32 33554638, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!1304 = metadata !{i32 786689, metadata !1297, metadata !"src", metadata !909, i32 50331854, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!1305 = metadata !{i32 786689, metadata !1297, metadata !"srcDevice", metadata !909, i32 67109070, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!1306 = metadata !{i32 786689, metadata !1297, metadata !"count", metadata !909, i32 83886287, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!1307 = metadata !{i32 786689, metadata !1297, metadata !"stream", metadata !909, i32 100663503, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!1308 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !909, i32 212, metadata !1309, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64
!1309 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1310, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1310 = metadata !{metadata !912, metadata !928, metadata !925, metadata !925, metadata !596, metadata !925, metadata !905}
!1311 = metadata !{metadata !1312}
!1312 = metadata !{metadata !1313, metadata !1314, metadata !1315, metadata !1316, metadata !1317, metadata !1318}
!1313 = metadata !{i32 786689, metadata !1308, metadata !"dst", metadata !909, i32 16777428, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!1314 = metadata !{i32 786689, metadata !1308, metadata !"wOffset", metadata !909, i32 33554644, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!1315 = metadata !{i32 786689, metadata !1308, metadata !"hOffset", metadata !909, i32 50331860, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!1316 = metadata !{i32 786689, metadata !1308, metadata !"src", metadata !909, i32 67109077, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!1317 = metadata !{i32 786689, metadata !1308, metadata !"count", metadata !909, i32 83886293, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!1318 = metadata !{i32 786689, metadata !1308, metadata !"kind", metadata !909, i32 100663509, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!1319 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !909, i32 217, metadata !1320, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaA
!1320 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1321, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1321 = metadata !{metadata !912, metadata !928, metadata !925, metadata !925, metadata !596, metadata !925, metadata !905, metadata !1096}
!1322 = metadata !{metadata !1323}
!1323 = metadata !{metadata !1324, metadata !1325, metadata !1326, metadata !1327, metadata !1328, metadata !1329, metadata !1330}
!1324 = metadata !{i32 786689, metadata !1319, metadata !"dst", metadata !909, i32 16777433, metadata !928, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!1325 = metadata !{i32 786689, metadata !1319, metadata !"wOffset", metadata !909, i32 33554649, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!1326 = metadata !{i32 786689, metadata !1319, metadata !"hOffset", metadata !909, i32 50331865, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!1327 = metadata !{i32 786689, metadata !1319, metadata !"src", metadata !909, i32 67109082, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!1328 = metadata !{i32 786689, metadata !1319, metadata !"count", metadata !909, i32 83886298, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!1329 = metadata !{i32 786689, metadata !1319, metadata !"kind", metadata !909, i32 100663514, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!1330 = metadata !{i32 786689, metadata !1319, metadata !"stream", metadata !909, i32 117440731, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!1331 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !909, i32 223, metadata !1332, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i
!1332 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1333, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1333 = metadata !{metadata !912, metadata !110, metadata !596, metadata !925, metadata !925, metadata !905}
!1334 = metadata !{metadata !1335}
!1335 = metadata !{metadata !1336, metadata !1337, metadata !1338, metadata !1339, metadata !1340}
!1336 = metadata !{i32 786689, metadata !1331, metadata !"symbol", metadata !909, i32 16777439, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!1337 = metadata !{i32 786689, metadata !1331, metadata !"src", metadata !909, i32 33554655, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!1338 = metadata !{i32 786689, metadata !1331, metadata !"count", metadata !909, i32 50331871, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!1339 = metadata !{i32 786689, metadata !1331, metadata !"offset", metadata !909, i32 67109088, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!1340 = metadata !{i32 786689, metadata !1331, metadata !"kind", metadata !909, i32 83886304, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!1341 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !909, i32 229, metadata !1342, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i
!1342 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1343, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1343 = metadata !{metadata !912, metadata !859, metadata !596, metadata !925, metadata !925, metadata !905, metadata !1096}
!1344 = metadata !{metadata !1345}
!1345 = metadata !{metadata !1346, metadata !1347, metadata !1348, metadata !1349, metadata !1350, metadata !1351}
!1346 = metadata !{i32 786689, metadata !1341, metadata !"symbol", metadata !909, i32 16777445, metadata !859, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!1347 = metadata !{i32 786689, metadata !1341, metadata !"src", metadata !909, i32 33554661, metadata !596, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!1348 = metadata !{i32 786689, metadata !1341, metadata !"count", metadata !909, i32 50331877, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!1349 = metadata !{i32 786689, metadata !1341, metadata !"offset", metadata !909, i32 67109093, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!1350 = metadata !{i32 786689, metadata !1341, metadata !"kind", metadata !909, i32 83886310, metadata !905, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!1351 = metadata !{i32 786689, metadata !1341, metadata !"stream", metadata !909, i32 100663526, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!1352 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !909, i32 234, metadata !1353, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo,
!1353 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1354, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1354 = metadata !{metadata !912, metadata !963, metadata !963}
!1355 = metadata !{metadata !1356}
!1356 = metadata !{metadata !1357, metadata !1358}
!1357 = metadata !{i32 786689, metadata !1352, metadata !"free", metadata !909, i32 16777450, metadata !963, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!1358 = metadata !{i32 786689, metadata !1352, metadata !"total", metadata !909, i32 33554666, metadata !963, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!1359 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !909, i32 238, metadata !1360, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, nu
!1360 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1361, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1361 = metadata !{metadata !912, metadata !145, metadata !108, metadata !925}
!1362 = metadata !{metadata !1363}
!1363 = metadata !{metadata !1364, metadata !1365, metadata !1366}
!1364 = metadata !{i32 786689, metadata !1359, metadata !"devPtr", metadata !909, i32 16777454, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!1365 = metadata !{i32 786689, metadata !1359, metadata !"value", metadata !909, i32 33554670, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!1366 = metadata !{i32 786689, metadata !1359, metadata !"count", metadata !909, i32 50331886, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!1367 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !909, i32 243, metadata !1368, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMe
!1368 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1369, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1369 = metadata !{metadata !912, metadata !145, metadata !925, metadata !108, metadata !925, metadata !925}
!1370 = metadata !{metadata !1371}
!1371 = metadata !{metadata !1372, metadata !1373, metadata !1374, metadata !1375, metadata !1376}
!1372 = metadata !{i32 786689, metadata !1367, metadata !"devPtr", metadata !909, i32 16777459, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!1373 = metadata !{i32 786689, metadata !1367, metadata !"pitch", metadata !909, i32 33554675, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!1374 = metadata !{i32 786689, metadata !1367, metadata !"value", metadata !909, i32 50331891, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!1375 = metadata !{i32 786689, metadata !1367, metadata !"width", metadata !909, i32 67109108, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!1376 = metadata !{i32 786689, metadata !1367, metadata !"height", metadata !909, i32 83886324, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!1377 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !909, i32 248, metadata !1378, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64
!1378 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1379, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1379 = metadata !{metadata !912, metadata !145, metadata !925, metadata !108, metadata !925, metadata !925, metadata !1096}
!1380 = metadata !{metadata !1381}
!1381 = metadata !{metadata !1382, metadata !1383, metadata !1384, metadata !1385, metadata !1386, metadata !1387}
!1382 = metadata !{i32 786689, metadata !1377, metadata !"devPtr", metadata !909, i32 16777464, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!1383 = metadata !{i32 786689, metadata !1377, metadata !"pitch", metadata !909, i32 33554680, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!1384 = metadata !{i32 786689, metadata !1377, metadata !"value", metadata !909, i32 50331896, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!1385 = metadata !{i32 786689, metadata !1377, metadata !"width", metadata !909, i32 67109113, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!1386 = metadata !{i32 786689, metadata !1377, metadata !"height", metadata !909, i32 83886329, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!1387 = metadata !{i32 786689, metadata !1377, metadata !"stream", metadata !909, i32 100663545, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!1388 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !909, i32 253, metadata !1389, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %st
!1389 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1390, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1390 = metadata !{metadata !912, metadata !1014, metadata !108, metadata !922}
!1391 = metadata !{metadata !1392}
!1392 = metadata !{metadata !1393, metadata !1394, metadata !1395}
!1393 = metadata !{i32 786689, metadata !1388, metadata !"pitchedDevPtr", metadata !909, i32 16777469, metadata !1014, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!1394 = metadata !{i32 786689, metadata !1388, metadata !"value", metadata !909, i32 33554685, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!1395 = metadata !{i32 786689, metadata !1388, metadata !"extent", metadata !909, i32 50331902, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!1396 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !909, i32 258, metadata !1397, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*
!1397 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1398, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1398 = metadata !{metadata !912, metadata !1014, metadata !108, metadata !922, metadata !1096}
!1399 = metadata !{metadata !1400}
!1400 = metadata !{metadata !1401, metadata !1402, metadata !1403, metadata !1404}
!1401 = metadata !{i32 786689, metadata !1396, metadata !"pitchedDevPtr", metadata !909, i32 16777474, metadata !1014, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!1402 = metadata !{i32 786689, metadata !1396, metadata !"value", metadata !909, i32 33554690, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!1403 = metadata !{i32 786689, metadata !1396, metadata !"extent", metadata !909, i32 50331907, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!1404 = metadata !{i32 786689, metadata !1396, metadata !"stream", metadata !909, i32 67109123, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!1405 = metadata !{i32 786478, i32 0, metadata !909, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !909, i32 263, metadata !1406, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUst
!1406 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1407, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1407 = metadata !{metadata !912, metadata !145, metadata !108, metadata !925, metadata !1096}
!1408 = metadata !{metadata !1409}
!1409 = metadata !{metadata !1410, metadata !1411, metadata !1412, metadata !1413}
!1410 = metadata !{i32 786689, metadata !1405, metadata !"devPtr", metadata !909, i32 16777479, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!1411 = metadata !{i32 786689, metadata !1405, metadata !"value", metadata !909, i32 33554695, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!1412 = metadata !{i32 786689, metadata !1405, metadata !"count", metadata !909, i32 50331911, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!1413 = metadata !{i32 786689, metadata !1405, metadata !"stream", metadata !909, i32 67109127, metadata !1096, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!1414 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 t
!1415 = metadata !{metadata !1416}
!1416 = metadata !{metadata !897, metadata !1417, metadata !1423}
!1417 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !898, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !1418, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!1418 = metadata !{metadata !1419, metadata !1420, metadata !1421, metadata !1422}
!1419 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!1420 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!1421 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!1422 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!1423 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !898, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !1424, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!1424 = metadata !{metadata !1425, metadata !1426, metadata !1427, metadata !1428, metadata !1429}
!1425 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!1426 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!1427 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!1428 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!1429 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!1430 = metadata !{metadata !1431}
!1431 = metadata !{metadata !1432, metadata !1500, metadata !1507, metadata !1514, metadata !1521, metadata !1529, metadata !1532, metadata !1538, metadata !1545, metadata !1546, metadata !1552, metadata !1556, metadata !1564, metadata !1570, metadata !1
!1432 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaChooseDevice", metadata !"cudaChooseDevice", metadata !"", metadata !1433, i32 14, metadata !1434, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, %struct.cudaDevice
!1433 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!1434 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1435, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1435 = metadata !{metadata !1436, metadata !721, metadata !1437}
!1436 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !1433, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !897} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!1437 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1438} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1438 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1439} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaDeviceProp]
!1439 = metadata !{i32 786451, null, metadata !"cudaDeviceProp", metadata !898, i32 1145, i64 4800, i64 64, i32 0, i32 0, null, metadata !1440, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaDeviceProp] [line 1145, size 4800, align 64, offset 0] [
!1440 = metadata !{metadata !1441, metadata !1442, metadata !1443, metadata !1444, metadata !1445, metadata !1446, metadata !1447, metadata !1448, metadata !1449, metadata !1450, metadata !1451, metadata !1452, metadata !1453, metadata !1454, metadata !1
!1441 = metadata !{i32 786445, metadata !1439, metadata !"name", metadata !898, i32 1147, i64 2048, i64 8, i64 0, i32 0, metadata !188} ; [ DW_TAG_member ] [name] [line 1147, size 2048, align 8, offset 0] [from ]
!1442 = metadata !{i32 786445, metadata !1439, metadata !"totalGlobalMem", metadata !898, i32 1148, i64 64, i64 64, i64 2048, i32 0, metadata !925} ; [ DW_TAG_member ] [totalGlobalMem] [line 1148, size 64, align 64, offset 2048] [from size_t]
!1443 = metadata !{i32 786445, metadata !1439, metadata !"sharedMemPerBlock", metadata !898, i32 1149, i64 64, i64 64, i64 2112, i32 0, metadata !925} ; [ DW_TAG_member ] [sharedMemPerBlock] [line 1149, size 64, align 64, offset 2112] [from size_t]
!1444 = metadata !{i32 786445, metadata !1439, metadata !"regsPerBlock", metadata !898, i32 1150, i64 32, i64 32, i64 2176, i32 0, metadata !108} ; [ DW_TAG_member ] [regsPerBlock] [line 1150, size 32, align 32, offset 2176] [from int]
!1445 = metadata !{i32 786445, metadata !1439, metadata !"warpSize", metadata !898, i32 1151, i64 32, i64 32, i64 2208, i32 0, metadata !108} ; [ DW_TAG_member ] [warpSize] [line 1151, size 32, align 32, offset 2208] [from int]
!1446 = metadata !{i32 786445, metadata !1439, metadata !"memPitch", metadata !898, i32 1152, i64 64, i64 64, i64 2240, i32 0, metadata !925} ; [ DW_TAG_member ] [memPitch] [line 1152, size 64, align 64, offset 2240] [from size_t]
!1447 = metadata !{i32 786445, metadata !1439, metadata !"maxThreadsPerBlock", metadata !898, i32 1153, i64 32, i64 32, i64 2304, i32 0, metadata !108} ; [ DW_TAG_member ] [maxThreadsPerBlock] [line 1153, size 32, align 32, offset 2304] [from int]
!1448 = metadata !{i32 786445, metadata !1439, metadata !"maxThreadsDim", metadata !898, i32 1154, i64 96, i64 32, i64 2336, i32 0, metadata !167} ; [ DW_TAG_member ] [maxThreadsDim] [line 1154, size 96, align 32, offset 2336] [from ]
!1449 = metadata !{i32 786445, metadata !1439, metadata !"maxGridSize", metadata !898, i32 1155, i64 96, i64 32, i64 2432, i32 0, metadata !167} ; [ DW_TAG_member ] [maxGridSize] [line 1155, size 96, align 32, offset 2432] [from ]
!1450 = metadata !{i32 786445, metadata !1439, metadata !"clockRate", metadata !898, i32 1156, i64 32, i64 32, i64 2528, i32 0, metadata !108} ; [ DW_TAG_member ] [clockRate] [line 1156, size 32, align 32, offset 2528] [from int]
!1451 = metadata !{i32 786445, metadata !1439, metadata !"totalConstMem", metadata !898, i32 1157, i64 64, i64 64, i64 2560, i32 0, metadata !925} ; [ DW_TAG_member ] [totalConstMem] [line 1157, size 64, align 64, offset 2560] [from size_t]
!1452 = metadata !{i32 786445, metadata !1439, metadata !"major", metadata !898, i32 1158, i64 32, i64 32, i64 2624, i32 0, metadata !108} ; [ DW_TAG_member ] [major] [line 1158, size 32, align 32, offset 2624] [from int]
!1453 = metadata !{i32 786445, metadata !1439, metadata !"minor", metadata !898, i32 1159, i64 32, i64 32, i64 2656, i32 0, metadata !108} ; [ DW_TAG_member ] [minor] [line 1159, size 32, align 32, offset 2656] [from int]
!1454 = metadata !{i32 786445, metadata !1439, metadata !"textureAlignment", metadata !898, i32 1160, i64 64, i64 64, i64 2688, i32 0, metadata !925} ; [ DW_TAG_member ] [textureAlignment] [line 1160, size 64, align 64, offset 2688] [from size_t]
!1455 = metadata !{i32 786445, metadata !1439, metadata !"texturePitchAlignment", metadata !898, i32 1161, i64 64, i64 64, i64 2752, i32 0, metadata !925} ; [ DW_TAG_member ] [texturePitchAlignment] [line 1161, size 64, align 64, offset 2752] [from size_
!1456 = metadata !{i32 786445, metadata !1439, metadata !"deviceOverlap", metadata !898, i32 1162, i64 32, i64 32, i64 2816, i32 0, metadata !108} ; [ DW_TAG_member ] [deviceOverlap] [line 1162, size 32, align 32, offset 2816] [from int]
!1457 = metadata !{i32 786445, metadata !1439, metadata !"multiProcessorCount", metadata !898, i32 1163, i64 32, i64 32, i64 2848, i32 0, metadata !108} ; [ DW_TAG_member ] [multiProcessorCount] [line 1163, size 32, align 32, offset 2848] [from int]
!1458 = metadata !{i32 786445, metadata !1439, metadata !"kernelExecTimeoutEnabled", metadata !898, i32 1164, i64 32, i64 32, i64 2880, i32 0, metadata !108} ; [ DW_TAG_member ] [kernelExecTimeoutEnabled] [line 1164, size 32, align 32, offset 2880] [from
!1459 = metadata !{i32 786445, metadata !1439, metadata !"integrated", metadata !898, i32 1165, i64 32, i64 32, i64 2912, i32 0, metadata !108} ; [ DW_TAG_member ] [integrated] [line 1165, size 32, align 32, offset 2912] [from int]
!1460 = metadata !{i32 786445, metadata !1439, metadata !"canMapHostMemory", metadata !898, i32 1166, i64 32, i64 32, i64 2944, i32 0, metadata !108} ; [ DW_TAG_member ] [canMapHostMemory] [line 1166, size 32, align 32, offset 2944] [from int]
!1461 = metadata !{i32 786445, metadata !1439, metadata !"computeMode", metadata !898, i32 1167, i64 32, i64 32, i64 2976, i32 0, metadata !108} ; [ DW_TAG_member ] [computeMode] [line 1167, size 32, align 32, offset 2976] [from int]
!1462 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture1D", metadata !898, i32 1168, i64 32, i64 32, i64 3008, i32 0, metadata !108} ; [ DW_TAG_member ] [maxTexture1D] [line 1168, size 32, align 32, offset 3008] [from int]
!1463 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture1DMipmap", metadata !898, i32 1169, i64 32, i64 32, i64 3040, i32 0, metadata !108} ; [ DW_TAG_member ] [maxTexture1DMipmap] [line 1169, size 32, align 32, offset 3040] [from int]
!1464 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture1DLinear", metadata !898, i32 1170, i64 32, i64 32, i64 3072, i32 0, metadata !108} ; [ DW_TAG_member ] [maxTexture1DLinear] [line 1170, size 32, align 32, offset 3072] [from int]
!1465 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture2D", metadata !898, i32 1171, i64 64, i64 32, i64 3104, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTexture2D] [line 1171, size 64, align 32, offset 3104] [from ]
!1466 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture2DMipmap", metadata !898, i32 1172, i64 64, i64 32, i64 3168, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTexture2DMipmap] [line 1172, size 64, align 32, offset 3168] [from ]
!1467 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture2DLinear", metadata !898, i32 1173, i64 96, i64 32, i64 3232, i32 0, metadata !167} ; [ DW_TAG_member ] [maxTexture2DLinear] [line 1173, size 96, align 32, offset 3232] [from ]
!1468 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture2DGather", metadata !898, i32 1174, i64 64, i64 32, i64 3328, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTexture2DGather] [line 1174, size 64, align 32, offset 3328] [from ]
!1469 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture3D", metadata !898, i32 1175, i64 96, i64 32, i64 3392, i32 0, metadata !167} ; [ DW_TAG_member ] [maxTexture3D] [line 1175, size 96, align 32, offset 3392] [from ]
!1470 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture3DAlt", metadata !898, i32 1176, i64 96, i64 32, i64 3488, i32 0, metadata !167} ; [ DW_TAG_member ] [maxTexture3DAlt] [line 1176, size 96, align 32, offset 3488] [from ]
!1471 = metadata !{i32 786445, metadata !1439, metadata !"maxTextureCubemap", metadata !898, i32 1177, i64 32, i64 32, i64 3584, i32 0, metadata !108} ; [ DW_TAG_member ] [maxTextureCubemap] [line 1177, size 32, align 32, offset 3584] [from int]
!1472 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture1DLayered", metadata !898, i32 1178, i64 64, i64 32, i64 3616, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTexture1DLayered] [line 1178, size 64, align 32, offset 3616] [from ]
!1473 = metadata !{i32 786445, metadata !1439, metadata !"maxTexture2DLayered", metadata !898, i32 1179, i64 96, i64 32, i64 3680, i32 0, metadata !167} ; [ DW_TAG_member ] [maxTexture2DLayered] [line 1179, size 96, align 32, offset 3680] [from ]
!1474 = metadata !{i32 786445, metadata !1439, metadata !"maxTextureCubemapLayered", metadata !898, i32 1180, i64 64, i64 32, i64 3776, i32 0, metadata !215} ; [ DW_TAG_member ] [maxTextureCubemapLayered] [line 1180, size 64, align 32, offset 3776] [from
!1475 = metadata !{i32 786445, metadata !1439, metadata !"maxSurface1D", metadata !898, i32 1181, i64 32, i64 32, i64 3840, i32 0, metadata !108} ; [ DW_TAG_member ] [maxSurface1D] [line 1181, size 32, align 32, offset 3840] [from int]
!1476 = metadata !{i32 786445, metadata !1439, metadata !"maxSurface2D", metadata !898, i32 1182, i64 64, i64 32, i64 3872, i32 0, metadata !215} ; [ DW_TAG_member ] [maxSurface2D] [line 1182, size 64, align 32, offset 3872] [from ]
!1477 = metadata !{i32 786445, metadata !1439, metadata !"maxSurface3D", metadata !898, i32 1183, i64 96, i64 32, i64 3936, i32 0, metadata !167} ; [ DW_TAG_member ] [maxSurface3D] [line 1183, size 96, align 32, offset 3936] [from ]
!1478 = metadata !{i32 786445, metadata !1439, metadata !"maxSurface1DLayered", metadata !898, i32 1184, i64 64, i64 32, i64 4032, i32 0, metadata !215} ; [ DW_TAG_member ] [maxSurface1DLayered] [line 1184, size 64, align 32, offset 4032] [from ]
!1479 = metadata !{i32 786445, metadata !1439, metadata !"maxSurface2DLayered", metadata !898, i32 1185, i64 96, i64 32, i64 4096, i32 0, metadata !167} ; [ DW_TAG_member ] [maxSurface2DLayered] [line 1185, size 96, align 32, offset 4096] [from ]
!1480 = metadata !{i32 786445, metadata !1439, metadata !"maxSurfaceCubemap", metadata !898, i32 1186, i64 32, i64 32, i64 4192, i32 0, metadata !108} ; [ DW_TAG_member ] [maxSurfaceCubemap] [line 1186, size 32, align 32, offset 4192] [from int]
!1481 = metadata !{i32 786445, metadata !1439, metadata !"maxSurfaceCubemapLayered", metadata !898, i32 1187, i64 64, i64 32, i64 4224, i32 0, metadata !215} ; [ DW_TAG_member ] [maxSurfaceCubemapLayered] [line 1187, size 64, align 32, offset 4224] [from
!1482 = metadata !{i32 786445, metadata !1439, metadata !"surfaceAlignment", metadata !898, i32 1188, i64 64, i64 64, i64 4288, i32 0, metadata !925} ; [ DW_TAG_member ] [surfaceAlignment] [line 1188, size 64, align 64, offset 4288] [from size_t]
!1483 = metadata !{i32 786445, metadata !1439, metadata !"concurrentKernels", metadata !898, i32 1189, i64 32, i64 32, i64 4352, i32 0, metadata !108} ; [ DW_TAG_member ] [concurrentKernels] [line 1189, size 32, align 32, offset 4352] [from int]
!1484 = metadata !{i32 786445, metadata !1439, metadata !"ECCEnabled", metadata !898, i32 1190, i64 32, i64 32, i64 4384, i32 0, metadata !108} ; [ DW_TAG_member ] [ECCEnabled] [line 1190, size 32, align 32, offset 4384] [from int]
!1485 = metadata !{i32 786445, metadata !1439, metadata !"pciBusID", metadata !898, i32 1191, i64 32, i64 32, i64 4416, i32 0, metadata !108} ; [ DW_TAG_member ] [pciBusID] [line 1191, size 32, align 32, offset 4416] [from int]
!1486 = metadata !{i32 786445, metadata !1439, metadata !"pciDeviceID", metadata !898, i32 1192, i64 32, i64 32, i64 4448, i32 0, metadata !108} ; [ DW_TAG_member ] [pciDeviceID] [line 1192, size 32, align 32, offset 4448] [from int]
!1487 = metadata !{i32 786445, metadata !1439, metadata !"pciDomainID", metadata !898, i32 1193, i64 32, i64 32, i64 4480, i32 0, metadata !108} ; [ DW_TAG_member ] [pciDomainID] [line 1193, size 32, align 32, offset 4480] [from int]
!1488 = metadata !{i32 786445, metadata !1439, metadata !"tccDriver", metadata !898, i32 1194, i64 32, i64 32, i64 4512, i32 0, metadata !108} ; [ DW_TAG_member ] [tccDriver] [line 1194, size 32, align 32, offset 4512] [from int]
!1489 = metadata !{i32 786445, metadata !1439, metadata !"asyncEngineCount", metadata !898, i32 1195, i64 32, i64 32, i64 4544, i32 0, metadata !108} ; [ DW_TAG_member ] [asyncEngineCount] [line 1195, size 32, align 32, offset 4544] [from int]
!1490 = metadata !{i32 786445, metadata !1439, metadata !"unifiedAddressing", metadata !898, i32 1196, i64 32, i64 32, i64 4576, i32 0, metadata !108} ; [ DW_TAG_member ] [unifiedAddressing] [line 1196, size 32, align 32, offset 4576] [from int]
!1491 = metadata !{i32 786445, metadata !1439, metadata !"memoryClockRate", metadata !898, i32 1197, i64 32, i64 32, i64 4608, i32 0, metadata !108} ; [ DW_TAG_member ] [memoryClockRate] [line 1197, size 32, align 32, offset 4608] [from int]
!1492 = metadata !{i32 786445, metadata !1439, metadata !"memoryBusWidth", metadata !898, i32 1198, i64 32, i64 32, i64 4640, i32 0, metadata !108} ; [ DW_TAG_member ] [memoryBusWidth] [line 1198, size 32, align 32, offset 4640] [from int]
!1493 = metadata !{i32 786445, metadata !1439, metadata !"l2CacheSize", metadata !898, i32 1199, i64 32, i64 32, i64 4672, i32 0, metadata !108} ; [ DW_TAG_member ] [l2CacheSize] [line 1199, size 32, align 32, offset 4672] [from int]
!1494 = metadata !{i32 786445, metadata !1439, metadata !"maxThreadsPerMultiProcessor", metadata !898, i32 1200, i64 32, i64 32, i64 4704, i32 0, metadata !108} ; [ DW_TAG_member ] [maxThreadsPerMultiProcessor] [line 1200, size 32, align 32, offset 4704]
!1495 = metadata !{i32 786445, metadata !1439, metadata !"streamPrioritiesSupported", metadata !898, i32 1201, i64 32, i64 32, i64 4736, i32 0, metadata !108} ; [ DW_TAG_member ] [streamPrioritiesSupported] [line 1201, size 32, align 32, offset 4736] [fr
!1496 = metadata !{metadata !1497}
!1497 = metadata !{metadata !1498, metadata !1499}
!1498 = metadata !{i32 786689, metadata !1432, metadata !"device", metadata !1433, i32 16777230, metadata !721, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 14]
!1499 = metadata !{i32 786689, metadata !1432, metadata !"prop", metadata !1433, i32 33554446, metadata !1437, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 14]
!1500 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaDeviceGetByPCIBusId", metadata !"cudaDeviceGetByPCIBusId", metadata !"", metadata !1433, i32 19, metadata !1501, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)
!1501 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1502, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1502 = metadata !{metadata !1436, metadata !721, metadata !110}
!1503 = metadata !{metadata !1504}
!1504 = metadata !{metadata !1505, metadata !1506}
!1505 = metadata !{i32 786689, metadata !1500, metadata !"device", metadata !1433, i32 16777235, metadata !721, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 19]
!1506 = metadata !{i32 786689, metadata !1500, metadata !"pciBusId", metadata !1433, i32 33554451, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 19]
!1507 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaDeviceGetCacheConfig", metadata !"cudaDeviceGetCacheConfig", metadata !"", metadata !1433, i32 24, metadata !1508, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @
!1508 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1509, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1509 = metadata !{metadata !1436, metadata !1510}
!1510 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1417} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!1511 = metadata !{metadata !1512}
!1512 = metadata !{metadata !1513}
!1513 = metadata !{i32 786689, metadata !1507, metadata !"pCacheConfig", metadata !1433, i32 16777240, metadata !1510, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 24]
!1514 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaDeviceGetLimit", metadata !"cudaDeviceGetLimit", metadata !"", metadata !1433, i32 28, metadata !1515, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaDev
!1515 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1516, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1516 = metadata !{metadata !1436, metadata !963, metadata !1423}
!1517 = metadata !{metadata !1518}
!1518 = metadata !{metadata !1519, metadata !1520}
!1519 = metadata !{i32 786689, metadata !1514, metadata !"pValue", metadata !1433, i32 16777244, metadata !963, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 28]
!1520 = metadata !{i32 786689, metadata !1514, metadata !"limit", metadata !1433, i32 33554460, metadata !1423, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 28]
!1521 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaDeviceGetPCIBusId", metadata !"cudaDeviceGetPCIBusId", metadata !"", metadata !1433, i32 32, metadata !1522, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)
!1522 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1523, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1523 = metadata !{metadata !1436, metadata !110, metadata !108, metadata !108}
!1524 = metadata !{metadata !1525}
!1525 = metadata !{metadata !1526, metadata !1527, metadata !1528}
!1526 = metadata !{i32 786689, metadata !1521, metadata !"pciBusId", metadata !1433, i32 16777248, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 32]
!1527 = metadata !{i32 786689, metadata !1521, metadata !"len", metadata !1433, i32 33554464, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 32]
!1528 = metadata !{i32 786689, metadata !1521, metadata !"device", metadata !1433, i32 50331680, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 32]
!1529 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaDeviceReset", metadata !"cudaDeviceReset", metadata !"", metadata !1433, i32 37, metadata !1530, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceReset, null,
!1530 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1531, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1531 = metadata !{metadata !1436}
!1532 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaDeviceSetCacheConfig", metadata !"cudaDeviceSetCacheConfig", metadata !"", metadata !1433, i32 41, metadata !1533, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @c
!1533 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1534, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1534 = metadata !{metadata !1436, metadata !1417}
!1535 = metadata !{metadata !1536}
!1536 = metadata !{metadata !1537}
!1537 = metadata !{i32 786689, metadata !1532, metadata !"cacheConfig", metadata !1433, i32 16777257, metadata !1417, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 41]
!1538 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaDeviceSetLimit", metadata !"cudaDeviceSetLimit", metadata !"", metadata !1433, i32 45, metadata !1539, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaDevi
!1539 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1540, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1540 = metadata !{metadata !1436, metadata !1423, metadata !925}
!1541 = metadata !{metadata !1542}
!1542 = metadata !{metadata !1543, metadata !1544}
!1543 = metadata !{i32 786689, metadata !1538, metadata !"limit", metadata !1433, i32 16777261, metadata !1423, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 45]
!1544 = metadata !{i32 786689, metadata !1538, metadata !"value", metadata !1433, i32 33554477, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 45]
!1545 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaDeviceSynchronize", metadata !"cudaDeviceSynchronize", metadata !"", metadata !1433, i32 49, metadata !1530, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDevice
!1546 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaGetDevice", metadata !"cudaGetDevice", metadata !"", metadata !1433, i32 53, metadata !1547, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDevice, null, n
!1547 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1548, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1548 = metadata !{metadata !1436, metadata !721}
!1549 = metadata !{metadata !1550}
!1550 = metadata !{metadata !1551}
!1551 = metadata !{i32 786689, metadata !1546, metadata !"device", metadata !1433, i32 16777269, metadata !721, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 53]
!1552 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaGetDeviceCount", metadata !"cudaGetDeviceCount", metadata !"", metadata !1433, i32 58, metadata !1547, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDevic
!1553 = metadata !{metadata !1554}
!1554 = metadata !{metadata !1555}
!1555 = metadata !{i32 786689, metadata !1552, metadata !"count", metadata !1433, i32 16777274, metadata !721, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 58]
!1556 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaGetDeviceProperties", metadata !"cudaGetDeviceProperties", metadata !"", metadata !1433, i32 63, metadata !1557, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cu
!1557 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1558, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1558 = metadata !{metadata !1436, metadata !1559, metadata !108}
!1559 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1439} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaDeviceProp]
!1560 = metadata !{metadata !1561}
!1561 = metadata !{metadata !1562, metadata !1563}
!1562 = metadata !{i32 786689, metadata !1556, metadata !"prop", metadata !1433, i32 16777279, metadata !1559, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 63]
!1563 = metadata !{i32 786689, metadata !1556, metadata !"device", metadata !1433, i32 33554495, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 63]
!1564 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaIpcCloseMemHandle", metadata !"cudaIpcCloseMemHandle", metadata !"", metadata !1433, i32 68, metadata !1565, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaIpc
!1565 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1566, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1566 = metadata !{metadata !1436, metadata !145}
!1567 = metadata !{metadata !1568}
!1568 = metadata !{metadata !1569}
!1569 = metadata !{i32 786689, metadata !1564, metadata !"devPtr", metadata !1433, i32 16777284, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 68]
!1570 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaIpcGetEventHandle", metadata !"cudaIpcGetEventHandle", metadata !"", metadata !1433, i32 72, metadata !1571, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIp
!1571 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1572, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1572 = metadata !{metadata !1436, metadata !1573, metadata !1579}
!1573 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1574} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcEventHandle_t]
!1574 = metadata !{i32 786454, null, metadata !"cudaIpcEventHandle_t", metadata !1433, i32 1274, i64 0, i64 0, i64 0, i32 0, metadata !1575} ; [ DW_TAG_typedef ] [cudaIpcEventHandle_t] [line 1274, size 0, align 0, offset 0] [from cudaIpcEventHandle_st]
!1575 = metadata !{i32 786451, null, metadata !"cudaIpcEventHandle_st", metadata !898, i32 1271, i64 512, i64 8, i32 0, i32 0, null, metadata !1576, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcEventHandle_st] [line 1271, size 512, align 8, o
!1576 = metadata !{metadata !1577}
!1577 = metadata !{i32 786445, metadata !1575, metadata !"reserved", metadata !898, i32 1273, i64 512, i64 8, i64 0, i32 0, metadata !1578} ; [ DW_TAG_member ] [reserved] [line 1273, size 512, align 8, offset 0] [from ]
!1578 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 8, i32 0, i32 0, metadata !111, metadata !820, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!1579 = metadata !{i32 786454, null, metadata !"cudaEvent_t", metadata !1433, i32 1303, i64 0, i64 0, i64 0, i32 0, metadata !1580} ; [ DW_TAG_typedef ] [cudaEvent_t] [line 1303, size 0, align 0, offset 0] [from ]
!1580 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1581} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUevent_st]
!1581 = metadata !{i32 786451, null, metadata !"CUevent_st", metadata !898, i32 1303, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUevent_st] [line 1303, size 0, align 0, offset 0] [fwd] [from ]
!1582 = metadata !{metadata !1583}
!1583 = metadata !{metadata !1584, metadata !1585}
!1584 = metadata !{i32 786689, metadata !1570, metadata !"handle", metadata !1433, i32 16777288, metadata !1573, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 72]
!1585 = metadata !{i32 786689, metadata !1570, metadata !"event", metadata !1433, i32 33554504, metadata !1579, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 72]
!1586 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaIpcGetMemHandle", metadata !"cudaIpcGetMemHandle", metadata !"", metadata !1433, i32 76, metadata !1587, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcMem
!1587 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1588, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1588 = metadata !{metadata !1436, metadata !1589, metadata !145}
!1589 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1590} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcMemHandle_t]
!1590 = metadata !{i32 786454, null, metadata !"cudaIpcMemHandle_t", metadata !1433, i32 1282, i64 0, i64 0, i64 0, i32 0, metadata !1591} ; [ DW_TAG_typedef ] [cudaIpcMemHandle_t] [line 1282, size 0, align 0, offset 0] [from cudaIpcMemHandle_st]
!1591 = metadata !{i32 786451, null, metadata !"cudaIpcMemHandle_st", metadata !898, i32 1279, i64 512, i64 8, i32 0, i32 0, null, metadata !1592, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcMemHandle_st] [line 1279, size 512, align 8, offse
!1592 = metadata !{metadata !1593}
!1593 = metadata !{i32 786445, metadata !1591, metadata !"reserved", metadata !898, i32 1281, i64 512, i64 8, i64 0, i32 0, metadata !1578} ; [ DW_TAG_member ] [reserved] [line 1281, size 512, align 8, offset 0] [from ]
!1594 = metadata !{metadata !1595}
!1595 = metadata !{metadata !1596, metadata !1597}
!1596 = metadata !{i32 786689, metadata !1586, metadata !"handle", metadata !1433, i32 16777292, metadata !1589, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 76]
!1597 = metadata !{i32 786689, metadata !1586, metadata !"devPtr", metadata !1433, i32 33554508, metadata !145, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 76]
!1598 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaIpcOpenEventHandle", metadata !"cudaIpcOpenEventHandle", metadata !"", metadata !1433, i32 80, metadata !1599, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.CUev
!1599 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1600, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1600 = metadata !{metadata !1436, metadata !1601, metadata !1574}
!1601 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1579} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaEvent_t]
!1602 = metadata !{metadata !1603}
!1603 = metadata !{metadata !1604, metadata !1605}
!1604 = metadata !{i32 786689, metadata !1598, metadata !"event", metadata !1433, i32 16777296, metadata !1601, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 80]
!1605 = metadata !{i32 786689, metadata !1598, metadata !"handle", metadata !1433, i32 33554512, metadata !1574, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 80]
!1606 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaIpcOpenMemHandle", metadata !"cudaIpcOpenMemHandle", metadata !"", metadata !1433, i32 84, metadata !1607, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, %struct.cu
!1607 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1608, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1608 = metadata !{metadata !1436, metadata !955, metadata !1590, metadata !257}
!1609 = metadata !{metadata !1610}
!1610 = metadata !{metadata !1611, metadata !1612, metadata !1613}
!1611 = metadata !{i32 786689, metadata !1606, metadata !"devPtr", metadata !1433, i32 16777300, metadata !955, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 84]
!1612 = metadata !{i32 786689, metadata !1606, metadata !"handle", metadata !1433, i32 33554516, metadata !1590, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 84]
!1613 = metadata !{i32 786689, metadata !1606, metadata !"flags", metadata !1433, i32 50331732, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 84]
!1614 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaSetDevice", metadata !"cudaSetDevice", metadata !"", metadata !1433, i32 88, metadata !1615, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDevice, null, nu
!1615 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1616, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1616 = metadata !{metadata !1436, metadata !108}
!1617 = metadata !{metadata !1618}
!1618 = metadata !{metadata !1619}
!1619 = metadata !{i32 786689, metadata !1614, metadata !"device", metadata !1433, i32 16777304, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 88]
!1620 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaSetDeviceFlags", metadata !"cudaSetDeviceFlags", metadata !"", metadata !1433, i32 92, metadata !1621, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDevice
!1621 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1622, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1622 = metadata !{metadata !1436, metadata !257}
!1623 = metadata !{metadata !1624}
!1624 = metadata !{metadata !1625}
!1625 = metadata !{i32 786689, metadata !1620, metadata !"flags", metadata !1433, i32 16777308, metadata !257, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 92]
!1626 = metadata !{i32 786478, i32 0, metadata !1433, metadata !"cudaSetValidDevices", metadata !"cudaSetValidDevices", metadata !"", metadata !1433, i32 96, metadata !1627, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32)* @cudaS
!1627 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1628, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1628 = metadata !{metadata !1436, metadata !721, metadata !108}
!1629 = metadata !{metadata !1630}
!1630 = metadata !{metadata !1631, metadata !1632}
!1631 = metadata !{i32 786689, metadata !1626, metadata !"device_arr", metadata !1433, i32 16777312, metadata !721, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device_arr] [line 96]
!1632 = metadata !{i32 786689, metadata !1626, metadata !"len", metadata !1433, i32 33554528, metadata !108, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 96]
!1633 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 
!1634 = metadata !{metadata !1635}
!1635 = metadata !{metadata !897}
!1636 = metadata !{metadata !1637}
!1637 = metadata !{metadata !1638, metadata !1648, metadata !1651}
!1638 = metadata !{i32 786478, i32 0, metadata !1639, metadata !"cudaGetErrorString", metadata !"cudaGetErrorString", metadata !"", metadata !1639, i32 16, metadata !1640, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i32)* @cudaGetErrorS
!1639 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!1640 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1641, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1641 = metadata !{metadata !859, metadata !1642}
!1642 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !1639, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !897} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!1643 = metadata !{metadata !1644}
!1644 = metadata !{metadata !1645, metadata !1646}
!1645 = metadata !{i32 786689, metadata !1638, metadata !"error", metadata !1639, i32 16777232, metadata !1642, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [error] [line 16]
!1646 = metadata !{i32 786688, metadata !1647, metadata !"tmp", metadata !1639, i32 17, metadata !157, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 17]
!1647 = metadata !{i32 786443, metadata !1638, i32 16, i32 0, metadata !1639, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c]
!1648 = metadata !{i32 786478, i32 0, metadata !1639, metadata !"cudaGetLastError", metadata !"cudaGetLastError", metadata !"", metadata !1639, i32 22, metadata !1649, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaGetLastError, nu
!1649 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1650, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1650 = metadata !{metadata !1642}
!1651 = metadata !{i32 786478, i32 0, metadata !1639, metadata !"cudaPeekAtLastError", metadata !"cudaPeekAtLastError", metadata !"", metadata !1639, i32 26, metadata !1649, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaPeekAtLast
!1652 = metadata !{metadata !1653}
!1653 = metadata !{metadata !1654}
!1654 = metadata !{i32 786484, i32 0, null, metadata !"msg", metadata !"msg", metadata !"", metadata !1639, i32 14, metadata !1655, i32 1, i32 1, [25 x i8]* @msg} ; [ DW_TAG_variable ] [msg] [line 14] [local] [def]
!1655 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 200, i64 8, i32 0, i32 0, metadata !111, metadata !1656, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 200, align 8, offset 0] [from char]
!1656 = metadata !{metadata !1657}
!1657 = metadata !{i32 786465, i64 0, i64 24}     ; [ DW_TAG_subrange_type ] [0, 24]
!1658 = metadata !{i32 26, i32 0, metadata !184, null}
!1659 = metadata !{i32 27, i32 0, metadata !184, null}
!1660 = metadata !{i32 28, i32 0, metadata !184, null}
!1661 = metadata !{i32 29, i32 0, metadata !184, null}
!1662 = metadata !{i32 30, i32 0, metadata !184, null}
!1663 = metadata !{i32 31, i32 0, metadata !184, null}
!1664 = metadata !{i32 32, i32 0, metadata !184, null}
!1665 = metadata !{i32 33, i32 0, metadata !184, null}
!1666 = metadata !{i32 36, i32 0, metadata !184, null}
!1667 = metadata !{i32 37, i32 0, metadata !184, null}
!1668 = metadata !{metadata !"long", metadata !1669}
!1669 = metadata !{metadata !"omnipotent char", metadata !1670}
!1670 = metadata !{metadata !"Simple C/C++ TBAA"}
!1671 = metadata !{i32 38, i32 0, metadata !184, null}
!1672 = metadata !{metadata !"int", metadata !1669}
!1673 = metadata !{i32 39, i32 0, metadata !184, null}
!1674 = metadata !{i32 40, i32 0, metadata !1675, null}
!1675 = metadata !{i32 786443, metadata !184, i32 39, i32 0, metadata !99, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1676 = metadata !{i32 41, i32 0, metadata !1675, null}
!1677 = metadata !{i32 43, i32 0, metadata !184, null}
!1678 = metadata !{i32 44, i32 0, metadata !184, null}
!1679 = metadata !{i32 45, i32 0, metadata !184, null}
!1680 = metadata !{i32 46, i32 0, metadata !184, null}
!1681 = metadata !{metadata !"float", metadata !1669}
!1682 = metadata !{i32 47, i32 0, metadata !184, null}
!1683 = metadata !{i32 48, i32 0, metadata !184, null}
!1684 = metadata !{i32 49, i32 0, metadata !184, null}
!1685 = metadata !{i32 50, i32 0, metadata !184, null}
!1686 = metadata !{i32 52, i32 0, metadata !184, null}
!1687 = metadata !{i32 58, i32 0, metadata !1688, null}
!1688 = metadata !{i32 786443, metadata !274, i32 58, i32 0, metadata !99, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1689 = metadata !{i32 59, i32 0, metadata !1690, null}
!1690 = metadata !{i32 786443, metadata !1688, i32 58, i32 0, metadata !99, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1691 = metadata !{i32 62, i32 0, metadata !1690, null}
!1692 = metadata !{i32 66, i32 0, metadata !274, null}
!1693 = metadata !{i32 67, i32 0, metadata !274, null}
!1694 = metadata !{i32 68, i32 0, metadata !274, null}
!1695 = metadata !{i32 70, i32 0, metadata !274, null}
!1696 = metadata !{i32 72, i32 0, metadata !274, null}
!1697 = metadata !{i32 74, i32 0, metadata !274, null}
!1698 = metadata !{i32 75, i32 0, metadata !274, null}
!1699 = metadata !{i32 77, i32 0, metadata !274, null}
!1700 = metadata !{i32 78, i32 0, metadata !274, null}
!1701 = metadata !{i32 80, i32 0, metadata !274, null}
!1702 = metadata !{i32 81, i32 0, metadata !274, null}
!1703 = metadata !{i32 83, i32 0, metadata !286, null}
!1704 = metadata !{i32 84, i32 0, metadata !1705, null}
!1705 = metadata !{i32 786443, metadata !286, i32 83, i32 0, metadata !99, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1706 = metadata !{i32 279, i32 0, metadata !1707, metadata !1704}
!1707 = metadata !{i32 786443, metadata !370, i32 279, i32 0, metadata !372, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning//usr/lib/gcc/x86_64-linux-gnu/4.9/../../../../include/c++/4.
!1708 = metadata !{i32 85, i32 0, metadata !1705, null}
!1709 = metadata !{i32 279, i32 0, metadata !1707, metadata !1708}
!1710 = metadata !{i32 86, i32 0, metadata !1705, null}
!1711 = metadata !{i32 279, i32 0, metadata !1707, metadata !1710}
!1712 = metadata !{i32 89, i32 0, metadata !274, null}
!1713 = metadata !{i32 110, i32 0, metadata !296, null}
!1714 = metadata !{i32 111, i32 0, metadata !296, null}
!1715 = metadata !{i32 114, i32 0, metadata !296, null}
!1716 = metadata !{i32 115, i32 0, metadata !296, null}
!1717 = metadata !{i32 116, i32 0, metadata !1718, null}
!1718 = metadata !{i32 786443, metadata !296, i32 115, i32 0, metadata !99, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1719 = metadata !{i32 118, i32 0, metadata !1718, null}
!1720 = metadata !{i32 120, i32 0, metadata !296, null}
!1721 = metadata !{i32 125, i32 0, metadata !296, null}
!1722 = metadata !{i32 128, i32 0, metadata !296, null}
!1723 = metadata !{i32 142, i32 0, metadata !296, null}
!1724 = metadata !{i32 143, i32 0, metadata !364, null}
!1725 = metadata !{i32 143, i32 0, metadata !1726, null}
!1726 = metadata !{i32 786443, metadata !364, i32 143, i32 0, metadata !99, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1727 = metadata !{i32 144, i32 0, metadata !296, null}
!1728 = metadata !{metadata !"any pointer", metadata !1669}
!1729 = metadata !{i32 145, i32 0, metadata !1730, null}
!1730 = metadata !{i32 786443, metadata !296, i32 144, i32 0, metadata !99, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1731 = metadata !{i32 146, i32 0, metadata !1730, null}
!1732 = metadata !{i32 149, i32 0, metadata !296, null}
!1733 = metadata !{i32 151, i32 0, metadata !296, null}
!1734 = metadata !{i32 152, i32 0, metadata !1735, null}
!1735 = metadata !{i32 786443, metadata !296, i32 151, i32 0, metadata !99, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1736 = metadata !{i32 153, i32 0, metadata !1735, null}
!1737 = metadata !{i32 156, i32 0, metadata !296, null}
!1738 = metadata !{i32 158, i32 0, metadata !296, null}
!1739 = metadata !{i32 159, i32 0, metadata !296, null}
!1740 = metadata !{i32 161, i32 0, metadata !296, null}
!1741 = metadata !{i32 169, i32 0, metadata !296, null}
!1742 = metadata !{i32 170, i32 0, metadata !296, null}
!1743 = metadata !{i32 186, i32 0, metadata !296, null}
!1744 = metadata !{i32 187, i32 0, metadata !296, null}
!1745 = metadata !{i32 188, i32 0, metadata !369, null}
!1746 = metadata !{i32 188, i32 0, metadata !1747, null}
!1747 = metadata !{i32 786443, metadata !369, i32 188, i32 0, metadata !99, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1748 = metadata !{i32 189, i32 0, metadata !296, null}
!1749 = metadata !{i32 190, i32 0, metadata !1750, null}
!1750 = metadata !{i32 786443, metadata !296, i32 189, i32 0, metadata !99, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/main.cpp]
!1751 = metadata !{i32 191, i32 0, metadata !1750, null}
!1752 = metadata !{i32 194, i32 0, metadata !296, null}
!1753 = metadata !{i32 199, i32 0, metadata !296, null}
!1754 = metadata !{i32 230, i32 0, metadata !296, null}
!1755 = metadata !{i32 231, i32 0, metadata !296, null}
!1756 = metadata !{i32 232, i32 0, metadata !296, null}
!1757 = metadata !{i32 236, i32 0, metadata !296, null}
!1758 = metadata !{i32 240, i32 0, metadata !296, null}
!1759 = metadata !{i32 241, i32 0, metadata !296, null}
!1760 = metadata !{i32 35, i32 0, metadata !425, null}
!1761 = metadata !{i32 40, i32 0, metadata !425, null}
!1762 = metadata !{i32 41, i32 0, metadata !425, null}
!1763 = metadata !{i32 42, i32 0, metadata !1764, null}
!1764 = metadata !{i32 786443, metadata !425, i32 41, i32 0, metadata !391, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!1765 = metadata !{i32 44, i32 0, metadata !1764, null}
!1766 = metadata !{i32 45, i32 0, metadata !1764, null}
!1767 = metadata !{i32 103, i32 0, metadata !1768, metadata !1769}
!1768 = metadata !{i32 786443, metadata !811, i32 102, i32 0, metadata !804, i32 38} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning//home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_functions
!1769 = metadata !{i32 46, i32 0, metadata !1770, null}
!1770 = metadata !{i32 786443, metadata !1764, i32 45, i32 0, metadata !391, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!1771 = metadata !{i32 47, i32 0, metadata !1770, null}
!1772 = metadata !{i32 113, i32 0, metadata !1773, metadata !1774}
!1773 = metadata !{i32 786443, metadata !803, i32 112, i32 0, metadata !804, i32 37} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning//home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_functions
!1774 = metadata !{i32 50, i32 0, metadata !1775, null}
!1775 = metadata !{i32 786443, metadata !1770, i32 49, i32 0, metadata !391, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/./GPU_kernels.cu]
!1776 = metadata !{i32 57, i32 0, metadata !1764, null}
!1777 = metadata !{i32 58, i32 0, metadata !1764, null}
!1778 = metadata !{i32 59, i32 0, metadata !1764, null}
!1779 = metadata !{i32 60, i32 0, metadata !425, null}
!1780 = metadata !{i32 63, i32 0, metadata !488, null}
!1781 = metadata !{i32 67, i32 0, metadata !488, null}
!1782 = metadata !{i32 68, i32 0, metadata !492, null}
!1783 = metadata !{i32 69, i32 0, metadata !492, null}
!1784 = metadata !{i32 81, i32 0, metadata !492, null}
!1785 = metadata !{i32 82, i32 0, metadata !492, null}
!1786 = metadata !{i32 83, i32 0, metadata !492, null}
!1787 = metadata !{i32 84, i32 0, metadata !488, null}
!1788 = metadata !{i32 90, i32 0, metadata !499, null}
!1789 = metadata !{i32 101, i32 0, metadata !499, null}
!1790 = metadata !{i32 103, i32 0, metadata !499, null}
!1791 = metadata !{i32 105, i32 0, metadata !499, null}
!1792 = metadata !{i32 107, i32 0, metadata !499, null}
!1793 = metadata !{i32 118, i32 0, metadata !514, null}
!1794 = metadata !{i32 121, i32 0, metadata !514, null}
!1795 = metadata !{i32 122, i32 0, metadata !514, null}
!1796 = metadata !{i32 123, i32 0, metadata !514, null}
!1797 = metadata !{i32 125, i32 0, metadata !514, null}
!1798 = metadata !{i32 126, i32 0, metadata !514, null}
!1799 = metadata !{i32 127, i32 0, metadata !514, null}
!1800 = metadata !{i32 128, i32 0, metadata !514, null}
!1801 = metadata !{i32 129, i32 0, metadata !514, null}
!1802 = metadata !{i32 132, i32 0, metadata !514, null}
!1803 = metadata !{i32 184, i32 0, metadata !1804, metadata !1802}
!1804 = metadata !{i32 786443, metadata !799, i32 184, i32 0, metadata !372, i32 36} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning//usr/lib/gcc/x86_64-linux-gnu/4.9/../../../../include/c++/4.
!1805 = metadata !{i32 134, i32 0, metadata !514, null}
!1806 = metadata !{i32 135, i32 0, metadata !514, null}
!1807 = metadata !{i32 137, i32 0, metadata !514, null}
!1808 = metadata !{i32 138, i32 0, metadata !514, null}
!1809 = metadata !{i32 139, i32 0, metadata !514, null}
!1810 = metadata !{i32 140, i32 0, metadata !514, null}
!1811 = metadata !{i32 142, i32 0, metadata !514, null}
!1812 = metadata !{i32 143, i32 0, metadata !514, null}
!1813 = metadata !{i32 144, i32 0, metadata !514, null}
!1814 = metadata !{i32 145, i32 0, metadata !514, null}
!1815 = metadata !{i32 147, i32 0, metadata !514, null}
!1816 = metadata !{i32 148, i32 0, metadata !514, null}
!1817 = metadata !{i32 149, i32 0, metadata !514, null}
!1818 = metadata !{i32 150, i32 0, metadata !514, null}
!1819 = metadata !{i32 172, i32 0, metadata !550, null}
!1820 = metadata !{i32 133, i32 0, metadata !514, null}
!1821 = metadata !{i32 130, i32 0, metadata !514, null}
!1822 = metadata !{i32 173, i32 0, metadata !552, null}
!1823 = metadata !{i32 175, i32 0, metadata !555, null}
!1824 = metadata !{i32 176, i32 0, metadata !555, null}
!1825 = metadata !{i32 186, i32 0, metadata !567, null}
!1826 = metadata !{i32 187, i32 0, metadata !567, null}
!1827 = metadata !{i32 188, i32 0, metadata !567, null}
!1828 = metadata !{i32 189, i32 0, metadata !567, null}
!1829 = metadata !{i32 190, i32 0, metadata !567, null}
!1830 = metadata !{i32 191, i32 0, metadata !567, null}
!1831 = metadata !{i32 201, i32 0, metadata !579, null}
!1832 = metadata !{i32 202, i32 0, metadata !579, null}
!1833 = metadata !{i32 204, i32 0, metadata !579, null}
!1834 = metadata !{i32 212, i32 0, metadata !579, null}
!1835 = metadata !{i32 220, i32 0, metadata !579, null}
!1836 = metadata !{i32 228, i32 0, metadata !579, null}
!1837 = metadata !{i32 174, i32 0, metadata !555, null}
!1838 = metadata !{i32 177, i32 0, metadata !555, null}
!1839 = metadata !{i32 178, i32 0, metadata !562, null}
!1840 = metadata !{i32 180, i32 0, metadata !564, null}
!1841 = metadata !{i32 195, i32 0, metadata !572, null}
!1842 = metadata !{i32 179, i32 0, metadata !564, null}
!1843 = metadata !{i32 181, i32 0, metadata !564, null}
!1844 = metadata !{i32 182, i32 0, metadata !564, null}
!1845 = metadata !{i32 183, i32 0, metadata !567, null}
!1846 = metadata !{i32 184, i32 0, metadata !567, null}
!1847 = metadata !{i32 192, i32 0, metadata !567, null}
!1848 = metadata !{i32 193, i32 0, metadata !564, null}
!1849 = metadata !{i32 196, i32 0, metadata !574, null}
!1850 = metadata !{i32 197, i32 0, metadata !574, null}
!1851 = metadata !{i32 198, i32 0, metadata !574, null}
!1852 = metadata !{i32 200, i32 0, metadata !574, null}
!1853 = metadata !{i32 205, i32 0, metadata !579, null}
!1854 = metadata !{i32 206, i32 0, metadata !582, null}
!1855 = metadata !{i32 90, i32 0, metadata !499, metadata !1854}
!1856 = metadata !{i32 101, i32 0, metadata !499, metadata !1854}
!1857 = metadata !{i32 103, i32 0, metadata !499, metadata !1854}
!1858 = metadata !{i32 105, i32 0, metadata !499, metadata !1854}
!1859 = metadata !{i32 207, i32 0, metadata !582, null}
!1860 = metadata !{i32 208, i32 0, metadata !582, null}
!1861 = metadata !{i32 209, i32 0, metadata !582, null}
!1862 = metadata !{i32 213, i32 0, metadata !579, null}
!1863 = metadata !{i32 210, i32 0, metadata !582, null}
!1864 = metadata !{i32 214, i32 0, metadata !585, null}
!1865 = metadata !{i32 90, i32 0, metadata !499, metadata !1864}
!1866 = metadata !{i32 101, i32 0, metadata !499, metadata !1864}
!1867 = metadata !{i32 103, i32 0, metadata !499, metadata !1864}
!1868 = metadata !{i32 105, i32 0, metadata !499, metadata !1864}
!1869 = metadata !{i32 215, i32 0, metadata !585, null}
!1870 = metadata !{i32 216, i32 0, metadata !585, null}
!1871 = metadata !{i32 217, i32 0, metadata !585, null}
!1872 = metadata !{i32 221, i32 0, metadata !579, null}
!1873 = metadata !{i32 218, i32 0, metadata !585, null}
!1874 = metadata !{i32 222, i32 0, metadata !588, null}
!1875 = metadata !{i32 90, i32 0, metadata !499, metadata !1874}
!1876 = metadata !{i32 101, i32 0, metadata !499, metadata !1874}
!1877 = metadata !{i32 103, i32 0, metadata !499, metadata !1874}
!1878 = metadata !{i32 105, i32 0, metadata !499, metadata !1874}
!1879 = metadata !{i32 223, i32 0, metadata !588, null}
!1880 = metadata !{i32 224, i32 0, metadata !588, null}
!1881 = metadata !{i32 225, i32 0, metadata !588, null}
!1882 = metadata !{i32 229, i32 0, metadata !579, null}
!1883 = metadata !{i32 226, i32 0, metadata !588, null}
!1884 = metadata !{i32 230, i32 0, metadata !591, null}
!1885 = metadata !{i32 90, i32 0, metadata !499, metadata !1884}
!1886 = metadata !{i32 101, i32 0, metadata !499, metadata !1884}
!1887 = metadata !{i32 103, i32 0, metadata !499, metadata !1884}
!1888 = metadata !{i32 105, i32 0, metadata !499, metadata !1884}
!1889 = metadata !{i32 231, i32 0, metadata !591, null}
!1890 = metadata !{i32 232, i32 0, metadata !591, null}
!1891 = metadata !{i32 233, i32 0, metadata !591, null}
!1892 = metadata !{i32 234, i32 0, metadata !591, null}
!1893 = metadata !{i32 241, i32 0, metadata !514, null}
!1894 = metadata !{i32 242, i32 0, metadata !514, null}
!1895 = metadata !{i32 244, i32 0, metadata !514, null}
!1896 = metadata !{i32 245, i32 0, metadata !514, null}
!1897 = metadata !{i32 247, i32 0, metadata !514, null}
!1898 = metadata !{i32 248, i32 0, metadata !514, null}
!1899 = metadata !{i32 250, i32 0, metadata !514, null}
!1900 = metadata !{i32 251, i32 0, metadata !514, null}
!1901 = metadata !{i32 252, i32 0, metadata !514, null}
!1902 = metadata !{i32 40, i32 0, metadata !1903, null}
!1903 = metadata !{i32 786443, metadata !592, i32 39, i32 0, metadata !593, i32 24} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/CUDA_interface.cpp]
!1904 = metadata !{i32 61, i32 0, metadata !668, null}
!1905 = metadata !{i32 63, i32 0, metadata !668, null}
!1906 = metadata !{i32 64, i32 0, metadata !668, null}
!1907 = metadata !{i32 66, i32 0, metadata !668, null}
!1908 = metadata !{i32 68, i32 0, metadata !668, null}
!1909 = metadata !{i32 70, i32 0, metadata !668, null}
!1910 = metadata !{i32 71, i32 0, metadata !668, null}
!1911 = metadata !{i32 72, i32 0, metadata !668, null}
!1912 = metadata !{i32 76, i32 0, metadata !668, null}
!1913 = metadata !{i32 77, i32 0, metadata !1914, null}
!1914 = metadata !{i32 786443, metadata !668, i32 76, i32 0, metadata !593, i32 26} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/CUDA_interface.cpp]
!1915 = metadata !{i32 86, i32 0, metadata !668, null}
!1916 = metadata !{i32 87, i32 0, metadata !668, null}
!1917 = metadata !{i32 90, i32 0, metadata !668, null}
!1918 = metadata !{i32 91, i32 0, metadata !668, null}
!1919 = metadata !{i32 92, i32 0, metadata !668, null}
!1920 = metadata !{i32 95, i32 0, metadata !668, null}
!1921 = metadata !{i32 106, i32 0, metadata !668, null}
!1922 = metadata !{i32 111, i32 0, metadata !668, null}
!1923 = metadata !{i32 112, i32 0, metadata !668, null}
!1924 = metadata !{i32 113, i32 0, metadata !668, null}
!1925 = metadata !{i32 114, i32 0, metadata !668, null}
!1926 = metadata !{i32 115, i32 0, metadata !668, null}
!1927 = metadata !{i32 121, i32 0, metadata !668, null}
!1928 = metadata !{i32 123, i32 0, metadata !732, null}
!1929 = metadata !{i32 123, i32 0, metadata !1930, null}
!1930 = metadata !{i32 786443, metadata !732, i32 123, i32 0, metadata !593, i32 28} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/CUDA_interface.cpp]
!1931 = metadata !{i32 126, i32 0, metadata !668, null}
!1932 = metadata !{i32 328, i32 0, metadata !1933, metadata !1931}
!1933 = metadata !{i32 786443, metadata !771, i32 327, i32 0, metadata !743, i32 34} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning//home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h]
!1934 = metadata !{i32 127, i32 0, metadata !668, null}
!1935 = metadata !{i32 328, i32 0, metadata !1933, metadata !1934}
!1936 = metadata !{i32 128, i32 0, metadata !668, null}
!1937 = metadata !{i32 328, i32 0, metadata !1938, metadata !1936}
!1938 = metadata !{i32 786443, metadata !757, i32 327, i32 0, metadata !743, i32 33} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning//home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h]
!1939 = metadata !{i32 129, i32 0, metadata !668, null}
!1940 = metadata !{i32 328, i32 0, metadata !1941, metadata !1939}
!1941 = metadata !{i32 786443, metadata !741, i32 327, i32 0, metadata !743, i32 32} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning//home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h]
!1942 = metadata !{i32 130, i32 0, metadata !668, null}
!1943 = metadata !{i32 328, i32 0, metadata !1933, metadata !1942}
!1944 = metadata !{i32 131, i32 0, metadata !668, null}
!1945 = metadata !{i32 132, i32 0, metadata !668, null}
!1946 = metadata !{i32 136, i32 0, metadata !668, null}
!1947 = metadata !{i32 145, i32 0, metadata !668, null}
!1948 = metadata !{i32 419, i32 0, metadata !792, metadata !1949}
!1949 = metadata !{i32 419, i32 0, metadata !784, metadata !1947}
!1950 = metadata !{i32 148, i32 0, metadata !668, null}
!1951 = metadata !{i32 150, i32 0, metadata !1952, null}
!1952 = metadata !{i32 786443, metadata !668, i32 150, i32 0, metadata !593, i32 29} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/CUDA_interface.cpp]
!1953 = metadata !{i32 152, i32 0, metadata !1952, null}
!1954 = metadata !{i32 176, i32 0, metadata !668, null}
!1955 = metadata !{i32 189, i32 0, metadata !668, null}
!1956 = metadata !{i32 190, i32 0, metadata !668, null}
!1957 = metadata !{i32 214, i32 0, metadata !668, null}
!1958 = metadata !{i32 216, i32 0, metadata !668, null}
!1959 = metadata !{i32 219, i32 0, metadata !668, null}
!1960 = metadata !{i32 220, i32 0, metadata !668, null}
!1961 = metadata !{i32 222, i32 0, metadata !668, null}
!1962 = metadata !{i32 228, i32 0, metadata !668, null}
!1963 = metadata !{i32 229, i32 0, metadata !668, null}
!1964 = metadata !{i32 230, i32 0, metadata !740, null}
!1965 = metadata !{i32 230, i32 0, metadata !1966, null}
!1966 = metadata !{i32 786443, metadata !740, i32 230, i32 0, metadata !593, i32 31} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_binning/CUDA_interface.cpp]
!1967 = metadata !{i32 232, i32 0, metadata !668, null}
!1968 = metadata !{i32 233, i32 0, metadata !668, null}
!1969 = metadata !{i32 275, i32 0, metadata !668, null}
!1970 = metadata !{i32 276, i32 0, metadata !668, null}
!1971 = metadata !{i32 277, i32 0, metadata !668, null}
!1972 = metadata !{i32 278, i32 0, metadata !668, null}
!1973 = metadata !{i32 279, i32 0, metadata !668, null}
!1974 = metadata !{i32 283, i32 0, metadata !668, null}
!1975 = metadata !{i32 284, i32 0, metadata !668, null}
!1976 = metadata !{i32 13, i32 0, metadata !1977, null}
!1977 = metadata !{i32 786443, metadata !835, i32 12, i32 0, metadata !836, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c]
!1978 = metadata !{i32 14, i32 0, metadata !1977, null}
!1979 = metadata !{i32 15, i32 0, metadata !1977, null}
!1980 = metadata !{i32 16, i32 0, metadata !857, null}
!1981 = metadata !{i32 17, i32 0, metadata !857, null}
!1982 = metadata !{i32 18, i32 0, metadata !857, null}
!1983 = metadata !{i32 14, i32 0, metadata !891, null}
!1984 = metadata !{i32 15, i32 0, metadata !891, null}
!1985 = metadata !{i32 16, i32 0, metadata !891, null}
!1986 = metadata !{i32 26, i32 0, metadata !1987, null}
!1987 = metadata !{i32 786443, metadata !908, i32 25, i32 0, metadata !909, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1988 = metadata !{i32 30, i32 0, metadata !1989, null}
!1989 = metadata !{i32 786443, metadata !936, i32 29, i32 0, metadata !909, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1990 = metadata !{i32 31, i32 0, metadata !1989, null}
!1991 = metadata !{i32 35, i32 0, metadata !1992, null}
!1992 = metadata !{i32 786443, metadata !942, i32 34, i32 0, metadata !909, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1993 = metadata !{i32 36, i32 0, metadata !1992, null}
!1994 = metadata !{i32 40, i32 0, metadata !1995, null}
!1995 = metadata !{i32 786443, metadata !948, i32 39, i32 0, metadata !909, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1996 = metadata !{i32 41, i32 0, metadata !1995, null}
!1997 = metadata !{i32 45, i32 0, metadata !1998, null}
!1998 = metadata !{i32 786443, metadata !952, i32 44, i32 0, metadata !909, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1999 = metadata !{i32 49, i32 0, metadata !2000, null}
!2000 = metadata !{i32 786443, metadata !960, i32 48, i32 0, metadata !909, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2001 = metadata !{i32 53, i32 0, metadata !2002, null}
!2002 = metadata !{i32 786443, metadata !968, i32 52, i32 0, metadata !909, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2003 = metadata !{i32 57, i32 0, metadata !2004, null}
!2004 = metadata !{i32 786443, metadata !976, i32 56, i32 0, metadata !909, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2005 = metadata !{i32 61, i32 0, metadata !2006, null}
!2006 = metadata !{i32 786443, metadata !984, i32 60, i32 0, metadata !909, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2007 = metadata !{i32 65, i32 0, metadata !2008, null}
!2008 = metadata !{i32 786443, metadata !991, i32 64, i32 0, metadata !909, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2009 = metadata !{i32 69, i32 0, metadata !2010, null}
!2010 = metadata !{i32 786443, metadata !999, i32 68, i32 0, metadata !909, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2011 = metadata !{i32 73, i32 0, metadata !2012, null}
!2012 = metadata !{i32 786443, metadata !1003, i32 72, i32 0, metadata !909, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2013 = metadata !{i32 74, i32 0, metadata !2012, null}
!2014 = metadata !{i32 75, i32 0, metadata !2012, null}
!2015 = metadata !{i32 77, i32 0, metadata !2012, null}
!2016 = metadata !{i32 81, i32 0, metadata !2017, null}
!2017 = metadata !{i32 786443, metadata !1010, i32 80, i32 0, metadata !909, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2018 = metadata !{i32 86, i32 0, metadata !2019, null}
!2019 = metadata !{i32 786443, metadata !1024, i32 85, i32 0, metadata !909, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2020 = metadata !{i32 91, i32 0, metadata !2021, null}
!2021 = metadata !{i32 786443, metadata !1034, i32 90, i32 0, metadata !909, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2022 = metadata !{i32 95, i32 0, metadata !2023, null}
!2023 = metadata !{i32 786443, metadata !1044, i32 94, i32 0, metadata !909, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2024 = metadata !{i32 96, i32 0, metadata !2023, null}
!2025 = metadata !{i32 97, i32 0, metadata !2023, null}
!2026 = metadata !{i32 99, i32 0, metadata !2023, null}
!2027 = metadata !{i32 103, i32 0, metadata !2028, null}
!2028 = metadata !{i32 786443, metadata !1049, i32 102, i32 0, metadata !909, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2029 = metadata !{i32 108, i32 0, metadata !2030, null}
!2030 = metadata !{i32 786443, metadata !1058, i32 106, i32 0, metadata !909, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2031 = metadata !{i32 113, i32 0, metadata !2032, null}
!2032 = metadata !{i32 786443, metadata !1067, i32 112, i32 0, metadata !909, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2033 = metadata !{i32 119, i32 0, metadata !2034, null}
!2034 = metadata !{i32 786443, metadata !1079, i32 118, i32 0, metadata !909, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2035 = metadata !{i32 125, i32 0, metadata !2036, null}
!2036 = metadata !{i32 786443, metadata !1093, i32 124, i32 0, metadata !909, i32 20} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2037 = metadata !{i32 131, i32 0, metadata !2038, null}
!2038 = metadata !{i32 786443, metadata !1109, i32 130, i32 0, metadata !909, i32 21} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2039 = metadata !{i32 137, i32 0, metadata !2040, null}
!2040 = metadata !{i32 786443, metadata !1122, i32 136, i32 0, metadata !909, i32 22} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2041 = metadata !{i32 143, i32 0, metadata !2042, null}
!2042 = metadata !{i32 786443, metadata !1136, i32 142, i32 0, metadata !909, i32 23} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2043 = metadata !{i32 149, i32 0, metadata !2044, null}
!2044 = metadata !{i32 786443, metadata !1149, i32 148, i32 0, metadata !909, i32 24} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2045 = metadata !{i32 153, i32 0, metadata !2046, null}
!2046 = metadata !{i32 786443, metadata !1163, i32 152, i32 0, metadata !909, i32 25} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2047 = metadata !{i32 157, i32 0, metadata !2048, null}
!2048 = metadata !{i32 786443, metadata !1187, i32 156, i32 0, metadata !909, i32 26} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2049 = metadata !{i32 161, i32 0, metadata !2050, null}
!2050 = metadata !{i32 786443, metadata !1194, i32 160, i32 0, metadata !909, i32 27} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2051 = metadata !{i32 165, i32 0, metadata !2052, null}
!2052 = metadata !{i32 786443, metadata !1213, i32 164, i32 0, metadata !909, i32 28} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2053 = metadata !{i32 171, i32 0, metadata !2054, null}
!2054 = metadata !{i32 786443, metadata !1220, i32 170, i32 0, metadata !909, i32 29} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2055 = metadata !{i32 176, i32 0, metadata !2056, null}
!2056 = metadata !{i32 786443, metadata !1233, i32 175, i32 0, metadata !909, i32 30} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2057 = metadata !{i32 181, i32 0, metadata !2058, null}
!2058 = metadata !{i32 786443, metadata !1243, i32 180, i32 0, metadata !909, i32 31} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2059 = metadata !{i32 187, i32 0, metadata !2060, null}
!2060 = metadata !{i32 786443, metadata !1254, i32 186, i32 0, metadata !909, i32 32} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2061 = metadata !{i32 192, i32 0, metadata !2062, null}
!2062 = metadata !{i32 786443, metadata !1266, i32 191, i32 0, metadata !909, i32 33} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2063 = metadata !{i32 198, i32 0, metadata !2064, null}
!2064 = metadata !{i32 786443, metadata !1276, i32 197, i32 0, metadata !909, i32 34} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2065 = metadata !{i32 203, i32 0, metadata !2066, null}
!2066 = metadata !{i32 786443, metadata !1287, i32 201, i32 0, metadata !909, i32 35} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2067 = metadata !{i32 209, i32 0, metadata !2068, null}
!2068 = metadata !{i32 786443, metadata !1297, i32 207, i32 0, metadata !909, i32 36} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2069 = metadata !{i32 214, i32 0, metadata !2070, null}
!2070 = metadata !{i32 786443, metadata !1308, i32 213, i32 0, metadata !909, i32 37} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2071 = metadata !{i32 220, i32 0, metadata !2072, null}
!2072 = metadata !{i32 786443, metadata !1319, i32 219, i32 0, metadata !909, i32 38} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2073 = metadata !{i32 225, i32 0, metadata !2074, null}
!2074 = metadata !{i32 786443, metadata !1331, i32 224, i32 0, metadata !909, i32 39} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2075 = metadata !{i32 226, i32 0, metadata !2074, null}
!2076 = metadata !{i32 231, i32 0, metadata !2077, null}
!2077 = metadata !{i32 786443, metadata !1341, i32 230, i32 0, metadata !909, i32 40} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2078 = metadata !{i32 235, i32 0, metadata !2079, null}
!2079 = metadata !{i32 786443, metadata !1352, i32 234, i32 0, metadata !909, i32 41} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2080 = metadata !{i32 239, i32 0, metadata !2081, null}
!2081 = metadata !{i32 786443, metadata !1359, i32 238, i32 0, metadata !909, i32 42} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2082 = metadata !{i32 240, i32 0, metadata !2081, null}
!2083 = metadata !{i32 245, i32 0, metadata !2084, null}
!2084 = metadata !{i32 786443, metadata !1367, i32 244, i32 0, metadata !909, i32 43} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2085 = metadata !{i32 250, i32 0, metadata !2086, null}
!2086 = metadata !{i32 786443, metadata !1377, i32 249, i32 0, metadata !909, i32 44} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2087 = metadata !{i32 255, i32 0, metadata !2088, null}
!2088 = metadata !{i32 786443, metadata !1388, i32 254, i32 0, metadata !909, i32 45} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2089 = metadata !{i32 260, i32 0, metadata !2090, null}
!2090 = metadata !{i32 786443, metadata !1396, i32 259, i32 0, metadata !909, i32 46} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2091 = metadata !{i32 264, i32 0, metadata !2092, null}
!2092 = metadata !{i32 786443, metadata !1405, i32 263, i32 0, metadata !909, i32 47} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2093 = metadata !{i32 15, i32 0, metadata !2094, null}
!2094 = metadata !{i32 786443, metadata !1432, i32 14, i32 0, metadata !1433, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2095 = metadata !{i32 16, i32 0, metadata !2094, null}
!2096 = metadata !{i32 20, i32 0, metadata !2097, null}
!2097 = metadata !{i32 786443, metadata !1500, i32 19, i32 0, metadata !1433, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2098 = metadata !{i32 21, i32 0, metadata !2097, null}
!2099 = metadata !{i32 25, i32 0, metadata !2100, null}
!2100 = metadata !{i32 786443, metadata !1507, i32 24, i32 0, metadata !1433, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2101 = metadata !{i32 29, i32 0, metadata !2102, null}
!2102 = metadata !{i32 786443, metadata !1514, i32 28, i32 0, metadata !1433, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2103 = metadata !{i32 33, i32 0, metadata !2104, null}
!2104 = metadata !{i32 786443, metadata !1521, i32 32, i32 0, metadata !1433, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2105 = metadata !{i32 34, i32 0, metadata !2104, null}
!2106 = metadata !{i32 38, i32 0, metadata !2107, null}
!2107 = metadata !{i32 786443, metadata !1529, i32 37, i32 0, metadata !1433, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2108 = metadata !{i32 42, i32 0, metadata !2109, null}
!2109 = metadata !{i32 786443, metadata !1532, i32 41, i32 0, metadata !1433, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2110 = metadata !{i32 46, i32 0, metadata !2111, null}
!2111 = metadata !{i32 786443, metadata !1538, i32 45, i32 0, metadata !1433, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2112 = metadata !{i32 50, i32 0, metadata !2113, null}
!2113 = metadata !{i32 786443, metadata !1545, i32 49, i32 0, metadata !1433, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2114 = metadata !{i32 54, i32 0, metadata !2115, null}
!2115 = metadata !{i32 786443, metadata !1546, i32 53, i32 0, metadata !1433, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2116 = metadata !{i32 55, i32 0, metadata !2115, null}
!2117 = metadata !{i32 59, i32 0, metadata !2118, null}
!2118 = metadata !{i32 786443, metadata !1552, i32 58, i32 0, metadata !1433, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2119 = metadata !{i32 60, i32 0, metadata !2118, null}
!2120 = metadata !{i32 64, i32 0, metadata !2121, null}
!2121 = metadata !{i32 786443, metadata !1556, i32 63, i32 0, metadata !1433, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2122 = metadata !{i32 65, i32 0, metadata !2121, null}
!2123 = metadata !{i32 69, i32 0, metadata !2124, null}
!2124 = metadata !{i32 786443, metadata !1564, i32 68, i32 0, metadata !1433, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2125 = metadata !{i32 73, i32 0, metadata !2126, null}
!2126 = metadata !{i32 786443, metadata !1570, i32 72, i32 0, metadata !1433, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2127 = metadata !{i32 77, i32 0, metadata !2128, null}
!2128 = metadata !{i32 786443, metadata !1586, i32 76, i32 0, metadata !1433, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2129 = metadata !{i32 81, i32 0, metadata !2130, null}
!2130 = metadata !{i32 786443, metadata !1598, i32 80, i32 0, metadata !1433, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2131 = metadata !{i32 85, i32 0, metadata !2132, null}
!2132 = metadata !{i32 786443, metadata !1606, i32 84, i32 0, metadata !1433, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2133 = metadata !{i32 89, i32 0, metadata !2134, null}
!2134 = metadata !{i32 786443, metadata !1614, i32 88, i32 0, metadata !1433, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2135 = metadata !{i32 93, i32 0, metadata !2136, null}
!2136 = metadata !{i32 786443, metadata !1620, i32 92, i32 0, metadata !1433, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2137 = metadata !{i32 97, i32 0, metadata !2138, null}
!2138 = metadata !{i32 786443, metadata !1626, i32 96, i32 0, metadata !1433, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2139 = metadata !{i32 19, i32 0, metadata !1647, null}
!2140 = metadata !{i32 23, i32 0, metadata !2141, null}
!2141 = metadata !{i32 786443, metadata !1648, i32 22, i32 0, metadata !1639, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c]
!2142 = metadata !{i32 27, i32 0, metadata !2143, null}
!2143 = metadata !{i32 786443, metadata !1651, i32 26, i32 0, metadata !1639, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c]
