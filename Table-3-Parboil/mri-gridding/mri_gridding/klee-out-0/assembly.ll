; ModuleID = 'mri-gridding'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3 = type { i32, i32, i32 }
%struct.ReconstructionSample = type { float, float, float, float, float, float }
%struct.float2 = type { float, float }
%struct.float4 = type { float, float, float, float }
%struct.pb_TimerSet = type { i32, %struct.pb_async_time_marker_list*, i64, i64, [8 x %struct.pb_Timer], [8 x %struct.pb_SubTimerList*] }
%struct.pb_async_time_marker_list = type { i8*, i32, i8*, %struct.pb_async_time_marker_list* }
%struct.pb_Timer = type { i32, i64, i64 }
%struct.pb_SubTimerList = type { %struct.pb_SubTimer*, %struct.pb_SubTimer* }
%struct.pb_SubTimer = type { i8*, %struct.pb_Timer, %struct.pb_SubTimer* }
%struct.parameters = type { i32, [3 x i32], [3 x i32], [3 x float], [3 x i32], float, float, i32, i32 }
%struct.cmplx = type { float, float }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.cudaDeviceProp = type { [256 x i8], i64, i64, i32, i32, i64, i32, [3 x i32], [3 x i32], i32, i64, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, [2 x i32], [2 x i32], [3 x i32], [2 x i32], [3 x i32], [3 x i32], i32, [2 x i32], [
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

@blockIdx = external global %struct.dim3
@blockDim = external global %struct.dim3
@threadIdx = external global %struct.dim3
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
@.str = private unnamed_addr constant [25 x i8] c"CUDA error: %s, line %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"gridNumElems: %u \0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"gridNumElems: %u end \0A\00", align 1
@.str3 = private unnamed_addr constant [41 x i8] c"size_y*size_z: %u, 4*dims.y*dims.z: %u \0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"aquisition.numsamples=%d\0A\00", align 1
@.str15 = private unnamed_addr constant [26 x i8] c"aquisition.kmax=%f %f %f\0A\00", align 1
@.str26 = private unnamed_addr constant [32 x i8] c"aquisition.matrixSize=%d %d %d\0A\00", align 1
@.str37 = private unnamed_addr constant [36 x i8] c"reconstruction.matrixSize=%d %d %d\0A\00", align 1
@.str48 = private unnamed_addr constant [30 x i8] c"gridding.matrixSize=%d %d %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"gridding.oversampling=%f\0A\00", align 1
@.str6 = private unnamed_addr constant [17 x i8] c"kernel.width=%f\0A\00", align 1
@.str7 = private unnamed_addr constant [18 x i8] c"kernel.useLUT=%d\0A\00", align 1
@.str8 = private unnamed_addr constant [42 x i8] c"  Total amount of GPU memory: %llu bytes\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"  Number of samples = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [24 x i8] c"  Grid Size = %dx%dx%d\0A\00", align 1
@.str12 = private unnamed_addr constant [32 x i8] c"  Input Matrix Size = %dx%dx%d\0A\00", align 1
@.str13 = private unnamed_addr constant [32 x i8] c"  Recon Matrix Size = %dx%dx%d\0A\00", align 1
@.str14 = private unnamed_addr constant [21 x i8] c"  Kernel Width = %f\0A\00", align 1
@.str159 = private unnamed_addr constant [25 x i8] c"  KMax = %.2f %.2f %.2f\0A\00", align 1
@.str16 = private unnamed_addr constant [21 x i8] c"  Oversampling = %f\0A\00", align 1
@.str17 = private unnamed_addr constant [20 x i8] c"  GPU Binsize = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [16 x i8] c"  Use LUT = %s\0A\00", align 1
@.str19 = private unnamed_addr constant [4 x i8] c"Yes\00", align 1
@.str20 = private unnamed_addr constant [3 x i8] c"No\00", align 1
@.str21 = private unnamed_addr constant [16 x i8] c"input/small.uks\00", align 1
@.str22 = private unnamed_addr constant [6 x i8] c".data\00", align 1
@.str23 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str24 = private unnamed_addr constant [26 x i8] c"ERROR: Could not open %s\0A\00", align 1
@.str2610 = private unnamed_addr constant [25 x i8] c"CUDA error: %s, line %d\0A\00", align 1
@.str31 = private unnamed_addr constant [19 x i8] c"gridNumElems: %d \0A\00", align 1
@str = private unnamed_addr constant [52 x i8] c"  Need at least 3GB of GPU memory for large dataset\00"
@str35 = private unnamed_addr constant [20 x i8] c"\0AReading parameters\00"
@str36 = private unnamed_addr constant [48 x i8] c"ERROR: Unable to allocate memory for input data\00"
@str37 = private unnamed_addr constant [32 x i8] c"ERROR: Could not open data file\00"
@str38 = private unnamed_addr constant [30 x i8] c"Reading input data from files\00"
@str39 = private unnamed_addr constant [37 x i8] c"Finish reading input data from files\00"
@str40 = private unnamed_addr constant [49 x i8] c"ERROR: Unable to allocate memory for output data\00"
@str41 = private unnamed_addr constant [21 x i8] c"Running CUDA version\00"
@.str10 = private unnamed_addr constant [65 x i8] c"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c\00", align 1
@.str111 = private unnamed_addr constant [15 x i8] c"divide by zero\00", align 1
@.str212 = private unnamed_addr constant [8 x i8] c"div.err\00", align 1
@.str135 = private unnamed_addr constant [11 x i8] c"GPU device\00", align 1
@cudaGetErrorString.tmp = private unnamed_addr constant [20 x i8] c"No Error Message\00\00\00\00", align 16
@msg = internal global [25 x i8] zeroinitializer, align 16

define void @_Z14binning_kerneljP20ReconstructionSamplePjS1_S1_jj(i32 %n, %struct.ReconstructionSample* nocapture %sample_g, i32* nocapture %idxKey_g, i32* nocapture %idxValue_g, i32* %binCount_g, i32 %binsize, i32 %gridNumElems) uwtable noinline {
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1655, !tbaa !1656
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1655, !tbaa !1656
  %mul = mul i32 %1, %0, !dbg !1655
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1655, !tbaa !1656
  %add = add i32 %mul, %2, !dbg !1655
  %cmp = icmp ult i32 %add, %n, !dbg !1659
  br i1 %cmp, label %if.then, label %if.end22, !dbg !1659

if.then:                                          ; preds = %entry
  %idxprom = zext i32 %add to i64, !dbg !1660
  %pt.sroa.1.8..idx26 = getelementptr inbounds %struct.ReconstructionSample* %sample_g, i64 %idxprom, i32 2, !dbg !1660
  %pt.sroa.1.8.copyload = load float* %pt.sroa.1.8..idx26, align 4, !dbg !1660
  %pt.sroa.2.12..idx27 = getelementptr inbounds %struct.ReconstructionSample* %sample_g, i64 %idxprom, i32 3, !dbg !1660
  %pt.sroa.2.12.copyload = load float* %pt.sroa.2.12..idx27, align 4, !dbg !1660
  %pt.sroa.3.16..idx28 = getelementptr inbounds %struct.ReconstructionSample* %sample_g, i64 %idxprom, i32 4, !dbg !1660
  %pt.sroa.3.16.copyload = load float* %pt.sroa.3.16..idx28, align 4, !dbg !1660
  %conv = fptoui float %pt.sroa.3.16.copyload to i32, !dbg !1662
  %3 = load i32* @_ZL9size_xy_c, align 4, !dbg !1662, !tbaa !1656
  %mul1 = mul i32 %conv, %3, !dbg !1662
  %conv2 = fptoui float %pt.sroa.2.12.copyload to i32, !dbg !1662
  %4 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 0), align 4, !dbg !1662, !tbaa !1656
  %mul3 = mul i32 %4, %conv2, !dbg !1662
  %conv5 = fptoui float %pt.sroa.1.8.copyload to i32, !dbg !1662
  %add4 = add i32 %mul1, %conv5, !dbg !1662
  %add6 = add i32 %add4, %mul3, !dbg !1662
  %idxprom7 = zext i32 %add6 to i64, !dbg !1663
  %arrayidx8 = getelementptr inbounds i32* %binCount_g, i64 %idxprom7, !dbg !1663
  %5 = load i32* %arrayidx8, align 4, !dbg !1663, !tbaa !1656
  %cmp9 = icmp ult i32 %5, %binsize, !dbg !1663
  br i1 %cmp9, label %if.then10, label %if.end17, !dbg !1663

if.then10:                                        ; preds = %if.then
  %call.i = tail call i32 @__uAtomicAdd(i32* %arrayidx8, i32 1), !dbg !1664
  %cmp11 = icmp ult i32 %call.i, %binsize, !dbg !1668
  br i1 %cmp11, label %if.end17, label %if.else, !dbg !1668

if.else:                                          ; preds = %if.then10
  %call.i38 = tail call i32 @__uAtomicAdd(i32* %arrayidx8, i32 -1), !dbg !1669
  br label %if.end17

if.end17:                                         ; preds = %if.else, %if.then10, %if.then
  %key.0 = phi i32 [ %gridNumElems, %if.else ], [ %add6, %if.then10 ], [ %gridNumElems, %if.then ]
  %arrayidx19 = getelementptr inbounds i32* %idxKey_g, i64 %idxprom, !dbg !1673
  store i32 %key.0, i32* %arrayidx19, align 4, !dbg !1673, !tbaa !1656
  %arrayidx21 = getelementptr inbounds i32* %idxValue_g, i64 %idxprom, !dbg !1674
  store i32 %add, i32* %arrayidx21, align 4, !dbg !1674, !tbaa !1656
  br label %if.end22, !dbg !1675

if.end22:                                         ; preds = %if.end17, %entry
  ret void, !dbg !1676
}

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define void @_Z14reorder_kerneliPjP20ReconstructionSample17sampleArrayStruct(i32 %n, i32* nocapture %idxValue_g, %struct.ReconstructionSample* nocapture %samples_g, %struct.float2* nocapture %sortedSampleSoA_g.coerce0, %struct.float4* nocapture %sortedSa
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1677, !tbaa !1656
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1677, !tbaa !1656
  %mul = mul i32 %1, %0, !dbg !1677
  %2 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1677, !tbaa !1656
  %add = add i32 %mul, %2, !dbg !1677
  %cmp = icmp ult i32 %add, %n, !dbg !1678
  br i1 %cmp, label %if.then, label %if.end, !dbg !1678

if.then:                                          ; preds = %entry
  %idxprom = zext i32 %add to i64, !dbg !1679
  %arrayidx = getelementptr inbounds i32* %idxValue_g, i64 %idxprom, !dbg !1679
  %3 = load i32* %arrayidx, align 4, !dbg !1679, !tbaa !1656
  %idxprom1 = zext i32 %3 to i64, !dbg !1680
  %pt.sroa.0.0..idx = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 0, !dbg !1680
  %pt.sroa.0.0.copyload = load float* %pt.sroa.0.0..idx, align 4, !dbg !1680
  %pt.sroa.1.4..idx15 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 1, !dbg !1680
  %pt.sroa.1.4.copyload = load float* %pt.sroa.1.4..idx15, align 4, !dbg !1680
  %pt.sroa.2.8..idx16 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 2, !dbg !1680
  %pt.sroa.2.8.copyload = load float* %pt.sroa.2.8..idx16, align 4, !dbg !1680
  %pt.sroa.3.12..idx17 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 3, !dbg !1680
  %pt.sroa.3.12.copyload = load float* %pt.sroa.3.12..idx17, align 4, !dbg !1680
  %pt.sroa.4.16..idx18 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 4, !dbg !1680
  %pt.sroa.4.16.copyload = load float* %pt.sroa.4.16..idx18, align 4, !dbg !1680
  %pt.sroa.5.20..idx19 = getelementptr inbounds %struct.ReconstructionSample* %samples_g, i64 %idxprom1, i32 5, !dbg !1680
  %pt.sroa.5.20.copyload = load float* %pt.sroa.5.20..idx19, align 4, !dbg !1680
  %data.sroa.0.0..idx = getelementptr inbounds %struct.float2* %sortedSampleSoA_g.coerce0, i64 %idxprom, i32 0, !dbg !1681
  store float %pt.sroa.0.0.copyload, float* %data.sroa.0.0..idx, align 8, !dbg !1681
  %data.sroa.1.4..idx14 = getelementptr inbounds %struct.float2* %sortedSampleSoA_g.coerce0, i64 %idxprom, i32 1, !dbg !1681
  store float %pt.sroa.1.4.copyload, float* %data.sroa.1.4..idx14, align 4, !dbg !1681
  %loc.sroa.0.0..idx = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 0, !dbg !1682
  store float %pt.sroa.2.8.copyload, float* %loc.sroa.0.0..idx, align 16, !dbg !1682
  %loc.sroa.1.4..idx11 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 1, !dbg !1682
  store float %pt.sroa.3.12.copyload, float* %loc.sroa.1.4..idx11, align 4, !dbg !1682
  %loc.sroa.2.8..idx12 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 2, !dbg !1682
  store float %pt.sroa.4.16.copyload, float* %loc.sroa.2.8..idx12, align 8, !dbg !1682
  %loc.sroa.3.12..idx13 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 3, !dbg !1682
  store float %pt.sroa.5.20.copyload, float* %loc.sroa.3.12..idx13, align 4, !dbg !1682
  br label %if.end, !dbg !1683

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !1684
}

define float @_Z12kernel_valuef(float %v) uwtable section "__device__" {
entry:
  %mul = fmul float %v, %v, !dbg !1685
  %mul1 = fmul float %mul, 0x3B39752860000000, !dbg !1686
  %add = fadd float %mul1, 0x3BE67934C0000000, !dbg !1686
  %mul2 = fmul float %mul, %add, !dbg !1686
  %add3 = fadd float %mul2, 0x3C8BA34A20000000, !dbg !1686
  %mul4 = fmul float %mul, %add3, !dbg !1686
  %add5 = fadd float %mul4, 0x3D287ED380000000, !dbg !1686
  %mul6 = fmul float %mul, %add5, !dbg !1686
  %add7 = fadd float %mul6, 0x3DC08B3AA0000000, !dbg !1686
  %mul8 = fmul float %mul, %add7, !dbg !1686
  %add9 = fadd float %mul8, 0x3E51343900000000, !dbg !1686
  %mul10 = fmul float %mul, %add9, !dbg !1686
  %add11 = fadd float %mul10, 0x3EDB777D00000000, !dbg !1686
  %mul12 = fmul float %mul, %add11, !dbg !1686
  %add13 = fadd float %mul12, 0x3F6098A4A0000000, !dbg !1686
  %mul14 = fmul float %mul, %add13, !dbg !1686
  %add15 = fadd float %mul14, 0x3FDDA30AC0000000, !dbg !1686
  %mul16 = fmul float %mul, %add15, !dbg !1686
  %add17 = fadd float %mul16, 0x4052DBC240000000, !dbg !1686
  %mul18 = fmul float %mul, %add17, !dbg !1686
  %add19 = fadd float %mul18, 0x40C039F680000000, !dbg !1686
  %mul20 = fmul float %mul, %add19, !dbg !1686
  %add21 = fadd float %mul20, 0x4121721A40000000, !dbg !1686
  %mul22 = fmul float %mul, %add21, !dbg !1686
  %add23 = fadd float %mul22, 0x4174A39560000000, !dbg !1686
  %mul24 = fmul float %mul, %add23, !dbg !1686
  %add25 = fadd float %mul24, 0x41B541F680000000, !dbg !1686
  %mul26 = fmul float %mul, %add25, !dbg !1686
  %add27 = fadd float %mul26, 0x41D57701A0000000, !dbg !1686
  %sub = fadd float %mul, 0xC0A808F040000000, !dbg !1687
  %mul28 = fmul float %mul, %sub, !dbg !1687
  %add29 = fadd float %mul28, 0x414A8593A0000000, !dbg !1687
  %mul30 = fmul float %mul, %add29, !dbg !1687
  %sub31 = fadd float %mul30, 0xC1D57701A0000000, !dbg !1687
  %sub32 = fsub float -0.000000e+00, %add27, !dbg !1688
  %call = tail call float @__fdividef(float %sub32, float %sub31), !dbg !1688
  ret float %call, !dbg !1689
}

declare float @__fdividef(float, float) section "__device__"

define void @_Z12gridding_GPU17sampleArrayStructPjP6float2Pff(%struct.float2* nocapture %sortedSampleSoA_g.coerce0, %struct.float4* nocapture %sortedSampleSoA_g.coerce1, i32* nocapture %binStartAddr_g, %struct.float2* nocapture %gridData_g, float* nocapt
entry:
  %0 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 2), align 4, !dbg !1690, !tbaa !1656
  %1 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 1), align 4, !dbg !1690, !tbaa !1656
  %mul = mul i32 %1, %0, !dbg !1690
  %2 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 0), align 4, !dbg !1690, !tbaa !1656
  %3 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 1), align 4, !dbg !1690, !tbaa !1656
  %mul1436 = add i32 %3, %mul, !dbg !1690
  %add = mul i32 %mul1436, %2, !dbg !1690
  %4 = load i32* getelementptr inbounds (%struct.dim3* @threadIdx, i64 0, i32 0), align 4, !dbg !1690, !tbaa !1656
  %add3 = add i32 %add, %4, !dbg !1690
  %5 = load i32* getelementptr inbounds (%struct.dim3* @blockDim, i64 0, i32 2), align 4, !dbg !1691, !tbaa !1656
  %mul4 = shl i32 %5, 2, !dbg !1691
  %6 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 1), align 4, !dbg !1691, !tbaa !1656
  %7 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 1), align 4, !dbg !1691, !tbaa !1656
  %int_cast_to_i64 = zext i32 %1 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %div = udiv i32 %7, %1, !dbg !1691
  %int_cast_to_i641 = zext i32 %div to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i641)
  %div5 = udiv i32 %6, %div, !dbg !1691
  %mul6 = mul i32 %div5, %mul4, !dbg !1691
  %int_cast_to_i642 = zext i32 %div to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i642)
  %rem = urem i32 %6, %div, !dbg !1692
  %mul8 = mul i32 %rem, %1, !dbg !1692
  %8 = load i32* getelementptr inbounds (%struct.dim3* @blockIdx, i64 0, i32 0), align 4, !dbg !1693, !tbaa !1656
  %mul9 = mul i32 %8, %2, !dbg !1693
  %add10 = add i32 %mul9, %4, !dbg !1694
  %add11 = add i32 %mul8, %3, !dbg !1695
  %add12 = add i32 %mul6, %0, !dbg !1696
  %add13 = add i32 %add12, %5, !dbg !1697
  %add14 = add i32 %add13, %5, !dbg !1698
  %conv = sitofp i32 %mul9 to float, !dbg !1699
  %9 = load float* @_ZL8cutoff_c, align 4, !dbg !1699, !tbaa !1700
  %call.i = tail call float @ceilf(float %9) nounwind readnone, !dbg !1701
  %sub = fsub float %conv, %call.i, !dbg !1699
  %conv16 = fptosi float %sub to i32, !dbg !1699
  %add17 = add i32 %mul9, %2, !dbg !1703
  %conv18 = uitofp i32 %add17 to float, !dbg !1703
  %add19 = fadd float %9, %conv18, !dbg !1703
  %conv20 = fptosi float %add19 to i32, !dbg !1703
  %10 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 0), align 4, !dbg !1704, !tbaa !1656
  %conv27 = sitofp i32 %mul8 to float, !dbg !1705
  %sub29 = fsub float %conv27, %call.i, !dbg !1705
  %conv30 = fptosi float %sub29 to i32, !dbg !1705
  %cmp31 = icmp slt i32 %conv30, 0, !dbg !1706
  %cond35 = select i1 %cmp31, i32 0, i32 %conv30, !dbg !1706
  %add36 = add i32 %mul8, %1, !dbg !1707
  %conv37 = uitofp i32 %add36 to float, !dbg !1707
  %add38 = fadd float %9, %conv37, !dbg !1707
  %conv39 = fptosi float %add38 to i32, !dbg !1707
  %cmp40 = icmp slt i32 %conv39, %7, !dbg !1708
  %sub42 = add nsw i32 %7, -1, !dbg !1708
  %cond45 = select i1 %cmp40, i32 %conv39, i32 %sub42, !dbg !1708
  %conv46 = sitofp i32 %mul6 to float, !dbg !1709
  %sub48 = fsub float %conv46, %call.i, !dbg !1709
  %conv49 = fptosi float %sub48 to i32, !dbg !1709
  %cmp50 = icmp slt i32 %conv49, 0, !dbg !1710
  %cond54 = select i1 %cmp50, i32 0, i32 %conv49, !dbg !1710
  %add56 = add i32 %mul6, %mul4, !dbg !1711
  %conv57 = uitofp i32 %add56 to float, !dbg !1711
  %add58 = fadd float %conv57, %9, !dbg !1711
  %conv59 = fptosi float %add58 to i32, !dbg !1711
  %11 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 2), align 4, !dbg !1712, !tbaa !1656
  %cmp60 = icmp slt i32 %conv59, %11, !dbg !1712
  %sub62 = add nsw i32 %11, -1, !dbg !1712
  %cond65 = select i1 %cmp60, i32 %conv59, i32 %sub62, !dbg !1712
  %12 = load i32* @_ZL9size_xy_c, align 4, !dbg !1713, !tbaa !1656
  %mul66 = mul nsw i32 %12, %add12, !dbg !1713
  %mul67 = mul nsw i32 %10, %add11, !dbg !1713
  %add68 = add i32 %mul67, %add10, !dbg !1713
  %add69 = add i32 %add68, %mul66, !dbg !1713
  %mul70 = mul i32 %12, %5, !dbg !1714
  %add71 = add i32 %add69, %mul70, !dbg !1714
  %add73 = add i32 %add71, %mul70, !dbg !1715
  %add75 = add i32 %add73, %mul70, !dbg !1716
  %cmp82627 = icmp sgt i32 %cond54, %cond65, !dbg !1717
  br i1 %cmp82627, label %for.end305, label %for.cond84.preheader.lr.ph, !dbg !1717

for.cond84.preheader.lr.ph:                       ; preds = %entry
  %sub23 = add nsw i32 %10, -1, !dbg !1704
  %cmp21 = icmp slt i32 %conv20, %10, !dbg !1704
  %cond26 = select i1 %cmp21, i32 %conv20, i32 %sub23, !dbg !1704
  %cmp = icmp slt i32 %conv16, 0, !dbg !1718
  %add15 = add i32 %add14, %5, !dbg !1719
  %cmp85601 = icmp sgt i32 %cond35, %cond45, !dbg !1720
  %13 = sext i32 %conv16 to i64, !dbg !1721
  %idx.ext91 = select i1 %cmp, i64 0, i64 %13, !dbg !1721
  %idx.ext93 = sext i32 %cond26 to i64, !dbg !1722
  %add.ptr90.sum437 = add i64 %idx.ext93, 1, !dbg !1722
  %idxprom121 = sext i32 %add3 to i64, !dbg !1723
  %arrayidx122 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6real_s, i64 0, i64 %idxprom121, !dbg !1723
  %arrayidx125 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6imag_s, i64 0, i64 %idxprom121, !dbg !1724
  %arrayidx128 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kx_s, i64 0, i64 %idxprom121, !dbg !1725
  %arrayidx131 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4ky_s, i64 0, i64 %idxprom121, !dbg !1726
  %arrayidx134 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kz_s, i64 0, i64 %idxprom121, !dbg !1727
  %arrayidx136 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE5sdc_s, i64 0, i64 %idxprom121, !dbg !1728
  %conv155 = sitofp i32 %add10 to float, !dbg !1729
  %conv164 = sitofp i32 %add11 to float, !dbg !1730
  %conv174 = sitofp i32 %add12 to float, !dbg !1731
  %conv205 = sitofp i32 %add13 to float, !dbg !1732
  %conv236 = sitofp i32 %add14 to float, !dbg !1733
  %conv267 = sitofp i32 %add15 to float, !dbg !1734
  br label %for.cond84.preheader, !dbg !1717

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
  br i1 %cmp85601, label %for.inc303, label %for.body86, !dbg !1720

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
  %14 = load i32* @_ZL9size_xy_c, align 4, !dbg !1735, !tbaa !1656
  %mul87 = mul nsw i32 %14, %z.0628, !dbg !1735
  %idx.ext = sext i32 %mul87 to i64, !dbg !1735
  %15 = load i32* getelementptr inbounds ([3 x i32]* @_ZL10gridSize_c, i64 0, i64 0), align 4, !dbg !1735, !tbaa !1656
  %mul88 = mul nsw i32 %15, %y83.0602, !dbg !1735
  %idx.ext89 = sext i32 %mul88 to i64, !dbg !1735
  %add.ptr.sum = add i64 %idx.ext89, %idx.ext, !dbg !1735
  %add.ptr90.sum = add i64 %add.ptr.sum, %idx.ext91, !dbg !1721
  %add.ptr92 = getelementptr inbounds i32* %binStartAddr_g, i64 %add.ptr90.sum, !dbg !1721
  %16 = load i32* %add.ptr92, align 4, !dbg !1721, !tbaa !1656
  %add.ptr94.sum = add i64 %add.ptr90.sum437, %add.ptr.sum, !dbg !1722
  %add.ptr95 = getelementptr inbounds i32* %binStartAddr_g, i64 %add.ptr94.sum, !dbg !1722
  %17 = load i32* %add.ptr95, align 4, !dbg !1722, !tbaa !1656
  %sub96 = sub i32 %17, %16, !dbg !1736
  %sub100 = add i32 %sub96, 63, !dbg !1737
  %shr = lshr i32 %sub100, 6, !dbg !1737
  %cmp101575 = icmp eq i32 %shr, 0, !dbg !1737
  br i1 %cmp101575, label %for.inc300, label %for.body102.lr.ph, !dbg !1737

for.body102.lr.ph:                                ; preds = %for.body86
  %add112 = add i32 %16, %add3, !dbg !1738
  %18 = add i32 %16, -1, !dbg !1737
  %19 = sub i32 %18, %17, !dbg !1737
  br label %for.body102, !dbg !1737

for.body102:                                      ; preds = %for.inc297, %for.body102.lr.ph
  %indvars.iv656 = phi i64 [ 0, %for.body102.lr.ph ], [ %indvars.iv.next657, %for.inc297 ]
  %indvars.iv654 = phi i32 [ %19, %for.body102.lr.ph ], [ %indvars.iv.next655, %for.inc297 ], !dbg !1739
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
  %20 = icmp ugt i32 %indvars.iv654, -65, !dbg !1737
  %indvars.iv654.op = xor i32 %indvars.iv654, -1, !dbg !1740
  %21 = select i1 %20, i32 %indvars.iv654.op, i32 64, !dbg !1740
  %22 = shl i64 %indvars.iv656, 6, !dbg !1740
  %23 = trunc i64 %22 to i32, !dbg !1740
  %sub103 = sub i32 %sub96, %23, !dbg !1740
  %cmp104 = icmp ugt i32 %sub103, 64, !dbg !1740
  %.sub103 = select i1 %cmp104, i32 64, i32 %sub103, !dbg !1740
  tail call void @__syncthreads(), !dbg !1741
  %cmp113 = icmp slt i32 %add3, %.sub103, !dbg !1742
  br i1 %cmp113, label %if.then, label %if.end, !dbg !1742

if.then:                                          ; preds = %for.body102
  %add114 = add i32 %add112, %23, !dbg !1743
  %idxprom = zext i32 %add114 to i64, !dbg !1743
  %data.sroa.0.0..idx = getelementptr inbounds %struct.float2* %sortedSampleSoA_g.coerce0, i64 %idxprom, i32 0, !dbg !1743
  %data.sroa.0.0.copyload = load float* %data.sroa.0.0..idx, align 8, !dbg !1743
  %data.sroa.1.4..idx365 = getelementptr inbounds %struct.float2* %sortedSampleSoA_g.coerce0, i64 %idxprom, i32 1, !dbg !1743
  %data.sroa.1.4.copyload = load float* %data.sroa.1.4..idx365, align 4, !dbg !1743
  %loc.sroa.0.0..idx = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 0, !dbg !1744
  %loc.sroa.0.0.copyload = load float* %loc.sroa.0.0..idx, align 16, !dbg !1744
  %loc.sroa.1.4..idx362 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 1, !dbg !1744
  %loc.sroa.1.4.copyload = load float* %loc.sroa.1.4..idx362, align 4, !dbg !1744
  %loc.sroa.2.8..idx363 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 2, !dbg !1744
  %loc.sroa.2.8.copyload = load float* %loc.sroa.2.8..idx363, align 8, !dbg !1744
  %loc.sroa.3.12..idx364 = getelementptr inbounds %struct.float4* %sortedSampleSoA_g.coerce1, i64 %idxprom, i32 3, !dbg !1744
  %loc.sroa.3.12.copyload = load float* %loc.sroa.3.12..idx364, align 4, !dbg !1744
  store float %data.sroa.0.0.copyload, float* %arrayidx122, align 4, !dbg !1723, !tbaa !1700
  store float %data.sroa.1.4.copyload, float* %arrayidx125, align 4, !dbg !1724, !tbaa !1700
  store float %loc.sroa.0.0.copyload, float* %arrayidx128, align 4, !dbg !1725, !tbaa !1700
  store float %loc.sroa.1.4.copyload, float* %arrayidx131, align 4, !dbg !1726, !tbaa !1700
  store float %loc.sroa.2.8.copyload, float* %arrayidx134, align 4, !dbg !1727, !tbaa !1700
  store float %loc.sroa.3.12.copyload, float* %arrayidx136, align 4, !dbg !1728, !tbaa !1700
  br label %if.end, !dbg !1745

if.end:                                           ; preds = %if.then, %for.body102
  tail call void @__syncthreads(), !dbg !1746
  %cmp138550 = icmp sgt i32 %.sub103, 0, !dbg !1739
  br i1 %cmp138550, label %for.body139, label %for.inc297, !dbg !1739

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
  %arrayidx141 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6real_s, i64 0, i64 %indvars.iv, !dbg !1747
  %24 = load float* %arrayidx141, align 4, !dbg !1747, !tbaa !1700
  %arrayidx143 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6imag_s, i64 0, i64 %indvars.iv, !dbg !1748
  %25 = load float* %arrayidx143, align 4, !dbg !1748, !tbaa !1700
  %arrayidx145 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE5sdc_s, i64 0, i64 %indvars.iv, !dbg !1749
  %26 = load float* %arrayidx145, align 4, !dbg !1749, !tbaa !1700
  %cmp147 = fcmp une float %24, 0.000000e+00, !dbg !1750
  %cmp149 = fcmp une float %25, 0.000000e+00, !dbg !1750
  %or.cond = or i1 %cmp147, %cmp149, !dbg !1750
  %cmp151 = fcmp une float %26, 0.000000e+00, !dbg !1750
  %or.cond438 = and i1 %or.cond, %cmp151, !dbg !1750
  br i1 %or.cond438, label %if.then152, label %for.inc, !dbg !1750

if.then152:                                       ; preds = %for.body139
  %arrayidx154 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kx_s, i64 0, i64 %indvars.iv, !dbg !1729
  %27 = load float* %arrayidx154, align 4, !dbg !1729, !tbaa !1700
  %sub156 = fsub float %27, %conv155, !dbg !1729
  %mul161 = fmul float %sub156, %sub156, !dbg !1729
  %arrayidx163 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4ky_s, i64 0, i64 %indvars.iv, !dbg !1730
  %28 = load float* %arrayidx163, align 4, !dbg !1730, !tbaa !1700
  %sub165 = fsub float %28, %conv164, !dbg !1730
  %mul170 = fmul float %sub165, %sub165, !dbg !1730
  %add171 = fadd float %mul161, %mul170, !dbg !1730
  %arrayidx173 = getelementptr inbounds [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kz_s, i64 0, i64 %indvars.iv, !dbg !1731
  %29 = load float* %arrayidx173, align 4, !dbg !1731, !tbaa !1700
  %sub175 = fsub float %29, %conv174, !dbg !1731
  %mul180 = fmul float %sub175, %sub175, !dbg !1731
  %add181 = fadd float %add171, %mul180, !dbg !1731
  %30 = load float* @_ZL9cutoff2_c, align 4, !dbg !1751, !tbaa !1700
  %cmp182 = fcmp olt float %add181, %30, !dbg !1751
  br i1 %cmp182, label %if.then183, label %if.end202, !dbg !1751

if.then183:                                       ; preds = %if.then152
  %31 = load float* @_ZL15_1overCutoff2_c, align 4, !dbg !1752, !tbaa !1700
  %mul185 = fmul float %add181, %31, !dbg !1752
  %conv188 = fsub float 1.000000e+00, %mul185, !dbg !1752
  %call189 = tail call float @sqrtf(float %conv188) nounwind, !dbg !1752
  %mul190 = fmul float %call189, %beta, !dbg !1752
  %mul.i = fmul float %mul190, %mul190, !dbg !1753
  %mul1.i = fmul float %mul.i, 0x3B39752860000000, !dbg !1754
  %add.i = fadd float %mul1.i, 0x3BE67934C0000000, !dbg !1754
  %mul2.i = fmul float %mul.i, %add.i, !dbg !1754
  %add3.i = fadd float %mul2.i, 0x3C8BA34A20000000, !dbg !1754
  %mul4.i = fmul float %mul.i, %add3.i, !dbg !1754
  %add5.i = fadd float %mul4.i, 0x3D287ED380000000, !dbg !1754
  %mul6.i = fmul float %mul.i, %add5.i, !dbg !1754
  %add7.i = fadd float %mul6.i, 0x3DC08B3AA0000000, !dbg !1754
  %mul8.i = fmul float %mul.i, %add7.i, !dbg !1754
  %add9.i = fadd float %mul8.i, 0x3E51343900000000, !dbg !1754
  %mul10.i = fmul float %mul.i, %add9.i, !dbg !1754
  %add11.i = fadd float %mul10.i, 0x3EDB777D00000000, !dbg !1754
  %mul12.i = fmul float %mul.i, %add11.i, !dbg !1754
  %add13.i = fadd float %mul12.i, 0x3F6098A4A0000000, !dbg !1754
  %mul14.i = fmul float %mul.i, %add13.i, !dbg !1754
  %add15.i = fadd float %mul14.i, 0x3FDDA30AC0000000, !dbg !1754
  %mul16.i = fmul float %mul.i, %add15.i, !dbg !1754
  %add17.i = fadd float %mul16.i, 0x4052DBC240000000, !dbg !1754
  %mul18.i = fmul float %mul.i, %add17.i, !dbg !1754
  %add19.i = fadd float %mul18.i, 0x40C039F680000000, !dbg !1754
  %mul20.i = fmul float %mul.i, %add19.i, !dbg !1754
  %add21.i = fadd float %mul20.i, 0x4121721A40000000, !dbg !1754
  %mul22.i = fmul float %mul.i, %add21.i, !dbg !1754
  %add23.i = fadd float %mul22.i, 0x4174A39560000000, !dbg !1754
  %mul24.i = fmul float %mul.i, %add23.i, !dbg !1754
  %add25.i = fadd float %mul24.i, 0x41B541F680000000, !dbg !1754
  %mul26.i = fmul float %mul.i, %add25.i, !dbg !1754
  %add27.i = fadd float %mul26.i, 0x41D57701A0000000, !dbg !1754
  %sub.i = fadd float %mul.i, 0xC0A808F040000000, !dbg !1755
  %mul28.i = fmul float %mul.i, %sub.i, !dbg !1755
  %add29.i = fadd float %mul28.i, 0x414A8593A0000000, !dbg !1755
  %mul30.i = fmul float %mul.i, %add29.i, !dbg !1755
  %sub31.i = fadd float %mul30.i, 0xC1D57701A0000000, !dbg !1755
  %sub32.i = fsub float -0.000000e+00, %add27.i, !dbg !1756
  %call.i441 = tail call float @__fdividef(float %sub32.i, float %sub31.i), !dbg !1756
  %mul192 = fmul float %26, %call.i441, !dbg !1752
  %mul193 = fmul float %24, %mul192, !dbg !1757
  %add195 = fadd float %pt.sroa.0.3562, %mul193, !dbg !1757
  %mul196 = fmul float %25, %mul192, !dbg !1758
  %add198 = fadd float %pt.sroa.1.3563, %mul196, !dbg !1758
  %conv201 = fadd float %density.3561, 1.000000e+00, !dbg !1759
  %.pre = load float* %arrayidx173, align 4, !dbg !1732, !tbaa !1700
  %.pre659 = load float* @_ZL9cutoff2_c, align 4, !dbg !1760, !tbaa !1700
  br label %if.end202, !dbg !1761

if.end202:                                        ; preds = %if.then183, %if.then152
  %32 = phi float [ %.pre659, %if.then183 ], [ %30, %if.then152 ]
  %33 = phi float [ %.pre, %if.then183 ], [ %29, %if.then152 ]
  %density.4 = phi float [ %conv201, %if.then183 ], [ %density.3561, %if.then152 ]
  %pt.sroa.0.4 = phi float [ %add195, %if.then183 ], [ %pt.sroa.0.3562, %if.then152 ]
  %pt.sroa.1.4 = phi float [ %add198, %if.then183 ], [ %pt.sroa.1.3563, %if.then152 ]
  %sub206 = fsub float %33, %conv205, !dbg !1732
  %mul211 = fmul float %sub206, %sub206, !dbg !1732
  %add212 = fadd float %add171, %mul211, !dbg !1732
  %cmp213 = fcmp olt float %add212, %32, !dbg !1760
  br i1 %cmp213, label %if.then214, label %if.end233, !dbg !1760

if.then214:                                       ; preds = %if.end202
  %34 = load float* @_ZL15_1overCutoff2_c, align 4, !dbg !1762, !tbaa !1700
  %mul216 = fmul float %add212, %34, !dbg !1762
  %conv219 = fsub float 1.000000e+00, %mul216, !dbg !1762
  %call220 = tail call float @sqrtf(float %conv219) nounwind, !dbg !1762
  %mul221 = fmul float %call220, %beta, !dbg !1762
  %mul.i442 = fmul float %mul221, %mul221, !dbg !1763
  %mul1.i443 = fmul float %mul.i442, 0x3B39752860000000, !dbg !1764
  %add.i444 = fadd float %mul1.i443, 0x3BE67934C0000000, !dbg !1764
  %mul2.i445 = fmul float %mul.i442, %add.i444, !dbg !1764
  %add3.i446 = fadd float %mul2.i445, 0x3C8BA34A20000000, !dbg !1764
  %mul4.i447 = fmul float %mul.i442, %add3.i446, !dbg !1764
  %add5.i448 = fadd float %mul4.i447, 0x3D287ED380000000, !dbg !1764
  %mul6.i449 = fmul float %mul.i442, %add5.i448, !dbg !1764
  %add7.i450 = fadd float %mul6.i449, 0x3DC08B3AA0000000, !dbg !1764
  %mul8.i451 = fmul float %mul.i442, %add7.i450, !dbg !1764
  %add9.i452 = fadd float %mul8.i451, 0x3E51343900000000, !dbg !1764
  %mul10.i453 = fmul float %mul.i442, %add9.i452, !dbg !1764
  %add11.i454 = fadd float %mul10.i453, 0x3EDB777D00000000, !dbg !1764
  %mul12.i455 = fmul float %mul.i442, %add11.i454, !dbg !1764
  %add13.i456 = fadd float %mul12.i455, 0x3F6098A4A0000000, !dbg !1764
  %mul14.i457 = fmul float %mul.i442, %add13.i456, !dbg !1764
  %add15.i458 = fadd float %mul14.i457, 0x3FDDA30AC0000000, !dbg !1764
  %mul16.i459 = fmul float %mul.i442, %add15.i458, !dbg !1764
  %add17.i460 = fadd float %mul16.i459, 0x4052DBC240000000, !dbg !1764
  %mul18.i461 = fmul float %mul.i442, %add17.i460, !dbg !1764
  %add19.i462 = fadd float %mul18.i461, 0x40C039F680000000, !dbg !1764
  %mul20.i463 = fmul float %mul.i442, %add19.i462, !dbg !1764
  %add21.i464 = fadd float %mul20.i463, 0x4121721A40000000, !dbg !1764
  %mul22.i465 = fmul float %mul.i442, %add21.i464, !dbg !1764
  %add23.i466 = fadd float %mul22.i465, 0x4174A39560000000, !dbg !1764
  %mul24.i467 = fmul float %mul.i442, %add23.i466, !dbg !1764
  %add25.i468 = fadd float %mul24.i467, 0x41B541F680000000, !dbg !1764
  %mul26.i469 = fmul float %mul.i442, %add25.i468, !dbg !1764
  %add27.i470 = fadd float %mul26.i469, 0x41D57701A0000000, !dbg !1764
  %sub.i471 = fadd float %mul.i442, 0xC0A808F040000000, !dbg !1765
  %mul28.i472 = fmul float %mul.i442, %sub.i471, !dbg !1765
  %add29.i473 = fadd float %mul28.i472, 0x414A8593A0000000, !dbg !1765
  %mul30.i474 = fmul float %mul.i442, %add29.i473, !dbg !1765
  %sub31.i475 = fadd float %mul30.i474, 0xC1D57701A0000000, !dbg !1765
  %sub32.i476 = fsub float -0.000000e+00, %add27.i470, !dbg !1766
  %call.i477 = tail call float @__fdividef(float %sub32.i476, float %sub31.i475), !dbg !1766
  %mul223 = fmul float %26, %call.i477, !dbg !1762
  %mul224 = fmul float %24, %mul223, !dbg !1767
  %add226 = fadd float %pt1.sroa.0.3559, %mul224, !dbg !1767
  %mul227 = fmul float %25, %mul223, !dbg !1768
  %add229 = fadd float %pt1.sroa.1.3560, %mul227, !dbg !1768
  %conv232 = fadd float %density1.3558, 1.000000e+00, !dbg !1769
  %.pre660 = load float* %arrayidx173, align 4, !dbg !1733, !tbaa !1700
  %.pre661 = load float* @_ZL9cutoff2_c, align 4, !dbg !1770, !tbaa !1700
  br label %if.end233, !dbg !1771

if.end233:                                        ; preds = %if.then214, %if.end202
  %35 = phi float [ %.pre661, %if.then214 ], [ %32, %if.end202 ]
  %36 = phi float [ %.pre660, %if.then214 ], [ %33, %if.end202 ]
  %density1.4 = phi float [ %conv232, %if.then214 ], [ %density1.3558, %if.end202 ]
  %pt1.sroa.0.4 = phi float [ %add226, %if.then214 ], [ %pt1.sroa.0.3559, %if.end202 ]
  %pt1.sroa.1.4 = phi float [ %add229, %if.then214 ], [ %pt1.sroa.1.3560, %if.end202 ]
  %sub237 = fsub float %36, %conv236, !dbg !1733
  %mul242 = fmul float %sub237, %sub237, !dbg !1733
  %add243 = fadd float %add171, %mul242, !dbg !1733
  %cmp244 = fcmp olt float %add243, %35, !dbg !1770
  br i1 %cmp244, label %if.then245, label %if.end264, !dbg !1770

if.then245:                                       ; preds = %if.end233
  %37 = load float* @_ZL15_1overCutoff2_c, align 4, !dbg !1772, !tbaa !1700
  %mul247 = fmul float %add243, %37, !dbg !1772
  %conv250 = fsub float 1.000000e+00, %mul247, !dbg !1772
  %call251 = tail call float @sqrtf(float %conv250) nounwind, !dbg !1772
  %mul252 = fmul float %call251, %beta, !dbg !1772
  %mul.i478 = fmul float %mul252, %mul252, !dbg !1773
  %mul1.i479 = fmul float %mul.i478, 0x3B39752860000000, !dbg !1774
  %add.i480 = fadd float %mul1.i479, 0x3BE67934C0000000, !dbg !1774
  %mul2.i481 = fmul float %mul.i478, %add.i480, !dbg !1774
  %add3.i482 = fadd float %mul2.i481, 0x3C8BA34A20000000, !dbg !1774
  %mul4.i483 = fmul float %mul.i478, %add3.i482, !dbg !1774
  %add5.i484 = fadd float %mul4.i483, 0x3D287ED380000000, !dbg !1774
  %mul6.i485 = fmul float %mul.i478, %add5.i484, !dbg !1774
  %add7.i486 = fadd float %mul6.i485, 0x3DC08B3AA0000000, !dbg !1774
  %mul8.i487 = fmul float %mul.i478, %add7.i486, !dbg !1774
  %add9.i488 = fadd float %mul8.i487, 0x3E51343900000000, !dbg !1774
  %mul10.i489 = fmul float %mul.i478, %add9.i488, !dbg !1774
  %add11.i490 = fadd float %mul10.i489, 0x3EDB777D00000000, !dbg !1774
  %mul12.i491 = fmul float %mul.i478, %add11.i490, !dbg !1774
  %add13.i492 = fadd float %mul12.i491, 0x3F6098A4A0000000, !dbg !1774
  %mul14.i493 = fmul float %mul.i478, %add13.i492, !dbg !1774
  %add15.i494 = fadd float %mul14.i493, 0x3FDDA30AC0000000, !dbg !1774
  %mul16.i495 = fmul float %mul.i478, %add15.i494, !dbg !1774
  %add17.i496 = fadd float %mul16.i495, 0x4052DBC240000000, !dbg !1774
  %mul18.i497 = fmul float %mul.i478, %add17.i496, !dbg !1774
  %add19.i498 = fadd float %mul18.i497, 0x40C039F680000000, !dbg !1774
  %mul20.i499 = fmul float %mul.i478, %add19.i498, !dbg !1774
  %add21.i500 = fadd float %mul20.i499, 0x4121721A40000000, !dbg !1774
  %mul22.i501 = fmul float %mul.i478, %add21.i500, !dbg !1774
  %add23.i502 = fadd float %mul22.i501, 0x4174A39560000000, !dbg !1774
  %mul24.i503 = fmul float %mul.i478, %add23.i502, !dbg !1774
  %add25.i504 = fadd float %mul24.i503, 0x41B541F680000000, !dbg !1774
  %mul26.i505 = fmul float %mul.i478, %add25.i504, !dbg !1774
  %add27.i506 = fadd float %mul26.i505, 0x41D57701A0000000, !dbg !1774
  %sub.i507 = fadd float %mul.i478, 0xC0A808F040000000, !dbg !1775
  %mul28.i508 = fmul float %mul.i478, %sub.i507, !dbg !1775
  %add29.i509 = fadd float %mul28.i508, 0x414A8593A0000000, !dbg !1775
  %mul30.i510 = fmul float %mul.i478, %add29.i509, !dbg !1775
  %sub31.i511 = fadd float %mul30.i510, 0xC1D57701A0000000, !dbg !1775
  %sub32.i512 = fsub float -0.000000e+00, %add27.i506, !dbg !1776
  %call.i513 = tail call float @__fdividef(float %sub32.i512, float %sub31.i511), !dbg !1776
  %mul254 = fmul float %26, %call.i513, !dbg !1772
  %mul255 = fmul float %24, %mul254, !dbg !1777
  %add257 = fadd float %pt2.sroa.0.3556, %mul255, !dbg !1777
  %mul258 = fmul float %25, %mul254, !dbg !1778
  %add260 = fadd float %pt2.sroa.1.3557, %mul258, !dbg !1778
  %conv263 = fadd float %density2.3555, 1.000000e+00, !dbg !1779
  %.pre662 = load float* %arrayidx173, align 4, !dbg !1734, !tbaa !1700
  %.pre663 = load float* @_ZL9cutoff2_c, align 4, !dbg !1780, !tbaa !1700
  br label %if.end264, !dbg !1781

if.end264:                                        ; preds = %if.then245, %if.end233
  %38 = phi float [ %.pre663, %if.then245 ], [ %35, %if.end233 ]
  %39 = phi float [ %.pre662, %if.then245 ], [ %36, %if.end233 ]
  %density2.4 = phi float [ %conv263, %if.then245 ], [ %density2.3555, %if.end233 ]
  %pt2.sroa.0.4 = phi float [ %add257, %if.then245 ], [ %pt2.sroa.0.3556, %if.end233 ]
  %pt2.sroa.1.4 = phi float [ %add260, %if.then245 ], [ %pt2.sroa.1.3557, %if.end233 ]
  %sub268 = fsub float %39, %conv267, !dbg !1734
  %mul273 = fmul float %sub268, %sub268, !dbg !1734
  %add274 = fadd float %add171, %mul273, !dbg !1734
  %cmp275 = fcmp olt float %add274, %38, !dbg !1780
  br i1 %cmp275, label %if.then276, label %for.inc, !dbg !1780

if.then276:                                       ; preds = %if.end264
  %40 = load float* @_ZL15_1overCutoff2_c, align 4, !dbg !1782, !tbaa !1700
  %mul278 = fmul float %add274, %40, !dbg !1782
  %conv281 = fsub float 1.000000e+00, %mul278, !dbg !1782
  %call282 = tail call float @sqrtf(float %conv281) nounwind, !dbg !1782
  %mul283 = fmul float %call282, %beta, !dbg !1782
  %mul.i514 = fmul float %mul283, %mul283, !dbg !1783
  %mul1.i515 = fmul float %mul.i514, 0x3B39752860000000, !dbg !1784
  %add.i516 = fadd float %mul1.i515, 0x3BE67934C0000000, !dbg !1784
  %mul2.i517 = fmul float %mul.i514, %add.i516, !dbg !1784
  %add3.i518 = fadd float %mul2.i517, 0x3C8BA34A20000000, !dbg !1784
  %mul4.i519 = fmul float %mul.i514, %add3.i518, !dbg !1784
  %add5.i520 = fadd float %mul4.i519, 0x3D287ED380000000, !dbg !1784
  %mul6.i521 = fmul float %mul.i514, %add5.i520, !dbg !1784
  %add7.i522 = fadd float %mul6.i521, 0x3DC08B3AA0000000, !dbg !1784
  %mul8.i523 = fmul float %mul.i514, %add7.i522, !dbg !1784
  %add9.i524 = fadd float %mul8.i523, 0x3E51343900000000, !dbg !1784
  %mul10.i525 = fmul float %mul.i514, %add9.i524, !dbg !1784
  %add11.i526 = fadd float %mul10.i525, 0x3EDB777D00000000, !dbg !1784
  %mul12.i527 = fmul float %mul.i514, %add11.i526, !dbg !1784
  %add13.i528 = fadd float %mul12.i527, 0x3F6098A4A0000000, !dbg !1784
  %mul14.i529 = fmul float %mul.i514, %add13.i528, !dbg !1784
  %add15.i530 = fadd float %mul14.i529, 0x3FDDA30AC0000000, !dbg !1784
  %mul16.i531 = fmul float %mul.i514, %add15.i530, !dbg !1784
  %add17.i532 = fadd float %mul16.i531, 0x4052DBC240000000, !dbg !1784
  %mul18.i533 = fmul float %mul.i514, %add17.i532, !dbg !1784
  %add19.i534 = fadd float %mul18.i533, 0x40C039F680000000, !dbg !1784
  %mul20.i535 = fmul float %mul.i514, %add19.i534, !dbg !1784
  %add21.i536 = fadd float %mul20.i535, 0x4121721A40000000, !dbg !1784
  %mul22.i537 = fmul float %mul.i514, %add21.i536, !dbg !1784
  %add23.i538 = fadd float %mul22.i537, 0x4174A39560000000, !dbg !1784
  %mul24.i539 = fmul float %mul.i514, %add23.i538, !dbg !1784
  %add25.i540 = fadd float %mul24.i539, 0x41B541F680000000, !dbg !1784
  %mul26.i541 = fmul float %mul.i514, %add25.i540, !dbg !1784
  %add27.i542 = fadd float %mul26.i541, 0x41D57701A0000000, !dbg !1784
  %sub.i543 = fadd float %mul.i514, 0xC0A808F040000000, !dbg !1785
  %mul28.i544 = fmul float %mul.i514, %sub.i543, !dbg !1785
  %add29.i545 = fadd float %mul28.i544, 0x414A8593A0000000, !dbg !1785
  %mul30.i546 = fmul float %mul.i514, %add29.i545, !dbg !1785
  %sub31.i547 = fadd float %mul30.i546, 0xC1D57701A0000000, !dbg !1785
  %sub32.i548 = fsub float -0.000000e+00, %add27.i542, !dbg !1786
  %call.i549 = tail call float @__fdividef(float %sub32.i548, float %sub31.i547), !dbg !1786
  %mul285 = fmul float %26, %call.i549, !dbg !1782
  %mul286 = fmul float %24, %mul285, !dbg !1787
  %add288 = fadd float %pt3.sroa.0.3553, %mul286, !dbg !1787
  %mul289 = fmul float %25, %mul285, !dbg !1788
  %add291 = fadd float %pt3.sroa.1.3554, %mul289, !dbg !1788
  %conv294 = fadd float %density3.3551, 1.000000e+00, !dbg !1789
  br label %for.inc, !dbg !1790

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
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !1739
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !1739
  %exitcond = icmp eq i32 %lftr.wideiv, %21, !dbg !1739
  br i1 %exitcond, label %for.inc297, label %for.body139, !dbg !1739

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
  %indvars.iv.next657 = add i64 %indvars.iv656, 1, !dbg !1737
  %41 = trunc i64 %indvars.iv.next657 to i32, !dbg !1737
  %cmp101 = icmp ult i32 %41, %shr, !dbg !1737
  %indvars.iv.next655 = add i32 %indvars.iv654, 64, !dbg !1737
  br i1 %cmp101, label %for.body102, label %for.inc300, !dbg !1737

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
  %inc301 = add nsw i32 %y83.0602, 1, !dbg !1720
  %cmp85 = icmp sgt i32 %inc301, %cond45, !dbg !1720
  br i1 %cmp85, label %for.inc303, label %for.body86, !dbg !1720

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
  %inc304 = add nsw i32 %z.0628, 1, !dbg !1717
  %cmp82 = icmp sgt i32 %inc304, %cond65, !dbg !1717
  br i1 %cmp82, label %for.end305, label %for.cond84.preheader, !dbg !1717

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
  %idxprom306 = sext i32 %add69 to i64, !dbg !1791
  %pt.sroa.0.0..idx = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom306, i32 0, !dbg !1791
  store float %pt.sroa.0.0.lcssa, float* %pt.sroa.0.0..idx, align 8, !dbg !1791
  %pt.sroa.1.4..idx388 = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom306, i32 1, !dbg !1791
  store float %pt.sroa.1.0.lcssa, float* %pt.sroa.1.4..idx388, align 4, !dbg !1791
  %arrayidx309 = getelementptr inbounds float* %sampleDensity_g, i64 %idxprom306, !dbg !1792
  store float %density.0.lcssa, float* %arrayidx309, align 4, !dbg !1792, !tbaa !1700
  %idxprom310 = sext i32 %add71 to i64, !dbg !1793
  %pt1.sroa.0.0..idx = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom310, i32 0, !dbg !1793
  store float %pt1.sroa.0.0.lcssa, float* %pt1.sroa.0.0..idx, align 8, !dbg !1793
  %pt1.sroa.1.4..idx386 = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom310, i32 1, !dbg !1793
  store float %pt1.sroa.1.0.lcssa, float* %pt1.sroa.1.4..idx386, align 4, !dbg !1793
  %arrayidx313 = getelementptr inbounds float* %sampleDensity_g, i64 %idxprom310, !dbg !1794
  store float %density1.0.lcssa, float* %arrayidx313, align 4, !dbg !1794, !tbaa !1700
  %idxprom314 = sext i32 %add73 to i64, !dbg !1795
  %pt2.sroa.0.0..idx = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom314, i32 0, !dbg !1795
  store float %pt2.sroa.0.0.lcssa, float* %pt2.sroa.0.0..idx, align 8, !dbg !1795
  %pt2.sroa.1.4..idx384 = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom314, i32 1, !dbg !1795
  store float %pt2.sroa.1.0.lcssa, float* %pt2.sroa.1.4..idx384, align 4, !dbg !1795
  %arrayidx317 = getelementptr inbounds float* %sampleDensity_g, i64 %idxprom314, !dbg !1796
  store float %density2.0.lcssa, float* %arrayidx317, align 4, !dbg !1796, !tbaa !1700
  %idxprom318 = sext i32 %add75 to i64, !dbg !1797
  %pt3.sroa.0.0..idx = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom318, i32 0, !dbg !1797
  store float %pt3.sroa.0.0.lcssa, float* %pt3.sroa.0.0..idx, align 8, !dbg !1797
  %pt3.sroa.1.4..idx382 = getelementptr inbounds %struct.float2* %gridData_g, i64 %idxprom318, i32 1, !dbg !1797
  store float %pt3.sroa.1.0.lcssa, float* %pt3.sroa.1.4..idx382, align 4, !dbg !1797
  %arrayidx321 = getelementptr inbounds float* %sampleDensity_g, i64 %idxprom318, !dbg !1798
  store float %density3.0.lcssa, float* %arrayidx321, align 4, !dbg !1798, !tbaa !1700
  ret void, !dbg !1799
}

declare void @__syncthreads() section "__device__"

declare float @sqrtf(float) nounwind section "__device__"

define i32 @_Z7comparePKvS0_(i8* nocapture %a, i8* nocapture %b) nounwind uwtable readonly {
entry:
  %0 = bitcast i8* %a to i32*, !dbg !1800
  %1 = load i32* %0, align 4, !dbg !1800, !tbaa !1656
  %2 = bitcast i8* %b to i32*, !dbg !1800
  %3 = load i32* %2, align 4, !dbg !1800, !tbaa !1656
  %sub = sub nsw i32 %1, %3, !dbg !1800
  ret i32 %sub, !dbg !1800
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
  %gridSize = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, !dbg !1802
  %0 = bitcast [3 x i32]* %gridSize to i64*, !dbg !1802
  %1 = load i64* %0, align 8, !dbg !1802
  %2 = trunc i64 %1 to i32, !dbg !1802
  %3 = lshr i64 %1, 32
  %4 = trunc i64 %3 to i32
  %arrayidx4 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 2, !dbg !1803
  %5 = bitcast i32* %arrayidx4 to i64*, !dbg !1803
  %6 = load i64* %5, align 8, !dbg !1803
  %7 = trunc i64 %6 to i32, !dbg !1803
  %mul = mul nsw i32 %4, %2, !dbg !1804
  store i32 %mul, i32* %size_xy, align 4, !dbg !1804, !tbaa !1656
  %mul6 = mul nsw i32 %mul, %7, !dbg !1805
  %kernelWidth = getelementptr inbounds %struct.parameters* %params, i64 0, i32 6, !dbg !1806
  %8 = load float* %kernelWidth, align 8, !dbg !1806, !tbaa !1700
  %mul7 = fmul float %8, 4.000000e+00, !dbg !1806
  %mul9 = fmul float %8, %mul7, !dbg !1806
  %9 = lshr i64 %6, 32
  %10 = trunc i64 %9 to i32
  %11 = bitcast i32 %10 to float
  %mul11 = fmul float %11, %11, !dbg !1806
  %div = fdiv float %mul9, %mul11, !dbg !1806
  %conv = fpext float %div to double, !dbg !1806
  %conv13 = fpext float %11 to double, !dbg !1806
  %sub = fadd double %conv13, -5.000000e-01, !dbg !1806
  %mul14 = fmul double %conv, %sub, !dbg !1806
  %mul18 = fmul double %sub, %mul14, !dbg !1806
  %sub19 = fadd double %mul18, -8.000000e-01, !dbg !1806
  %call = call double @sqrt(double %sub19) nounwind, !dbg !1806
  %mul20 = fmul double %call, 0x400921FB54442EEA, !dbg !1806
  %conv21 = fptrunc double %mul20 to float, !dbg !1806
  %conv25 = fmul float %8, 5.000000e-01, !dbg !1807
  store float %conv25, float* %cutoff, align 4, !dbg !1807, !tbaa !1700
  %mul26 = fmul float %conv25, %conv25, !dbg !1808
  store float %mul26, float* %cutoff2, align 4, !dbg !1808, !tbaa !1700
  %div27 = fdiv float 1.000000e+00, %mul26, !dbg !1809
  store float %div27, float* %_1overCutoff2, align 4, !dbg !1809, !tbaa !1700
  %rem = and i32 %n, 63, !dbg !1810
  %cmp = icmp eq i32 %rem, 0, !dbg !1810
  %sub29 = sub i32 64, %rem, !dbg !1811
  %npad.0 = select i1 %cmp, i32 0, i32 %sub29, !dbg !1810
  store %struct.ReconstructionSample* null, %struct.ReconstructionSample** %sample_d, align 8, !dbg !1813, !tbaa !1814
  store float* null, float** %sortedSample_d, align 8, !dbg !1815, !tbaa !1814
  store %struct.float2* null, %struct.float2** %gridData_d, align 8, !dbg !1816, !tbaa !1814
  store float* null, float** %sampleDensity_d, align 8, !dbg !1817, !tbaa !1814
  store i32* null, i32** %idxKey_d, align 8, !dbg !1818, !tbaa !1814
  store i32* null, i32** %idxValue_d, align 8, !dbg !1819, !tbaa !1814
  store i32* null, i32** %binStartAddr_d, align 8, !dbg !1820, !tbaa !1814
  %12 = bitcast float** %sortedSample_d to i8**, !dbg !1821
  %add = add i32 %npad.0, %n, !dbg !1821
  %conv30 = zext i32 %add to i64, !dbg !1821
  %mul31 = mul i64 %conv30, 24, !dbg !1821
  %call32 = call i32 @cudaMalloc(i8** %12, i64 %mul31), !dbg !1821
  %13 = bitcast i32** %binStartAddr_d to i8**, !dbg !1822
  %add33 = add nsw i32 %mul6, 1, !dbg !1822
  %conv34 = sext i32 %add33 to i64, !dbg !1822
  %mul35 = shl nsw i64 %conv34, 2, !dbg !1822
  %call36 = call i32 @cudaMalloc(i8** %13, i64 %mul35), !dbg !1822
  %14 = bitcast %struct.ReconstructionSample** %sample_d to i8**, !dbg !1823
  %conv37 = zext i32 %n to i64, !dbg !1823
  %mul38 = mul i64 %conv37, 24, !dbg !1823
  %call39 = call i32 @cudaMalloc(i8** %14, i64 %mul38), !dbg !1823
  %15 = bitcast i32** %idxKey_d to i8**, !dbg !1824
  %add40 = add i32 %n, 3, !dbg !1824
  %div41 = and i32 %add40, -4, !dbg !1824
  %conv43 = zext i32 %div41 to i64, !dbg !1824
  %mul44 = shl nuw nsw i64 %conv43, 2, !dbg !1824
  %call45 = call i32 @cudaMalloc(i8** %15, i64 %mul44), !dbg !1824
  %16 = bitcast i32** %idxValue_d to i8**, !dbg !1825
  %call51 = call i32 @cudaMalloc(i8** %16, i64 %mul44), !dbg !1825
  %17 = load i32** %binStartAddr_d, align 8, !dbg !1826, !tbaa !1814
  %call52 = call i32 @cudaGetLastError(), !dbg !1827
  %cmp53 = icmp eq i32 %call52, 0, !dbg !1827
  br i1 %cmp53, label %do.end, label %if.then54, !dbg !1827

if.then54:                                        ; preds = %entry
  %call55 = call i8* @cudaGetErrorString(i32 %call52), !dbg !1828
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i8* %call55, i32 123), !dbg !1828
  br label %return, !dbg !1828

do.end:                                           ; preds = %entry
  %18 = bitcast float* %cutoff2 to i8*, !dbg !1830
  %call.i = call i32 @cudaMemcpyToSymbol(i8* bitcast (float* @_ZL9cutoff2_c to i8*), i8* %18, i64 4, i64 0, i32 1), !dbg !1831
  %19 = bitcast float* %cutoff to i8*, !dbg !1833
  %call.i163 = call i32 @cudaMemcpyToSymbol(i8* bitcast (float* @_ZL8cutoff_c to i8*), i8* %19, i64 4, i64 0, i32 1), !dbg !1834
  %20 = bitcast [3 x i32]* %gridSize to i8*, !dbg !1835
  %call.i164 = call i32 @cudaMemcpyToSymbol(i8* bitcast ([3 x i32]* @_ZL10gridSize_c to i8*), i8* %20, i64 12, i64 0, i32 1), !dbg !1836
  %21 = bitcast i32* %size_xy to i8*, !dbg !1838
  %call.i165 = call i32 @cudaMemcpyToSymbol(i8* bitcast (i32* @_ZL9size_xy_c to i8*), i8* %21, i64 4, i64 0, i32 1), !dbg !1839
  %22 = bitcast float* %_1overCutoff2 to i8*, !dbg !1841
  %call.i166 = call i32 @cudaMemcpyToSymbol(i8* bitcast (float* @_ZL15_1overCutoff2_c to i8*), i8* %22, i64 4, i64 0, i32 1), !dbg !1842
  %23 = load %struct.ReconstructionSample** %sample_d, align 8, !dbg !1843, !tbaa !1814
  %24 = bitcast %struct.ReconstructionSample* %23 to i8*, !dbg !1843
  %25 = bitcast %struct.ReconstructionSample* %sample to i8*, !dbg !1843
  %call66 = call i32 @cudaMemcpy(i8* %24, i8* %25, i64 %mul38, i32 1), !dbg !1843
  %26 = bitcast i32* %17 to i8*, !dbg !1844
  %call70 = call i32 @cudaMemset(i8* %26, i32 0, i64 %mul35), !dbg !1844
  %27 = load i32** %idxKey_d, align 8, !dbg !1845, !tbaa !1814
  %add.ptr = getelementptr inbounds i32* %27, i64 %conv37, !dbg !1845
  %28 = bitcast i32* %add.ptr to i8*, !dbg !1845
  %sub72 = sub i32 %div41, %n, !dbg !1845
  %conv73 = zext i32 %sub72 to i64, !dbg !1845
  %mul74 = shl nuw nsw i64 %conv73, 2, !dbg !1845
  %call75 = call i32 @cudaMemset(i8* %28, i32 255, i64 %mul74), !dbg !1845
  %29 = load float** %sortedSample_d, align 8, !dbg !1846, !tbaa !1814
  %30 = load i32** %idxKey_d, align 8, !dbg !1847, !tbaa !1814
  %31 = bitcast i32* %30 to i8*, !dbg !1847
  %call80 = call i32 @cudaFree(i8* %31), !dbg !1847
  %32 = load %struct.ReconstructionSample** %sample_d, align 8, !dbg !1848, !tbaa !1814
  %33 = bitcast %struct.ReconstructionSample* %32 to i8*, !dbg !1848
  %call81 = call i32 @cudaFree(i8* %33), !dbg !1848
  %34 = load i32** %idxValue_d, align 8, !dbg !1849, !tbaa !1814
  %35 = bitcast i32* %34 to i8*, !dbg !1849
  %call82 = call i32 @cudaFree(i8* %35), !dbg !1849
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %mul6), !dbg !1850
  %int_cast_to_i64 = zext i32 256 to i64
  call void @klee_div_zero_check(i64 %int_cast_to_i64)
  %div84 = sdiv i32 %mul6, 256, !dbg !1851
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %div84), !dbg !1852
  %36 = bitcast %struct.float2** %gridData_d to i8**, !dbg !1853
  %conv86 = sext i32 %div84 to i64, !dbg !1853
  %mul87 = shl nsw i64 %conv86, 3, !dbg !1853
  %call88 = call i32 @cudaMalloc(i8** %36, i64 %mul87), !dbg !1853
  %call89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %div84), !dbg !1854
  %37 = bitcast float** %sampleDensity_d to i8**, !dbg !1855
  %mul91 = shl nsw i64 %conv86, 2, !dbg !1855
  %call92 = call i32 @cudaMalloc(i8** %37, i64 %mul91), !dbg !1855
  %call93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %div84), !dbg !1856
  %call96 = call i32 @cudaGetLastError(), !dbg !1857
  %cmp97 = icmp eq i32 %call96, 0, !dbg !1857
  br i1 %cmp97, label %do.end102, label %if.then98, !dbg !1857

if.then98:                                        ; preds = %do.end
  %call99 = call i8* @cudaGetErrorString(i32 %call96), !dbg !1858
  %call100 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i8* %call99, i32 224), !dbg !1858
  br label %return, !dbg !1858

do.end102:                                        ; preds = %do.end
  %mul77 = shl i32 %add, 1, !dbg !1860
  %idx.ext78 = zext i32 %mul77 to i64, !dbg !1860
  %add.ptr79 = getelementptr inbounds float* %29, i64 %idx.ext78, !dbg !1860
  %38 = bitcast float* %add.ptr79 to %struct.float4*, !dbg !1860
  %39 = bitcast float* %29 to %struct.float2*, !dbg !1846
  %40 = load %struct.float2** %gridData_d, align 8, !dbg !1861, !tbaa !1814
  %41 = bitcast %struct.float2* %40 to i8*, !dbg !1861
  %call105 = call i32 @cudaMemset(i8* %41, i32 0, i64 %mul87), !dbg !1861
  %42 = load float** %sampleDensity_d, align 8, !dbg !1862, !tbaa !1814
  %43 = bitcast float* %42 to i8*, !dbg !1862
  %call108 = call i32 @cudaMemset(i8* %43, i32 0, i64 %mul91), !dbg !1862
  %mul109 = mul nsw i32 %7, %4, !dbg !1863
  %call112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([41 x i8]* @.str3, i64 0, i64 0), i32 %mul109, i32 32), !dbg !1863
  %div116 = lshr i64 %1, 3, !dbg !1864
  %div122 = lshr i32 %mul109, 5, !dbg !1864
  %grid2.sroa.0.0.insert.ext = and i64 %div116, 536870911, !dbg !1865
  %grid2.sroa.0.4.insert.ext = zext i32 %div122 to i64, !dbg !1865
  %grid2.sroa.0.4.insert.shift = shl nuw nsw i64 %grid2.sroa.0.4.insert.ext, 32, !dbg !1865
  %grid2.sroa.0.4.insert.insert = or i64 %grid2.sroa.0.4.insert.shift, %grid2.sroa.0.0.insert.ext, !dbg !1865
  call void (i64, i32, i64, i32, ...)* @__set_CUDAConfig(i64 %grid2.sroa.0.4.insert.insert, i32 1, i64 17179869192, i32 2), !dbg !1867
  %44 = load i32** %binStartAddr_d, align 8, !dbg !1869, !tbaa !1814
  %45 = load %struct.float2** %gridData_d, align 8, !dbg !1869, !tbaa !1814
  %46 = load float** %sampleDensity_d, align 8, !dbg !1869, !tbaa !1814
  call void @_Z12gridding_GPU17sampleArrayStructPjP6float2Pff(%struct.float2* %39, %struct.float4* %38, i32* %44, %struct.float2* %45, float* %46, float %conv21), !dbg !1869
  %47 = load %struct.float2** %gridData_d, align 8, !dbg !1870, !tbaa !1814
  %48 = bitcast %struct.float2* %47 to i8*, !dbg !1870
  %call125 = call i32 @cudaFree(i8* %48), !dbg !1870
  %49 = load float** %sampleDensity_d, align 8, !dbg !1871, !tbaa !1814
  %50 = bitcast float* %49 to i8*, !dbg !1871
  %call126 = call i32 @cudaFree(i8* %50), !dbg !1871
  %call127 = call i32 @cudaFree(i8* %26), !dbg !1872
  %51 = load float** %sortedSample_d, align 8, !dbg !1873, !tbaa !1814
  %52 = bitcast float* %51 to i8*, !dbg !1873
  %call128 = call i32 @cudaFree(i8* %52), !dbg !1873
  br label %return, !dbg !1874

return:                                           ; preds = %do.end102, %if.then98, %if.then54
  ret void, !dbg !1875
}

declare double @sqrt(double) nounwind section "__device__"

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @__set_CUDAConfig(i64, i32, i64, i32, ...)

declare float @ceilf(float) nounwind readnone

declare i32 @__uAtomicAdd(i32*, i32) section "__device__"

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

define void @_Z13setParametersP8_IO_FILEP10parameters(%struct._IO_FILE* nocapture %file, %struct.parameters* %p) uwtable {
entry:
  %deviceProp = alloca %struct.cudaDeviceProp, align 8
  %numSamples = getelementptr inbounds %struct.parameters* %p, i64 0, i32 0, !dbg !1876
  %call = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([26 x i8]* @.str4, i64 0, i64 0), i32* %numSamples), !dbg !1876
  %arrayidx = getelementptr inbounds %struct.parameters* %p, i64 0, i32 3, i64 0, !dbg !1877
  %arrayidx2 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 3, i64 1, !dbg !1877
  %arrayidx4 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 3, i64 2, !dbg !1877
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([26 x i8]* @.str15, i64 0, i64 0), float* %arrayidx, float* %arrayidx2, float* %arrayidx4), !dbg !1877
  %arrayidx6 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 1, i64 0, !dbg !1878
  %arrayidx8 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 1, i64 1, !dbg !1878
  %arrayidx10 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 1, i64 2, !dbg !1878
  %call11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([32 x i8]* @.str26, i64 0, i64 0), i32* %arrayidx6, i32* %arrayidx8, i32* %arrayidx10), !dbg !1878
  %arrayidx12 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 2, i64 0, !dbg !1879
  %arrayidx14 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 2, i64 1, !dbg !1879
  %arrayidx16 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 2, i64 2, !dbg !1879
  %call17 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([36 x i8]* @.str37, i64 0, i64 0), i32* %arrayidx12, i32* %arrayidx14, i32* %arrayidx16), !dbg !1879
  %arrayidx18 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 4, i64 0, !dbg !1880
  %arrayidx20 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 4, i64 1, !dbg !1880
  %arrayidx22 = getelementptr inbounds %struct.parameters* %p, i64 0, i32 4, i64 2, !dbg !1880
  %call23 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([30 x i8]* @.str48, i64 0, i64 0), i32* %arrayidx18, i32* %arrayidx20, i32* %arrayidx22), !dbg !1880
  %oversample = getelementptr inbounds %struct.parameters* %p, i64 0, i32 5, !dbg !1881
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([26 x i8]* @.str5, i64 0, i64 0), float* %oversample), !dbg !1881
  %kernelWidth = getelementptr inbounds %struct.parameters* %p, i64 0, i32 6, !dbg !1882
  %call25 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([17 x i8]* @.str6, i64 0, i64 0), float* %kernelWidth), !dbg !1882
  %useLUT = getelementptr inbounds %struct.parameters* %p, i64 0, i32 8, !dbg !1883
  %call26 = call i32 (%struct._IO_FILE*, i8*, ...)* @fscanf(%struct._IO_FILE* %file, i8* getelementptr inbounds ([18 x i8]* @.str7, i64 0, i64 0), i32* %useLUT), !dbg !1883
  %call27 = call i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* %deviceProp, i32 0), !dbg !1884
  %totalGlobalMem = getelementptr inbounds %struct.cudaDeviceProp* %deviceProp, i64 0, i32 1, !dbg !1885
  %0 = load i64* %totalGlobalMem, align 8, !dbg !1885, !tbaa !1886
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([42 x i8]* @.str8, i64 0, i64 0), i64 %0), !dbg !1885
  %1 = load i32* %numSamples, align 4, !dbg !1887, !tbaa !1656
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i64 0, i64 0), i32 %1), !dbg !1887
  %2 = load i32* %numSamples, align 4, !dbg !1888, !tbaa !1656
  %cmp = icmp sgt i32 %2, 10000000, !dbg !1888
  br i1 %cmp, label %land.lhs.true, label %if.end, !dbg !1888

land.lhs.true:                                    ; preds = %entry
  %3 = load i64* %totalGlobalMem, align 8, !dbg !1888, !tbaa !1886
  %cmp34 = icmp ult i64 %3, 3145728000, !dbg !1888
  br i1 %cmp34, label %if.then, label %if.end, !dbg !1888

if.then:                                          ; preds = %land.lhs.true
  %puts = call i32 @puts(i8* getelementptr inbounds ([52 x i8]* @str, i64 0, i64 0)), !dbg !1889
  call void @exit(i32 1) noreturn nounwind, !dbg !1891
  unreachable, !dbg !1891

if.end:                                           ; preds = %land.lhs.true, %entry
  %4 = load i32* %arrayidx18, align 4, !dbg !1892, !tbaa !1656
  %5 = load i32* %arrayidx20, align 4, !dbg !1892, !tbaa !1656
  %6 = load i32* %arrayidx22, align 4, !dbg !1892, !tbaa !1656
  %call42 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str11, i64 0, i64 0), i32 %4, i32 %5, i32 %6), !dbg !1892
  %7 = load i32* %arrayidx6, align 4, !dbg !1893, !tbaa !1656
  %8 = load i32* %arrayidx8, align 4, !dbg !1893, !tbaa !1656
  %9 = load i32* %arrayidx10, align 4, !dbg !1893, !tbaa !1656
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str12, i64 0, i64 0), i32 %7, i32 %8, i32 %9), !dbg !1893
  %10 = load i32* %arrayidx12, align 4, !dbg !1894, !tbaa !1656
  %11 = load i32* %arrayidx14, align 4, !dbg !1894, !tbaa !1656
  %12 = load i32* %arrayidx16, align 4, !dbg !1894, !tbaa !1656
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str13, i64 0, i64 0), i32 %10, i32 %11, i32 %12), !dbg !1894
  %13 = load float* %kernelWidth, align 4, !dbg !1895, !tbaa !1700
  %conv = fpext float %13 to double, !dbg !1895
  %call58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str14, i64 0, i64 0), double %conv), !dbg !1895
  %14 = load float* %arrayidx, align 4, !dbg !1896, !tbaa !1700
  %conv61 = fpext float %14 to double, !dbg !1896
  %15 = load float* %arrayidx2, align 4, !dbg !1896, !tbaa !1700
  %conv64 = fpext float %15 to double, !dbg !1896
  %16 = load float* %arrayidx4, align 4, !dbg !1896, !tbaa !1700
  %conv67 = fpext float %16 to double, !dbg !1896
  %call68 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str159, i64 0, i64 0), double %conv61, double %conv64, double %conv67), !dbg !1896
  %17 = load float* %oversample, align 4, !dbg !1897, !tbaa !1700
  %conv70 = fpext float %17 to double, !dbg !1897
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str16, i64 0, i64 0), double %conv70), !dbg !1897
  %binsize = getelementptr inbounds %struct.parameters* %p, i64 0, i32 7, !dbg !1898
  %18 = load i32* %binsize, align 4, !dbg !1898, !tbaa !1656
  %call72 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str17, i64 0, i64 0), i32 %18), !dbg !1898
  %19 = load i32* %useLUT, align 4, !dbg !1899, !tbaa !1656
  %tobool = icmp ne i32 %19, 0, !dbg !1899
  %cond = select i1 %tobool, i8* getelementptr inbounds ([4 x i8]* @.str19, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8]* @.str20, i64 0, i64 0), !dbg !1899
  %call74 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str18, i64 0, i64 0), i8* %cond), !dbg !1899
  ret void, !dbg !1900
}

declare i32 @fscanf(%struct._IO_FILE* nocapture, i8* nocapture, ...) nounwind

declare void @exit(i32) noreturn nounwind

define i32 @_Z14readSampleData10parametersP8_IO_FILEP20ReconstructionSample(%struct.parameters* nocapture byval align 8 %params, %struct._IO_FILE* nocapture %uksdata_f, %struct.ReconstructionSample* nocapture %samples) nounwind uwtable {
entry:
  %0 = bitcast %struct.parameters* %params to i64*, !dbg !1901
  %1 = load i64* %0, align 8, !dbg !1901
  %2 = trunc i64 %1 to i32, !dbg !1901
  %cmp123 = icmp eq i32 %2, 0, !dbg !1901
  %3 = lshr i64 %1, 32
  %4 = trunc i64 %3 to i32
  br i1 %cmp123, label %for.end, label %for.body, !dbg !1901

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %if.end ], [ 0, %entry ]
  %i.0124 = phi i32 [ %inc, %if.end ], [ 0, %entry ]
  %call = tail call i32 @feof(%struct._IO_FILE* %uksdata_f) nounwind, !dbg !1903
  %tobool = icmp eq i32 %call, 0, !dbg !1903
  br i1 %tobool, label %if.end, label %for.end, !dbg !1903

if.end:                                           ; preds = %for.body
  %arrayidx = getelementptr inbounds %struct.ReconstructionSample* %samples, i64 %indvars.iv126, !dbg !1905
  %5 = bitcast %struct.ReconstructionSample* %arrayidx to i8*, !dbg !1905
  %call1 = tail call i64 @fread(i8* %5, i64 24, i64 1, %struct._IO_FILE* %uksdata_f), !dbg !1905
  %indvars.iv.next127 = add i64 %indvars.iv126, 1, !dbg !1901
  %inc = add i32 %i.0124, 1, !dbg !1901
  %6 = trunc i64 %indvars.iv.next127 to i32, !dbg !1901
  %cmp = icmp ult i32 %6, %2, !dbg !1901
  br i1 %cmp, label %for.body, label %for.end, !dbg !1901

for.end:                                          ; preds = %if.end, %for.body, %entry
  %i.0.lcssa = phi i32 [ 0, %entry ], [ %i.0124, %for.body ], [ %inc, %if.end ]
  %conv = sitofp i32 %4 to float, !dbg !1906
  %arrayidx3 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 2, i64 0, !dbg !1906
  %7 = bitcast i32* %arrayidx3 to i64*, !dbg !1906
  %8 = load i64* %7, align 8, !dbg !1906
  %9 = trunc i64 %8 to i32, !dbg !1906
  %conv4 = sitofp i32 %9 to float, !dbg !1906
  %arrayidx5 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 3, i64 0, !dbg !1906
  %10 = load float* %arrayidx5, align 4, !dbg !1906, !tbaa !1700
  %mul = fmul float %conv4, %10, !dbg !1906
  %div = fdiv float %conv, %mul, !dbg !1906
  %arrayidx8 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 1, i64 1, !dbg !1907
  %11 = load i32* %arrayidx8, align 4, !dbg !1907, !tbaa !1656
  %conv9 = sitofp i32 %11 to float, !dbg !1907
  %12 = lshr i64 %8, 32
  %13 = trunc i64 %12 to i32
  %conv12 = sitofp i32 %13 to float, !dbg !1907
  %arrayidx14 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 3, i64 1, !dbg !1907
  %14 = load float* %arrayidx14, align 4, !dbg !1907, !tbaa !1700
  %mul15 = fmul float %conv12, %14, !dbg !1907
  %div16 = fdiv float %conv9, %mul15, !dbg !1907
  %arrayidx19 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 1, i64 2, !dbg !1908
  %15 = load i32* %arrayidx19, align 4, !dbg !1908, !tbaa !1656
  %conv20 = sitofp i32 %15 to float, !dbg !1908
  %arrayidx22 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 2, i64 2, !dbg !1908
  %16 = load i32* %arrayidx22, align 8, !dbg !1908, !tbaa !1656
  %conv23 = sitofp i32 %16 to float, !dbg !1908
  %arrayidx25 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 3, i64 2, !dbg !1908
  %17 = load float* %arrayidx25, align 4, !dbg !1908, !tbaa !1700
  %mul26 = fmul float %conv23, %17, !dbg !1908
  %div27 = fdiv float %conv20, %mul26, !dbg !1908
  %arrayidx29 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 0, !dbg !1909
  %18 = bitcast i32* %arrayidx29 to i64*, !dbg !1909
  %19 = load i64* %18, align 8, !dbg !1909
  %20 = trunc i64 %19 to i32, !dbg !1909
  %21 = lshr i64 %19, 32
  %22 = trunc i64 %21 to i32
  %arrayidx33 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 2, !dbg !1910
  %23 = load i32* %arrayidx33, align 8, !dbg !1910, !tbaa !1656
  %sub = add nsw i32 %20, -1, !dbg !1911
  %conv35 = sitofp i32 %sub to float, !dbg !1911
  %mul36 = fmul float %div, %conv35, !dbg !1911
  %conv39 = fmul float %mul36, 5.000000e-01, !dbg !1911
  %conv44 = fmul float %conv35, 5.000000e-01, !dbg !1912
  %sub46 = add nsw i32 %22, -1, !dbg !1913
  %conv47 = sitofp i32 %sub46 to float, !dbg !1913
  %mul48 = fmul float %div16, %conv47, !dbg !1913
  %conv51 = fmul float %mul48, 5.000000e-01, !dbg !1913
  %conv56 = fmul float %conv47, 5.000000e-01, !dbg !1914
  %sub58 = add nsw i32 %23, -1, !dbg !1915
  %conv59 = sitofp i32 %sub58 to float, !dbg !1915
  %mul60 = fmul float %div27, %conv59, !dbg !1915
  %conv63 = fmul float %mul60, 5.000000e-01, !dbg !1915
  %conv68 = fmul float %conv59, 5.000000e-01, !dbg !1916
  %cmp70121 = icmp eq i32 %i.0.lcssa, 0, !dbg !1917
  br i1 %cmp70121, label %for.end97, label %for.body71, !dbg !1917

for.body71:                                       ; preds = %for.body71, %for.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body71 ], [ 0, %for.end ]
  %kX = getelementptr inbounds %struct.ReconstructionSample* %samples, i64 %indvars.iv, i32 2, !dbg !1918
  %24 = load float* %kX, align 4, !dbg !1918, !tbaa !1700
  %mul74 = fmul float %conv39, %24, !dbg !1918
  %add = fadd float %conv44, %mul74, !dbg !1918
  %call.i = tail call float @floorf(float %add) nounwind readnone, !dbg !1920
  store float %call.i, float* %kX, align 4, !dbg !1918, !tbaa !1700
  %kY = getelementptr inbounds %struct.ReconstructionSample* %samples, i64 %indvars.iv, i32 3, !dbg !1922
  %25 = load float* %kY, align 4, !dbg !1922, !tbaa !1700
  %mul81 = fmul float %conv51, %25, !dbg !1922
  %add82 = fadd float %conv56, %mul81, !dbg !1922
  %call.i119 = tail call float @floorf(float %add82) nounwind readnone, !dbg !1923
  store float %call.i119, float* %kY, align 4, !dbg !1922, !tbaa !1700
  %kZ = getelementptr inbounds %struct.ReconstructionSample* %samples, i64 %indvars.iv, i32 4, !dbg !1924
  %26 = load float* %kZ, align 4, !dbg !1924, !tbaa !1700
  %mul89 = fmul float %conv63, %26, !dbg !1924
  %add90 = fadd float %conv68, %mul89, !dbg !1924
  %call.i120 = tail call float @floorf(float %add90) nounwind readnone, !dbg !1925
  store float %call.i120, float* %kZ, align 4, !dbg !1924, !tbaa !1700
  %indvars.iv.next = add i64 %indvars.iv, 1, !dbg !1917
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32, !dbg !1917
  %exitcond = icmp eq i32 %lftr.wideiv, %i.0.lcssa, !dbg !1917
  br i1 %exitcond, label %for.end97, label %for.body71, !dbg !1917

for.end97:                                        ; preds = %for.body71, %for.end
  ret i32 %i.0.lcssa, !dbg !1926
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
  %arraydecay = getelementptr inbounds [250 x i8]* %uksdata, i64 0, i64 0, !dbg !1927
  %0 = call i8* @memcpy(i8* %arraydecay, i8* getelementptr inbounds ([16 x i8]* @.str21, i64 0, i64 0), i64 16)
  %strlen = call i64 @strlen(i8* %arraydecay), !dbg !1928
  %endptr = getelementptr [250 x i8]* %uksdata, i64 0, i64 %strlen, !dbg !1928
  %1 = call i8* @memcpy(i8* %endptr, i8* getelementptr inbounds ([6 x i8]* @.str22, i64 0, i64 0), i64 6)
  %call3 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([16 x i8]* @.str21, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0)), !dbg !1929
  %cmp = icmp eq %struct._IO_FILE* %call3, null, !dbg !1930
  br i1 %cmp, label %if.then, label %if.end, !dbg !1930

if.then:                                          ; preds = %entry
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str24, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8]* @.str21, i64 0, i64 0)), !dbg !1931
  br label %if.end, !dbg !1933

if.end:                                           ; preds = %if.then, %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str35, i64 0, i64 0)), !dbg !1934
  %binsize = getelementptr inbounds %struct.parameters* %params, i64 0, i32 7, !dbg !1935
  store i32 128, i32* %binsize, align 4, !dbg !1935, !tbaa !1656
  call void @_Z13setParametersP8_IO_FILEP10parameters(%struct._IO_FILE* %call3, %struct.parameters* %params), !dbg !1936
  %2 = bitcast %struct.ReconstructionSample** %samples to i8**, !dbg !1937
  %numSamples = getelementptr inbounds %struct.parameters* %params, i64 0, i32 0, !dbg !1937
  %3 = load i32* %numSamples, align 8, !dbg !1937, !tbaa !1656
  %conv = sext i32 %3 to i64, !dbg !1937
  %mul = mul i64 %conv, 24, !dbg !1937
  %call6 = call i32 @cudaMallocHost(i8** %2, i64 %mul), !dbg !1937
  %call7 = call i32 @cudaGetLastError(), !dbg !1938
  %cmp8 = icmp eq i32 %call7, 0, !dbg !1938
  br i1 %cmp8, label %do.end, label %if.then9, !dbg !1938

if.then9:                                         ; preds = %if.end
  %call10 = call i8* @cudaGetErrorString(i32 %call7), !dbg !1939
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2610, i64 0, i64 0), i8* %call10, i32 143), !dbg !1939
  br label %return, !dbg !1939

do.end:                                           ; preds = %if.end
  %4 = load %struct.ReconstructionSample** %samples, align 8, !dbg !1941, !tbaa !1814
  %cmp13 = icmp eq %struct.ReconstructionSample* %4, null, !dbg !1941
  br i1 %cmp13, label %if.then14, label %if.end16, !dbg !1941

if.then14:                                        ; preds = %do.end
  %puts68 = call i32 @puts(i8* getelementptr inbounds ([48 x i8]* @str36, i64 0, i64 0)), !dbg !1942
  call void @exit(i32 1) noreturn nounwind, !dbg !1944
  unreachable, !dbg !1944

if.end16:                                         ; preds = %do.end
  %call18 = call %struct._IO_FILE* @fopen(i8* %arraydecay, i8* getelementptr inbounds ([2 x i8]* @.str23, i64 0, i64 0)), !dbg !1945
  %cmp19 = icmp eq %struct._IO_FILE* %call18, null, !dbg !1946
  br i1 %cmp19, label %if.then20, label %if.end22, !dbg !1946

if.then20:                                        ; preds = %if.end16
  %puts69 = call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str37, i64 0, i64 0)), !dbg !1947
  call void @exit(i32 1) noreturn nounwind, !dbg !1949
  unreachable, !dbg !1949

if.end22:                                         ; preds = %if.end16
  %puts70 = call i32 @puts(i8* getelementptr inbounds ([30 x i8]* @str38, i64 0, i64 0)), !dbg !1950
  %5 = load %struct.ReconstructionSample** %samples, align 8, !dbg !1951, !tbaa !1814
  %call24 = call i32 @_Z14readSampleData10parametersP8_IO_FILEP20ReconstructionSample(%struct.parameters* byval align 8 %params, %struct._IO_FILE* %call18, %struct.ReconstructionSample* %5), !dbg !1951
  %call25 = call i32 @fclose(%struct._IO_FILE* %call18), !dbg !1952
  %puts71 = call i32 @puts(i8* getelementptr inbounds ([37 x i8]* @str39, i64 0, i64 0)), !dbg !1953
  %arrayidx = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 0, !dbg !1954
  %6 = load i32* %arrayidx, align 8, !dbg !1954, !tbaa !1656
  %arrayidx28 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 1, !dbg !1954
  %7 = load i32* %arrayidx28, align 4, !dbg !1954, !tbaa !1656
  %mul29 = mul nsw i32 %7, %6, !dbg !1954
  %arrayidx31 = getelementptr inbounds %struct.parameters* %params, i64 0, i32 4, i64 2, !dbg !1954
  %8 = load i32* %arrayidx31, align 8, !dbg !1954, !tbaa !1656
  %mul32 = mul nsw i32 %mul29, %8, !dbg !1954
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str31, i64 0, i64 0), i32 %mul32), !dbg !1955
  %9 = bitcast %struct.cmplx** %gridData to i8**, !dbg !1956
  %conv34 = sext i32 %mul32 to i64, !dbg !1956
  %mul35 = shl nsw i64 %conv34, 3, !dbg !1956
  %call36 = call i32 @cudaMallocHost(i8** %9, i64 %mul35), !dbg !1956
  %10 = bitcast float** %sampleDensity to i8**, !dbg !1957
  %mul38 = shl nsw i64 %conv34, 2, !dbg !1957
  %call39 = call i32 @cudaMallocHost(i8** %10, i64 %mul38), !dbg !1957
  %call42 = call i32 @cudaGetLastError(), !dbg !1958
  %cmp43 = icmp eq i32 %call42, 0, !dbg !1958
  br i1 %cmp43, label %do.end48, label %if.then44, !dbg !1958

if.then44:                                        ; preds = %if.end22
  %call45 = call i8* @cudaGetErrorString(i32 %call42), !dbg !1959
  %call46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2610, i64 0, i64 0), i8* %call45, i32 188), !dbg !1959
  br label %return, !dbg !1959

do.end48:                                         ; preds = %if.end22
  %11 = load float** %sampleDensity, align 8, !dbg !1961, !tbaa !1814
  %cmp49 = icmp eq float* %11, null, !dbg !1961
  br i1 %cmp49, label %if.then51, label %lor.lhs.false, !dbg !1961

lor.lhs.false:                                    ; preds = %do.end48
  %12 = load %struct.cmplx** %gridData, align 8, !dbg !1961, !tbaa !1814
  %cmp50 = icmp eq %struct.cmplx* %12, null, !dbg !1961
  br i1 %cmp50, label %if.then51, label %if.end53, !dbg !1961

if.then51:                                        ; preds = %lor.lhs.false, %do.end48
  %puts72 = call i32 @puts(i8* getelementptr inbounds ([49 x i8]* @str40, i64 0, i64 0)), !dbg !1962
  call void @exit(i32 1) noreturn nounwind, !dbg !1964
  unreachable, !dbg !1964

if.end53:                                         ; preds = %lor.lhs.false
  %puts73 = call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str41, i64 0, i64 0)), !dbg !1965
  %13 = load %struct.ReconstructionSample** %samples, align 8, !dbg !1966, !tbaa !1814
  %14 = load %struct.cmplx** %gridData, align 8, !dbg !1966, !tbaa !1814
  %15 = load float** %sampleDensity, align 8, !dbg !1966, !tbaa !1814
  call void @_Z14CUDA_interfaceP11pb_TimerSetj10parametersP20ReconstructionSamplePfiP5cmplxS4_(%struct.pb_TimerSet* %timers, i32 %call24, %struct.parameters* byval align 8 %params, %struct.ReconstructionSample* %13, float* undef, i32 undef, %struct.cmplx
  %16 = load %struct.ReconstructionSample** %samples, align 8, !dbg !1967, !tbaa !1814
  %17 = bitcast %struct.ReconstructionSample* %16 to i8*, !dbg !1967
  %call58 = call i32 @cudaFreeHost(i8* %17), !dbg !1967
  %18 = load %struct.cmplx** %gridData, align 8, !dbg !1968, !tbaa !1814
  %19 = bitcast %struct.cmplx* %18 to i8*, !dbg !1968
  %call59 = call i32 @cudaFreeHost(i8* %19), !dbg !1968
  %20 = load float** %sampleDensity, align 8, !dbg !1969, !tbaa !1814
  %21 = bitcast float* %20 to i8*, !dbg !1969
  %call60 = call i32 @cudaFreeHost(i8* %21), !dbg !1969
  %putchar = call i32 @putchar(i32 10), !dbg !1970
  br label %return, !dbg !1971

return:                                           ; preds = %if.end53, %if.then44, %if.then9
  ret i32 0, !dbg !1972
}

declare noalias %struct._IO_FILE* @fopen(i8* nocapture, i8* nocapture) nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @fclose(%struct._IO_FILE* nocapture) nounwind

declare float @floorf(float) nounwind readnone

declare i64 @strlen(i8* nocapture) nounwind readonly

declare i32 @puts(i8* nocapture) nounwind

declare i32 @putchar(i32)

define void @klee_div_zero_check(i64 %z) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %z, 0, !dbg !1973
  br i1 %cmp, label %if.then, label %if.end, !dbg !1973

if.then:                                          ; preds = %entry
  tail call void @klee_report_error(i8* getelementptr inbounds ([65 x i8]* @.str10, i64 0, i64 0), i32 14, i8* getelementptr inbounds ([15 x i8]* @.str111, i64 0, i64 0), i8* getelementptr inbounds ([8 x i8]* @.str212, i64 0, i64 0)) noreturn nounwind, !
  unreachable, !dbg !1975

if.end:                                           ; preds = %entry
  ret void, !dbg !1976
}

declare void @klee_report_error(i8*, i32, i8*, i8*) noreturn

define i8* @memcpy(i8* %destaddr, i8* nocapture %srcaddr, i64 %len) nounwind uwtable {
entry:
  %cmp3 = icmp eq i64 %len, 0, !dbg !1977
  br i1 %cmp3, label %while.end, label %while.body, !dbg !1977

while.body:                                       ; preds = %while.body, %entry
  %src.06 = phi i8* [ %incdec.ptr, %while.body ], [ %srcaddr, %entry ]
  %dest.05 = phi i8* [ %incdec.ptr1, %while.body ], [ %destaddr, %entry ]
  %len.addr.04 = phi i64 [ %dec, %while.body ], [ %len, %entry ]
  %dec = add i64 %len.addr.04, -1, !dbg !1977
  %incdec.ptr = getelementptr inbounds i8* %src.06, i64 1, !dbg !1978
  %0 = load i8* %src.06, align 1, !dbg !1978, !tbaa !1657
  %incdec.ptr1 = getelementptr inbounds i8* %dest.05, i64 1, !dbg !1978
  store i8 %0, i8* %dest.05, align 1, !dbg !1978, !tbaa !1657
  %cmp = icmp eq i64 %dec, 0, !dbg !1977
  br i1 %cmp, label %while.end, label %while.body, !dbg !1977

while.end:                                        ; preds = %while.body, %entry
  ret i8* %destaddr, !dbg !1979
}

define i8* @memset(i8* %dst, i32 %s, i64 %count) nounwind uwtable {
entry:
  %cmp2 = icmp eq i64 %count, 0, !dbg !1980
  br i1 %cmp2, label %while.end, label %while.body.lr.ph, !dbg !1980

while.body.lr.ph:                                 ; preds = %entry
  %conv = trunc i32 %s to i8, !dbg !1981
  br label %while.body, !dbg !1980

while.body:                                       ; preds = %while.body, %while.body.lr.ph
  %a.04 = phi i8* [ %dst, %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  %count.addr.03 = phi i64 [ %count, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add i64 %count.addr.03, -1, !dbg !1980
  %incdec.ptr = getelementptr inbounds i8* %a.04, i64 1, !dbg !1981
  store volatile i8 %conv, i8* %a.04, align 1, !dbg !1981, !tbaa !1657
  %cmp = icmp eq i64 %dec, 0, !dbg !1980
  br i1 %cmp, label %while.end, label %while.body, !dbg !1980

while.end:                                        ; preds = %while.body, %entry
  ret i8* %dst, !dbg !1982
}

define i32 @cudaArrayGetInfo(%struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture %extent, i32* nocapture %flags, %struct.cudaArray* nocapture %array) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1983
}

define i32 @cudaFree(i8* nocapture %devPtr) nounwind uwtable {
entry:
  tail call void @free(i8* %devPtr) nounwind, !dbg !1985
  ret i32 0, !dbg !1987
}

declare void @free(i8* nocapture) nounwind

define i32 @cudaFreeArray(%struct.cudaArray* nocapture %array) nounwind uwtable {
entry:
  %0 = bitcast %struct.cudaArray* %array to i8*, !dbg !1988
  tail call void @free(i8* %0) nounwind, !dbg !1988
  ret i32 0, !dbg !1990
}

define i32 @cudaFreeHost(i8* nocapture %ptr) nounwind uwtable {
entry:
  tail call void @free(i8* %ptr) nounwind, !dbg !1991
  ret i32 0, !dbg !1993
}

define i32 @cudaGetSymbolAddress(i8** nocapture %devPtr, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1994
}

define i32 @cudaGetSymbolSize(i64* nocapture %size, i8* nocapture %symbol) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1996
}

define i32 @cudaHostAlloc(i8** nocapture %pHost, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !1998
}

define i32 @cudaHostGetDevicePointer(i8** nocapture %pDevice, i8* nocapture %pHost, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2000
}

define i32 @cudaHostGetFlags(i32* nocapture %pFlags, i8* nocapture %pHost) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2002
}

define i32 @cudaHostRegister(i8* nocapture %ptr, i64 %size, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2004
}

define i32 @cudaHostUnregister(i8* nocapture %ptr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2006
}

define i32 @cudaMalloc(i8** nocapture %devPtr, i64 %size) uwtable {
entry:
  tail call void @__set_device(), !dbg !2008
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !2010
  store i8* %call, i8** %devPtr, align 8, !dbg !2010, !tbaa !1814
  tail call void @__clear_device(), !dbg !2011
  ret i32 0, !dbg !2012
}

declare void @__set_device()

declare noalias i8* @malloc(i64) nounwind

declare void @__clear_device()

define i32 @cudaMalloc3D(%struct.cudaPitchedPtr* nocapture %pitchedDevPtr, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2013
}

define i32 @cudaMalloc3DArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, %struct.cudaExtent* nocapture byval align 8 %extent, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2015
}

define i32 @cudaMallocArray(%struct.cudaArray** nocapture %array, %struct.cudaChannelFormatDesc* nocapture %desc, i64 %width, i64 %height, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2017
}

define i32 @cudaMallocHost(i8** nocapture %ptr, i64 %size) uwtable {
entry:
  tail call void @__set_host(), !dbg !2019
  %call = tail call noalias i8* @malloc(i64 %size) nounwind, !dbg !2021
  store i8* %call, i8** %ptr, align 8, !dbg !2021, !tbaa !1814
  tail call void @__clear_host(), !dbg !2022
  ret i32 0, !dbg !2023
}

declare void @__set_host()

declare void @__clear_host()

define i32 @cudaMallocPitch(i8** nocapture %devPtr, i64* nocapture %pitch, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2024
}

define i32 @cudaMemcpy(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !2026
}

define i32 @cudaMemcpy2D(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2028
}

define i32 @cudaMemcpy2DArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2030
}

define i32 @cudaMemcpy2DAsync(i8* nocapture %dst, i64 %dpitch, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2032
}

define i32 @cudaMemcpy2DFromArray(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2034
}

define i32 @cudaMemcpy2DFromArrayAsync(i8* nocapture %dst, i64 %dpitch, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2036
}

define i32 @cudaMemcpy2DToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2038
}

define i32 @cudaMemcpy2DToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %spitch, i64 %width, i64 %height, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2040
}

define i32 @cudaMemcpy3D(%struct.cudaMemcpy3DParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2042
}

define i32 @cudaMemcpy3DAsync(%struct.cudaMemcpy3DParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2044
}

define i32 @cudaMemcpy3DPeer(%struct.cudaMemcpy3DPeerParms* nocapture %p) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2046
}

define i32 @cudaMemcpy3DPeerAsync(%struct.cudaMemcpy3DPeerParms* nocapture %p, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2048
}

define i32 @cudaMemcpyArrayToArray(%struct.cudaArray* nocapture %dst, i64 %wOffsetDst, i64 %hOffsetDst, %struct.cudaArray* nocapture %src, i64 %wOffsetSrc, i64 %hOffsetSrc, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2050
}

define i32 @cudaMemcpyAsync(i8* nocapture %dst, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2052
}

define i32 @cudaMemcpyFromArray(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2054
}

define i32 @cudaMemcpyFromArrayAsync(i8* nocapture %dst, %struct.cudaArray* nocapture %src, i64 %wOffset, i64 %hOffset, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2056
}

define i32 @cudaMemcpyFromSymbol(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2058
}

define i32 @cudaMemcpyFromSymbolAsync(i8* nocapture %dst, i8* nocapture %symbol, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2060
}

define i32 @cudaMemcpyPeer(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !2062
}

define i32 @cudaMemcpyPeerAsync(i8* nocapture %dst, i32 %dstDevice, i8* nocapture %src, i32 %srcDevice, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* %dst, i8* %src, i64 %count)
  ret i32 0, !dbg !2064
}

define i32 @cudaMemcpyToArray(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2066
}

define i32 @cudaMemcpyToArrayAsync(%struct.cudaArray* nocapture %dst, i64 %wOffset, i64 %hOffset, i8* nocapture %src, i64 %count, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2068
}

define i32 @cudaMemcpyToSymbol(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind) nounwind uwtable {
entry:
  %add.ptr = getelementptr inbounds i8* %symbol, i64 %offset, !dbg !2070
  %0 = call i8* @memcpy(i8* %add.ptr, i8* %src, i64 %count)
  ret i32 0, !dbg !2072
}

define i32 @cudaMemcpyToSymbolAsync(i8* nocapture %symbol, i8* nocapture %src, i64 %count, i64 %offset, i32 %kind, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2073
}

define i32 @cudaMemGetInfo(i64* nocapture %free, i64* nocapture %total) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2075
}

define i32 @cudaMemset(i8* nocapture %devPtr, i32 %value, i64 %count) nounwind uwtable {
entry:
  %0 = trunc i32 %value to i8, !dbg !2077
  %1 = zext i8 %0 to i32
  %2 = call i8* @memset(i8* %devPtr, i32 %1, i64 %count)
  ret i32 0, !dbg !2079
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @cudaMemset2D(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2080
}

define i32 @cudaMemset2DAsync(i8* nocapture %devPtr, i64 %pitch, i32 %value, i64 %width, i64 %height, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2082
}

define i32 @cudaMemset3D(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2084
}

define i32 @cudaMemset3DAsync(%struct.cudaPitchedPtr* nocapture byval align 8 %pitchedDevPtr, i32 %value, %struct.cudaExtent* nocapture byval align 8 %extent, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2086
}

define i32 @cudaMemsetAsync(i8* nocapture %devPtr, i32 %value, i64 %count, %struct.CUstream_st* nocapture %stream) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2088
}

define i32 @cudaChooseDevice(i32* nocapture %device, %struct.cudaDeviceProp* nocapture %prop) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !2090, !tbaa !1656
  ret i32 0, !dbg !2092
}

define i32 @cudaDeviceGetByPCIBusId(i32* nocapture %device, i8* nocapture %pciBusId) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !2093, !tbaa !1656
  ret i32 0, !dbg !2095
}

define i32 @cudaDeviceGetCacheConfig(i32* nocapture %pCacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2096
}

define i32 @cudaDeviceGetLimit(i64* nocapture %pValue, i32 %limit) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2098
}

define i32 @cudaDeviceGetPCIBusId(i8* nocapture %pciBusId, i32 %len, i32 %device) nounwind uwtable {
entry:
  %0 = bitcast i8* %pciBusId to i32*, !dbg !2100
  store i32 3171433, i32* %0, align 1, !dbg !2100
  ret i32 0, !dbg !2102
}

define i32 @cudaDeviceReset() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2103
}

define i32 @cudaDeviceSetCacheConfig(i32 %cacheConfig) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2105
}

define i32 @cudaDeviceSetLimit(i32 %limit, i64 %value) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2107
}

define i32 @cudaDeviceSynchronize() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2109
}

define i32 @cudaGetDevice(i32* nocapture %device) nounwind uwtable {
entry:
  store i32 0, i32* %device, align 4, !dbg !2111, !tbaa !1656
  ret i32 0, !dbg !2113
}

define i32 @cudaGetDeviceCount(i32* nocapture %count) nounwind uwtable {
entry:
  store i32 1, i32* %count, align 4, !dbg !2114, !tbaa !1656
  ret i32 0, !dbg !2116
}

define i32 @cudaGetDeviceProperties(%struct.cudaDeviceProp* nocapture %prop, i32 %device) nounwind uwtable {
entry:
  %arraydecay = getelementptr inbounds %struct.cudaDeviceProp* %prop, i64 0, i32 0, i64 0, !dbg !2117
  %0 = call i8* @memcpy(i8* %arraydecay, i8* getelementptr inbounds ([11 x i8]* @.str135, i64 0, i64 0), i64 11)
  ret i32 0, !dbg !2119
}

define i32 @cudaIpcCloseMemHandle(i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2120
}

define i32 @cudaIpcGetEventHandle(%struct.cudaIpcEventHandle_st* nocapture %handle, %struct.CUevent_st* nocapture %event) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2122
}

define i32 @cudaIpcGetMemHandle(%struct.cudaIpcMemHandle_st* nocapture %handle, i8* nocapture %devPtr) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2124
}

define i32 @cudaIpcOpenEventHandle(%struct.CUevent_st** nocapture %event, %struct.cudaIpcEventHandle_st* nocapture byval align 8 %handle) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2126
}

define i32 @cudaIpcOpenMemHandle(i8** nocapture %devPtr, %struct.cudaIpcMemHandle_st* nocapture byval align 8 %handle, i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2128
}

define i32 @cudaSetDevice(i32 %device) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2130
}

define i32 @cudaSetDeviceFlags(i32 %flags) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2132
}

define i32 @cudaSetValidDevices(i32* nocapture %device_arr, i32 %len) nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2134
}

define i8* @cudaGetErrorString(i32 %error) nounwind uwtable {
entry:
  %0 = call i8* @memcpy(i8* getelementptr inbounds ([25 x i8]* @msg, i64 0, i64 0), i8* getelementptr inbounds ([20 x i8]* @cudaGetErrorString.tmp, i64 0, i64 0), i64 17)
  ret i8* getelementptr inbounds ([25 x i8]* @msg, i64 0, i64 0), !dbg !2136
}

define i32 @cudaGetLastError() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2137
}

define i32 @cudaPeekAtLastError() nounwind uwtable readnone {
entry:
  ret i32 0, !dbg !2139
}

!llvm.dbg.cu = !{!0, !567, !829, !840, !858, !874, !891, !1411, !1630}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"CUDA_interface.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !""
!1 = metadata !{metadata !2}
!2 = metadata !{metadata !3, metadata !15, metadata !19, metadata !94}
!3 = metadata !{i32 786436, null, metadata !"pb_TimerID", metadata !4, i32 93, i64 32, i64 32, i32 0, i32 0, null, metadata !5, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [pb_TimerID] [line 93, size 32, align 32, offset 0] [from ]
!4 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/../parboil/common/include/parboil.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type
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
!20 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
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
!94 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !20, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !95, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!95 = metadata !{metadata !96, metadata !97, metadata !98, metadata !99, metadata !100}
!96 = metadata !{i32 786472, metadata !"cudaMemcpyHostToHost", i64 0} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToHost :: 0]
!97 = metadata !{i32 786472, metadata !"cudaMemcpyHostToDevice", i64 1} ; [ DW_TAG_enumerator ] [cudaMemcpyHostToDevice :: 1]
!98 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToHost", i64 2} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToHost :: 2]
!99 = metadata !{i32 786472, metadata !"cudaMemcpyDeviceToDevice", i64 3} ; [ DW_TAG_enumerator ] [cudaMemcpyDeviceToDevice :: 3]
!100 = metadata !{i32 786472, metadata !"cudaMemcpyDefault", i64 4} ; [ DW_TAG_enumerator ] [cudaMemcpyDefault :: 4]
!101 = metadata !{metadata !102}
!102 = metadata !{i32 0}
!103 = metadata !{metadata !104}
!104 = metadata !{metadata !105, metadata !150, metadata !215, metadata !226, metadata !316, metadata !326, metadata !473, metadata !490, metadata !504, metadata !517, metadata !525, metadata !532, metadata !538, metadata !546}
!105 = metadata !{i32 786478, i32 0, metadata !106, metadata !"binning_kernel", metadata !"binning_kernel", metadata !"_Z14binning_kerneljP20ReconstructionSamplePjS1_S1_jj", metadata !106, i32 32, metadata !107, i1 false, i1 true, i32 0, i32 0, null, i32
!106 = metadata !{i32 786473, metadata !"./GPU_kernels.cu", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
!107 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !108, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!108 = metadata !{null, metadata !109, metadata !110, metadata !134, metadata !134, metadata !134, metadata !109, metadata !109}
!109 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned int] [line 0, size 32, align 32, offset 0, enc DW_ATE_unsigned]
!110 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !111} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ReconstructionSample]
!111 = metadata !{i32 786454, null, metadata !"ReconstructionSample", metadata !106, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !112} ; [ DW_TAG_typedef ] [ReconstructionSample] [line 31, size 0, align 0, offset 0] [from ]
!112 = metadata !{i32 786451, null, metadata !"", metadata !113, i32 24, i64 192, i64 32, i32 0, i32 0, null, metadata !114, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 24, size 192, align 32, offset 0] [from ]
!113 = metadata !{i32 786473, metadata !"./UDTypes.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
!114 = metadata !{metadata !115, metadata !117, metadata !118, metadata !119, metadata !120, metadata !121, metadata !122, metadata !128}
!115 = metadata !{i32 786445, metadata !112, metadata !"real", metadata !113, i32 25, i64 32, i64 32, i64 0, i32 0, metadata !116} ; [ DW_TAG_member ] [real] [line 25, size 32, align 32, offset 0] [from float]
!116 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ] [float] [line 0, size 32, align 32, offset 0, enc DW_ATE_float]
!117 = metadata !{i32 786445, metadata !112, metadata !"imag", metadata !113, i32 26, i64 32, i64 32, i64 32, i32 0, metadata !116} ; [ DW_TAG_member ] [imag] [line 26, size 32, align 32, offset 32] [from float]
!118 = metadata !{i32 786445, metadata !112, metadata !"kX", metadata !113, i32 27, i64 32, i64 32, i64 64, i32 0, metadata !116} ; [ DW_TAG_member ] [kX] [line 27, size 32, align 32, offset 64] [from float]
!119 = metadata !{i32 786445, metadata !112, metadata !"kY", metadata !113, i32 28, i64 32, i64 32, i64 96, i32 0, metadata !116} ; [ DW_TAG_member ] [kY] [line 28, size 32, align 32, offset 96] [from float]
!120 = metadata !{i32 786445, metadata !112, metadata !"kZ", metadata !113, i32 29, i64 32, i64 32, i64 128, i32 0, metadata !116} ; [ DW_TAG_member ] [kZ] [line 29, size 32, align 32, offset 128] [from float]
!121 = metadata !{i32 786445, metadata !112, metadata !"sdc", metadata !113, i32 30, i64 32, i64 32, i64 160, i32 0, metadata !116} ; [ DW_TAG_member ] [sdc] [line 30, size 32, align 32, offset 160] [from float]
!122 = metadata !{i32 786478, i32 0, metadata !112, metadata !"", metadata !"", metadata !"", metadata !113, i32 24, metadata !123, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 24} ; [ DW_TAG_subprogram 
!123 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !124, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!124 = metadata !{null, metadata !125}
!125 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !112} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!126 = metadata !{metadata !127}
!127 = metadata !{i32 786468}                     ; [ DW_TAG_base_type ] [line 0, size 0, align 0, offset 0]
!128 = metadata !{i32 786478, i32 0, metadata !112, metadata !"operator=", metadata !"operator=", metadata !"_ZN20ReconstructionSampleaSERKS_", metadata !113, i32 24, metadata !129, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i3
!129 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !130, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!130 = metadata !{metadata !131, metadata !125, metadata !132}
!131 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !112} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!132 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !133} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!133 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !112} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!134 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !109} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from unsigned int]
!135 = metadata !{metadata !136}
!136 = metadata !{metadata !137, metadata !138, metadata !139, metadata !140, metadata !141, metadata !142, metadata !143, metadata !144, metadata !146, metadata !147, metadata !148, metadata !149}
!137 = metadata !{i32 786689, metadata !105, metadata !"n", metadata !106, i32 16777248, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 32]
!138 = metadata !{i32 786689, metadata !105, metadata !"sample_g", metadata !106, i32 33554464, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sample_g] [line 32]
!139 = metadata !{i32 786689, metadata !105, metadata !"idxKey_g", metadata !106, i32 50331680, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idxKey_g] [line 32]
!140 = metadata !{i32 786689, metadata !105, metadata !"idxValue_g", metadata !106, i32 67108897, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idxValue_g] [line 33]
!141 = metadata !{i32 786689, metadata !105, metadata !"binCount_g", metadata !106, i32 83886113, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [binCount_g] [line 33]
!142 = metadata !{i32 786689, metadata !105, metadata !"binsize", metadata !106, i32 100663329, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [binsize] [line 33]
!143 = metadata !{i32 786689, metadata !105, metadata !"gridNumElems", metadata !106, i32 117440545, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [gridNumElems] [line 33]
!144 = metadata !{i32 786688, metadata !145, metadata !"key", metadata !106, i32 34, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [key] [line 34]
!145 = metadata !{i32 786443, metadata !105, i32 33, i32 0, metadata !106, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!146 = metadata !{i32 786688, metadata !145, metadata !"sampleIdx", metadata !106, i32 35, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleIdx] [line 35]
!147 = metadata !{i32 786688, metadata !145, metadata !"pt", metadata !106, i32 36, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt] [line 36]
!148 = metadata !{i32 786688, metadata !145, metadata !"binIdx", metadata !106, i32 37, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [binIdx] [line 37]
!149 = metadata !{i32 786688, metadata !145, metadata !"count", metadata !106, i32 38, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [count] [line 38]
!150 = metadata !{i32 786478, i32 0, metadata !106, metadata !"reorder_kernel", metadata !"reorder_kernel", metadata !"_Z14reorder_kerneliPjP20ReconstructionSample17sampleArrayStruct", metadata !106, i32 61, metadata !151, i1 false, i1 true, i32 0, i32 0
!151 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !152, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!152 = metadata !{null, metadata !153, metadata !134, metadata !110, metadata !154}
!153 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [int] [line 0, size 32, align 32, offset 0, enc DW_ATE_signed]
!154 = metadata !{i32 786454, null, metadata !"sampleArrayStruct", metadata !106, i32 24, i64 0, i64 0, i64 0, i32 0, metadata !155} ; [ DW_TAG_typedef ] [sampleArrayStruct] [line 24, size 0, align 0, offset 0] [from ]
!155 = metadata !{i32 786451, null, metadata !"", metadata !106, i32 21, i64 128, i64 64, i32 0, i32 0, null, metadata !156, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 21, size 128, align 64, offset 0] [from ]
!156 = metadata !{metadata !157, metadata !179}
!157 = metadata !{i32 786445, metadata !155, metadata !"data", metadata !106, i32 22, i64 64, i64 64, i64 0, i32 0, metadata !158} ; [ DW_TAG_member ] [data] [line 22, size 64, align 64, offset 0] [from ]
!158 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !159} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float2]
!159 = metadata !{i32 786454, null, metadata !"float2", metadata !106, i32 393, i64 0, i64 0, i64 0, i32 0, metadata !160} ; [ DW_TAG_typedef ] [float2] [line 393, size 0, align 0, offset 0] [from float2]
!160 = metadata !{i32 786451, null, metadata !"float2", metadata !161, i32 272, i64 64, i64 64, i32 0, i32 0, null, metadata !162, i32 0, null, null} ; [ DW_TAG_structure_type ] [float2] [line 272, size 64, align 64, offset 0] [from ]
!161 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/vector_types.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
!162 = metadata !{metadata !163, metadata !164, metadata !165, metadata !169, metadata !174, metadata !175}
!163 = metadata !{i32 786445, metadata !160, metadata !"x", metadata !161, i32 272, i64 32, i64 32, i64 0, i32 0, metadata !116} ; [ DW_TAG_member ] [x] [line 272, size 32, align 32, offset 0] [from float]
!164 = metadata !{i32 786445, metadata !160, metadata !"y", metadata !161, i32 272, i64 32, i64 32, i64 32, i32 0, metadata !116} ; [ DW_TAG_member ] [y] [line 272, size 32, align 32, offset 32] [from float]
!165 = metadata !{i32 786478, i32 0, metadata !160, metadata !"float2", metadata !"float2", metadata !"", metadata !161, i32 272, metadata !166, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 272} ; [ DW_T
!166 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !167, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!167 = metadata !{null, metadata !168}
!168 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !160} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float2]
!169 = metadata !{i32 786478, i32 0, metadata !160, metadata !"float2", metadata !"float2", metadata !"", metadata !161, i32 272, metadata !170, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 272} ; [ DW_T
!170 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !171, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!171 = metadata !{null, metadata !168, metadata !172}
!172 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !173} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!173 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !160} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float2]
!174 = metadata !{i32 786478, i32 0, metadata !160, metadata !"~float2", metadata !"~float2", metadata !"", metadata !161, i32 272, metadata !166, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 272} ; [ DW
!175 = metadata !{i32 786478, i32 0, metadata !160, metadata !"operator=", metadata !"operator=", metadata !"_ZN6float2aSERKS_", metadata !161, i32 272, metadata !176, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata 
!176 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !177, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!177 = metadata !{metadata !178, metadata !168, metadata !172}
!178 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !160} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from float2]
!179 = metadata !{i32 786445, metadata !155, metadata !"loc", metadata !106, i32 23, i64 64, i64 64, i64 64, i32 0, metadata !180} ; [ DW_TAG_member ] [loc] [line 23, size 64, align 64, offset 64] [from ]
!180 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !181} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float4]
!181 = metadata !{i32 786454, null, metadata !"float4", metadata !106, i32 395, i64 0, i64 0, i64 0, i32 0, metadata !182} ; [ DW_TAG_typedef ] [float4] [line 395, size 0, align 0, offset 0] [from float4]
!182 = metadata !{i32 786451, null, metadata !"float4", metadata !161, i32 282, i64 128, i64 128, i32 0, i32 0, null, metadata !183, i32 0, null, null} ; [ DW_TAG_structure_type ] [float4] [line 282, size 128, align 128, offset 0] [from ]
!183 = metadata !{metadata !184, metadata !185, metadata !186, metadata !187, metadata !188, metadata !192, metadata !197, metadata !198}
!184 = metadata !{i32 786445, metadata !182, metadata !"x", metadata !161, i32 284, i64 32, i64 32, i64 0, i32 0, metadata !116} ; [ DW_TAG_member ] [x] [line 284, size 32, align 32, offset 0] [from float]
!185 = metadata !{i32 786445, metadata !182, metadata !"y", metadata !161, i32 284, i64 32, i64 32, i64 32, i32 0, metadata !116} ; [ DW_TAG_member ] [y] [line 284, size 32, align 32, offset 32] [from float]
!186 = metadata !{i32 786445, metadata !182, metadata !"z", metadata !161, i32 284, i64 32, i64 32, i64 64, i32 0, metadata !116} ; [ DW_TAG_member ] [z] [line 284, size 32, align 32, offset 64] [from float]
!187 = metadata !{i32 786445, metadata !182, metadata !"w", metadata !161, i32 284, i64 32, i64 32, i64 96, i32 0, metadata !116} ; [ DW_TAG_member ] [w] [line 284, size 32, align 32, offset 96] [from float]
!188 = metadata !{i32 786478, i32 0, metadata !182, metadata !"float4", metadata !"float4", metadata !"", metadata !161, i32 282, metadata !189, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 282} ; [ DW_T
!189 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !190, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!190 = metadata !{null, metadata !191}
!191 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !182} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float4]
!192 = metadata !{i32 786478, i32 0, metadata !182, metadata !"float4", metadata !"float4", metadata !"", metadata !161, i32 282, metadata !193, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 282} ; [ DW_T
!193 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !194, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!194 = metadata !{null, metadata !191, metadata !195}
!195 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !196} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!196 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !182} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float4]
!197 = metadata !{i32 786478, i32 0, metadata !182, metadata !"~float4", metadata !"~float4", metadata !"", metadata !161, i32 282, metadata !189, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 282} ; [ DW
!198 = metadata !{i32 786478, i32 0, metadata !182, metadata !"operator=", metadata !"operator=", metadata !"_ZN6float4aSERKS_", metadata !161, i32 282, metadata !199, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata 
!199 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !200, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!200 = metadata !{metadata !201, metadata !191, metadata !195}
!201 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !182} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from float4]
!202 = metadata !{metadata !203}
!203 = metadata !{metadata !204, metadata !205, metadata !206, metadata !207, metadata !208, metadata !210, metadata !211, metadata !212, metadata !214}
!204 = metadata !{i32 786689, metadata !150, metadata !"n", metadata !106, i32 16777277, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 61]
!205 = metadata !{i32 786689, metadata !150, metadata !"idxValue_g", metadata !106, i32 33554493, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [idxValue_g] [line 61]
!206 = metadata !{i32 786689, metadata !150, metadata !"samples_g", metadata !106, i32 50331709, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [samples_g] [line 61]
!207 = metadata !{i32 786689, metadata !150, metadata !"sortedSampleSoA_g", metadata !106, i32 67108925, metadata !154, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sortedSampleSoA_g] [line 61]
!208 = metadata !{i32 786688, metadata !209, metadata !"index", metadata !106, i32 62, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [index] [line 62]
!209 = metadata !{i32 786443, metadata !150, i32 61, i32 0, metadata !106, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!210 = metadata !{i32 786688, metadata !209, metadata !"old_index", metadata !106, i32 63, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [old_index] [line 63]
!211 = metadata !{i32 786688, metadata !209, metadata !"pt", metadata !106, i32 64, metadata !111, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt] [line 64]
!212 = metadata !{i32 786688, metadata !213, metadata !"data", metadata !106, i32 70, metadata !159, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [data] [line 70]
!213 = metadata !{i32 786443, metadata !209, i32 66, i32 0, metadata !106, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!214 = metadata !{i32 786688, metadata !213, metadata !"loc", metadata !106, i32 74, metadata !181, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loc] [line 74]
!215 = metadata !{i32 786478, i32 0, metadata !106, metadata !"kernel_value", metadata !"kernel_value", metadata !"_Z12kernel_valuef", metadata !106, i32 85, metadata !216, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, float (float)* @_Z12kern
!216 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !217, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!217 = metadata !{metadata !116, metadata !116}
!218 = metadata !{metadata !219}
!219 = metadata !{metadata !220, metadata !221, metadata !223, metadata !224, metadata !225}
!220 = metadata !{i32 786689, metadata !215, metadata !"v", metadata !106, i32 16777301, metadata !116, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [v] [line 85]
!221 = metadata !{i32 786688, metadata !222, metadata !"rValue", metadata !106, i32 87, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [rValue] [line 87]
!222 = metadata !{i32 786443, metadata !215, i32 85, i32 0, metadata !106, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!223 = metadata !{i32 786688, metadata !222, metadata !"z", metadata !106, i32 89, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 89]
!224 = metadata !{i32 786688, metadata !222, metadata !"num", metadata !106, i32 92, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [num] [line 92]
!225 = metadata !{i32 786688, metadata !222, metadata !"den", metadata !106, i32 102, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [den] [line 102]
!226 = metadata !{i32 786478, i32 0, metadata !106, metadata !"gridding_GPU", metadata !"gridding_GPU", metadata !"_Z12gridding_GPU17sampleArrayStructPjP6float2Pff", metadata !106, i32 109, metadata !227, i1 false, i1 true, i32 0, i32 0, null, i32 256, i
!227 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !228, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!228 = metadata !{null, metadata !154, metadata !134, metadata !158, metadata !229, metadata !116}
!229 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !116} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from float]
!230 = metadata !{metadata !231}
!231 = metadata !{metadata !232, metadata !233, metadata !234, metadata !235, metadata !236, metadata !237, metadata !240, metadata !241, metadata !242, metadata !243, metadata !244, metadata !245, metadata !246, metadata !247, metadata !248, metadata !2
!232 = metadata !{i32 786689, metadata !226, metadata !"sortedSampleSoA_g", metadata !106, i32 16777325, metadata !154, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sortedSampleSoA_g] [line 109]
!233 = metadata !{i32 786689, metadata !226, metadata !"binStartAddr_g", metadata !106, i32 33554541, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [binStartAddr_g] [line 109]
!234 = metadata !{i32 786689, metadata !226, metadata !"gridData_g", metadata !106, i32 50331757, metadata !158, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [gridData_g] [line 109]
!235 = metadata !{i32 786689, metadata !226, metadata !"sampleDensity_g", metadata !106, i32 67108973, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sampleDensity_g] [line 109]
!236 = metadata !{i32 786689, metadata !226, metadata !"beta", metadata !106, i32 83886189, metadata !116, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [beta] [line 109]
!237 = metadata !{i32 786688, metadata !238, metadata !"flatIdx", metadata !106, i32 117, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [flatIdx] [line 117]
!238 = metadata !{i32 786443, metadata !226, i32 109, i32 0, metadata !106, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!239 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !153} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from int]
!240 = metadata !{i32 786688, metadata !238, metadata !"z0", metadata !106, i32 120, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z0] [line 120]
!241 = metadata !{i32 786688, metadata !238, metadata !"y0", metadata !106, i32 121, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y0] [line 121]
!242 = metadata !{i32 786688, metadata !238, metadata !"x0", metadata !106, i32 122, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x0] [line 122]
!243 = metadata !{i32 786688, metadata !238, metadata !"X", metadata !106, i32 124, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [X] [line 124]
!244 = metadata !{i32 786688, metadata !238, metadata !"Y", metadata !106, i32 125, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Y] [line 125]
!245 = metadata !{i32 786688, metadata !238, metadata !"Z", metadata !106, i32 126, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z] [line 126]
!246 = metadata !{i32 786688, metadata !238, metadata !"Z1", metadata !106, i32 127, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z1] [line 127]
!247 = metadata !{i32 786688, metadata !238, metadata !"Z2", metadata !106, i32 128, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z2] [line 128]
!248 = metadata !{i32 786688, metadata !238, metadata !"Z3", metadata !106, i32 129, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [Z3] [line 129]
!249 = metadata !{i32 786688, metadata !238, metadata !"xl", metadata !106, i32 131, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xl] [line 131]
!250 = metadata !{i32 786688, metadata !238, metadata !"xL", metadata !106, i32 132, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xL] [line 132]
!251 = metadata !{i32 786688, metadata !238, metadata !"xh", metadata !106, i32 133, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xh] [line 133]
!252 = metadata !{i32 786688, metadata !238, metadata !"xH", metadata !106, i32 134, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [xH] [line 134]
!253 = metadata !{i32 786688, metadata !238, metadata !"yl", metadata !106, i32 136, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yl] [line 136]
!254 = metadata !{i32 786688, metadata !238, metadata !"yL", metadata !106, i32 137, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yL] [line 137]
!255 = metadata !{i32 786688, metadata !238, metadata !"yh", metadata !106, i32 138, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yh] [line 138]
!256 = metadata !{i32 786688, metadata !238, metadata !"yH", metadata !106, i32 139, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [yH] [line 139]
!257 = metadata !{i32 786688, metadata !238, metadata !"zl", metadata !106, i32 141, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zl] [line 141]
!258 = metadata !{i32 786688, metadata !238, metadata !"zL", metadata !106, i32 142, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zL] [line 142]
!259 = metadata !{i32 786688, metadata !238, metadata !"zh", metadata !106, i32 143, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zh] [line 143]
!260 = metadata !{i32 786688, metadata !238, metadata !"zH", metadata !106, i32 144, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [zH] [line 144]
!261 = metadata !{i32 786688, metadata !238, metadata !"idx", metadata !106, i32 146, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx] [line 146]
!262 = metadata !{i32 786688, metadata !238, metadata !"idx1", metadata !106, i32 147, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx1] [line 147]
!263 = metadata !{i32 786688, metadata !238, metadata !"idx2", metadata !106, i32 148, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx2] [line 148]
!264 = metadata !{i32 786688, metadata !238, metadata !"idx3", metadata !106, i32 149, metadata !239, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idx3] [line 149]
!265 = metadata !{i32 786688, metadata !238, metadata !"pt", metadata !106, i32 151, metadata !159, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt] [line 151]
!266 = metadata !{i32 786688, metadata !238, metadata !"density", metadata !106, i32 154, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [density] [line 154]
!267 = metadata !{i32 786688, metadata !238, metadata !"pt1", metadata !106, i32 156, metadata !159, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt1] [line 156]
!268 = metadata !{i32 786688, metadata !238, metadata !"density1", metadata !106, i32 159, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [density1] [line 159]
!269 = metadata !{i32 786688, metadata !238, metadata !"pt2", metadata !106, i32 161, metadata !159, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt2] [line 161]
!270 = metadata !{i32 786688, metadata !238, metadata !"density2", metadata !106, i32 164, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [density2] [line 164]
!271 = metadata !{i32 786688, metadata !238, metadata !"pt3", metadata !106, i32 166, metadata !159, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [pt3] [line 166]
!272 = metadata !{i32 786688, metadata !238, metadata !"density3", metadata !106, i32 169, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [density3] [line 169]
!273 = metadata !{i32 786688, metadata !274, metadata !"z", metadata !106, i32 171, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [z] [line 171]
!274 = metadata !{i32 786443, metadata !238, i32 171, i32 0, metadata !106, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!275 = metadata !{i32 786688, metadata !276, metadata !"y", metadata !106, i32 172, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [y] [line 172]
!276 = metadata !{i32 786443, metadata !277, i32 172, i32 0, metadata !106, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!277 = metadata !{i32 786443, metadata !274, i32 171, i32 0, metadata !106, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!278 = metadata !{i32 786688, metadata !279, metadata !"addr", metadata !106, i32 173, metadata !280, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [addr] [line 173]
!279 = metadata !{i32 786443, metadata !276, i32 172, i32 0, metadata !106, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!280 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !281} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!281 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !109} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from unsigned int]
!282 = metadata !{i32 786688, metadata !279, metadata !"start", metadata !106, i32 174, metadata !281, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [start] [line 174]
!283 = metadata !{i32 786688, metadata !279, metadata !"end", metadata !106, i32 175, metadata !281, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [end] [line 175]
!284 = metadata !{i32 786688, metadata !279, metadata !"delta", metadata !106, i32 176, metadata !281, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [delta] [line 176]
!285 = metadata !{i32 786688, metadata !286, metadata !"x", metadata !106, i32 177, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [x] [line 177]
!286 = metadata !{i32 786443, metadata !279, i32 177, i32 0, metadata !106, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!287 = metadata !{i32 786688, metadata !288, metadata !"tileSize", metadata !106, i32 178, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tileSize] [line 178]
!288 = metadata !{i32 786443, metadata !286, i32 177, i32 0, metadata !106, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!289 = metadata !{i32 786688, metadata !288, metadata !"globalIdx", metadata !106, i32 179, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [globalIdx] [line 179]
!290 = metadata !{i32 786688, metadata !291, metadata !"data", metadata !106, i32 182, metadata !292, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [data] [line 182]
!291 = metadata !{i32 786443, metadata !288, i32 181, i32 0, metadata !106, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!292 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !159} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float2]
!293 = metadata !{i32 786688, metadata !291, metadata !"loc", metadata !106, i32 183, metadata !294, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [loc] [line 183]
!294 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !181} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float4]
!295 = metadata !{i32 786688, metadata !296, metadata !"j", metadata !106, i32 194, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [j] [line 194]
!296 = metadata !{i32 786443, metadata !288, i32 194, i32 0, metadata !106, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!297 = metadata !{i32 786688, metadata !298, metadata !"real", metadata !106, i32 195, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [real] [line 195]
!298 = metadata !{i32 786443, metadata !296, i32 194, i32 0, metadata !106, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!299 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !116} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from float]
!300 = metadata !{i32 786688, metadata !298, metadata !"imag", metadata !106, i32 196, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [imag] [line 196]
!301 = metadata !{i32 786688, metadata !298, metadata !"sdc", metadata !106, i32 197, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sdc] [line 197]
!302 = metadata !{i32 786688, metadata !303, metadata !"v0", metadata !106, i32 200, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v0] [line 200]
!303 = metadata !{i32 786443, metadata !298, i32 199, i32 0, metadata !106, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!304 = metadata !{i32 786688, metadata !303, metadata !"v", metadata !106, i32 203, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v] [line 203]
!305 = metadata !{i32 786688, metadata !306, metadata !"w", metadata !106, i32 205, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 205]
!306 = metadata !{i32 786443, metadata !303, i32 204, i32 0, metadata !106, i32 20} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!307 = metadata !{i32 786688, metadata !303, metadata !"v1", metadata !106, i32 211, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v1] [line 211]
!308 = metadata !{i32 786688, metadata !309, metadata !"w", metadata !106, i32 213, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 213]
!309 = metadata !{i32 786443, metadata !303, i32 212, i32 0, metadata !106, i32 21} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!310 = metadata !{i32 786688, metadata !303, metadata !"v2", metadata !106, i32 219, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v2] [line 219]
!311 = metadata !{i32 786688, metadata !312, metadata !"w", metadata !106, i32 221, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 221]
!312 = metadata !{i32 786443, metadata !303, i32 220, i32 0, metadata !106, i32 22} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!313 = metadata !{i32 786688, metadata !303, metadata !"v3", metadata !106, i32 227, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [v3] [line 227]
!314 = metadata !{i32 786688, metadata !315, metadata !"w", metadata !106, i32 229, metadata !299, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [w] [line 229]
!315 = metadata !{i32 786443, metadata !303, i32 228, i32 0, metadata !106, i32 23} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!316 = metadata !{i32 786478, i32 0, metadata !317, metadata !"compare", metadata !"compare", metadata !"_Z7comparePKvS0_", metadata !317, i32 38, metadata !318, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*)* @_Z7comparePKvS0_, 
!317 = metadata !{i32 786473, metadata !"CUDA_interface.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
!318 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !319, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!319 = metadata !{metadata !153, metadata !320, metadata !320}
!320 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !321} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!321 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, null} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!322 = metadata !{metadata !323}
!323 = metadata !{metadata !324, metadata !325}
!324 = metadata !{i32 786689, metadata !316, metadata !"a", metadata !317, i32 16777254, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [a] [line 38]
!325 = metadata !{i32 786689, metadata !316, metadata !"b", metadata !317, i32 33554470, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [b] [line 38]
!326 = metadata !{i32 786478, i32 0, metadata !317, metadata !"CUDA_interface", metadata !"CUDA_interface", metadata !"_Z14CUDA_interfaceP11pb_TimerSetj10parametersP20ReconstructionSamplePfiP5cmplxS4_", metadata !317, i32 44, metadata !327, i1 false, i1 
!327 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !328, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!328 = metadata !{null, metadata !329, metadata !109, metadata !370, metadata !110, metadata !229, metadata !153, metadata !386, metadata !229}
!329 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !330} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_TimerSet]
!330 = metadata !{i32 786451, null, metadata !"pb_TimerSet", metadata !4, i32 136, i64 2304, i64 64, i32 0, i32 0, null, metadata !331, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_TimerSet] [line 136, size 2304, align 64, offset 0] [from ]
!331 = metadata !{metadata !332, metadata !333, metadata !344, metadata !347, metadata !348, metadata !357}
!332 = metadata !{i32 786445, metadata !330, metadata !"current", metadata !4, i32 137, i64 32, i64 32, i64 0, i32 0, metadata !3} ; [ DW_TAG_member ] [current] [line 137, size 32, align 32, offset 0] [from pb_TimerID]
!333 = metadata !{i32 786445, metadata !330, metadata !"async_markers", metadata !4, i32 138, i64 64, i64 64, i64 64, i32 0, metadata !334} ; [ DW_TAG_member ] [async_markers] [line 138, size 64, align 64, offset 64] [from ]
!334 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !335} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_async_time_marker_list]
!335 = metadata !{i32 786451, null, metadata !"pb_async_time_marker_list", metadata !4, i32 115, i64 256, i64 64, i32 0, i32 0, null, metadata !336, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_async_time_marker_list] [line 115, size 256, align 64,
!336 = metadata !{metadata !337, metadata !340, metadata !341, metadata !343}
!337 = metadata !{i32 786445, metadata !335, metadata !"label", metadata !4, i32 116, i64 64, i64 64, i64 0, i32 0, metadata !338} ; [ DW_TAG_member ] [label] [line 116, size 64, align 64, offset 0] [from ]
!338 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !339} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from char]
!339 = metadata !{i32 786468, null, metadata !"char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!340 = metadata !{i32 786445, metadata !335, metadata !"timerID", metadata !4, i32 117, i64 32, i64 32, i64 64, i32 0, metadata !3} ; [ DW_TAG_member ] [timerID] [line 117, size 32, align 32, offset 64] [from pb_TimerID]
!341 = metadata !{i32 786445, metadata !335, metadata !"marker", metadata !4, i32 119, i64 64, i64 64, i64 128, i32 0, metadata !342} ; [ DW_TAG_member ] [marker] [line 119, size 64, align 64, offset 128] [from ]
!342 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, null} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!343 = metadata !{i32 786445, metadata !335, metadata !"next", metadata !4, i32 121, i64 64, i64 64, i64 192, i32 0, metadata !334} ; [ DW_TAG_member ] [next] [line 121, size 64, align 64, offset 192] [from ]
!344 = metadata !{i32 786445, metadata !330, metadata !"async_begin", metadata !4, i32 139, i64 64, i64 64, i64 128, i32 0, metadata !345} ; [ DW_TAG_member ] [async_begin] [line 139, size 64, align 64, offset 128] [from pb_Timestamp]
!345 = metadata !{i32 786454, null, metadata !"pb_Timestamp", metadata !4, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !346} ; [ DW_TAG_typedef ] [pb_Timestamp] [line 48, size 0, align 0, offset 0] [from long long unsigned int]
!346 = metadata !{i32 786468, null, metadata !"long long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!347 = metadata !{i32 786445, metadata !330, metadata !"wall_begin", metadata !4, i32 140, i64 64, i64 64, i64 192, i32 0, metadata !345} ; [ DW_TAG_member ] [wall_begin] [line 140, size 64, align 64, offset 192] [from pb_Timestamp]
!348 = metadata !{i32 786445, metadata !330, metadata !"timers", metadata !4, i32 141, i64 1536, i64 64, i64 256, i32 0, metadata !349} ; [ DW_TAG_member ] [timers] [line 141, size 1536, align 64, offset 256] [from ]
!349 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1536, i64 64, i32 0, i32 0, metadata !350, metadata !355, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 1536, align 64, offset 0] [from pb_Timer]
!350 = metadata !{i32 786451, null, metadata !"pb_Timer", metadata !4, i32 58, i64 192, i64 64, i32 0, i32 0, null, metadata !351, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_Timer] [line 58, size 192, align 64, offset 0] [from ]
!351 = metadata !{metadata !352, metadata !353, metadata !354}
!352 = metadata !{i32 786445, metadata !350, metadata !"state", metadata !4, i32 59, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [state] [line 59, size 32, align 32, offset 0] [from pb_TimerState]
!353 = metadata !{i32 786445, metadata !350, metadata !"elapsed", metadata !4, i32 60, i64 64, i64 64, i64 64, i32 0, metadata !345} ; [ DW_TAG_member ] [elapsed] [line 60, size 64, align 64, offset 64] [from pb_Timestamp]
!354 = metadata !{i32 786445, metadata !350, metadata !"init", metadata !4, i32 61, i64 64, i64 64, i64 128, i32 0, metadata !345} ; [ DW_TAG_member ] [init] [line 61, size 64, align 64, offset 128] [from pb_Timestamp]
!355 = metadata !{metadata !356}
!356 = metadata !{i32 786465, i64 0, i64 7}       ; [ DW_TAG_subrange_type ] [0, 7]
!357 = metadata !{i32 786445, metadata !330, metadata !"sub_timer_list", metadata !4, i32 142, i64 512, i64 64, i64 1792, i32 0, metadata !358} ; [ DW_TAG_member ] [sub_timer_list] [line 142, size 512, align 64, offset 1792] [from ]
!358 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 64, i32 0, i32 0, metadata !359, metadata !355, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from ]
!359 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !360} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_SubTimerList]
!360 = metadata !{i32 786451, null, metadata !"pb_SubTimerList", metadata !4, i32 130, i64 128, i64 64, i32 0, i32 0, null, metadata !361, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_SubTimerList] [line 130, size 128, align 64, offset 0] [from ]
!361 = metadata !{metadata !362, metadata !369}
!362 = metadata !{i32 786445, metadata !360, metadata !"current", metadata !4, i32 131, i64 64, i64 64, i64 0, i32 0, metadata !363} ; [ DW_TAG_member ] [current] [line 131, size 64, align 64, offset 0] [from ]
!363 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !364} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_SubTimer]
!364 = metadata !{i32 786451, null, metadata !"pb_SubTimer", metadata !4, i32 124, i64 320, i64 64, i32 0, i32 0, null, metadata !365, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_SubTimer] [line 124, size 320, align 64, offset 0] [from ]
!365 = metadata !{metadata !366, metadata !367, metadata !368}
!366 = metadata !{i32 786445, metadata !364, metadata !"label", metadata !4, i32 125, i64 64, i64 64, i64 0, i32 0, metadata !338} ; [ DW_TAG_member ] [label] [line 125, size 64, align 64, offset 0] [from ]
!367 = metadata !{i32 786445, metadata !364, metadata !"timer", metadata !4, i32 126, i64 192, i64 64, i64 64, i32 0, metadata !350} ; [ DW_TAG_member ] [timer] [line 126, size 192, align 64, offset 64] [from pb_Timer]
!368 = metadata !{i32 786445, metadata !364, metadata !"next", metadata !4, i32 127, i64 64, i64 64, i64 256, i32 0, metadata !363} ; [ DW_TAG_member ] [next] [line 127, size 64, align 64, offset 256] [from ]
!369 = metadata !{i32 786445, metadata !360, metadata !"subtimer_list", metadata !4, i32 132, i64 64, i64 64, i64 64, i32 0, metadata !363} ; [ DW_TAG_member ] [subtimer_list] [line 132, size 64, align 64, offset 64] [from ]
!370 = metadata !{i32 786454, null, metadata !"parameters", metadata !317, i32 22, i64 0, i64 0, i64 0, i32 0, metadata !371} ; [ DW_TAG_typedef ] [parameters] [line 22, size 0, align 0, offset 0] [from ]
!371 = metadata !{i32 786451, null, metadata !"", metadata !113, i32 12, i64 544, i64 32, i32 0, i32 0, null, metadata !372, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 12, size 544, align 32, offset 0] [from ]
!372 = metadata !{metadata !373, metadata !374, metadata !378, metadata !379, metadata !381, metadata !382, metadata !383, metadata !384, metadata !385}
!373 = metadata !{i32 786445, metadata !371, metadata !"numSamples", metadata !113, i32 13, i64 32, i64 32, i64 0, i32 0, metadata !153} ; [ DW_TAG_member ] [numSamples] [line 13, size 32, align 32, offset 0] [from int]
!374 = metadata !{i32 786445, metadata !371, metadata !"aquisitionMatrixSize", metadata !113, i32 14, i64 96, i64 32, i64 32, i32 0, metadata !375} ; [ DW_TAG_member ] [aquisitionMatrixSize] [line 14, size 96, align 32, offset 32] [from ]
!375 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !153, metadata !376, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from int]
!376 = metadata !{metadata !377}
!377 = metadata !{i32 786465, i64 0, i64 2}       ; [ DW_TAG_subrange_type ] [0, 2]
!378 = metadata !{i32 786445, metadata !371, metadata !"reconstructionMatrixSize", metadata !113, i32 15, i64 96, i64 32, i64 128, i32 0, metadata !375} ; [ DW_TAG_member ] [reconstructionMatrixSize] [line 15, size 96, align 32, offset 128] [from ]
!379 = metadata !{i32 786445, metadata !371, metadata !"kMax", metadata !113, i32 16, i64 96, i64 32, i64 224, i32 0, metadata !380} ; [ DW_TAG_member ] [kMax] [line 16, size 96, align 32, offset 224] [from ]
!380 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 96, i64 32, i32 0, i32 0, metadata !116, metadata !376, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 96, align 32, offset 0] [from float]
!381 = metadata !{i32 786445, metadata !371, metadata !"gridSize", metadata !113, i32 17, i64 96, i64 32, i64 320, i32 0, metadata !375} ; [ DW_TAG_member ] [gridSize] [line 17, size 96, align 32, offset 320] [from ]
!382 = metadata !{i32 786445, metadata !371, metadata !"oversample", metadata !113, i32 18, i64 32, i64 32, i64 416, i32 0, metadata !116} ; [ DW_TAG_member ] [oversample] [line 18, size 32, align 32, offset 416] [from float]
!383 = metadata !{i32 786445, metadata !371, metadata !"kernelWidth", metadata !113, i32 19, i64 32, i64 32, i64 448, i32 0, metadata !116} ; [ DW_TAG_member ] [kernelWidth] [line 19, size 32, align 32, offset 448] [from float]
!384 = metadata !{i32 786445, metadata !371, metadata !"binsize", metadata !113, i32 20, i64 32, i64 32, i64 480, i32 0, metadata !153} ; [ DW_TAG_member ] [binsize] [line 20, size 32, align 32, offset 480] [from int]
!385 = metadata !{i32 786445, metadata !371, metadata !"useLUT", metadata !113, i32 21, i64 32, i64 32, i64 512, i32 0, metadata !153} ; [ DW_TAG_member ] [useLUT] [line 21, size 32, align 32, offset 512] [from int]
!386 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !387} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cmplx]
!387 = metadata !{i32 786454, null, metadata !"cmplx", metadata !317, i32 36, i64 0, i64 0, i64 0, i32 0, metadata !388} ; [ DW_TAG_typedef ] [cmplx] [line 36, size 0, align 0, offset 0] [from ]
!388 = metadata !{i32 786451, null, metadata !"", metadata !113, i32 33, i64 64, i64 32, i32 0, i32 0, null, metadata !389, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 33, size 64, align 32, offset 0] [from ]
!389 = metadata !{metadata !390, metadata !391}
!390 = metadata !{i32 786445, metadata !388, metadata !"real", metadata !113, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !116} ; [ DW_TAG_member ] [real] [line 34, size 32, align 32, offset 0] [from float]
!391 = metadata !{i32 786445, metadata !388, metadata !"imag", metadata !113, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !116} ; [ DW_TAG_member ] [imag] [line 35, size 32, align 32, offset 32] [from float]
!392 = metadata !{metadata !393}
!393 = metadata !{metadata !394, metadata !395, metadata !396, metadata !397, metadata !398, metadata !399, metadata !400, metadata !401, metadata !402, metadata !443, metadata !444, metadata !445, metadata !446, metadata !447, metadata !448, metadata !4
!394 = metadata !{i32 786689, metadata !326, metadata !"timers", metadata !317, i32 16777261, metadata !329, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [timers] [line 45]
!395 = metadata !{i32 786689, metadata !326, metadata !"n", metadata !317, i32 33554478, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [n] [line 46]
!396 = metadata !{i32 786689, metadata !326, metadata !"params", metadata !317, i32 50331695, metadata !370, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [params] [line 47]
!397 = metadata !{i32 786689, metadata !326, metadata !"sample", metadata !317, i32 67108912, metadata !110, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sample] [line 48]
!398 = metadata !{i32 786689, metadata !326, metadata !"LUT", metadata !317, i32 83886129, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [LUT] [line 49]
!399 = metadata !{i32 786689, metadata !326, metadata !"sizeLUT", metadata !317, i32 100663347, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sizeLUT] [line 51]
!400 = metadata !{i32 786689, metadata !326, metadata !"gridData", metadata !317, i32 117440564, metadata !386, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [gridData] [line 52]
!401 = metadata !{i32 786689, metadata !326, metadata !"sampleDensity", metadata !317, i32 134217781, metadata !229, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [sampleDensity] [line 53]
!402 = metadata !{i32 786688, metadata !403, metadata !"dims", metadata !317, i32 58, metadata !404, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dims] [line 58]
!403 = metadata !{i32 786443, metadata !326, i32 55, i32 0, metadata !317, i32 25} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/CUDA_interface.cpp]
!404 = metadata !{i32 786454, null, metadata !"dim3", metadata !317, i32 425, i64 0, i64 0, i64 0, i32 0, metadata !405} ; [ DW_TAG_typedef ] [dim3] [line 425, size 0, align 0, offset 0] [from dim3]
!405 = metadata !{i32 786451, null, metadata !"dim3", metadata !161, i32 415, i64 96, i64 32, i32 0, i32 0, null, metadata !406, i32 0, null, null} ; [ DW_TAG_structure_type ] [dim3] [line 415, size 96, align 32, offset 0] [from ]
!406 = metadata !{metadata !407, metadata !408, metadata !409, metadata !410, metadata !414, metadata !432, metadata !435, metadata !440}
!407 = metadata !{i32 786445, metadata !405, metadata !"x", metadata !161, i32 417, i64 32, i64 32, i64 0, i32 0, metadata !109} ; [ DW_TAG_member ] [x] [line 417, size 32, align 32, offset 0] [from unsigned int]
!408 = metadata !{i32 786445, metadata !405, metadata !"y", metadata !161, i32 417, i64 32, i64 32, i64 32, i32 0, metadata !109} ; [ DW_TAG_member ] [y] [line 417, size 32, align 32, offset 32] [from unsigned int]
!409 = metadata !{i32 786445, metadata !405, metadata !"z", metadata !161, i32 417, i64 32, i64 32, i64 64, i32 0, metadata !109} ; [ DW_TAG_member ] [z] [line 417, size 32, align 32, offset 64] [from unsigned int]
!410 = metadata !{i32 786478, i32 0, metadata !405, metadata !"dim3", metadata !"dim3", metadata !"", metadata !161, i32 419, metadata !411, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !126, i32 419} ; [ DW_TAG_s
!411 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !412, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!412 = metadata !{null, metadata !413, metadata !109, metadata !109, metadata !109}
!413 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !405} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!414 = metadata !{i32 786478, i32 0, metadata !405, metadata !"dim3", metadata !"dim3", metadata !"", metadata !161, i32 420, metadata !415, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0, metadata !126, i32 420} ; [ DW_TAG_s
!415 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !416, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!416 = metadata !{null, metadata !413, metadata !417}
!417 = metadata !{i32 786454, null, metadata !"uint3", metadata !161, i32 381, i64 0, i64 0, i64 0, i32 0, metadata !418} ; [ DW_TAG_typedef ] [uint3] [line 381, size 0, align 0, offset 0] [from uint3]
!418 = metadata !{i32 786451, null, metadata !"uint3", metadata !161, i32 188, i64 96, i64 32, i32 0, i32 0, null, metadata !419, i32 0, null, null} ; [ DW_TAG_structure_type ] [uint3] [line 188, size 96, align 32, offset 0] [from ]
!419 = metadata !{metadata !420, metadata !421, metadata !422, metadata !423, metadata !427}
!420 = metadata !{i32 786445, metadata !418, metadata !"x", metadata !161, i32 190, i64 32, i64 32, i64 0, i32 0, metadata !109} ; [ DW_TAG_member ] [x] [line 190, size 32, align 32, offset 0] [from unsigned int]
!421 = metadata !{i32 786445, metadata !418, metadata !"y", metadata !161, i32 190, i64 32, i64 32, i64 32, i32 0, metadata !109} ; [ DW_TAG_member ] [y] [line 190, size 32, align 32, offset 32] [from unsigned int]
!422 = metadata !{i32 786445, metadata !418, metadata !"z", metadata !161, i32 190, i64 32, i64 32, i64 64, i32 0, metadata !109} ; [ DW_TAG_member ] [z] [line 190, size 32, align 32, offset 64] [from unsigned int]
!423 = metadata !{i32 786478, i32 0, metadata !418, metadata !"uint3", metadata !"uint3", metadata !"", metadata !161, i32 188, metadata !424, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 188} ; [ DW_TAG
!424 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !425, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!425 = metadata !{null, metadata !426}
!426 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !418} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from uint3]
!427 = metadata !{i32 786478, i32 0, metadata !418, metadata !"uint3", metadata !"uint3", metadata !"", metadata !161, i32 188, metadata !428, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 188} ; [ DW_TAG
!428 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !429, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!429 = metadata !{null, metadata !426, metadata !430}
!430 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !431} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!431 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !418} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from uint3]
!432 = metadata !{i32 786478, i32 0, metadata !405, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !161, i32 421, metadata !433, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 true, null, null, i32 0
!433 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !434, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!434 = metadata !{metadata !417, metadata !413}
!435 = metadata !{i32 786478, i32 0, metadata !405, metadata !"dim3", metadata !"dim3", metadata !"", metadata !161, i32 415, metadata !436, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 415} ; [ DW_TAG_s
!436 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !437, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!437 = metadata !{null, metadata !413, metadata !438}
!438 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !439} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!439 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !405} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from dim3]
!440 = metadata !{i32 786478, i32 0, metadata !405, metadata !"~dim3", metadata !"~dim3", metadata !"", metadata !161, i32 415, metadata !441, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 415} ; [ DW_TAG
!441 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !442, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!442 = metadata !{null, metadata !413}
!443 = metadata !{i32 786688, metadata !403, metadata !"size_x", metadata !317, i32 61, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_x] [line 61]
!444 = metadata !{i32 786688, metadata !403, metadata !"size_y", metadata !317, i32 62, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_y] [line 62]
!445 = metadata !{i32 786688, metadata !403, metadata !"size_z", metadata !317, i32 63, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_z] [line 63]
!446 = metadata !{i32 786688, metadata !403, metadata !"size_xy", metadata !317, i32 64, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_xy] [line 64]
!447 = metadata !{i32 786688, metadata !403, metadata !"gridNumElems", metadata !317, i32 66, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridNumElems] [line 66]
!448 = metadata !{i32 786688, metadata !403, metadata !"beta", metadata !317, i32 68, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [beta] [line 68]
!449 = metadata !{i32 786688, metadata !403, metadata !"cutoff", metadata !317, i32 70, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutoff] [line 70]
!450 = metadata !{i32 786688, metadata !403, metadata !"cutoff2", metadata !317, i32 71, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [cutoff2] [line 71]
!451 = metadata !{i32 786688, metadata !403, metadata !"_1overCutoff2", metadata !317, i32 72, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [_1overCutoff2] [line 72]
!452 = metadata !{i32 786688, metadata !403, metadata !"npad", metadata !317, i32 75, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [npad] [line 75]
!453 = metadata !{i32 786688, metadata !403, metadata !"gridData_CPU", metadata !317, i32 81, metadata !386, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridData_CPU] [line 81]
!454 = metadata !{i32 786688, metadata !403, metadata !"sampleDensity_CPU", metadata !317, i32 82, metadata !229, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleDensity_CPU] [line 82]
!455 = metadata !{i32 786688, metadata !403, metadata !"indices_CPU", metadata !317, i32 83, metadata !456, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [indices_CPU] [line 83]
!456 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !153} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from int]
!457 = metadata !{i32 786688, metadata !403, metadata !"sample_d", metadata !317, i32 86, metadata !110, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sample_d] [line 86]
!458 = metadata !{i32 786688, metadata !403, metadata !"sortedSample_d", metadata !317, i32 87, metadata !229, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sortedSample_d] [line 87]
!459 = metadata !{i32 786688, metadata !403, metadata !"gridData_d", metadata !317, i32 90, metadata !158, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridData_d] [line 90]
!460 = metadata !{i32 786688, metadata !403, metadata !"sampleDensity_d", metadata !317, i32 91, metadata !229, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleDensity_d] [line 91]
!461 = metadata !{i32 786688, metadata !403, metadata !"idxKey_d", metadata !317, i32 92, metadata !134, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idxKey_d] [line 92]
!462 = metadata !{i32 786688, metadata !403, metadata !"idxValue_d", metadata !317, i32 95, metadata !134, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [idxValue_d] [line 95]
!463 = metadata !{i32 786688, metadata !403, metadata !"sortedSampleSoA_d", metadata !317, i32 100, metadata !154, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sortedSampleSoA_d] [line 100]
!464 = metadata !{i32 786688, metadata !403, metadata !"binCount_d", metadata !317, i32 103, metadata !134, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [binCount_d] [line 103]
!465 = metadata !{i32 786688, metadata !403, metadata !"binStartAddr_d", metadata !317, i32 106, metadata !134, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [binStartAddr_d] [line 106]
!466 = metadata !{i32 786688, metadata !467, metadata !"err", metadata !317, i32 123, metadata !468, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 123]
!467 = metadata !{i32 786443, metadata !403, i32 123, i32 0, metadata !317, i32 27} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/CUDA_interface.cpp]
!468 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !317, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!469 = metadata !{i32 786688, metadata !470, metadata !"err", metadata !317, i32 224, metadata !468, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 224]
!470 = metadata !{i32 786443, metadata !403, i32 224, i32 0, metadata !317, i32 29} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/CUDA_interface.cpp]
!471 = metadata !{i32 786688, metadata !403, metadata !"block2", metadata !317, i32 233, metadata !404, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [block2] [line 233]
!472 = metadata !{i32 786688, metadata !403, metadata !"grid2", metadata !317, i32 234, metadata !404, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [grid2] [line 234]
!473 = metadata !{i32 786478, i32 0, metadata !474, metadata !"cudaMemcpyToSymbol<int>", metadata !"cudaMemcpyToSymbol<int>", metadata !"_ZN12_GLOBAL__N_118cudaMemcpyToSymbolIiEE9cudaErrorRKT_PKvmm14cudaMemcpyKind", metadata !475, i32 320, metadata !476,
!474 = metadata !{i32 786489, null, metadata !"", metadata !475, i32 93} ; [ DW_TAG_namespace ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding//home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h]
!475 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
!476 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !477, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!477 = metadata !{metadata !468, metadata !478, metadata !320, metadata !479, metadata !479, metadata !94}
!478 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !239} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!479 = metadata !{i32 786454, null, metadata !"size_t", metadata !475, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !480} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!480 = metadata !{i32 786468, null, metadata !"long unsigned int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [long unsigned int] [line 0, size 64, align 64, offset 0, enc DW_ATE_unsigned]
!481 = metadata !{metadata !482}
!482 = metadata !{i32 786479, null, metadata !"T", metadata !153, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!483 = metadata !{metadata !484}
!484 = metadata !{metadata !485, metadata !486, metadata !487, metadata !488, metadata !489}
!485 = metadata !{i32 786689, metadata !473, metadata !"symbol", metadata !475, i32 16777537, metadata !478, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 321]
!486 = metadata !{i32 786689, metadata !473, metadata !"src", metadata !475, i32 33554754, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 322]
!487 = metadata !{i32 786689, metadata !473, metadata !"count", metadata !475, i32 50331971, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 323]
!488 = metadata !{i32 786689, metadata !473, metadata !"offset", metadata !475, i32 67109188, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 324]
!489 = metadata !{i32 786689, metadata !473, metadata !"kind", metadata !475, i32 83886405, metadata !94, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 325]
!490 = metadata !{i32 786478, i32 0, metadata !474, metadata !"cudaMemcpyToSymbol<int [3]>", metadata !"cudaMemcpyToSymbol<int [3]>", metadata !"_ZN12_GLOBAL__N_118cudaMemcpyToSymbolIA3_iEE9cudaErrorRKT_PKvmm14cudaMemcpyKind", metadata !475, i32 320, met
!491 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !492, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!492 = metadata !{metadata !468, metadata !493, metadata !320, metadata !479, metadata !479, metadata !94}
!493 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !494} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!494 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !375} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from ]
!495 = metadata !{metadata !496}
!496 = metadata !{i32 786479, null, metadata !"T", metadata !375, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!497 = metadata !{metadata !498}
!498 = metadata !{metadata !499, metadata !500, metadata !501, metadata !502, metadata !503}
!499 = metadata !{i32 786689, metadata !490, metadata !"symbol", metadata !475, i32 16777537, metadata !493, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 321]
!500 = metadata !{i32 786689, metadata !490, metadata !"src", metadata !475, i32 33554754, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 322]
!501 = metadata !{i32 786689, metadata !490, metadata !"count", metadata !475, i32 50331971, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 323]
!502 = metadata !{i32 786689, metadata !490, metadata !"offset", metadata !475, i32 67109188, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 324]
!503 = metadata !{i32 786689, metadata !490, metadata !"kind", metadata !475, i32 83886405, metadata !94, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 325]
!504 = metadata !{i32 786478, i32 0, metadata !474, metadata !"cudaMemcpyToSymbol<float>", metadata !"cudaMemcpyToSymbol<float>", metadata !"_ZN12_GLOBAL__N_118cudaMemcpyToSymbolIfEE9cudaErrorRKT_PKvmm14cudaMemcpyKind", metadata !475, i32 320, metadata !
!505 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !506, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!506 = metadata !{metadata !468, metadata !507, metadata !320, metadata !479, metadata !479, metadata !94}
!507 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !299} ; [ DW_TAG_reference_type ] [line 0, size 0, align 0, offset 0] [from ]
!508 = metadata !{metadata !509}
!509 = metadata !{i32 786479, null, metadata !"T", metadata !116, null, i32 0, i32 0} ; [ DW_TAG_template_type_parameter ]
!510 = metadata !{metadata !511}
!511 = metadata !{metadata !512, metadata !513, metadata !514, metadata !515, metadata !516}
!512 = metadata !{i32 786689, metadata !504, metadata !"symbol", metadata !475, i32 16777537, metadata !507, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 321]
!513 = metadata !{i32 786689, metadata !504, metadata !"src", metadata !475, i32 33554754, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 322]
!514 = metadata !{i32 786689, metadata !504, metadata !"count", metadata !475, i32 50331971, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 323]
!515 = metadata !{i32 786689, metadata !504, metadata !"offset", metadata !475, i32 67109188, metadata !479, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 324]
!516 = metadata !{i32 786689, metadata !504, metadata !"kind", metadata !475, i32 83886405, metadata !94, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 325]
!517 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !161, i32 419, metadata !411, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !410, metadata !518, i32 419} 
!518 = metadata !{metadata !519}
!519 = metadata !{metadata !520, metadata !522, metadata !523, metadata !524}
!520 = metadata !{i32 786689, metadata !517, metadata !"this", metadata !161, i32 16777635, metadata !521, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!521 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !405} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from dim3]
!522 = metadata !{i32 786689, metadata !517, metadata !"vx", metadata !161, i32 33554851, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!523 = metadata !{i32 786689, metadata !517, metadata !"vy", metadata !161, i32 50332067, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!524 = metadata !{i32 786689, metadata !517, metadata !"vz", metadata !161, i32 67109283, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!525 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !161, i32 419, metadata !411, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, metadata !410, metadata !526, i32 419} 
!526 = metadata !{metadata !527}
!527 = metadata !{metadata !528, metadata !529, metadata !530, metadata !531}
!528 = metadata !{i32 786689, metadata !525, metadata !"this", metadata !161, i32 16777635, metadata !521, i32 1088, i32 0} ; [ DW_TAG_arg_variable ] [this] [line 419]
!529 = metadata !{i32 786689, metadata !525, metadata !"vx", metadata !161, i32 33554851, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vx] [line 419]
!530 = metadata !{i32 786689, metadata !525, metadata !"vy", metadata !161, i32 50332067, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vy] [line 419]
!531 = metadata !{i32 786689, metadata !525, metadata !"vz", metadata !161, i32 67109283, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [vz] [line 419]
!532 = metadata !{i32 786478, i32 0, metadata !533, metadata !"ceil", metadata !"ceil", metadata !"_ZSt4ceilf", metadata !534, i32 183, metadata !216, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !535, i32 184} ; [ 
!533 = metadata !{i32 786489, null, metadata !"std", metadata !534, i32 74} ; [ DW_TAG_namespace ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding//usr/lib/gcc/x86_64-linux-gnu/4.9/../../../../include/c++/4.9/cmath]
!534 = metadata !{i32 786473, metadata !"/usr/lib/gcc/x86_64-linux-gnu/4.9/../../../../include/c++/4.9/cmath", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
!535 = metadata !{metadata !536}
!536 = metadata !{metadata !537}
!537 = metadata !{i32 786689, metadata !532, metadata !"__x", metadata !534, i32 16777399, metadata !116, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__x] [line 183]
!538 = metadata !{i32 786478, i32 0, metadata !539, metadata !"atomicSub", metadata !"atomicSub", metadata !"_ZL9atomicSubPjj", metadata !539, i32 111, metadata !540, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !542
!539 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_functions.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
!540 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !541, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!541 = metadata !{metadata !109, metadata !134, metadata !109}
!542 = metadata !{metadata !543}
!543 = metadata !{metadata !544, metadata !545}
!544 = metadata !{i32 786689, metadata !538, metadata !"address", metadata !539, i32 16777327, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [address] [line 111]
!545 = metadata !{i32 786689, metadata !538, metadata !"val", metadata !539, i32 33554543, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 111]
!546 = metadata !{i32 786478, i32 0, metadata !539, metadata !"atomicAdd", metadata !"atomicAdd", metadata !"_ZL9atomicAddPjj", metadata !539, i32 101, metadata !540, i1 true, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !547
!547 = metadata !{metadata !548}
!548 = metadata !{metadata !549, metadata !550}
!549 = metadata !{i32 786689, metadata !546, metadata !"address", metadata !539, i32 16777317, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [address] [line 101]
!550 = metadata !{i32 786689, metadata !546, metadata !"val", metadata !539, i32 33554533, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [val] [line 101]
!551 = metadata !{metadata !552}
!552 = metadata !{metadata !553, metadata !557, metadata !558, metadata !559, metadata !560, metadata !561, metadata !562, metadata !563, metadata !564, metadata !565, metadata !566}
!553 = metadata !{i32 786484, i32 0, metadata !226, metadata !"real_s", metadata !"real_s", metadata !"", metadata !106, i32 110, metadata !554, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6real_s} ; [ DW_TAG_variable ]
!554 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 32, i32 0, i32 0, metadata !116, metadata !555, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 32, offset 0] [from float]
!555 = metadata !{metadata !556}
!556 = metadata !{i32 786465, i64 0, i64 63}      ; [ DW_TAG_subrange_type ] [0, 63]
!557 = metadata !{i32 786484, i32 0, metadata !226, metadata !"imag_s", metadata !"imag_s", metadata !"", metadata !106, i32 111, metadata !554, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE6imag_s} ; [ DW_TAG_variable ]
!558 = metadata !{i32 786484, i32 0, metadata !226, metadata !"kx_s", metadata !"kx_s", metadata !"", metadata !106, i32 112, metadata !554, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kx_s} ; [ DW_TAG_variable ] [kx_s
!559 = metadata !{i32 786484, i32 0, metadata !226, metadata !"ky_s", metadata !"ky_s", metadata !"", metadata !106, i32 113, metadata !554, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4ky_s} ; [ DW_TAG_variable ] [ky_s
!560 = metadata !{i32 786484, i32 0, metadata !226, metadata !"kz_s", metadata !"kz_s", metadata !"", metadata !106, i32 114, metadata !554, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE4kz_s} ; [ DW_TAG_variable ] [kz_s
!561 = metadata !{i32 786484, i32 0, metadata !226, metadata !"sdc_s", metadata !"sdc_s", metadata !"", metadata !106, i32 115, metadata !554, i32 1, i32 1, [64 x float]* @_ZZ12gridding_GPU17sampleArrayStructPjP6float2PffE5sdc_s} ; [ DW_TAG_variable ] [s
!562 = metadata !{i32 786484, i32 0, null, metadata !"_1overCutoff2_c", metadata !"_1overCutoff2_c", metadata !"_ZL15_1overCutoff2_c", metadata !106, i32 30, metadata !116, i32 1, i32 1, float* @_ZL15_1overCutoff2_c} ; [ DW_TAG_variable ] [_1overCutoff2_
!563 = metadata !{i32 786484, i32 0, null, metadata !"cutoff2_c", metadata !"cutoff2_c", metadata !"_ZL9cutoff2_c", metadata !106, i32 26, metadata !116, i32 1, i32 1, float* @_ZL9cutoff2_c} ; [ DW_TAG_variable ] [cutoff2_c] [line 26] [local] [def]
!564 = metadata !{i32 786484, i32 0, null, metadata !"cutoff_c", metadata !"cutoff_c", metadata !"_ZL8cutoff_c", metadata !106, i32 27, metadata !116, i32 1, i32 1, float* @_ZL8cutoff_c} ; [ DW_TAG_variable ] [cutoff_c] [line 27] [local] [def]
!565 = metadata !{i32 786484, i32 0, null, metadata !"gridSize_c", metadata !"gridSize_c", metadata !"_ZL10gridSize_c", metadata !106, i32 28, metadata !375, i32 1, i32 1, [3 x i32]* @_ZL10gridSize_c} ; [ DW_TAG_variable ] [gridSize_c] [line 28] [local] 
!566 = metadata !{i32 786484, i32 0, null, metadata !"size_xy_c", metadata !"size_xy_c", metadata !"_ZL9size_xy_c", metadata !106, i32 29, metadata !153, i32 1, i32 1, i32* @_ZL9size_xy_c} ; [ DW_TAG_variable ] [size_xy_c] [line 29] [local] [def]
!567 = metadata !{i32 786449, i32 0, i32 4, metadata !"main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !"", i32 0,
!568 = metadata !{metadata !569}
!569 = metadata !{metadata !3, metadata !15, metadata !19}
!570 = metadata !{metadata !571}
!571 = metadata !{metadata !572, metadata !715, metadata !747, metadata !825}
!572 = metadata !{i32 786478, i32 0, metadata !573, metadata !"setParameters", metadata !"setParameters", metadata !"_Z13setParametersP8_IO_FILEP10parameters", metadata !573, i32 25, metadata !574, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true,
!573 = metadata !{i32 786473, metadata !"main.cpp", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
!574 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !575, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!575 = metadata !{null, metadata !576, metadata !629}
!576 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !577} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from FILE]
!577 = metadata !{i32 786454, null, metadata !"FILE", metadata !573, i32 48, i64 0, i64 0, i64 0, i32 0, metadata !578} ; [ DW_TAG_typedef ] [FILE] [line 48, size 0, align 0, offset 0] [from _IO_FILE]
!578 = metadata !{i32 786451, null, metadata !"_IO_FILE", metadata !579, i32 245, i64 1728, i64 64, i32 0, i32 0, null, metadata !580, i32 0, null, null} ; [ DW_TAG_structure_type ] [_IO_FILE] [line 245, size 1728, align 64, offset 0] [from ]
!579 = metadata !{i32 786473, metadata !"/usr/include/libio.h", metadata !"/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding", null} ; [ DW_TAG_file_type ]
!580 = metadata !{metadata !581, metadata !582, metadata !583, metadata !584, metadata !585, metadata !586, metadata !587, metadata !588, metadata !589, metadata !590, metadata !591, metadata !592, metadata !593, metadata !601, metadata !602, metadata !6
!581 = metadata !{i32 786445, metadata !578, metadata !"_flags", metadata !579, i32 246, i64 32, i64 32, i64 0, i32 0, metadata !153} ; [ DW_TAG_member ] [_flags] [line 246, size 32, align 32, offset 0] [from int]
!582 = metadata !{i32 786445, metadata !578, metadata !"_IO_read_ptr", metadata !579, i32 251, i64 64, i64 64, i64 64, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_read_ptr] [line 251, size 64, align 64, offset 64] [from ]
!583 = metadata !{i32 786445, metadata !578, metadata !"_IO_read_end", metadata !579, i32 252, i64 64, i64 64, i64 128, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_read_end] [line 252, size 64, align 64, offset 128] [from ]
!584 = metadata !{i32 786445, metadata !578, metadata !"_IO_read_base", metadata !579, i32 253, i64 64, i64 64, i64 192, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_read_base] [line 253, size 64, align 64, offset 192] [from ]
!585 = metadata !{i32 786445, metadata !578, metadata !"_IO_write_base", metadata !579, i32 254, i64 64, i64 64, i64 256, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_write_base] [line 254, size 64, align 64, offset 256] [from ]
!586 = metadata !{i32 786445, metadata !578, metadata !"_IO_write_ptr", metadata !579, i32 255, i64 64, i64 64, i64 320, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_write_ptr] [line 255, size 64, align 64, offset 320] [from ]
!587 = metadata !{i32 786445, metadata !578, metadata !"_IO_write_end", metadata !579, i32 256, i64 64, i64 64, i64 384, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_write_end] [line 256, size 64, align 64, offset 384] [from ]
!588 = metadata !{i32 786445, metadata !578, metadata !"_IO_buf_base", metadata !579, i32 257, i64 64, i64 64, i64 448, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_buf_base] [line 257, size 64, align 64, offset 448] [from ]
!589 = metadata !{i32 786445, metadata !578, metadata !"_IO_buf_end", metadata !579, i32 258, i64 64, i64 64, i64 512, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_buf_end] [line 258, size 64, align 64, offset 512] [from ]
!590 = metadata !{i32 786445, metadata !578, metadata !"_IO_save_base", metadata !579, i32 260, i64 64, i64 64, i64 576, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_save_base] [line 260, size 64, align 64, offset 576] [from ]
!591 = metadata !{i32 786445, metadata !578, metadata !"_IO_backup_base", metadata !579, i32 261, i64 64, i64 64, i64 640, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_backup_base] [line 261, size 64, align 64, offset 640] [from ]
!592 = metadata !{i32 786445, metadata !578, metadata !"_IO_save_end", metadata !579, i32 262, i64 64, i64 64, i64 704, i32 0, metadata !338} ; [ DW_TAG_member ] [_IO_save_end] [line 262, size 64, align 64, offset 704] [from ]
!593 = metadata !{i32 786445, metadata !578, metadata !"_markers", metadata !579, i32 264, i64 64, i64 64, i64 768, i32 0, metadata !594} ; [ DW_TAG_member ] [_markers] [line 264, size 64, align 64, offset 768] [from ]
!594 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !595} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_marker]
!595 = metadata !{i32 786451, null, metadata !"_IO_marker", metadata !579, i32 160, i64 192, i64 64, i32 0, i32 0, null, metadata !596, i32 0, null, null} ; [ DW_TAG_structure_type ] [_IO_marker] [line 160, size 192, align 64, offset 0] [from ]
!596 = metadata !{metadata !597, metadata !598, metadata !600}
!597 = metadata !{i32 786445, metadata !595, metadata !"_next", metadata !579, i32 161, i64 64, i64 64, i64 0, i32 0, metadata !594} ; [ DW_TAG_member ] [_next] [line 161, size 64, align 64, offset 0] [from ]
!598 = metadata !{i32 786445, metadata !595, metadata !"_sbuf", metadata !579, i32 162, i64 64, i64 64, i64 64, i32 0, metadata !599} ; [ DW_TAG_member ] [_sbuf] [line 162, size 64, align 64, offset 64] [from ]
!599 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !578} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from _IO_FILE]
!600 = metadata !{i32 786445, metadata !595, metadata !"_pos", metadata !579, i32 166, i64 32, i64 32, i64 128, i32 0, metadata !153} ; [ DW_TAG_member ] [_pos] [line 166, size 32, align 32, offset 128] [from int]
!601 = metadata !{i32 786445, metadata !578, metadata !"_chain", metadata !579, i32 266, i64 64, i64 64, i64 832, i32 0, metadata !599} ; [ DW_TAG_member ] [_chain] [line 266, size 64, align 64, offset 832] [from ]
!602 = metadata !{i32 786445, metadata !578, metadata !"_fileno", metadata !579, i32 268, i64 32, i64 32, i64 896, i32 0, metadata !153} ; [ DW_TAG_member ] [_fileno] [line 268, size 32, align 32, offset 896] [from int]
!603 = metadata !{i32 786445, metadata !578, metadata !"_flags2", metadata !579, i32 272, i64 32, i64 32, i64 928, i32 0, metadata !153} ; [ DW_TAG_member ] [_flags2] [line 272, size 32, align 32, offset 928] [from int]
!604 = metadata !{i32 786445, metadata !578, metadata !"_old_offset", metadata !579, i32 274, i64 64, i64 64, i64 960, i32 0, metadata !605} ; [ DW_TAG_member ] [_old_offset] [line 274, size 64, align 64, offset 960] [from __off_t]
!605 = metadata !{i32 786454, null, metadata !"__off_t", metadata !579, i32 131, i64 0, i64 0, i64 0, i32 0, metadata !606} ; [ DW_TAG_typedef ] [__off_t] [line 131, size 0, align 0, offset 0] [from long int]
!606 = metadata !{i32 786468, null, metadata !"long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!607 = metadata !{i32 786445, metadata !578, metadata !"_cur_column", metadata !579, i32 278, i64 16, i64 16, i64 1024, i32 0, metadata !608} ; [ DW_TAG_member ] [_cur_column] [line 278, size 16, align 16, offset 1024] [from unsigned short]
!608 = metadata !{i32 786468, null, metadata !"unsigned short", null, i32 0, i64 16, i64 16, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ] [unsigned short] [line 0, size 16, align 16, offset 0, enc DW_ATE_unsigned]
!609 = metadata !{i32 786445, metadata !578, metadata !"_vtable_offset", metadata !579, i32 279, i64 8, i64 8, i64 1040, i32 0, metadata !610} ; [ DW_TAG_member ] [_vtable_offset] [line 279, size 8, align 8, offset 1040] [from signed char]
!610 = metadata !{i32 786468, null, metadata !"signed char", null, i32 0, i64 8, i64 8, i64 0, i32 0, i32 6} ; [ DW_TAG_base_type ] [signed char] [line 0, size 8, align 8, offset 0, enc DW_ATE_signed_char]
!611 = metadata !{i32 786445, metadata !578, metadata !"_shortbuf", metadata !579, i32 280, i64 8, i64 8, i64 1048, i32 0, metadata !612} ; [ DW_TAG_member ] [_shortbuf] [line 280, size 8, align 8, offset 1048] [from ]
!612 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8, i64 8, i32 0, i32 0, metadata !339, metadata !613, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 8, align 8, offset 0] [from char]
!613 = metadata !{metadata !614}
!614 = metadata !{i32 786465, i64 0, i64 0}       ; [ DW_TAG_subrange_type ] [0, 0]
!615 = metadata !{i32 786445, metadata !578, metadata !"_lock", metadata !579, i32 284, i64 64, i64 64, i64 1088, i32 0, metadata !342} ; [ DW_TAG_member ] [_lock] [line 284, size 64, align 64, offset 1088] [from ]
!616 = metadata !{i32 786445, metadata !578, metadata !"_offset", metadata !579, i32 293, i64 64, i64 64, i64 1152, i32 0, metadata !617} ; [ DW_TAG_member ] [_offset] [line 293, size 64, align 64, offset 1152] [from __off64_t]
!617 = metadata !{i32 786454, null, metadata !"__off64_t", metadata !579, i32 132, i64 0, i64 0, i64 0, i32 0, metadata !606} ; [ DW_TAG_typedef ] [__off64_t] [line 132, size 0, align 0, offset 0] [from long int]
!618 = metadata !{i32 786445, metadata !578, metadata !"__pad1", metadata !579, i32 302, i64 64, i64 64, i64 1216, i32 0, metadata !342} ; [ DW_TAG_member ] [__pad1] [line 302, size 64, align 64, offset 1216] [from ]
!619 = metadata !{i32 786445, metadata !578, metadata !"__pad2", metadata !579, i32 303, i64 64, i64 64, i64 1280, i32 0, metadata !342} ; [ DW_TAG_member ] [__pad2] [line 303, size 64, align 64, offset 1280] [from ]
!620 = metadata !{i32 786445, metadata !578, metadata !"__pad3", metadata !579, i32 304, i64 64, i64 64, i64 1344, i32 0, metadata !342} ; [ DW_TAG_member ] [__pad3] [line 304, size 64, align 64, offset 1344] [from ]
!621 = metadata !{i32 786445, metadata !578, metadata !"__pad4", metadata !579, i32 305, i64 64, i64 64, i64 1408, i32 0, metadata !342} ; [ DW_TAG_member ] [__pad4] [line 305, size 64, align 64, offset 1408] [from ]
!622 = metadata !{i32 786445, metadata !578, metadata !"__pad5", metadata !579, i32 306, i64 64, i64 64, i64 1472, i32 0, metadata !623} ; [ DW_TAG_member ] [__pad5] [line 306, size 64, align 64, offset 1472] [from size_t]
!623 = metadata !{i32 786454, null, metadata !"size_t", metadata !579, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !480} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!624 = metadata !{i32 786445, metadata !578, metadata !"_mode", metadata !579, i32 308, i64 32, i64 32, i64 1536, i32 0, metadata !153} ; [ DW_TAG_member ] [_mode] [line 308, size 32, align 32, offset 1536] [from int]
!625 = metadata !{i32 786445, metadata !578, metadata !"_unused2", metadata !579, i32 310, i64 160, i64 8, i64 1568, i32 0, metadata !626} ; [ DW_TAG_member ] [_unused2] [line 310, size 160, align 8, offset 1568] [from ]
!626 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 160, i64 8, i32 0, i32 0, metadata !339, metadata !627, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 160, align 8, offset 0] [from char]
!627 = metadata !{metadata !628}
!628 = metadata !{i32 786465, i64 0, i64 19}      ; [ DW_TAG_subrange_type ] [0, 19]
!629 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !630} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from parameters]
!630 = metadata !{i32 786454, null, metadata !"parameters", metadata !573, i32 22, i64 0, i64 0, i64 0, i32 0, metadata !631} ; [ DW_TAG_typedef ] [parameters] [line 22, size 0, align 0, offset 0] [from ]
!631 = metadata !{i32 786451, null, metadata !"", metadata !113, i32 12, i64 544, i64 32, i32 0, i32 0, null, metadata !632, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 12, size 544, align 32, offset 0] [from ]
!632 = metadata !{metadata !633, metadata !634, metadata !635, metadata !636, metadata !637, metadata !638, metadata !639, metadata !640, metadata !641}
!633 = metadata !{i32 786445, metadata !631, metadata !"numSamples", metadata !113, i32 13, i64 32, i64 32, i64 0, i32 0, metadata !153} ; [ DW_TAG_member ] [numSamples] [line 13, size 32, align 32, offset 0] [from int]
!634 = metadata !{i32 786445, metadata !631, metadata !"aquisitionMatrixSize", metadata !113, i32 14, i64 96, i64 32, i64 32, i32 0, metadata !375} ; [ DW_TAG_member ] [aquisitionMatrixSize] [line 14, size 96, align 32, offset 32] [from ]
!635 = metadata !{i32 786445, metadata !631, metadata !"reconstructionMatrixSize", metadata !113, i32 15, i64 96, i64 32, i64 128, i32 0, metadata !375} ; [ DW_TAG_member ] [reconstructionMatrixSize] [line 15, size 96, align 32, offset 128] [from ]
!636 = metadata !{i32 786445, metadata !631, metadata !"kMax", metadata !113, i32 16, i64 96, i64 32, i64 224, i32 0, metadata !380} ; [ DW_TAG_member ] [kMax] [line 16, size 96, align 32, offset 224] [from ]
!637 = metadata !{i32 786445, metadata !631, metadata !"gridSize", metadata !113, i32 17, i64 96, i64 32, i64 320, i32 0, metadata !375} ; [ DW_TAG_member ] [gridSize] [line 17, size 96, align 32, offset 320] [from ]
!638 = metadata !{i32 786445, metadata !631, metadata !"oversample", metadata !113, i32 18, i64 32, i64 32, i64 416, i32 0, metadata !116} ; [ DW_TAG_member ] [oversample] [line 18, size 32, align 32, offset 416] [from float]
!639 = metadata !{i32 786445, metadata !631, metadata !"kernelWidth", metadata !113, i32 19, i64 32, i64 32, i64 448, i32 0, metadata !116} ; [ DW_TAG_member ] [kernelWidth] [line 19, size 32, align 32, offset 448] [from float]
!640 = metadata !{i32 786445, metadata !631, metadata !"binsize", metadata !113, i32 20, i64 32, i64 32, i64 480, i32 0, metadata !153} ; [ DW_TAG_member ] [binsize] [line 20, size 32, align 32, offset 480] [from int]
!641 = metadata !{i32 786445, metadata !631, metadata !"useLUT", metadata !113, i32 21, i64 32, i64 32, i64 512, i32 0, metadata !153} ; [ DW_TAG_member ] [useLUT] [line 21, size 32, align 32, offset 512] [from int]
!642 = metadata !{metadata !643}
!643 = metadata !{metadata !644, metadata !645, metadata !646}
!644 = metadata !{i32 786689, metadata !572, metadata !"file", metadata !573, i32 16777241, metadata !576, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [file] [line 25]
!645 = metadata !{i32 786689, metadata !572, metadata !"p", metadata !573, i32 33554457, metadata !629, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 25]
!646 = metadata !{i32 786688, metadata !647, metadata !"deviceProp", metadata !573, i32 35, metadata !648, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [deviceProp] [line 35]
!647 = metadata !{i32 786443, metadata !572, i32 25, i32 0, metadata !573, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!648 = metadata !{i32 786451, null, metadata !"cudaDeviceProp", metadata !20, i32 1145, i64 4800, i64 64, i32 0, i32 0, null, metadata !649, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaDeviceProp] [line 1145, size 4800, align 64, offset 0] [from 
!649 = metadata !{metadata !650, metadata !654, metadata !655, metadata !656, metadata !657, metadata !658, metadata !659, metadata !660, metadata !661, metadata !662, metadata !663, metadata !664, metadata !665, metadata !666, metadata !667, metadata !6
!650 = metadata !{i32 786445, metadata !648, metadata !"name", metadata !20, i32 1147, i64 2048, i64 8, i64 0, i32 0, metadata !651} ; [ DW_TAG_member ] [name] [line 1147, size 2048, align 8, offset 0] [from ]
!651 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2048, i64 8, i32 0, i32 0, metadata !339, metadata !652, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2048, align 8, offset 0] [from char]
!652 = metadata !{metadata !653}
!653 = metadata !{i32 786465, i64 0, i64 255}     ; [ DW_TAG_subrange_type ] [0, 255]
!654 = metadata !{i32 786445, metadata !648, metadata !"totalGlobalMem", metadata !20, i32 1148, i64 64, i64 64, i64 2048, i32 0, metadata !623} ; [ DW_TAG_member ] [totalGlobalMem] [line 1148, size 64, align 64, offset 2048] [from size_t]
!655 = metadata !{i32 786445, metadata !648, metadata !"sharedMemPerBlock", metadata !20, i32 1149, i64 64, i64 64, i64 2112, i32 0, metadata !623} ; [ DW_TAG_member ] [sharedMemPerBlock] [line 1149, size 64, align 64, offset 2112] [from size_t]
!656 = metadata !{i32 786445, metadata !648, metadata !"regsPerBlock", metadata !20, i32 1150, i64 32, i64 32, i64 2176, i32 0, metadata !153} ; [ DW_TAG_member ] [regsPerBlock] [line 1150, size 32, align 32, offset 2176] [from int]
!657 = metadata !{i32 786445, metadata !648, metadata !"warpSize", metadata !20, i32 1151, i64 32, i64 32, i64 2208, i32 0, metadata !153} ; [ DW_TAG_member ] [warpSize] [line 1151, size 32, align 32, offset 2208] [from int]
!658 = metadata !{i32 786445, metadata !648, metadata !"memPitch", metadata !20, i32 1152, i64 64, i64 64, i64 2240, i32 0, metadata !623} ; [ DW_TAG_member ] [memPitch] [line 1152, size 64, align 64, offset 2240] [from size_t]
!659 = metadata !{i32 786445, metadata !648, metadata !"maxThreadsPerBlock", metadata !20, i32 1153, i64 32, i64 32, i64 2304, i32 0, metadata !153} ; [ DW_TAG_member ] [maxThreadsPerBlock] [line 1153, size 32, align 32, offset 2304] [from int]
!660 = metadata !{i32 786445, metadata !648, metadata !"maxThreadsDim", metadata !20, i32 1154, i64 96, i64 32, i64 2336, i32 0, metadata !375} ; [ DW_TAG_member ] [maxThreadsDim] [line 1154, size 96, align 32, offset 2336] [from ]
!661 = metadata !{i32 786445, metadata !648, metadata !"maxGridSize", metadata !20, i32 1155, i64 96, i64 32, i64 2432, i32 0, metadata !375} ; [ DW_TAG_member ] [maxGridSize] [line 1155, size 96, align 32, offset 2432] [from ]
!662 = metadata !{i32 786445, metadata !648, metadata !"clockRate", metadata !20, i32 1156, i64 32, i64 32, i64 2528, i32 0, metadata !153} ; [ DW_TAG_member ] [clockRate] [line 1156, size 32, align 32, offset 2528] [from int]
!663 = metadata !{i32 786445, metadata !648, metadata !"totalConstMem", metadata !20, i32 1157, i64 64, i64 64, i64 2560, i32 0, metadata !623} ; [ DW_TAG_member ] [totalConstMem] [line 1157, size 64, align 64, offset 2560] [from size_t]
!664 = metadata !{i32 786445, metadata !648, metadata !"major", metadata !20, i32 1158, i64 32, i64 32, i64 2624, i32 0, metadata !153} ; [ DW_TAG_member ] [major] [line 1158, size 32, align 32, offset 2624] [from int]
!665 = metadata !{i32 786445, metadata !648, metadata !"minor", metadata !20, i32 1159, i64 32, i64 32, i64 2656, i32 0, metadata !153} ; [ DW_TAG_member ] [minor] [line 1159, size 32, align 32, offset 2656] [from int]
!666 = metadata !{i32 786445, metadata !648, metadata !"textureAlignment", metadata !20, i32 1160, i64 64, i64 64, i64 2688, i32 0, metadata !623} ; [ DW_TAG_member ] [textureAlignment] [line 1160, size 64, align 64, offset 2688] [from size_t]
!667 = metadata !{i32 786445, metadata !648, metadata !"texturePitchAlignment", metadata !20, i32 1161, i64 64, i64 64, i64 2752, i32 0, metadata !623} ; [ DW_TAG_member ] [texturePitchAlignment] [line 1161, size 64, align 64, offset 2752] [from size_t]
!668 = metadata !{i32 786445, metadata !648, metadata !"deviceOverlap", metadata !20, i32 1162, i64 32, i64 32, i64 2816, i32 0, metadata !153} ; [ DW_TAG_member ] [deviceOverlap] [line 1162, size 32, align 32, offset 2816] [from int]
!669 = metadata !{i32 786445, metadata !648, metadata !"multiProcessorCount", metadata !20, i32 1163, i64 32, i64 32, i64 2848, i32 0, metadata !153} ; [ DW_TAG_member ] [multiProcessorCount] [line 1163, size 32, align 32, offset 2848] [from int]
!670 = metadata !{i32 786445, metadata !648, metadata !"kernelExecTimeoutEnabled", metadata !20, i32 1164, i64 32, i64 32, i64 2880, i32 0, metadata !153} ; [ DW_TAG_member ] [kernelExecTimeoutEnabled] [line 1164, size 32, align 32, offset 2880] [from in
!671 = metadata !{i32 786445, metadata !648, metadata !"integrated", metadata !20, i32 1165, i64 32, i64 32, i64 2912, i32 0, metadata !153} ; [ DW_TAG_member ] [integrated] [line 1165, size 32, align 32, offset 2912] [from int]
!672 = metadata !{i32 786445, metadata !648, metadata !"canMapHostMemory", metadata !20, i32 1166, i64 32, i64 32, i64 2944, i32 0, metadata !153} ; [ DW_TAG_member ] [canMapHostMemory] [line 1166, size 32, align 32, offset 2944] [from int]
!673 = metadata !{i32 786445, metadata !648, metadata !"computeMode", metadata !20, i32 1167, i64 32, i64 32, i64 2976, i32 0, metadata !153} ; [ DW_TAG_member ] [computeMode] [line 1167, size 32, align 32, offset 2976] [from int]
!674 = metadata !{i32 786445, metadata !648, metadata !"maxTexture1D", metadata !20, i32 1168, i64 32, i64 32, i64 3008, i32 0, metadata !153} ; [ DW_TAG_member ] [maxTexture1D] [line 1168, size 32, align 32, offset 3008] [from int]
!675 = metadata !{i32 786445, metadata !648, metadata !"maxTexture1DMipmap", metadata !20, i32 1169, i64 32, i64 32, i64 3040, i32 0, metadata !153} ; [ DW_TAG_member ] [maxTexture1DMipmap] [line 1169, size 32, align 32, offset 3040] [from int]
!676 = metadata !{i32 786445, metadata !648, metadata !"maxTexture1DLinear", metadata !20, i32 1170, i64 32, i64 32, i64 3072, i32 0, metadata !153} ; [ DW_TAG_member ] [maxTexture1DLinear] [line 1170, size 32, align 32, offset 3072] [from int]
!677 = metadata !{i32 786445, metadata !648, metadata !"maxTexture2D", metadata !20, i32 1171, i64 64, i64 32, i64 3104, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTexture2D] [line 1171, size 64, align 32, offset 3104] [from ]
!678 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 64, i64 32, i32 0, i32 0, metadata !153, metadata !679, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 64, align 32, offset 0] [from int]
!679 = metadata !{metadata !680}
!680 = metadata !{i32 786465, i64 0, i64 1}       ; [ DW_TAG_subrange_type ] [0, 1]
!681 = metadata !{i32 786445, metadata !648, metadata !"maxTexture2DMipmap", metadata !20, i32 1172, i64 64, i64 32, i64 3168, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTexture2DMipmap] [line 1172, size 64, align 32, offset 3168] [from ]
!682 = metadata !{i32 786445, metadata !648, metadata !"maxTexture2DLinear", metadata !20, i32 1173, i64 96, i64 32, i64 3232, i32 0, metadata !375} ; [ DW_TAG_member ] [maxTexture2DLinear] [line 1173, size 96, align 32, offset 3232] [from ]
!683 = metadata !{i32 786445, metadata !648, metadata !"maxTexture2DGather", metadata !20, i32 1174, i64 64, i64 32, i64 3328, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTexture2DGather] [line 1174, size 64, align 32, offset 3328] [from ]
!684 = metadata !{i32 786445, metadata !648, metadata !"maxTexture3D", metadata !20, i32 1175, i64 96, i64 32, i64 3392, i32 0, metadata !375} ; [ DW_TAG_member ] [maxTexture3D] [line 1175, size 96, align 32, offset 3392] [from ]
!685 = metadata !{i32 786445, metadata !648, metadata !"maxTexture3DAlt", metadata !20, i32 1176, i64 96, i64 32, i64 3488, i32 0, metadata !375} ; [ DW_TAG_member ] [maxTexture3DAlt] [line 1176, size 96, align 32, offset 3488] [from ]
!686 = metadata !{i32 786445, metadata !648, metadata !"maxTextureCubemap", metadata !20, i32 1177, i64 32, i64 32, i64 3584, i32 0, metadata !153} ; [ DW_TAG_member ] [maxTextureCubemap] [line 1177, size 32, align 32, offset 3584] [from int]
!687 = metadata !{i32 786445, metadata !648, metadata !"maxTexture1DLayered", metadata !20, i32 1178, i64 64, i64 32, i64 3616, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTexture1DLayered] [line 1178, size 64, align 32, offset 3616] [from ]
!688 = metadata !{i32 786445, metadata !648, metadata !"maxTexture2DLayered", metadata !20, i32 1179, i64 96, i64 32, i64 3680, i32 0, metadata !375} ; [ DW_TAG_member ] [maxTexture2DLayered] [line 1179, size 96, align 32, offset 3680] [from ]
!689 = metadata !{i32 786445, metadata !648, metadata !"maxTextureCubemapLayered", metadata !20, i32 1180, i64 64, i64 32, i64 3776, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTextureCubemapLayered] [line 1180, size 64, align 32, offset 3776] [from ]
!690 = metadata !{i32 786445, metadata !648, metadata !"maxSurface1D", metadata !20, i32 1181, i64 32, i64 32, i64 3840, i32 0, metadata !153} ; [ DW_TAG_member ] [maxSurface1D] [line 1181, size 32, align 32, offset 3840] [from int]
!691 = metadata !{i32 786445, metadata !648, metadata !"maxSurface2D", metadata !20, i32 1182, i64 64, i64 32, i64 3872, i32 0, metadata !678} ; [ DW_TAG_member ] [maxSurface2D] [line 1182, size 64, align 32, offset 3872] [from ]
!692 = metadata !{i32 786445, metadata !648, metadata !"maxSurface3D", metadata !20, i32 1183, i64 96, i64 32, i64 3936, i32 0, metadata !375} ; [ DW_TAG_member ] [maxSurface3D] [line 1183, size 96, align 32, offset 3936] [from ]
!693 = metadata !{i32 786445, metadata !648, metadata !"maxSurface1DLayered", metadata !20, i32 1184, i64 64, i64 32, i64 4032, i32 0, metadata !678} ; [ DW_TAG_member ] [maxSurface1DLayered] [line 1184, size 64, align 32, offset 4032] [from ]
!694 = metadata !{i32 786445, metadata !648, metadata !"maxSurface2DLayered", metadata !20, i32 1185, i64 96, i64 32, i64 4096, i32 0, metadata !375} ; [ DW_TAG_member ] [maxSurface2DLayered] [line 1185, size 96, align 32, offset 4096] [from ]
!695 = metadata !{i32 786445, metadata !648, metadata !"maxSurfaceCubemap", metadata !20, i32 1186, i64 32, i64 32, i64 4192, i32 0, metadata !153} ; [ DW_TAG_member ] [maxSurfaceCubemap] [line 1186, size 32, align 32, offset 4192] [from int]
!696 = metadata !{i32 786445, metadata !648, metadata !"maxSurfaceCubemapLayered", metadata !20, i32 1187, i64 64, i64 32, i64 4224, i32 0, metadata !678} ; [ DW_TAG_member ] [maxSurfaceCubemapLayered] [line 1187, size 64, align 32, offset 4224] [from ]
!697 = metadata !{i32 786445, metadata !648, metadata !"surfaceAlignment", metadata !20, i32 1188, i64 64, i64 64, i64 4288, i32 0, metadata !623} ; [ DW_TAG_member ] [surfaceAlignment] [line 1188, size 64, align 64, offset 4288] [from size_t]
!698 = metadata !{i32 786445, metadata !648, metadata !"concurrentKernels", metadata !20, i32 1189, i64 32, i64 32, i64 4352, i32 0, metadata !153} ; [ DW_TAG_member ] [concurrentKernels] [line 1189, size 32, align 32, offset 4352] [from int]
!699 = metadata !{i32 786445, metadata !648, metadata !"ECCEnabled", metadata !20, i32 1190, i64 32, i64 32, i64 4384, i32 0, metadata !153} ; [ DW_TAG_member ] [ECCEnabled] [line 1190, size 32, align 32, offset 4384] [from int]
!700 = metadata !{i32 786445, metadata !648, metadata !"pciBusID", metadata !20, i32 1191, i64 32, i64 32, i64 4416, i32 0, metadata !153} ; [ DW_TAG_member ] [pciBusID] [line 1191, size 32, align 32, offset 4416] [from int]
!701 = metadata !{i32 786445, metadata !648, metadata !"pciDeviceID", metadata !20, i32 1192, i64 32, i64 32, i64 4448, i32 0, metadata !153} ; [ DW_TAG_member ] [pciDeviceID] [line 1192, size 32, align 32, offset 4448] [from int]
!702 = metadata !{i32 786445, metadata !648, metadata !"pciDomainID", metadata !20, i32 1193, i64 32, i64 32, i64 4480, i32 0, metadata !153} ; [ DW_TAG_member ] [pciDomainID] [line 1193, size 32, align 32, offset 4480] [from int]
!703 = metadata !{i32 786445, metadata !648, metadata !"tccDriver", metadata !20, i32 1194, i64 32, i64 32, i64 4512, i32 0, metadata !153} ; [ DW_TAG_member ] [tccDriver] [line 1194, size 32, align 32, offset 4512] [from int]
!704 = metadata !{i32 786445, metadata !648, metadata !"asyncEngineCount", metadata !20, i32 1195, i64 32, i64 32, i64 4544, i32 0, metadata !153} ; [ DW_TAG_member ] [asyncEngineCount] [line 1195, size 32, align 32, offset 4544] [from int]
!705 = metadata !{i32 786445, metadata !648, metadata !"unifiedAddressing", metadata !20, i32 1196, i64 32, i64 32, i64 4576, i32 0, metadata !153} ; [ DW_TAG_member ] [unifiedAddressing] [line 1196, size 32, align 32, offset 4576] [from int]
!706 = metadata !{i32 786445, metadata !648, metadata !"memoryClockRate", metadata !20, i32 1197, i64 32, i64 32, i64 4608, i32 0, metadata !153} ; [ DW_TAG_member ] [memoryClockRate] [line 1197, size 32, align 32, offset 4608] [from int]
!707 = metadata !{i32 786445, metadata !648, metadata !"memoryBusWidth", metadata !20, i32 1198, i64 32, i64 32, i64 4640, i32 0, metadata !153} ; [ DW_TAG_member ] [memoryBusWidth] [line 1198, size 32, align 32, offset 4640] [from int]
!708 = metadata !{i32 786445, metadata !648, metadata !"l2CacheSize", metadata !20, i32 1199, i64 32, i64 32, i64 4672, i32 0, metadata !153} ; [ DW_TAG_member ] [l2CacheSize] [line 1199, size 32, align 32, offset 4672] [from int]
!709 = metadata !{i32 786445, metadata !648, metadata !"maxThreadsPerMultiProcessor", metadata !20, i32 1200, i64 32, i64 32, i64 4704, i32 0, metadata !153} ; [ DW_TAG_member ] [maxThreadsPerMultiProcessor] [line 1200, size 32, align 32, offset 4704] [f
!710 = metadata !{i32 786445, metadata !648, metadata !"streamPrioritiesSupported", metadata !20, i32 1201, i64 32, i64 32, i64 4736, i32 0, metadata !153} ; [ DW_TAG_member ] [streamPrioritiesSupported] [line 1201, size 32, align 32, offset 4736] [from 
!711 = metadata !{i32 786478, i32 0, metadata !648, metadata !"cudaDeviceProp", metadata !"cudaDeviceProp", metadata !"", metadata !20, i32 1145, metadata !712, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i
!712 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !713, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!713 = metadata !{null, metadata !714}
!714 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !648} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaDeviceProp]
!715 = metadata !{i32 786478, i32 0, metadata !573, metadata !"readSampleData", metadata !"readSampleData", metadata !"_Z14readSampleData10parametersP8_IO_FILEP20ReconstructionSample", metadata !573, i32 55, metadata !716, i1 false, i1 true, i32 0, i32 0
!716 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !717, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!717 = metadata !{metadata !109, metadata !630, metadata !576, metadata !718}
!718 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !719} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ReconstructionSample]
!719 = metadata !{i32 786454, null, metadata !"ReconstructionSample", metadata !573, i32 31, i64 0, i64 0, i64 0, i32 0, metadata !720} ; [ DW_TAG_typedef ] [ReconstructionSample] [line 31, size 0, align 0, offset 0] [from ]
!720 = metadata !{i32 786451, null, metadata !"", metadata !113, i32 24, i64 192, i64 32, i32 0, i32 0, null, metadata !721, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 24, size 192, align 32, offset 0] [from ]
!721 = metadata !{metadata !722, metadata !723, metadata !724, metadata !725, metadata !726, metadata !727}
!722 = metadata !{i32 786445, metadata !720, metadata !"real", metadata !113, i32 25, i64 32, i64 32, i64 0, i32 0, metadata !116} ; [ DW_TAG_member ] [real] [line 25, size 32, align 32, offset 0] [from float]
!723 = metadata !{i32 786445, metadata !720, metadata !"imag", metadata !113, i32 26, i64 32, i64 32, i64 32, i32 0, metadata !116} ; [ DW_TAG_member ] [imag] [line 26, size 32, align 32, offset 32] [from float]
!724 = metadata !{i32 786445, metadata !720, metadata !"kX", metadata !113, i32 27, i64 32, i64 32, i64 64, i32 0, metadata !116} ; [ DW_TAG_member ] [kX] [line 27, size 32, align 32, offset 64] [from float]
!725 = metadata !{i32 786445, metadata !720, metadata !"kY", metadata !113, i32 28, i64 32, i64 32, i64 96, i32 0, metadata !116} ; [ DW_TAG_member ] [kY] [line 28, size 32, align 32, offset 96] [from float]
!726 = metadata !{i32 786445, metadata !720, metadata !"kZ", metadata !113, i32 29, i64 32, i64 32, i64 128, i32 0, metadata !116} ; [ DW_TAG_member ] [kZ] [line 29, size 32, align 32, offset 128] [from float]
!727 = metadata !{i32 786445, metadata !720, metadata !"sdc", metadata !113, i32 30, i64 32, i64 32, i64 160, i32 0, metadata !116} ; [ DW_TAG_member ] [sdc] [line 30, size 32, align 32, offset 160] [from float]
!728 = metadata !{metadata !729}
!729 = metadata !{metadata !730, metadata !731, metadata !732, metadata !733, metadata !735, metadata !736, metadata !737, metadata !738, metadata !739, metadata !740, metadata !741, metadata !742, metadata !743, metadata !744, metadata !745}
!730 = metadata !{i32 786689, metadata !715, metadata !"params", metadata !573, i32 16777271, metadata !630, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [params] [line 55]
!731 = metadata !{i32 786689, metadata !715, metadata !"uksdata_f", metadata !573, i32 33554487, metadata !576, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [uksdata_f] [line 55]
!732 = metadata !{i32 786689, metadata !715, metadata !"samples", metadata !573, i32 50331703, metadata !718, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [samples] [line 55]
!733 = metadata !{i32 786688, metadata !734, metadata !"i", metadata !573, i32 56, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [i] [line 56]
!734 = metadata !{i32 786443, metadata !715, i32 55, i32 0, metadata !573, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!735 = metadata !{i32 786688, metadata !734, metadata !"kScale", metadata !573, i32 65, metadata !380, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [kScale] [line 65]
!736 = metadata !{i32 786688, metadata !734, metadata !"size_x", metadata !573, i32 70, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_x] [line 70]
!737 = metadata !{i32 786688, metadata !734, metadata !"size_y", metadata !573, i32 71, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_y] [line 71]
!738 = metadata !{i32 786688, metadata !734, metadata !"size_z", metadata !573, i32 72, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [size_z] [line 72]
!739 = metadata !{i32 786688, metadata !734, metadata !"ax", metadata !573, i32 74, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ax] [line 74]
!740 = metadata !{i32 786688, metadata !734, metadata !"bx", metadata !573, i32 75, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bx] [line 75]
!741 = metadata !{i32 786688, metadata !734, metadata !"ay", metadata !573, i32 77, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [ay] [line 77]
!742 = metadata !{i32 786688, metadata !734, metadata !"by", metadata !573, i32 78, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [by] [line 78]
!743 = metadata !{i32 786688, metadata !734, metadata !"az", metadata !573, i32 80, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [az] [line 80]
!744 = metadata !{i32 786688, metadata !734, metadata !"bz", metadata !573, i32 81, metadata !116, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [bz] [line 81]
!745 = metadata !{i32 786688, metadata !746, metadata !"n", metadata !573, i32 83, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 83]
!746 = metadata !{i32 786443, metadata !734, i32 83, i32 0, metadata !573, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!747 = metadata !{i32 786478, i32 0, metadata !573, metadata !"main", metadata !"main", metadata !"", metadata !573, i32 93, metadata !748, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i8**)* @main, null, null, metadata !751, i32 93
!748 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !749, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!749 = metadata !{metadata !153, metadata !153, metadata !750}
!750 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !338} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!751 = metadata !{metadata !752}
!752 = metadata !{metadata !753, metadata !754, metadata !755, metadata !798, metadata !802, metadata !803, metadata !804, metadata !805, metadata !806, metadata !807, metadata !808, metadata !815, metadata !816, metadata !817, metadata !818, metadata !8
!753 = metadata !{i32 786689, metadata !747, metadata !"argc", metadata !573, i32 16777309, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argc] [line 93]
!754 = metadata !{i32 786689, metadata !747, metadata !"argv", metadata !573, i32 33554525, metadata !750, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [argv] [line 93]
!755 = metadata !{i32 786688, metadata !756, metadata !"timers", metadata !573, i32 95, metadata !757, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [timers] [line 95]
!756 = metadata !{i32 786443, metadata !747, i32 93, i32 0, metadata !573, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!757 = metadata !{i32 786451, null, metadata !"pb_TimerSet", metadata !4, i32 136, i64 2304, i64 64, i32 0, i32 0, null, metadata !758, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_TimerSet] [line 136, size 2304, align 64, offset 0] [from ]
!758 = metadata !{metadata !759, metadata !760, metadata !768, metadata !769, metadata !770, metadata !781, metadata !794}
!759 = metadata !{i32 786445, metadata !757, metadata !"current", metadata !4, i32 137, i64 32, i64 32, i64 0, i32 0, metadata !3} ; [ DW_TAG_member ] [current] [line 137, size 32, align 32, offset 0] [from pb_TimerID]
!760 = metadata !{i32 786445, metadata !757, metadata !"async_markers", metadata !4, i32 138, i64 64, i64 64, i64 64, i32 0, metadata !761} ; [ DW_TAG_member ] [async_markers] [line 138, size 64, align 64, offset 64] [from ]
!761 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !762} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_async_time_marker_list]
!762 = metadata !{i32 786451, null, metadata !"pb_async_time_marker_list", metadata !4, i32 115, i64 256, i64 64, i32 0, i32 0, null, metadata !763, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_async_time_marker_list] [line 115, size 256, align 64,
!763 = metadata !{metadata !764, metadata !765, metadata !766, metadata !767}
!764 = metadata !{i32 786445, metadata !762, metadata !"label", metadata !4, i32 116, i64 64, i64 64, i64 0, i32 0, metadata !338} ; [ DW_TAG_member ] [label] [line 116, size 64, align 64, offset 0] [from ]
!765 = metadata !{i32 786445, metadata !762, metadata !"timerID", metadata !4, i32 117, i64 32, i64 32, i64 64, i32 0, metadata !3} ; [ DW_TAG_member ] [timerID] [line 117, size 32, align 32, offset 64] [from pb_TimerID]
!766 = metadata !{i32 786445, metadata !762, metadata !"marker", metadata !4, i32 119, i64 64, i64 64, i64 128, i32 0, metadata !342} ; [ DW_TAG_member ] [marker] [line 119, size 64, align 64, offset 128] [from ]
!767 = metadata !{i32 786445, metadata !762, metadata !"next", metadata !4, i32 121, i64 64, i64 64, i64 192, i32 0, metadata !761} ; [ DW_TAG_member ] [next] [line 121, size 64, align 64, offset 192] [from ]
!768 = metadata !{i32 786445, metadata !757, metadata !"async_begin", metadata !4, i32 139, i64 64, i64 64, i64 128, i32 0, metadata !345} ; [ DW_TAG_member ] [async_begin] [line 139, size 64, align 64, offset 128] [from pb_Timestamp]
!769 = metadata !{i32 786445, metadata !757, metadata !"wall_begin", metadata !4, i32 140, i64 64, i64 64, i64 192, i32 0, metadata !345} ; [ DW_TAG_member ] [wall_begin] [line 140, size 64, align 64, offset 192] [from pb_Timestamp]
!770 = metadata !{i32 786445, metadata !757, metadata !"timers", metadata !4, i32 141, i64 1536, i64 64, i64 256, i32 0, metadata !771} ; [ DW_TAG_member ] [timers] [line 141, size 1536, align 64, offset 256] [from ]
!771 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 1536, i64 64, i32 0, i32 0, metadata !772, metadata !355, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 1536, align 64, offset 0] [from pb_Timer]
!772 = metadata !{i32 786451, null, metadata !"pb_Timer", metadata !4, i32 58, i64 192, i64 64, i32 0, i32 0, null, metadata !773, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_Timer] [line 58, size 192, align 64, offset 0] [from ]
!773 = metadata !{metadata !774, metadata !775, metadata !776, metadata !777}
!774 = metadata !{i32 786445, metadata !772, metadata !"state", metadata !4, i32 59, i64 32, i64 32, i64 0, i32 0, metadata !15} ; [ DW_TAG_member ] [state] [line 59, size 32, align 32, offset 0] [from pb_TimerState]
!775 = metadata !{i32 786445, metadata !772, metadata !"elapsed", metadata !4, i32 60, i64 64, i64 64, i64 64, i32 0, metadata !345} ; [ DW_TAG_member ] [elapsed] [line 60, size 64, align 64, offset 64] [from pb_Timestamp]
!776 = metadata !{i32 786445, metadata !772, metadata !"init", metadata !4, i32 61, i64 64, i64 64, i64 128, i32 0, metadata !345} ; [ DW_TAG_member ] [init] [line 61, size 64, align 64, offset 128] [from pb_Timestamp]
!777 = metadata !{i32 786478, i32 0, metadata !772, metadata !"pb_Timer", metadata !"pb_Timer", metadata !"", metadata !4, i32 58, metadata !778, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 58} ; [ DW_T
!778 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !779, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!779 = metadata !{null, metadata !780}
!780 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !772} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_Timer]
!781 = metadata !{i32 786445, metadata !757, metadata !"sub_timer_list", metadata !4, i32 142, i64 512, i64 64, i64 1792, i32 0, metadata !782} ; [ DW_TAG_member ] [sub_timer_list] [line 142, size 512, align 64, offset 1792] [from ]
!782 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 64, i32 0, i32 0, metadata !783, metadata !355, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 64, offset 0] [from ]
!783 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !784} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_SubTimerList]
!784 = metadata !{i32 786451, null, metadata !"pb_SubTimerList", metadata !4, i32 130, i64 128, i64 64, i32 0, i32 0, null, metadata !785, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_SubTimerList] [line 130, size 128, align 64, offset 0] [from ]
!785 = metadata !{metadata !786, metadata !793}
!786 = metadata !{i32 786445, metadata !784, metadata !"current", metadata !4, i32 131, i64 64, i64 64, i64 0, i32 0, metadata !787} ; [ DW_TAG_member ] [current] [line 131, size 64, align 64, offset 0] [from ]
!787 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !788} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_SubTimer]
!788 = metadata !{i32 786451, null, metadata !"pb_SubTimer", metadata !4, i32 124, i64 320, i64 64, i32 0, i32 0, null, metadata !789, i32 0, null, null} ; [ DW_TAG_structure_type ] [pb_SubTimer] [line 124, size 320, align 64, offset 0] [from ]
!789 = metadata !{metadata !790, metadata !791, metadata !792}
!790 = metadata !{i32 786445, metadata !788, metadata !"label", metadata !4, i32 125, i64 64, i64 64, i64 0, i32 0, metadata !338} ; [ DW_TAG_member ] [label] [line 125, size 64, align 64, offset 0] [from ]
!791 = metadata !{i32 786445, metadata !788, metadata !"timer", metadata !4, i32 126, i64 192, i64 64, i64 64, i32 0, metadata !772} ; [ DW_TAG_member ] [timer] [line 126, size 192, align 64, offset 64] [from pb_Timer]
!792 = metadata !{i32 786445, metadata !788, metadata !"next", metadata !4, i32 127, i64 64, i64 64, i64 256, i32 0, metadata !787} ; [ DW_TAG_member ] [next] [line 127, size 64, align 64, offset 256] [from ]
!793 = metadata !{i32 786445, metadata !784, metadata !"subtimer_list", metadata !4, i32 132, i64 64, i64 64, i64 64, i32 0, metadata !787} ; [ DW_TAG_member ] [subtimer_list] [line 132, size 64, align 64, offset 64] [from ]
!794 = metadata !{i32 786478, i32 0, metadata !757, metadata !"pb_TimerSet", metadata !"pb_TimerSet", metadata !"", metadata !4, i32 136, metadata !795, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 true, null, null, i32 0, metadata !126, i32 136} 
!795 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !796, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!796 = metadata !{null, metadata !797}
!797 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 1088, metadata !757} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from pb_TimerSet]
!798 = metadata !{i32 786688, metadata !756, metadata !"uksdata", metadata !573, i32 102, metadata !799, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [uksdata] [line 102]
!799 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 2000, i64 8, i32 0, i32 0, metadata !339, metadata !800, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 2000, align 8, offset 0] [from char]
!800 = metadata !{metadata !801}
!801 = metadata !{i32 786465, i64 0, i64 249}     ; [ DW_TAG_subrange_type ] [0, 249]
!802 = metadata !{i32 786688, metadata !756, metadata !"params", metadata !573, i32 103, metadata !630, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [params] [line 103]
!803 = metadata !{i32 786688, metadata !756, metadata !"uksfile_f", metadata !573, i32 105, metadata !576, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [uksfile_f] [line 105]
!804 = metadata !{i32 786688, metadata !756, metadata !"uksdata_f", metadata !573, i32 106, metadata !576, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [uksdata_f] [line 106]
!805 = metadata !{i32 786688, metadata !756, metadata !"samples", metadata !573, i32 132, metadata !718, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [samples] [line 132]
!806 = metadata !{i32 786688, metadata !756, metadata !"LUT", metadata !573, i32 133, metadata !229, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [LUT] [line 133]
!807 = metadata !{i32 786688, metadata !756, metadata !"sizeLUT", metadata !573, i32 134, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sizeLUT] [line 134]
!808 = metadata !{i32 786688, metadata !756, metadata !"gridData", metadata !573, i32 136, metadata !809, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridData] [line 136]
!809 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !810} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cmplx]
!810 = metadata !{i32 786454, null, metadata !"cmplx", metadata !573, i32 36, i64 0, i64 0, i64 0, i32 0, metadata !811} ; [ DW_TAG_typedef ] [cmplx] [line 36, size 0, align 0, offset 0] [from ]
!811 = metadata !{i32 786451, null, metadata !"", metadata !113, i32 33, i64 64, i64 32, i32 0, i32 0, null, metadata !812, i32 0, null, null} ; [ DW_TAG_structure_type ] [line 33, size 64, align 32, offset 0] [from ]
!812 = metadata !{metadata !813, metadata !814}
!813 = metadata !{i32 786445, metadata !811, metadata !"real", metadata !113, i32 34, i64 32, i64 32, i64 0, i32 0, metadata !116} ; [ DW_TAG_member ] [real] [line 34, size 32, align 32, offset 0] [from float]
!814 = metadata !{i32 786445, metadata !811, metadata !"imag", metadata !113, i32 35, i64 32, i64 32, i64 32, i32 0, metadata !116} ; [ DW_TAG_member ] [imag] [line 35, size 32, align 32, offset 32] [from float]
!815 = metadata !{i32 786688, metadata !756, metadata !"sampleDensity", metadata !573, i32 137, metadata !229, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleDensity] [line 137]
!816 = metadata !{i32 786688, metadata !756, metadata !"gridData_gold", metadata !573, i32 139, metadata !809, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridData_gold] [line 139]
!817 = metadata !{i32 786688, metadata !756, metadata !"sampleDensity_gold", metadata !573, i32 140, metadata !229, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [sampleDensity_gold] [line 140]
!818 = metadata !{i32 786688, metadata !819, metadata !"err", metadata !573, i32 143, metadata !820, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 143]
!819 = metadata !{i32 786443, metadata !756, i32 143, i32 0, metadata !573, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!820 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !573, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !19} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!821 = metadata !{i32 786688, metadata !756, metadata !"n", metadata !573, i32 158, metadata !109, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [n] [line 158]
!822 = metadata !{i32 786688, metadata !756, metadata !"gridNumElems", metadata !573, i32 169, metadata !153, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [gridNumElems] [line 169]
!823 = metadata !{i32 786688, metadata !824, metadata !"err", metadata !573, i32 188, metadata !820, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [err] [line 188]
!824 = metadata !{i32 786443, metadata !756, i32 188, i32 0, metadata !573, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!825 = metadata !{i32 786478, i32 0, metadata !533, metadata !"floor", metadata !"floor", metadata !"_ZSt5floorf", metadata !534, i32 278, metadata !216, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !826, i32 279} ;
!826 = metadata !{metadata !827}
!827 = metadata !{metadata !828}
!828 = metadata !{i32 786689, metadata !825, metadata !"__x", metadata !534, i32 16777494, metadata !116, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [__x] [line 278]
!829 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!830 = metadata !{metadata !831}
!831 = metadata !{metadata !832}
!832 = metadata !{i32 786478, i32 0, metadata !833, metadata !"klee_div_zero_check", metadata !"klee_div_zero_check", metadata !"", metadata !833, i32 12, metadata !834, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, void (i64)* @klee_div_zero_
!833 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!834 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !835, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!835 = metadata !{null, metadata !836}
!836 = metadata !{i32 786468, null, metadata !"long long int", null, i32 0, i64 64, i64 64, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ] [long long int] [line 0, size 64, align 64, offset 0, enc DW_ATE_signed]
!837 = metadata !{metadata !838}
!838 = metadata !{metadata !839}
!839 = metadata !{i32 786689, metadata !832, metadata !"z", metadata !833, i32 16777228, metadata !836, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [z] [line 12]
!840 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!841 = metadata !{metadata !842}
!842 = metadata !{metadata !843}
!843 = metadata !{i32 786478, i32 0, metadata !844, metadata !"memcpy", metadata !"memcpy", metadata !"", metadata !844, i32 12, metadata !845, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i8*, i64)* @memcpy, null, null, metadata !8
!844 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!845 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !846, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!846 = metadata !{metadata !342, metadata !342, metadata !320, metadata !847}
!847 = metadata !{i32 786454, null, metadata !"size_t", metadata !844, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !480} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!848 = metadata !{metadata !849}
!849 = metadata !{metadata !850, metadata !851, metadata !852, metadata !853, metadata !855}
!850 = metadata !{i32 786689, metadata !843, metadata !"destaddr", metadata !844, i32 16777228, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [destaddr] [line 12]
!851 = metadata !{i32 786689, metadata !843, metadata !"srcaddr", metadata !844, i32 33554444, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcaddr] [line 12]
!852 = metadata !{i32 786689, metadata !843, metadata !"len", metadata !844, i32 50331660, metadata !847, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 12]
!853 = metadata !{i32 786688, metadata !854, metadata !"dest", metadata !844, i32 13, metadata !338, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [dest] [line 13]
!854 = metadata !{i32 786443, metadata !843, i32 12, i32 0, metadata !844, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memcpy.c]
!855 = metadata !{i32 786688, metadata !854, metadata !"src", metadata !844, i32 14, metadata !856, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [src] [line 14]
!856 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !857} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!857 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !339} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from char]
!858 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata 
!859 = metadata !{metadata !860}
!860 = metadata !{metadata !861}
!861 = metadata !{i32 786478, i32 0, metadata !862, metadata !"memmove", metadata !"memmove", metadata !"", metadata !862, i32 12, metadata !863, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, null, null, null, metadata !866, i32 12} ; [ DW_TAG
!862 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!863 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !864, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!864 = metadata !{metadata !342, metadata !342, metadata !320, metadata !865}
!865 = metadata !{i32 786454, null, metadata !"size_t", metadata !862, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !480} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!866 = metadata !{metadata !867}
!867 = metadata !{metadata !868, metadata !869, metadata !870, metadata !871, metadata !873}
!868 = metadata !{i32 786689, metadata !861, metadata !"dst", metadata !862, i32 16777228, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!869 = metadata !{i32 786689, metadata !861, metadata !"src", metadata !862, i32 33554444, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 12]
!870 = metadata !{i32 786689, metadata !861, metadata !"count", metadata !862, i32 50331660, metadata !865, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!871 = metadata !{i32 786688, metadata !872, metadata !"a", metadata !862, i32 14, metadata !338, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 14]
!872 = metadata !{i32 786443, metadata !861, i32 12, i32 0, metadata !862, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memmove.c]
!873 = metadata !{i32 786688, metadata !872, metadata !"b", metadata !862, i32 15, metadata !856, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [b] [line 15]
!874 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 true, metadata !
!875 = metadata !{metadata !876}
!876 = metadata !{metadata !877}
!877 = metadata !{i32 786478, i32 0, metadata !878, metadata !"memset", metadata !"memset", metadata !"", metadata !878, i32 12, metadata !879, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i8*, i32, i64)* @memset, null, null, metadata !8
!878 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic", null} ; [ DW_TAG_file_type ]
!879 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !880, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!880 = metadata !{metadata !342, metadata !342, metadata !153, metadata !881}
!881 = metadata !{i32 786454, null, metadata !"size_t", metadata !878, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !480} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!882 = metadata !{metadata !883}
!883 = metadata !{metadata !884, metadata !885, metadata !886, metadata !887}
!884 = metadata !{i32 786689, metadata !877, metadata !"dst", metadata !878, i32 16777228, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 12]
!885 = metadata !{i32 786689, metadata !877, metadata !"s", metadata !878, i32 33554444, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [s] [line 12]
!886 = metadata !{i32 786689, metadata !877, metadata !"count", metadata !878, i32 50331660, metadata !881, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 12]
!887 = metadata !{i32 786688, metadata !888, metadata !"a", metadata !878, i32 13, metadata !889, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [a] [line 13]
!888 = metadata !{i32 786443, metadata !877, i32 12, i32 0, metadata !878, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/memset.c]
!889 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !890} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!890 = metadata !{i32 786485, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !339} ; [ DW_TAG_volatile_type ] [line 0, size 0, align 0, offset 0] [from char]
!891 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 tru
!892 = metadata !{metadata !893}
!893 = metadata !{metadata !894, metadata !896, metadata !902}
!894 = metadata !{i32 786436, null, metadata !"cudaError", metadata !895, i32 124, i64 32, i64 32, i32 0, i32 0, null, metadata !21, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaError] [line 124, size 32, align 32, offset 0] [from ]
!895 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/include/cuda/driver_types.h", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!896 = metadata !{i32 786436, null, metadata !"cudaChannelFormatKind", metadata !895, i32 649, i64 32, i64 32, i32 0, i32 0, null, metadata !897, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaChannelFormatKind] [line 649, size 32, align 32, offset 0] 
!897 = metadata !{metadata !898, metadata !899, metadata !900, metadata !901}
!898 = metadata !{i32 786472, metadata !"cudaChannelFormatKindSigned", i64 0} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindSigned :: 0]
!899 = metadata !{i32 786472, metadata !"cudaChannelFormatKindUnsigned", i64 1} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindUnsigned :: 1]
!900 = metadata !{i32 786472, metadata !"cudaChannelFormatKindFloat", i64 2} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindFloat :: 2]
!901 = metadata !{i32 786472, metadata !"cudaChannelFormatKindNone", i64 3} ; [ DW_TAG_enumerator ] [cudaChannelFormatKindNone :: 3]
!902 = metadata !{i32 786436, null, metadata !"cudaMemcpyKind", metadata !895, i32 705, i64 32, i64 32, i32 0, i32 0, null, metadata !95, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaMemcpyKind] [line 705, size 32, align 32, offset 0] [from ]
!903 = metadata !{metadata !904}
!904 = metadata !{metadata !905, metadata !933, metadata !939, metadata !945, metadata !949, metadata !957, metadata !965, metadata !973, metadata !981, metadata !988, metadata !996, metadata !1000, metadata !1007, metadata !1021, metadata !1031, metadat
!905 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaArrayGetInfo", metadata !"cudaArrayGetInfo", metadata !"", metadata !906, i32 24, metadata !907, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaChannelFormatDes
!906 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!907 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !908, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!908 = metadata !{metadata !909, metadata !910, metadata !918, metadata !134, metadata !925}
!909 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !906, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !894} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!910 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !911} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaChannelFormatDesc]
!911 = metadata !{i32 786451, null, metadata !"cudaChannelFormatDesc", metadata !895, i32 660, i64 160, i64 32, i32 0, i32 0, null, metadata !912, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaChannelFormatDesc] [line 660, size 160, align 32, offse
!912 = metadata !{metadata !913, metadata !914, metadata !915, metadata !916, metadata !917}
!913 = metadata !{i32 786445, metadata !911, metadata !"x", metadata !895, i32 662, i64 32, i64 32, i64 0, i32 0, metadata !153} ; [ DW_TAG_member ] [x] [line 662, size 32, align 32, offset 0] [from int]
!914 = metadata !{i32 786445, metadata !911, metadata !"y", metadata !895, i32 663, i64 32, i64 32, i64 32, i32 0, metadata !153} ; [ DW_TAG_member ] [y] [line 663, size 32, align 32, offset 32] [from int]
!915 = metadata !{i32 786445, metadata !911, metadata !"z", metadata !895, i32 664, i64 32, i64 32, i64 64, i32 0, metadata !153} ; [ DW_TAG_member ] [z] [line 664, size 32, align 32, offset 64] [from int]
!916 = metadata !{i32 786445, metadata !911, metadata !"w", metadata !895, i32 665, i64 32, i64 32, i64 96, i32 0, metadata !153} ; [ DW_TAG_member ] [w] [line 665, size 32, align 32, offset 96] [from int]
!917 = metadata !{i32 786445, metadata !911, metadata !"f", metadata !895, i32 666, i64 32, i64 32, i64 128, i32 0, metadata !896} ; [ DW_TAG_member ] [f] [line 666, size 32, align 32, offset 128] [from cudaChannelFormatKind]
!918 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !919} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaExtent]
!919 = metadata !{i32 786451, null, metadata !"cudaExtent", metadata !895, i32 730, i64 192, i64 64, i32 0, i32 0, null, metadata !920, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaExtent] [line 730, size 192, align 64, offset 0] [from ]
!920 = metadata !{metadata !921, metadata !923, metadata !924}
!921 = metadata !{i32 786445, metadata !919, metadata !"width", metadata !895, i32 732, i64 64, i64 64, i64 0, i32 0, metadata !922} ; [ DW_TAG_member ] [width] [line 732, size 64, align 64, offset 0] [from size_t]
!922 = metadata !{i32 786454, null, metadata !"size_t", metadata !895, i32 35, i64 0, i64 0, i64 0, i32 0, metadata !480} ; [ DW_TAG_typedef ] [size_t] [line 35, size 0, align 0, offset 0] [from long unsigned int]
!923 = metadata !{i32 786445, metadata !919, metadata !"height", metadata !895, i32 733, i64 64, i64 64, i64 64, i32 0, metadata !922} ; [ DW_TAG_member ] [height] [line 733, size 64, align 64, offset 64] [from size_t]
!924 = metadata !{i32 786445, metadata !919, metadata !"depth", metadata !895, i32 734, i64 64, i64 64, i64 128, i32 0, metadata !922} ; [ DW_TAG_member ] [depth] [line 734, size 64, align 64, offset 128] [from size_t]
!925 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !926} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaArray]
!926 = metadata !{i32 786451, null, metadata !"cudaArray", metadata !895, i32 672, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [cudaArray] [line 672, size 0, align 0, offset 0] [fwd] [from ]
!927 = metadata !{metadata !928}
!928 = metadata !{metadata !929, metadata !930, metadata !931, metadata !932}
!929 = metadata !{i32 786689, metadata !905, metadata !"desc", metadata !906, i32 16777240, metadata !910, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 24]
!930 = metadata !{i32 786689, metadata !905, metadata !"extent", metadata !906, i32 33554456, metadata !918, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 24]
!931 = metadata !{i32 786689, metadata !905, metadata !"flags", metadata !906, i32 50331673, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 25]
!932 = metadata !{i32 786689, metadata !905, metadata !"array", metadata !906, i32 67108889, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 25]
!933 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaFree", metadata !"cudaFree", metadata !"", metadata !906, i32 29, metadata !934, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFree, null, null, metadata !936, 
!934 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !935, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!935 = metadata !{metadata !909, metadata !342}
!936 = metadata !{metadata !937}
!937 = metadata !{metadata !938}
!938 = metadata !{i32 786689, metadata !933, metadata !"devPtr", metadata !906, i32 16777245, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 29]
!939 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaFreeArray", metadata !"cudaFreeArray", metadata !"", metadata !906, i32 34, metadata !940, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*)* @cudaFreeArra
!940 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !941, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!941 = metadata !{metadata !909, metadata !925}
!942 = metadata !{metadata !943}
!943 = metadata !{metadata !944}
!944 = metadata !{i32 786689, metadata !939, metadata !"array", metadata !906, i32 16777250, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 34]
!945 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaFreeHost", metadata !"cudaFreeHost", metadata !"", metadata !906, i32 39, metadata !934, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaFreeHost, null, null, met
!946 = metadata !{metadata !947}
!947 = metadata !{metadata !948}
!948 = metadata !{i32 786689, metadata !945, metadata !"ptr", metadata !906, i32 16777255, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 39]
!949 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaGetSymbolAddress", metadata !"cudaGetSymbolAddress", metadata !"", metadata !906, i32 44, metadata !950, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*)* @cudaGet
!950 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !951, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!951 = metadata !{metadata !909, metadata !952, metadata !856}
!952 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !342} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!953 = metadata !{metadata !954}
!954 = metadata !{metadata !955, metadata !956}
!955 = metadata !{i32 786689, metadata !949, metadata !"devPtr", metadata !906, i32 16777260, metadata !952, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 44]
!956 = metadata !{i32 786689, metadata !949, metadata !"symbol", metadata !906, i32 33554476, metadata !856, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 44]
!957 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaGetSymbolSize", metadata !"cudaGetSymbolSize", metadata !"", metadata !906, i32 48, metadata !958, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i8*)* @cudaGetSymbol
!958 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !959, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!959 = metadata !{metadata !909, metadata !960, metadata !856}
!960 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !922} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from size_t]
!961 = metadata !{metadata !962}
!962 = metadata !{metadata !963, metadata !964}
!963 = metadata !{i32 786689, metadata !957, metadata !"size", metadata !906, i32 16777264, metadata !960, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 48]
!964 = metadata !{i32 786689, metadata !957, metadata !"symbol", metadata !906, i32 33554480, metadata !856, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 48]
!965 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaHostAlloc", metadata !"cudaHostAlloc", metadata !"", metadata !906, i32 52, metadata !966, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64, i32)* @cudaHostAlloc, n
!966 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !967, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!967 = metadata !{metadata !909, metadata !952, metadata !922, metadata !109}
!968 = metadata !{metadata !969}
!969 = metadata !{metadata !970, metadata !971, metadata !972}
!970 = metadata !{i32 786689, metadata !965, metadata !"pHost", metadata !906, i32 16777268, metadata !952, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 52]
!971 = metadata !{i32 786689, metadata !965, metadata !"size", metadata !906, i32 33554484, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 52]
!972 = metadata !{i32 786689, metadata !965, metadata !"flags", metadata !906, i32 50331700, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 52]
!973 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaHostGetDevicePointer", metadata !"cudaHostGetDevicePointer", metadata !"", metadata !906, i32 56, metadata !974, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i8*, i
!974 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !975, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!975 = metadata !{metadata !909, metadata !952, metadata !342, metadata !109}
!976 = metadata !{metadata !977}
!977 = metadata !{metadata !978, metadata !979, metadata !980}
!978 = metadata !{i32 786689, metadata !973, metadata !"pDevice", metadata !906, i32 16777272, metadata !952, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pDevice] [line 56]
!979 = metadata !{i32 786689, metadata !973, metadata !"pHost", metadata !906, i32 33554488, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 56]
!980 = metadata !{i32 786689, metadata !973, metadata !"flags", metadata !906, i32 50331704, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 56]
!981 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaHostGetFlags", metadata !"cudaHostGetFlags", metadata !"", metadata !906, i32 60, metadata !982, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)* @cudaHostGetFlag
!982 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !983, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!983 = metadata !{metadata !909, metadata !134, metadata !342}
!984 = metadata !{metadata !985}
!985 = metadata !{metadata !986, metadata !987}
!986 = metadata !{i32 786689, metadata !981, metadata !"pFlags", metadata !906, i32 16777276, metadata !134, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pFlags] [line 60]
!987 = metadata !{i32 786689, metadata !981, metadata !"pHost", metadata !906, i32 33554492, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pHost] [line 60]
!988 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaHostRegister", metadata !"cudaHostRegister", metadata !"", metadata !906, i32 64, metadata !989, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32)* @cudaHostReg
!989 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !990, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!990 = metadata !{metadata !909, metadata !342, metadata !922, metadata !109}
!991 = metadata !{metadata !992}
!992 = metadata !{metadata !993, metadata !994, metadata !995}
!993 = metadata !{i32 786689, metadata !988, metadata !"ptr", metadata !906, i32 16777280, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 64]
!994 = metadata !{i32 786689, metadata !988, metadata !"size", metadata !906, i32 33554496, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 64]
!995 = metadata !{i32 786689, metadata !988, metadata !"flags", metadata !906, i32 50331712, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 64]
!996 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaHostUnregister", metadata !"cudaHostUnregister", metadata !"", metadata !906, i32 68, metadata !934, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaHostUnregiste
!997 = metadata !{metadata !998}
!998 = metadata !{metadata !999}
!999 = metadata !{i32 786689, metadata !996, metadata !"ptr", metadata !906, i32 16777284, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 68]
!1000 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMalloc", metadata !"cudaMalloc", metadata !"", metadata !906, i32 72, metadata !1001, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMalloc, null, null, m
!1001 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1002, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1002 = metadata !{metadata !909, metadata !952, metadata !922}
!1003 = metadata !{metadata !1004}
!1004 = metadata !{metadata !1005, metadata !1006}
!1005 = metadata !{i32 786689, metadata !1000, metadata !"devPtr", metadata !906, i32 16777288, metadata !952, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 72]
!1006 = metadata !{i32 786689, metadata !1000, metadata !"size", metadata !906, i32 33554504, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 72]
!1007 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMalloc3D", metadata !"cudaMalloc3D", metadata !"", metadata !906, i32 80, metadata !1008, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, %struct.c
!1008 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1009, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1009 = metadata !{metadata !909, metadata !1010, metadata !919}
!1010 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1011} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaPitchedPtr]
!1011 = metadata !{i32 786451, null, metadata !"cudaPitchedPtr", metadata !895, i32 718, i64 256, i64 64, i32 0, i32 0, null, metadata !1012, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPitchedPtr] [line 718, size 256, align 64, offset 0] [from ]
!1012 = metadata !{metadata !1013, metadata !1014, metadata !1015, metadata !1016}
!1013 = metadata !{i32 786445, metadata !1011, metadata !"ptr", metadata !895, i32 720, i64 64, i64 64, i64 0, i32 0, metadata !342} ; [ DW_TAG_member ] [ptr] [line 720, size 64, align 64, offset 0] [from ]
!1014 = metadata !{i32 786445, metadata !1011, metadata !"pitch", metadata !895, i32 721, i64 64, i64 64, i64 64, i32 0, metadata !922} ; [ DW_TAG_member ] [pitch] [line 721, size 64, align 64, offset 64] [from size_t]
!1015 = metadata !{i32 786445, metadata !1011, metadata !"xsize", metadata !895, i32 722, i64 64, i64 64, i64 128, i32 0, metadata !922} ; [ DW_TAG_member ] [xsize] [line 722, size 64, align 64, offset 128] [from size_t]
!1016 = metadata !{i32 786445, metadata !1011, metadata !"ysize", metadata !895, i32 723, i64 64, i64 64, i64 192, i32 0, metadata !922} ; [ DW_TAG_member ] [ysize] [line 723, size 64, align 64, offset 192] [from size_t]
!1017 = metadata !{metadata !1018}
!1018 = metadata !{metadata !1019, metadata !1020}
!1019 = metadata !{i32 786689, metadata !1007, metadata !"pitchedDevPtr", metadata !906, i32 16777296, metadata !1010, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 80]
!1020 = metadata !{i32 786689, metadata !1007, metadata !"extent", metadata !906, i32 33554512, metadata !919, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 80]
!1021 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMalloc3DArray", metadata !"cudaMalloc3DArray", metadata !"", metadata !906, i32 84, metadata !1022, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %st
!1022 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1023, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1023 = metadata !{metadata !909, metadata !1024, metadata !910, metadata !919, metadata !109}
!1024 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !925} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1025 = metadata !{metadata !1026}
!1026 = metadata !{metadata !1027, metadata !1028, metadata !1029, metadata !1030}
!1027 = metadata !{i32 786689, metadata !1021, metadata !"array", metadata !906, i32 16777300, metadata !1024, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 84]
!1028 = metadata !{i32 786689, metadata !1021, metadata !"desc", metadata !906, i32 33554516, metadata !910, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 84]
!1029 = metadata !{i32 786689, metadata !1021, metadata !"extent", metadata !906, i32 50331733, metadata !919, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 85]
!1030 = metadata !{i32 786689, metadata !1021, metadata !"flags", metadata !906, i32 67108949, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 85]
!1031 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMallocArray", metadata !"cudaMallocArray", metadata !"", metadata !906, i32 89, metadata !1032, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray**, %struct
!1032 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1033, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1033 = metadata !{metadata !909, metadata !1024, metadata !910, metadata !922, metadata !922, metadata !109}
!1034 = metadata !{metadata !1035}
!1035 = metadata !{metadata !1036, metadata !1037, metadata !1038, metadata !1039, metadata !1040}
!1036 = metadata !{i32 786689, metadata !1031, metadata !"array", metadata !906, i32 16777305, metadata !1024, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [array] [line 89]
!1037 = metadata !{i32 786689, metadata !1031, metadata !"desc", metadata !906, i32 33554521, metadata !910, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [desc] [line 89]
!1038 = metadata !{i32 786689, metadata !1031, metadata !"width", metadata !906, i32 50331738, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 90]
!1039 = metadata !{i32 786689, metadata !1031, metadata !"height", metadata !906, i32 67108954, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 90]
!1040 = metadata !{i32 786689, metadata !1031, metadata !"flags", metadata !906, i32 83886170, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 90]
!1041 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMallocHost", metadata !"cudaMallocHost", metadata !"", metadata !906, i32 94, metadata !1001, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64)* @cudaMallocHost, n
!1042 = metadata !{metadata !1043}
!1043 = metadata !{metadata !1044, metadata !1045}
!1044 = metadata !{i32 786689, metadata !1041, metadata !"ptr", metadata !906, i32 16777310, metadata !952, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [ptr] [line 94]
!1045 = metadata !{i32 786689, metadata !1041, metadata !"size", metadata !906, i32 33554526, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [size] [line 94]
!1046 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMallocPitch", metadata !"cudaMallocPitch", metadata !"", metadata !906, i32 102, metadata !1047, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, i64*, i64, i64)* @cud
!1047 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1048, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1048 = metadata !{metadata !909, metadata !952, metadata !960, metadata !922, metadata !922}
!1049 = metadata !{metadata !1050}
!1050 = metadata !{metadata !1051, metadata !1052, metadata !1053, metadata !1054}
!1051 = metadata !{i32 786689, metadata !1046, metadata !"devPtr", metadata !906, i32 16777318, metadata !952, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 102]
!1052 = metadata !{i32 786689, metadata !1046, metadata !"pitch", metadata !906, i32 33554534, metadata !960, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 102]
!1053 = metadata !{i32 786689, metadata !1046, metadata !"width", metadata !906, i32 50331750, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 102]
!1054 = metadata !{i32 786689, metadata !1046, metadata !"height", metadata !906, i32 67108966, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 102]
!1055 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy", metadata !"cudaMemcpy", metadata !"", metadata !906, i32 106, metadata !1056, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32)* @cudaMemcpy, nul
!1056 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1057, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1057 = metadata !{metadata !909, metadata !342, metadata !320, metadata !922, metadata !902}
!1058 = metadata !{metadata !1059}
!1059 = metadata !{metadata !1060, metadata !1061, metadata !1062, metadata !1063}
!1060 = metadata !{i32 786689, metadata !1055, metadata !"dst", metadata !906, i32 16777322, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 106]
!1061 = metadata !{i32 786689, metadata !1055, metadata !"src", metadata !906, i32 33554538, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 106]
!1062 = metadata !{i32 786689, metadata !1055, metadata !"count", metadata !906, i32 50331754, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 106]
!1063 = metadata !{i32 786689, metadata !1055, metadata !"kind", metadata !906, i32 67108970, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 106]
!1064 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy2D", metadata !"cudaMemcpy2D", metadata !"", metadata !906, i32 111, metadata !1065, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64, i64, i32
!1065 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1066, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1066 = metadata !{metadata !909, metadata !342, metadata !922, metadata !320, metadata !922, metadata !922, metadata !922, metadata !902}
!1067 = metadata !{metadata !1068}
!1068 = metadata !{metadata !1069, metadata !1070, metadata !1071, metadata !1072, metadata !1073, metadata !1074, metadata !1075}
!1069 = metadata !{i32 786689, metadata !1064, metadata !"dst", metadata !906, i32 16777327, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 111]
!1070 = metadata !{i32 786689, metadata !1064, metadata !"dpitch", metadata !906, i32 33554543, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 111]
!1071 = metadata !{i32 786689, metadata !1064, metadata !"src", metadata !906, i32 50331759, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 111]
!1072 = metadata !{i32 786689, metadata !1064, metadata !"spitch", metadata !906, i32 67108975, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 111]
!1073 = metadata !{i32 786689, metadata !1064, metadata !"width", metadata !906, i32 83886192, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 112]
!1074 = metadata !{i32 786689, metadata !1064, metadata !"height", metadata !906, i32 100663408, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 112]
!1075 = metadata !{i32 786689, metadata !1064, metadata !"kind", metadata !906, i32 117440624, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 112]
!1076 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy2DArrayToArray", metadata !"cudaMemcpy2DArrayToArray", metadata !"", metadata !906, i32 116, metadata !1077, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.c
!1077 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1078, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1078 = metadata !{metadata !909, metadata !925, metadata !922, metadata !922, metadata !925, metadata !922, metadata !922, metadata !922, metadata !922, metadata !902}
!1079 = metadata !{metadata !1080}
!1080 = metadata !{metadata !1081, metadata !1082, metadata !1083, metadata !1084, metadata !1085, metadata !1086, metadata !1087, metadata !1088, metadata !1089}
!1081 = metadata !{i32 786689, metadata !1076, metadata !"dst", metadata !906, i32 16777332, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 116]
!1082 = metadata !{i32 786689, metadata !1076, metadata !"wOffsetDst", metadata !906, i32 33554548, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 116]
!1083 = metadata !{i32 786689, metadata !1076, metadata !"hOffsetDst", metadata !906, i32 50331764, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 116]
!1084 = metadata !{i32 786689, metadata !1076, metadata !"src", metadata !906, i32 67108981, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 117]
!1085 = metadata !{i32 786689, metadata !1076, metadata !"wOffsetSrc", metadata !906, i32 83886197, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 117]
!1086 = metadata !{i32 786689, metadata !1076, metadata !"hOffsetSrc", metadata !906, i32 100663413, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 117]
!1087 = metadata !{i32 786689, metadata !1076, metadata !"width", metadata !906, i32 117440630, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 118]
!1088 = metadata !{i32 786689, metadata !1076, metadata !"height", metadata !906, i32 134217846, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 118]
!1089 = metadata !{i32 786689, metadata !1076, metadata !"kind", metadata !906, i32 150995062, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 118]
!1090 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy2DAsync", metadata !"cudaMemcpy2DAsync", metadata !"", metadata !906, i32 122, metadata !1091, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i8*, i64, i64
!1091 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1092, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1092 = metadata !{metadata !909, metadata !342, metadata !922, metadata !320, metadata !922, metadata !922, metadata !922, metadata !902, metadata !1093}
!1093 = metadata !{i32 786454, null, metadata !"cudaStream_t", metadata !906, i32 1298, i64 0, i64 0, i64 0, i32 0, metadata !1094} ; [ DW_TAG_typedef ] [cudaStream_t] [line 1298, size 0, align 0, offset 0] [from ]
!1094 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1095} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUstream_st]
!1095 = metadata !{i32 786451, null, metadata !"CUstream_st", metadata !895, i32 1298, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUstream_st] [line 1298, size 0, align 0, offset 0] [fwd] [from ]
!1096 = metadata !{metadata !1097}
!1097 = metadata !{metadata !1098, metadata !1099, metadata !1100, metadata !1101, metadata !1102, metadata !1103, metadata !1104, metadata !1105}
!1098 = metadata !{i32 786689, metadata !1090, metadata !"dst", metadata !906, i32 16777338, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 122]
!1099 = metadata !{i32 786689, metadata !1090, metadata !"dpitch", metadata !906, i32 33554554, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 122]
!1100 = metadata !{i32 786689, metadata !1090, metadata !"src", metadata !906, i32 50331770, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 122]
!1101 = metadata !{i32 786689, metadata !1090, metadata !"spitch", metadata !906, i32 67108986, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 122]
!1102 = metadata !{i32 786689, metadata !1090, metadata !"width", metadata !906, i32 83886203, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 123]
!1103 = metadata !{i32 786689, metadata !1090, metadata !"height", metadata !906, i32 100663419, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 123]
!1104 = metadata !{i32 786689, metadata !1090, metadata !"kind", metadata !906, i32 117440635, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 123]
!1105 = metadata !{i32 786689, metadata !1090, metadata !"stream", metadata !906, i32 134217852, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 124]
!1106 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy2DFromArray", metadata !"cudaMemcpy2DFromArray", metadata !"", metadata !906, i32 128, metadata !1107, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, %stru
!1107 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1108, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1108 = metadata !{metadata !909, metadata !342, metadata !922, metadata !925, metadata !922, metadata !922, metadata !922, metadata !922, metadata !902}
!1109 = metadata !{metadata !1110}
!1110 = metadata !{metadata !1111, metadata !1112, metadata !1113, metadata !1114, metadata !1115, metadata !1116, metadata !1117, metadata !1118}
!1111 = metadata !{i32 786689, metadata !1106, metadata !"dst", metadata !906, i32 16777344, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 128]
!1112 = metadata !{i32 786689, metadata !1106, metadata !"dpitch", metadata !906, i32 33554560, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 128]
!1113 = metadata !{i32 786689, metadata !1106, metadata !"src", metadata !906, i32 50331776, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 128]
!1114 = metadata !{i32 786689, metadata !1106, metadata !"wOffset", metadata !906, i32 67108993, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 129]
!1115 = metadata !{i32 786689, metadata !1106, metadata !"hOffset", metadata !906, i32 83886209, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 129]
!1116 = metadata !{i32 786689, metadata !1106, metadata !"width", metadata !906, i32 100663425, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 129]
!1117 = metadata !{i32 786689, metadata !1106, metadata !"height", metadata !906, i32 117440641, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 129]
!1118 = metadata !{i32 786689, metadata !1106, metadata !"kind", metadata !906, i32 134217858, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 130]
!1119 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy2DFromArrayAsync", metadata !"cudaMemcpy2DFromArrayAsync", metadata !"", metadata !906, i32 134, metadata !1120, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, 
!1120 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1121, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1121 = metadata !{metadata !909, metadata !342, metadata !922, metadata !925, metadata !922, metadata !922, metadata !922, metadata !922, metadata !902, metadata !1093}
!1122 = metadata !{metadata !1123}
!1123 = metadata !{metadata !1124, metadata !1125, metadata !1126, metadata !1127, metadata !1128, metadata !1129, metadata !1130, metadata !1131, metadata !1132}
!1124 = metadata !{i32 786689, metadata !1119, metadata !"dst", metadata !906, i32 16777350, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 134]
!1125 = metadata !{i32 786689, metadata !1119, metadata !"dpitch", metadata !906, i32 33554566, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dpitch] [line 134]
!1126 = metadata !{i32 786689, metadata !1119, metadata !"src", metadata !906, i32 50331782, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 134]
!1127 = metadata !{i32 786689, metadata !1119, metadata !"wOffset", metadata !906, i32 67108999, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 135]
!1128 = metadata !{i32 786689, metadata !1119, metadata !"hOffset", metadata !906, i32 83886215, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 135]
!1129 = metadata !{i32 786689, metadata !1119, metadata !"width", metadata !906, i32 100663431, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 135]
!1130 = metadata !{i32 786689, metadata !1119, metadata !"height", metadata !906, i32 117440647, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 135]
!1131 = metadata !{i32 786689, metadata !1119, metadata !"kind", metadata !906, i32 134217864, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 136]
!1132 = metadata !{i32 786689, metadata !1119, metadata !"stream", metadata !906, i32 150995080, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 136]
!1133 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy2DToArray", metadata !"cudaMemcpy2DToArray", metadata !"", metadata !906, i32 140, metadata !1134, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*,
!1134 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1135, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1135 = metadata !{metadata !909, metadata !925, metadata !922, metadata !922, metadata !320, metadata !922, metadata !922, metadata !922, metadata !902}
!1136 = metadata !{metadata !1137}
!1137 = metadata !{metadata !1138, metadata !1139, metadata !1140, metadata !1141, metadata !1142, metadata !1143, metadata !1144, metadata !1145}
!1138 = metadata !{i32 786689, metadata !1133, metadata !"dst", metadata !906, i32 16777356, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 140]
!1139 = metadata !{i32 786689, metadata !1133, metadata !"wOffset", metadata !906, i32 33554572, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 140]
!1140 = metadata !{i32 786689, metadata !1133, metadata !"hOffset", metadata !906, i32 50331788, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 140]
!1141 = metadata !{i32 786689, metadata !1133, metadata !"src", metadata !906, i32 67109005, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 141]
!1142 = metadata !{i32 786689, metadata !1133, metadata !"spitch", metadata !906, i32 83886221, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 141]
!1143 = metadata !{i32 786689, metadata !1133, metadata !"width", metadata !906, i32 100663437, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 141]
!1144 = metadata !{i32 786689, metadata !1133, metadata !"height", metadata !906, i32 117440653, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 141]
!1145 = metadata !{i32 786689, metadata !1133, metadata !"kind", metadata !906, i32 134217870, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 142]
!1146 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy2DToArrayAsync", metadata !"cudaMemcpy2DToArrayAsync", metadata !"", metadata !906, i32 146, metadata !1147, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.c
!1147 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1148, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1148 = metadata !{metadata !909, metadata !925, metadata !922, metadata !922, metadata !320, metadata !922, metadata !922, metadata !922, metadata !902, metadata !1093}
!1149 = metadata !{metadata !1150}
!1150 = metadata !{metadata !1151, metadata !1152, metadata !1153, metadata !1154, metadata !1155, metadata !1156, metadata !1157, metadata !1158, metadata !1159}
!1151 = metadata !{i32 786689, metadata !1146, metadata !"dst", metadata !906, i32 16777362, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 146]
!1152 = metadata !{i32 786689, metadata !1146, metadata !"wOffset", metadata !906, i32 33554578, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 146]
!1153 = metadata !{i32 786689, metadata !1146, metadata !"hOffset", metadata !906, i32 50331794, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 146]
!1154 = metadata !{i32 786689, metadata !1146, metadata !"src", metadata !906, i32 67109011, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 147]
!1155 = metadata !{i32 786689, metadata !1146, metadata !"spitch", metadata !906, i32 83886227, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [spitch] [line 147]
!1156 = metadata !{i32 786689, metadata !1146, metadata !"width", metadata !906, i32 100663443, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 147]
!1157 = metadata !{i32 786689, metadata !1146, metadata !"height", metadata !906, i32 117440659, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 147]
!1158 = metadata !{i32 786689, metadata !1146, metadata !"kind", metadata !906, i32 134217876, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 148]
!1159 = metadata !{i32 786689, metadata !1146, metadata !"stream", metadata !906, i32 150995092, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 148]
!1160 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy3D", metadata !"cudaMemcpy3D", metadata !"", metadata !906, i32 152, metadata !1161, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DParms*)* @cud
!1161 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1162, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1162 = metadata !{metadata !909, metadata !1163}
!1163 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1164} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1164 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1165} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DParms]
!1165 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DParms", metadata !895, i32 751, i64 1280, i64 64, i32 0, i32 0, null, metadata !1166, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DParms] [line 751, size 1280, align 64, offset 0]
!1166 = metadata !{metadata !1167, metadata !1169, metadata !1175, metadata !1176, metadata !1177, metadata !1178, metadata !1179, metadata !1180}
!1167 = metadata !{i32 786445, metadata !1165, metadata !"srcArray", metadata !895, i32 753, i64 64, i64 64, i64 0, i32 0, metadata !1168} ; [ DW_TAG_member ] [srcArray] [line 753, size 64, align 64, offset 0] [from cudaArray_t]
!1168 = metadata !{i32 786454, null, metadata !"cudaArray_t", metadata !895, i32 672, i64 0, i64 0, i64 0, i32 0, metadata !925} ; [ DW_TAG_typedef ] [cudaArray_t] [line 672, size 0, align 0, offset 0] [from ]
!1169 = metadata !{i32 786445, metadata !1165, metadata !"srcPos", metadata !895, i32 754, i64 192, i64 64, i64 64, i32 0, metadata !1170} ; [ DW_TAG_member ] [srcPos] [line 754, size 192, align 64, offset 64] [from cudaPos]
!1170 = metadata !{i32 786451, null, metadata !"cudaPos", metadata !895, i32 741, i64 192, i64 64, i32 0, i32 0, null, metadata !1171, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaPos] [line 741, size 192, align 64, offset 0] [from ]
!1171 = metadata !{metadata !1172, metadata !1173, metadata !1174}
!1172 = metadata !{i32 786445, metadata !1170, metadata !"x", metadata !895, i32 743, i64 64, i64 64, i64 0, i32 0, metadata !922} ; [ DW_TAG_member ] [x] [line 743, size 64, align 64, offset 0] [from size_t]
!1173 = metadata !{i32 786445, metadata !1170, metadata !"y", metadata !895, i32 744, i64 64, i64 64, i64 64, i32 0, metadata !922} ; [ DW_TAG_member ] [y] [line 744, size 64, align 64, offset 64] [from size_t]
!1174 = metadata !{i32 786445, metadata !1170, metadata !"z", metadata !895, i32 745, i64 64, i64 64, i64 128, i32 0, metadata !922} ; [ DW_TAG_member ] [z] [line 745, size 64, align 64, offset 128] [from size_t]
!1175 = metadata !{i32 786445, metadata !1165, metadata !"srcPtr", metadata !895, i32 755, i64 256, i64 64, i64 256, i32 0, metadata !1011} ; [ DW_TAG_member ] [srcPtr] [line 755, size 256, align 64, offset 256] [from cudaPitchedPtr]
!1176 = metadata !{i32 786445, metadata !1165, metadata !"dstArray", metadata !895, i32 757, i64 64, i64 64, i64 512, i32 0, metadata !1168} ; [ DW_TAG_member ] [dstArray] [line 757, size 64, align 64, offset 512] [from cudaArray_t]
!1177 = metadata !{i32 786445, metadata !1165, metadata !"dstPos", metadata !895, i32 758, i64 192, i64 64, i64 576, i32 0, metadata !1170} ; [ DW_TAG_member ] [dstPos] [line 758, size 192, align 64, offset 576] [from cudaPos]
!1178 = metadata !{i32 786445, metadata !1165, metadata !"dstPtr", metadata !895, i32 759, i64 256, i64 64, i64 768, i32 0, metadata !1011} ; [ DW_TAG_member ] [dstPtr] [line 759, size 256, align 64, offset 768] [from cudaPitchedPtr]
!1179 = metadata !{i32 786445, metadata !1165, metadata !"extent", metadata !895, i32 761, i64 192, i64 64, i64 1024, i32 0, metadata !919} ; [ DW_TAG_member ] [extent] [line 761, size 192, align 64, offset 1024] [from cudaExtent]
!1180 = metadata !{i32 786445, metadata !1165, metadata !"kind", metadata !895, i32 762, i64 32, i64 32, i64 1216, i32 0, metadata !902} ; [ DW_TAG_member ] [kind] [line 762, size 32, align 32, offset 1216] [from cudaMemcpyKind]
!1181 = metadata !{metadata !1182}
!1182 = metadata !{metadata !1183}
!1183 = metadata !{i32 786689, metadata !1160, metadata !"p", metadata !906, i32 16777368, metadata !1163, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 152]
!1184 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy3DAsync", metadata !"cudaMemcpy3DAsync", metadata !"", metadata !906, i32 156, metadata !1185, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPar
!1185 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1186, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1186 = metadata !{metadata !909, metadata !1163, metadata !1093}
!1187 = metadata !{metadata !1188}
!1188 = metadata !{metadata !1189, metadata !1190}
!1189 = metadata !{i32 786689, metadata !1184, metadata !"p", metadata !906, i32 16777372, metadata !1163, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 156]
!1190 = metadata !{i32 786689, metadata !1184, metadata !"stream", metadata !906, i32 33554588, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 156]
!1191 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy3DPeer", metadata !"cudaMemcpy3DPeer", metadata !"", metadata !906, i32 160, metadata !1192, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMemcpy3DPeerP
!1192 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1193, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1193 = metadata !{metadata !909, metadata !1194}
!1194 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1195} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1195 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1196} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaMemcpy3DPeerParms]
!1196 = metadata !{i32 786451, null, metadata !"cudaMemcpy3DPeerParms", metadata !895, i32 768, i64 1344, i64 64, i32 0, i32 0, null, metadata !1197, i32 0, null, null} ; [ DW_TAG_structure_type ] [cudaMemcpy3DPeerParms] [line 768, size 1344, align 64, o
!1197 = metadata !{metadata !1198, metadata !1199, metadata !1200, metadata !1201, metadata !1202, metadata !1203, metadata !1204, metadata !1205, metadata !1206}
!1198 = metadata !{i32 786445, metadata !1196, metadata !"srcArray", metadata !895, i32 770, i64 64, i64 64, i64 0, i32 0, metadata !1168} ; [ DW_TAG_member ] [srcArray] [line 770, size 64, align 64, offset 0] [from cudaArray_t]
!1199 = metadata !{i32 786445, metadata !1196, metadata !"srcPos", metadata !895, i32 771, i64 192, i64 64, i64 64, i32 0, metadata !1170} ; [ DW_TAG_member ] [srcPos] [line 771, size 192, align 64, offset 64] [from cudaPos]
!1200 = metadata !{i32 786445, metadata !1196, metadata !"srcPtr", metadata !895, i32 772, i64 256, i64 64, i64 256, i32 0, metadata !1011} ; [ DW_TAG_member ] [srcPtr] [line 772, size 256, align 64, offset 256] [from cudaPitchedPtr]
!1201 = metadata !{i32 786445, metadata !1196, metadata !"srcDevice", metadata !895, i32 773, i64 32, i64 32, i64 512, i32 0, metadata !153} ; [ DW_TAG_member ] [srcDevice] [line 773, size 32, align 32, offset 512] [from int]
!1202 = metadata !{i32 786445, metadata !1196, metadata !"dstArray", metadata !895, i32 775, i64 64, i64 64, i64 576, i32 0, metadata !1168} ; [ DW_TAG_member ] [dstArray] [line 775, size 64, align 64, offset 576] [from cudaArray_t]
!1203 = metadata !{i32 786445, metadata !1196, metadata !"dstPos", metadata !895, i32 776, i64 192, i64 64, i64 640, i32 0, metadata !1170} ; [ DW_TAG_member ] [dstPos] [line 776, size 192, align 64, offset 640] [from cudaPos]
!1204 = metadata !{i32 786445, metadata !1196, metadata !"dstPtr", metadata !895, i32 777, i64 256, i64 64, i64 832, i32 0, metadata !1011} ; [ DW_TAG_member ] [dstPtr] [line 777, size 256, align 64, offset 832] [from cudaPitchedPtr]
!1205 = metadata !{i32 786445, metadata !1196, metadata !"dstDevice", metadata !895, i32 778, i64 32, i64 32, i64 1088, i32 0, metadata !153} ; [ DW_TAG_member ] [dstDevice] [line 778, size 32, align 32, offset 1088] [from int]
!1206 = metadata !{i32 786445, metadata !1196, metadata !"extent", metadata !895, i32 780, i64 192, i64 64, i64 1152, i32 0, metadata !919} ; [ DW_TAG_member ] [extent] [line 780, size 192, align 64, offset 1152] [from cudaExtent]
!1207 = metadata !{metadata !1208}
!1208 = metadata !{metadata !1209}
!1209 = metadata !{i32 786689, metadata !1191, metadata !"p", metadata !906, i32 16777376, metadata !1194, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 160]
!1210 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpy3DPeerAsync", metadata !"cudaMemcpy3DPeerAsync", metadata !"", metadata !906, i32 164, metadata !1211, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaMem
!1211 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1212, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1212 = metadata !{metadata !909, metadata !1194, metadata !1093}
!1213 = metadata !{metadata !1214}
!1214 = metadata !{metadata !1215, metadata !1216}
!1215 = metadata !{i32 786689, metadata !1210, metadata !"p", metadata !906, i32 16777380, metadata !1194, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [p] [line 164]
!1216 = metadata !{i32 786689, metadata !1210, metadata !"stream", metadata !906, i32 33554596, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 164]
!1217 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyArrayToArray", metadata !"cudaMemcpyArrayToArray", metadata !"", metadata !906, i32 168, metadata !1218, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaA
!1218 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1219, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1219 = metadata !{metadata !909, metadata !925, metadata !922, metadata !922, metadata !925, metadata !922, metadata !922, metadata !922, metadata !902}
!1220 = metadata !{metadata !1221}
!1221 = metadata !{metadata !1222, metadata !1223, metadata !1224, metadata !1225, metadata !1226, metadata !1227, metadata !1228, metadata !1229}
!1222 = metadata !{i32 786689, metadata !1217, metadata !"dst", metadata !906, i32 16777384, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 168]
!1223 = metadata !{i32 786689, metadata !1217, metadata !"wOffsetDst", metadata !906, i32 33554600, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetDst] [line 168]
!1224 = metadata !{i32 786689, metadata !1217, metadata !"hOffsetDst", metadata !906, i32 50331816, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetDst] [line 168]
!1225 = metadata !{i32 786689, metadata !1217, metadata !"src", metadata !906, i32 67109033, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 169]
!1226 = metadata !{i32 786689, metadata !1217, metadata !"wOffsetSrc", metadata !906, i32 83886249, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffsetSrc] [line 169]
!1227 = metadata !{i32 786689, metadata !1217, metadata !"hOffsetSrc", metadata !906, i32 100663465, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffsetSrc] [line 169]
!1228 = metadata !{i32 786689, metadata !1217, metadata !"count", metadata !906, i32 117440682, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 170]
!1229 = metadata !{i32 786689, metadata !1217, metadata !"kind", metadata !906, i32 134217898, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 170]
!1230 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyAsync", metadata !"cudaMemcpyAsync", metadata !"", metadata !906, i32 174, metadata !1231, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i32, %struct
!1231 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1232, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1232 = metadata !{metadata !909, metadata !342, metadata !320, metadata !922, metadata !902, metadata !1093}
!1233 = metadata !{metadata !1234}
!1234 = metadata !{metadata !1235, metadata !1236, metadata !1237, metadata !1238, metadata !1239}
!1235 = metadata !{i32 786689, metadata !1230, metadata !"dst", metadata !906, i32 16777390, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 174]
!1236 = metadata !{i32 786689, metadata !1230, metadata !"src", metadata !906, i32 33554606, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 174]
!1237 = metadata !{i32 786689, metadata !1230, metadata !"count", metadata !906, i32 50331822, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 174]
!1238 = metadata !{i32 786689, metadata !1230, metadata !"kind", metadata !906, i32 67109039, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 175]
!1239 = metadata !{i32 786689, metadata !1230, metadata !"stream", metadata !906, i32 83886255, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 175]
!1240 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyFromArray", metadata !"cudaMemcpyFromArray", metadata !"", metadata !906, i32 179, metadata !1241, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %struct.cudaAr
!1241 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1242, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1242 = metadata !{metadata !909, metadata !342, metadata !925, metadata !922, metadata !922, metadata !922, metadata !902}
!1243 = metadata !{metadata !1244}
!1244 = metadata !{metadata !1245, metadata !1246, metadata !1247, metadata !1248, metadata !1249, metadata !1250}
!1245 = metadata !{i32 786689, metadata !1240, metadata !"dst", metadata !906, i32 16777395, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 179]
!1246 = metadata !{i32 786689, metadata !1240, metadata !"src", metadata !906, i32 33554611, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 179]
!1247 = metadata !{i32 786689, metadata !1240, metadata !"wOffset", metadata !906, i32 50331827, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 179]
!1248 = metadata !{i32 786689, metadata !1240, metadata !"hOffset", metadata !906, i32 67109044, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 180]
!1249 = metadata !{i32 786689, metadata !1240, metadata !"count", metadata !906, i32 83886260, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 180]
!1250 = metadata !{i32 786689, metadata !1240, metadata !"kind", metadata !906, i32 100663476, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 180]
!1251 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyFromArrayAsync", metadata !"cudaMemcpyFromArrayAsync", metadata !"", metadata !906, i32 184, metadata !1252, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, %str
!1252 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1253, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1253 = metadata !{metadata !909, metadata !342, metadata !925, metadata !922, metadata !922, metadata !922, metadata !902, metadata !1093}
!1254 = metadata !{metadata !1255}
!1255 = metadata !{metadata !1256, metadata !1257, metadata !1258, metadata !1259, metadata !1260, metadata !1261, metadata !1262}
!1256 = metadata !{i32 786689, metadata !1251, metadata !"dst", metadata !906, i32 16777400, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 184]
!1257 = metadata !{i32 786689, metadata !1251, metadata !"src", metadata !906, i32 33554616, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 184]
!1258 = metadata !{i32 786689, metadata !1251, metadata !"wOffset", metadata !906, i32 50331832, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 184]
!1259 = metadata !{i32 786689, metadata !1251, metadata !"hOffset", metadata !906, i32 67109049, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 185]
!1260 = metadata !{i32 786689, metadata !1251, metadata !"count", metadata !906, i32 83886265, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 185]
!1261 = metadata !{i32 786689, metadata !1251, metadata !"kind", metadata !906, i32 100663481, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 185]
!1262 = metadata !{i32 786689, metadata !1251, metadata !"stream", metadata !906, i32 117440698, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 186]
!1263 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyFromSymbol", metadata !"cudaMemcpyFromSymbol", metadata !"", metadata !906, i32 190, metadata !1264, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i6
!1264 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1265, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1265 = metadata !{metadata !909, metadata !342, metadata !856, metadata !922, metadata !922, metadata !902}
!1266 = metadata !{metadata !1267}
!1267 = metadata !{metadata !1268, metadata !1269, metadata !1270, metadata !1271, metadata !1272}
!1268 = metadata !{i32 786689, metadata !1263, metadata !"dst", metadata !906, i32 16777406, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 190]
!1269 = metadata !{i32 786689, metadata !1263, metadata !"symbol", metadata !906, i32 33554622, metadata !856, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 190]
!1270 = metadata !{i32 786689, metadata !1263, metadata !"count", metadata !906, i32 50331838, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 190]
!1271 = metadata !{i32 786689, metadata !1263, metadata !"offset", metadata !906, i32 67109055, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 191]
!1272 = metadata !{i32 786689, metadata !1263, metadata !"kind", metadata !906, i32 83886271, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 191]
!1273 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyFromSymbolAsync", metadata !"cudaMemcpyFromSymbolAsync", metadata !"", metadata !906, i32 195, metadata !1274, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8
!1274 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1275, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1275 = metadata !{metadata !909, metadata !342, metadata !856, metadata !922, metadata !922, metadata !902, metadata !1093}
!1276 = metadata !{metadata !1277}
!1277 = metadata !{metadata !1278, metadata !1279, metadata !1280, metadata !1281, metadata !1282, metadata !1283}
!1278 = metadata !{i32 786689, metadata !1273, metadata !"dst", metadata !906, i32 16777411, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 195]
!1279 = metadata !{i32 786689, metadata !1273, metadata !"symbol", metadata !906, i32 33554627, metadata !856, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 195]
!1280 = metadata !{i32 786689, metadata !1273, metadata !"count", metadata !906, i32 50331843, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 195]
!1281 = metadata !{i32 786689, metadata !1273, metadata !"offset", metadata !906, i32 67109060, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 196]
!1282 = metadata !{i32 786689, metadata !1273, metadata !"kind", metadata !906, i32 83886276, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 196]
!1283 = metadata !{i32 786689, metadata !1273, metadata !"stream", metadata !906, i32 100663493, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 197]
!1284 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyPeer", metadata !"cudaMemcpyPeer", metadata !"", metadata !906, i32 201, metadata !1285, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32, i64)* @cu
!1285 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1286, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1286 = metadata !{metadata !909, metadata !342, metadata !153, metadata !320, metadata !153, metadata !922}
!1287 = metadata !{metadata !1288}
!1288 = metadata !{metadata !1289, metadata !1290, metadata !1291, metadata !1292, metadata !1293}
!1289 = metadata !{i32 786689, metadata !1284, metadata !"dst", metadata !906, i32 16777417, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 201]
!1290 = metadata !{i32 786689, metadata !1284, metadata !"dstDevice", metadata !906, i32 33554633, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 201]
!1291 = metadata !{i32 786689, metadata !1284, metadata !"src", metadata !906, i32 50331849, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 201]
!1292 = metadata !{i32 786689, metadata !1284, metadata !"srcDevice", metadata !906, i32 67109065, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 201]
!1293 = metadata !{i32 786689, metadata !1284, metadata !"count", metadata !906, i32 83886281, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 201]
!1294 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyPeerAsync", metadata !"cudaMemcpyPeerAsync", metadata !"", metadata !906, i32 206, metadata !1295, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i8*, i32,
!1295 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1296, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1296 = metadata !{metadata !909, metadata !342, metadata !153, metadata !320, metadata !153, metadata !922, metadata !1093}
!1297 = metadata !{metadata !1298}
!1298 = metadata !{metadata !1299, metadata !1300, metadata !1301, metadata !1302, metadata !1303, metadata !1304}
!1299 = metadata !{i32 786689, metadata !1294, metadata !"dst", metadata !906, i32 16777422, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 206]
!1300 = metadata !{i32 786689, metadata !1294, metadata !"dstDevice", metadata !906, i32 33554638, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dstDevice] [line 206]
!1301 = metadata !{i32 786689, metadata !1294, metadata !"src", metadata !906, i32 50331854, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 206]
!1302 = metadata !{i32 786689, metadata !1294, metadata !"srcDevice", metadata !906, i32 67109070, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [srcDevice] [line 206]
!1303 = metadata !{i32 786689, metadata !1294, metadata !"count", metadata !906, i32 83886287, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 207]
!1304 = metadata !{i32 786689, metadata !1294, metadata !"stream", metadata !906, i32 100663503, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 207]
!1305 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyToArray", metadata !"cudaMemcpyToArray", metadata !"", metadata !906, i32 212, metadata !1306, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaArray*, i64
!1306 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1307, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1307 = metadata !{metadata !909, metadata !925, metadata !922, metadata !922, metadata !320, metadata !922, metadata !902}
!1308 = metadata !{metadata !1309}
!1309 = metadata !{metadata !1310, metadata !1311, metadata !1312, metadata !1313, metadata !1314, metadata !1315}
!1310 = metadata !{i32 786689, metadata !1305, metadata !"dst", metadata !906, i32 16777428, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 212]
!1311 = metadata !{i32 786689, metadata !1305, metadata !"wOffset", metadata !906, i32 33554644, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 212]
!1312 = metadata !{i32 786689, metadata !1305, metadata !"hOffset", metadata !906, i32 50331860, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 212]
!1313 = metadata !{i32 786689, metadata !1305, metadata !"src", metadata !906, i32 67109077, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 213]
!1314 = metadata !{i32 786689, metadata !1305, metadata !"count", metadata !906, i32 83886293, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 213]
!1315 = metadata !{i32 786689, metadata !1305, metadata !"kind", metadata !906, i32 100663509, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 213]
!1316 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyToArrayAsync", metadata !"cudaMemcpyToArrayAsync", metadata !"", metadata !906, i32 217, metadata !1317, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaA
!1317 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1318, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1318 = metadata !{metadata !909, metadata !925, metadata !922, metadata !922, metadata !320, metadata !922, metadata !902, metadata !1093}
!1319 = metadata !{metadata !1320}
!1320 = metadata !{metadata !1321, metadata !1322, metadata !1323, metadata !1324, metadata !1325, metadata !1326, metadata !1327}
!1321 = metadata !{i32 786689, metadata !1316, metadata !"dst", metadata !906, i32 16777433, metadata !925, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [dst] [line 217]
!1322 = metadata !{i32 786689, metadata !1316, metadata !"wOffset", metadata !906, i32 33554649, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [wOffset] [line 217]
!1323 = metadata !{i32 786689, metadata !1316, metadata !"hOffset", metadata !906, i32 50331865, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [hOffset] [line 217]
!1324 = metadata !{i32 786689, metadata !1316, metadata !"src", metadata !906, i32 67109082, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 218]
!1325 = metadata !{i32 786689, metadata !1316, metadata !"count", metadata !906, i32 83886298, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 218]
!1326 = metadata !{i32 786689, metadata !1316, metadata !"kind", metadata !906, i32 100663514, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 218]
!1327 = metadata !{i32 786689, metadata !1316, metadata !"stream", metadata !906, i32 117440731, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 219]
!1328 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyToSymbol", metadata !"cudaMemcpyToSymbol", metadata !"", metadata !906, i32 223, metadata !1329, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i64, i64, i
!1329 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1330, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1330 = metadata !{metadata !909, metadata !338, metadata !320, metadata !922, metadata !922, metadata !902}
!1331 = metadata !{metadata !1332}
!1332 = metadata !{metadata !1333, metadata !1334, metadata !1335, metadata !1336, metadata !1337}
!1333 = metadata !{i32 786689, metadata !1328, metadata !"symbol", metadata !906, i32 16777439, metadata !338, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 223]
!1334 = metadata !{i32 786689, metadata !1328, metadata !"src", metadata !906, i32 33554655, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 223]
!1335 = metadata !{i32 786689, metadata !1328, metadata !"count", metadata !906, i32 50331871, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 223]
!1336 = metadata !{i32 786689, metadata !1328, metadata !"offset", metadata !906, i32 67109088, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 224]
!1337 = metadata !{i32 786689, metadata !1328, metadata !"kind", metadata !906, i32 83886304, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 224]
!1338 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemcpyToSymbolAsync", metadata !"cudaMemcpyToSymbolAsync", metadata !"", metadata !906, i32 229, metadata !1339, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i8*, i
!1339 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1340, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1340 = metadata !{metadata !909, metadata !856, metadata !320, metadata !922, metadata !922, metadata !902, metadata !1093}
!1341 = metadata !{metadata !1342}
!1342 = metadata !{metadata !1343, metadata !1344, metadata !1345, metadata !1346, metadata !1347, metadata !1348}
!1343 = metadata !{i32 786689, metadata !1338, metadata !"symbol", metadata !906, i32 16777445, metadata !856, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [symbol] [line 229]
!1344 = metadata !{i32 786689, metadata !1338, metadata !"src", metadata !906, i32 33554661, metadata !320, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [src] [line 229]
!1345 = metadata !{i32 786689, metadata !1338, metadata !"count", metadata !906, i32 50331877, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 229]
!1346 = metadata !{i32 786689, metadata !1338, metadata !"offset", metadata !906, i32 67109093, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [offset] [line 229]
!1347 = metadata !{i32 786689, metadata !1338, metadata !"kind", metadata !906, i32 83886310, metadata !902, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [kind] [line 230]
!1348 = metadata !{i32 786689, metadata !1338, metadata !"stream", metadata !906, i32 100663526, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 230]
!1349 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemGetInfo", metadata !"cudaMemGetInfo", metadata !"", metadata !906, i32 234, metadata !1350, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i64*)* @cudaMemGetInfo,
!1350 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1351, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1351 = metadata !{metadata !909, metadata !960, metadata !960}
!1352 = metadata !{metadata !1353}
!1353 = metadata !{metadata !1354, metadata !1355}
!1354 = metadata !{i32 786689, metadata !1349, metadata !"free", metadata !906, i32 16777450, metadata !960, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [free] [line 234]
!1355 = metadata !{i32 786689, metadata !1349, metadata !"total", metadata !906, i32 33554666, metadata !960, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [total] [line 234]
!1356 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemset", metadata !"cudaMemset", metadata !"", metadata !906, i32 238, metadata !1357, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64)* @cudaMemset, null, nu
!1357 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1358, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1358 = metadata !{metadata !909, metadata !342, metadata !153, metadata !922}
!1359 = metadata !{metadata !1360}
!1360 = metadata !{metadata !1361, metadata !1362, metadata !1363}
!1361 = metadata !{i32 786689, metadata !1356, metadata !"devPtr", metadata !906, i32 16777454, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 238]
!1362 = metadata !{i32 786689, metadata !1356, metadata !"value", metadata !906, i32 33554670, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 238]
!1363 = metadata !{i32 786689, metadata !1356, metadata !"count", metadata !906, i32 50331886, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 238]
!1364 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemset2D", metadata !"cudaMemset2D", metadata !"", metadata !906, i32 243, metadata !1365, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64)* @cudaMe
!1365 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1366, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1366 = metadata !{metadata !909, metadata !342, metadata !922, metadata !153, metadata !922, metadata !922}
!1367 = metadata !{metadata !1368}
!1368 = metadata !{metadata !1369, metadata !1370, metadata !1371, metadata !1372, metadata !1373}
!1369 = metadata !{i32 786689, metadata !1364, metadata !"devPtr", metadata !906, i32 16777459, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 243]
!1370 = metadata !{i32 786689, metadata !1364, metadata !"pitch", metadata !906, i32 33554675, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 243]
!1371 = metadata !{i32 786689, metadata !1364, metadata !"value", metadata !906, i32 50331891, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 243]
!1372 = metadata !{i32 786689, metadata !1364, metadata !"width", metadata !906, i32 67109108, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 244]
!1373 = metadata !{i32 786689, metadata !1364, metadata !"height", metadata !906, i32 83886324, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 244]
!1374 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemset2DAsync", metadata !"cudaMemset2DAsync", metadata !"", metadata !906, i32 248, metadata !1375, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i64, i32, i64, i64
!1375 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1376, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1376 = metadata !{metadata !909, metadata !342, metadata !922, metadata !153, metadata !922, metadata !922, metadata !1093}
!1377 = metadata !{metadata !1378}
!1378 = metadata !{metadata !1379, metadata !1380, metadata !1381, metadata !1382, metadata !1383, metadata !1384}
!1379 = metadata !{i32 786689, metadata !1374, metadata !"devPtr", metadata !906, i32 16777464, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 248]
!1380 = metadata !{i32 786689, metadata !1374, metadata !"pitch", metadata !906, i32 33554680, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitch] [line 248]
!1381 = metadata !{i32 786689, metadata !1374, metadata !"value", metadata !906, i32 50331896, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 248]
!1382 = metadata !{i32 786689, metadata !1374, metadata !"width", metadata !906, i32 67109113, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [width] [line 249]
!1383 = metadata !{i32 786689, metadata !1374, metadata !"height", metadata !906, i32 83886329, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [height] [line 249]
!1384 = metadata !{i32 786689, metadata !1374, metadata !"stream", metadata !906, i32 100663545, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 249]
!1385 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemset3D", metadata !"cudaMemset3D", metadata !"", metadata !906, i32 253, metadata !1386, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*, i32, %st
!1386 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1387, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1387 = metadata !{metadata !909, metadata !1011, metadata !153, metadata !919}
!1388 = metadata !{metadata !1389}
!1389 = metadata !{metadata !1390, metadata !1391, metadata !1392}
!1390 = metadata !{i32 786689, metadata !1385, metadata !"pitchedDevPtr", metadata !906, i32 16777469, metadata !1011, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 253]
!1391 = metadata !{i32 786689, metadata !1385, metadata !"value", metadata !906, i32 33554685, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 253]
!1392 = metadata !{i32 786689, metadata !1385, metadata !"extent", metadata !906, i32 50331902, metadata !919, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 254]
!1393 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemset3DAsync", metadata !"cudaMemset3DAsync", metadata !"", metadata !906, i32 258, metadata !1394, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaPitchedPtr*
!1394 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1395, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1395 = metadata !{metadata !909, metadata !1011, metadata !153, metadata !919, metadata !1093}
!1396 = metadata !{metadata !1397}
!1397 = metadata !{metadata !1398, metadata !1399, metadata !1400, metadata !1401}
!1398 = metadata !{i32 786689, metadata !1393, metadata !"pitchedDevPtr", metadata !906, i32 16777474, metadata !1011, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pitchedDevPtr] [line 258]
!1399 = metadata !{i32 786689, metadata !1393, metadata !"value", metadata !906, i32 33554690, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 258]
!1400 = metadata !{i32 786689, metadata !1393, metadata !"extent", metadata !906, i32 50331907, metadata !919, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [extent] [line 259]
!1401 = metadata !{i32 786689, metadata !1393, metadata !"stream", metadata !906, i32 67109123, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 259]
!1402 = metadata !{i32 786478, i32 0, metadata !906, metadata !"cudaMemsetAsync", metadata !"cudaMemsetAsync", metadata !"", metadata !906, i32 263, metadata !1403, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i64, %struct.CUst
!1403 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1404, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1404 = metadata !{metadata !909, metadata !342, metadata !153, metadata !922, metadata !1093}
!1405 = metadata !{metadata !1406}
!1406 = metadata !{metadata !1407, metadata !1408, metadata !1409, metadata !1410}
!1407 = metadata !{i32 786689, metadata !1402, metadata !"devPtr", metadata !906, i32 16777479, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 263]
!1408 = metadata !{i32 786689, metadata !1402, metadata !"value", metadata !906, i32 33554695, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 263]
!1409 = metadata !{i32 786689, metadata !1402, metadata !"count", metadata !906, i32 50331911, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 263]
!1410 = metadata !{i32 786689, metadata !1402, metadata !"stream", metadata !906, i32 67109127, metadata !1093, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [stream] [line 263]
!1411 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 t
!1412 = metadata !{metadata !1413}
!1413 = metadata !{metadata !894, metadata !1414, metadata !1420}
!1414 = metadata !{i32 786436, null, metadata !"cudaFuncCache", metadata !895, i32 1007, i64 32, i64 32, i32 0, i32 0, null, metadata !1415, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaFuncCache] [line 1007, size 32, align 32, offset 0] [from ]
!1415 = metadata !{metadata !1416, metadata !1417, metadata !1418, metadata !1419}
!1416 = metadata !{i32 786472, metadata !"cudaFuncCachePreferNone", i64 0} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferNone :: 0]
!1417 = metadata !{i32 786472, metadata !"cudaFuncCachePreferShared", i64 1} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferShared :: 1]
!1418 = metadata !{i32 786472, metadata !"cudaFuncCachePreferL1", i64 2} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferL1 :: 2]
!1419 = metadata !{i32 786472, metadata !"cudaFuncCachePreferEqual", i64 3} ; [ DW_TAG_enumerator ] [cudaFuncCachePreferEqual :: 3]
!1420 = metadata !{i32 786436, null, metadata !"cudaLimit", metadata !895, i32 1040, i64 32, i64 32, i32 0, i32 0, null, metadata !1421, i32 0, i32 0} ; [ DW_TAG_enumeration_type ] [cudaLimit] [line 1040, size 32, align 32, offset 0] [from ]
!1421 = metadata !{metadata !1422, metadata !1423, metadata !1424, metadata !1425, metadata !1426}
!1422 = metadata !{i32 786472, metadata !"cudaLimitStackSize", i64 0} ; [ DW_TAG_enumerator ] [cudaLimitStackSize :: 0]
!1423 = metadata !{i32 786472, metadata !"cudaLimitPrintfFifoSize", i64 1} ; [ DW_TAG_enumerator ] [cudaLimitPrintfFifoSize :: 1]
!1424 = metadata !{i32 786472, metadata !"cudaLimitMallocHeapSize", i64 2} ; [ DW_TAG_enumerator ] [cudaLimitMallocHeapSize :: 2]
!1425 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimeSyncDepth", i64 3} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimeSyncDepth :: 3]
!1426 = metadata !{i32 786472, metadata !"cudaLimitDevRuntimePendingLaunchCount", i64 4} ; [ DW_TAG_enumerator ] [cudaLimitDevRuntimePendingLaunchCount :: 4]
!1427 = metadata !{metadata !1428}
!1428 = metadata !{metadata !1429, metadata !1497, metadata !1504, metadata !1511, metadata !1518, metadata !1526, metadata !1529, metadata !1535, metadata !1542, metadata !1543, metadata !1549, metadata !1553, metadata !1561, metadata !1567, metadata !1
!1429 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaChooseDevice", metadata !"cudaChooseDevice", metadata !"", metadata !1430, i32 14, metadata !1431, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, %struct.cudaDevice
!1430 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!1431 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1432, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1432 = metadata !{metadata !1433, metadata !456, metadata !1434}
!1433 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !1430, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !894} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!1434 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1435} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from ]
!1435 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !1436} ; [ DW_TAG_const_type ] [line 0, size 0, align 0, offset 0] [from cudaDeviceProp]
!1436 = metadata !{i32 786451, null, metadata !"cudaDeviceProp", metadata !895, i32 1145, i64 4800, i64 64, i32 0, i32 0, null, metadata !1437, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaDeviceProp] [line 1145, size 4800, align 64, offset 0] [
!1437 = metadata !{metadata !1438, metadata !1439, metadata !1440, metadata !1441, metadata !1442, metadata !1443, metadata !1444, metadata !1445, metadata !1446, metadata !1447, metadata !1448, metadata !1449, metadata !1450, metadata !1451, metadata !1
!1438 = metadata !{i32 786445, metadata !1436, metadata !"name", metadata !895, i32 1147, i64 2048, i64 8, i64 0, i32 0, metadata !651} ; [ DW_TAG_member ] [name] [line 1147, size 2048, align 8, offset 0] [from ]
!1439 = metadata !{i32 786445, metadata !1436, metadata !"totalGlobalMem", metadata !895, i32 1148, i64 64, i64 64, i64 2048, i32 0, metadata !922} ; [ DW_TAG_member ] [totalGlobalMem] [line 1148, size 64, align 64, offset 2048] [from size_t]
!1440 = metadata !{i32 786445, metadata !1436, metadata !"sharedMemPerBlock", metadata !895, i32 1149, i64 64, i64 64, i64 2112, i32 0, metadata !922} ; [ DW_TAG_member ] [sharedMemPerBlock] [line 1149, size 64, align 64, offset 2112] [from size_t]
!1441 = metadata !{i32 786445, metadata !1436, metadata !"regsPerBlock", metadata !895, i32 1150, i64 32, i64 32, i64 2176, i32 0, metadata !153} ; [ DW_TAG_member ] [regsPerBlock] [line 1150, size 32, align 32, offset 2176] [from int]
!1442 = metadata !{i32 786445, metadata !1436, metadata !"warpSize", metadata !895, i32 1151, i64 32, i64 32, i64 2208, i32 0, metadata !153} ; [ DW_TAG_member ] [warpSize] [line 1151, size 32, align 32, offset 2208] [from int]
!1443 = metadata !{i32 786445, metadata !1436, metadata !"memPitch", metadata !895, i32 1152, i64 64, i64 64, i64 2240, i32 0, metadata !922} ; [ DW_TAG_member ] [memPitch] [line 1152, size 64, align 64, offset 2240] [from size_t]
!1444 = metadata !{i32 786445, metadata !1436, metadata !"maxThreadsPerBlock", metadata !895, i32 1153, i64 32, i64 32, i64 2304, i32 0, metadata !153} ; [ DW_TAG_member ] [maxThreadsPerBlock] [line 1153, size 32, align 32, offset 2304] [from int]
!1445 = metadata !{i32 786445, metadata !1436, metadata !"maxThreadsDim", metadata !895, i32 1154, i64 96, i64 32, i64 2336, i32 0, metadata !375} ; [ DW_TAG_member ] [maxThreadsDim] [line 1154, size 96, align 32, offset 2336] [from ]
!1446 = metadata !{i32 786445, metadata !1436, metadata !"maxGridSize", metadata !895, i32 1155, i64 96, i64 32, i64 2432, i32 0, metadata !375} ; [ DW_TAG_member ] [maxGridSize] [line 1155, size 96, align 32, offset 2432] [from ]
!1447 = metadata !{i32 786445, metadata !1436, metadata !"clockRate", metadata !895, i32 1156, i64 32, i64 32, i64 2528, i32 0, metadata !153} ; [ DW_TAG_member ] [clockRate] [line 1156, size 32, align 32, offset 2528] [from int]
!1448 = metadata !{i32 786445, metadata !1436, metadata !"totalConstMem", metadata !895, i32 1157, i64 64, i64 64, i64 2560, i32 0, metadata !922} ; [ DW_TAG_member ] [totalConstMem] [line 1157, size 64, align 64, offset 2560] [from size_t]
!1449 = metadata !{i32 786445, metadata !1436, metadata !"major", metadata !895, i32 1158, i64 32, i64 32, i64 2624, i32 0, metadata !153} ; [ DW_TAG_member ] [major] [line 1158, size 32, align 32, offset 2624] [from int]
!1450 = metadata !{i32 786445, metadata !1436, metadata !"minor", metadata !895, i32 1159, i64 32, i64 32, i64 2656, i32 0, metadata !153} ; [ DW_TAG_member ] [minor] [line 1159, size 32, align 32, offset 2656] [from int]
!1451 = metadata !{i32 786445, metadata !1436, metadata !"textureAlignment", metadata !895, i32 1160, i64 64, i64 64, i64 2688, i32 0, metadata !922} ; [ DW_TAG_member ] [textureAlignment] [line 1160, size 64, align 64, offset 2688] [from size_t]
!1452 = metadata !{i32 786445, metadata !1436, metadata !"texturePitchAlignment", metadata !895, i32 1161, i64 64, i64 64, i64 2752, i32 0, metadata !922} ; [ DW_TAG_member ] [texturePitchAlignment] [line 1161, size 64, align 64, offset 2752] [from size_
!1453 = metadata !{i32 786445, metadata !1436, metadata !"deviceOverlap", metadata !895, i32 1162, i64 32, i64 32, i64 2816, i32 0, metadata !153} ; [ DW_TAG_member ] [deviceOverlap] [line 1162, size 32, align 32, offset 2816] [from int]
!1454 = metadata !{i32 786445, metadata !1436, metadata !"multiProcessorCount", metadata !895, i32 1163, i64 32, i64 32, i64 2848, i32 0, metadata !153} ; [ DW_TAG_member ] [multiProcessorCount] [line 1163, size 32, align 32, offset 2848] [from int]
!1455 = metadata !{i32 786445, metadata !1436, metadata !"kernelExecTimeoutEnabled", metadata !895, i32 1164, i64 32, i64 32, i64 2880, i32 0, metadata !153} ; [ DW_TAG_member ] [kernelExecTimeoutEnabled] [line 1164, size 32, align 32, offset 2880] [from
!1456 = metadata !{i32 786445, metadata !1436, metadata !"integrated", metadata !895, i32 1165, i64 32, i64 32, i64 2912, i32 0, metadata !153} ; [ DW_TAG_member ] [integrated] [line 1165, size 32, align 32, offset 2912] [from int]
!1457 = metadata !{i32 786445, metadata !1436, metadata !"canMapHostMemory", metadata !895, i32 1166, i64 32, i64 32, i64 2944, i32 0, metadata !153} ; [ DW_TAG_member ] [canMapHostMemory] [line 1166, size 32, align 32, offset 2944] [from int]
!1458 = metadata !{i32 786445, metadata !1436, metadata !"computeMode", metadata !895, i32 1167, i64 32, i64 32, i64 2976, i32 0, metadata !153} ; [ DW_TAG_member ] [computeMode] [line 1167, size 32, align 32, offset 2976] [from int]
!1459 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture1D", metadata !895, i32 1168, i64 32, i64 32, i64 3008, i32 0, metadata !153} ; [ DW_TAG_member ] [maxTexture1D] [line 1168, size 32, align 32, offset 3008] [from int]
!1460 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture1DMipmap", metadata !895, i32 1169, i64 32, i64 32, i64 3040, i32 0, metadata !153} ; [ DW_TAG_member ] [maxTexture1DMipmap] [line 1169, size 32, align 32, offset 3040] [from int]
!1461 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture1DLinear", metadata !895, i32 1170, i64 32, i64 32, i64 3072, i32 0, metadata !153} ; [ DW_TAG_member ] [maxTexture1DLinear] [line 1170, size 32, align 32, offset 3072] [from int]
!1462 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture2D", metadata !895, i32 1171, i64 64, i64 32, i64 3104, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTexture2D] [line 1171, size 64, align 32, offset 3104] [from ]
!1463 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture2DMipmap", metadata !895, i32 1172, i64 64, i64 32, i64 3168, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTexture2DMipmap] [line 1172, size 64, align 32, offset 3168] [from ]
!1464 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture2DLinear", metadata !895, i32 1173, i64 96, i64 32, i64 3232, i32 0, metadata !375} ; [ DW_TAG_member ] [maxTexture2DLinear] [line 1173, size 96, align 32, offset 3232] [from ]
!1465 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture2DGather", metadata !895, i32 1174, i64 64, i64 32, i64 3328, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTexture2DGather] [line 1174, size 64, align 32, offset 3328] [from ]
!1466 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture3D", metadata !895, i32 1175, i64 96, i64 32, i64 3392, i32 0, metadata !375} ; [ DW_TAG_member ] [maxTexture3D] [line 1175, size 96, align 32, offset 3392] [from ]
!1467 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture3DAlt", metadata !895, i32 1176, i64 96, i64 32, i64 3488, i32 0, metadata !375} ; [ DW_TAG_member ] [maxTexture3DAlt] [line 1176, size 96, align 32, offset 3488] [from ]
!1468 = metadata !{i32 786445, metadata !1436, metadata !"maxTextureCubemap", metadata !895, i32 1177, i64 32, i64 32, i64 3584, i32 0, metadata !153} ; [ DW_TAG_member ] [maxTextureCubemap] [line 1177, size 32, align 32, offset 3584] [from int]
!1469 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture1DLayered", metadata !895, i32 1178, i64 64, i64 32, i64 3616, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTexture1DLayered] [line 1178, size 64, align 32, offset 3616] [from ]
!1470 = metadata !{i32 786445, metadata !1436, metadata !"maxTexture2DLayered", metadata !895, i32 1179, i64 96, i64 32, i64 3680, i32 0, metadata !375} ; [ DW_TAG_member ] [maxTexture2DLayered] [line 1179, size 96, align 32, offset 3680] [from ]
!1471 = metadata !{i32 786445, metadata !1436, metadata !"maxTextureCubemapLayered", metadata !895, i32 1180, i64 64, i64 32, i64 3776, i32 0, metadata !678} ; [ DW_TAG_member ] [maxTextureCubemapLayered] [line 1180, size 64, align 32, offset 3776] [from
!1472 = metadata !{i32 786445, metadata !1436, metadata !"maxSurface1D", metadata !895, i32 1181, i64 32, i64 32, i64 3840, i32 0, metadata !153} ; [ DW_TAG_member ] [maxSurface1D] [line 1181, size 32, align 32, offset 3840] [from int]
!1473 = metadata !{i32 786445, metadata !1436, metadata !"maxSurface2D", metadata !895, i32 1182, i64 64, i64 32, i64 3872, i32 0, metadata !678} ; [ DW_TAG_member ] [maxSurface2D] [line 1182, size 64, align 32, offset 3872] [from ]
!1474 = metadata !{i32 786445, metadata !1436, metadata !"maxSurface3D", metadata !895, i32 1183, i64 96, i64 32, i64 3936, i32 0, metadata !375} ; [ DW_TAG_member ] [maxSurface3D] [line 1183, size 96, align 32, offset 3936] [from ]
!1475 = metadata !{i32 786445, metadata !1436, metadata !"maxSurface1DLayered", metadata !895, i32 1184, i64 64, i64 32, i64 4032, i32 0, metadata !678} ; [ DW_TAG_member ] [maxSurface1DLayered] [line 1184, size 64, align 32, offset 4032] [from ]
!1476 = metadata !{i32 786445, metadata !1436, metadata !"maxSurface2DLayered", metadata !895, i32 1185, i64 96, i64 32, i64 4096, i32 0, metadata !375} ; [ DW_TAG_member ] [maxSurface2DLayered] [line 1185, size 96, align 32, offset 4096] [from ]
!1477 = metadata !{i32 786445, metadata !1436, metadata !"maxSurfaceCubemap", metadata !895, i32 1186, i64 32, i64 32, i64 4192, i32 0, metadata !153} ; [ DW_TAG_member ] [maxSurfaceCubemap] [line 1186, size 32, align 32, offset 4192] [from int]
!1478 = metadata !{i32 786445, metadata !1436, metadata !"maxSurfaceCubemapLayered", metadata !895, i32 1187, i64 64, i64 32, i64 4224, i32 0, metadata !678} ; [ DW_TAG_member ] [maxSurfaceCubemapLayered] [line 1187, size 64, align 32, offset 4224] [from
!1479 = metadata !{i32 786445, metadata !1436, metadata !"surfaceAlignment", metadata !895, i32 1188, i64 64, i64 64, i64 4288, i32 0, metadata !922} ; [ DW_TAG_member ] [surfaceAlignment] [line 1188, size 64, align 64, offset 4288] [from size_t]
!1480 = metadata !{i32 786445, metadata !1436, metadata !"concurrentKernels", metadata !895, i32 1189, i64 32, i64 32, i64 4352, i32 0, metadata !153} ; [ DW_TAG_member ] [concurrentKernels] [line 1189, size 32, align 32, offset 4352] [from int]
!1481 = metadata !{i32 786445, metadata !1436, metadata !"ECCEnabled", metadata !895, i32 1190, i64 32, i64 32, i64 4384, i32 0, metadata !153} ; [ DW_TAG_member ] [ECCEnabled] [line 1190, size 32, align 32, offset 4384] [from int]
!1482 = metadata !{i32 786445, metadata !1436, metadata !"pciBusID", metadata !895, i32 1191, i64 32, i64 32, i64 4416, i32 0, metadata !153} ; [ DW_TAG_member ] [pciBusID] [line 1191, size 32, align 32, offset 4416] [from int]
!1483 = metadata !{i32 786445, metadata !1436, metadata !"pciDeviceID", metadata !895, i32 1192, i64 32, i64 32, i64 4448, i32 0, metadata !153} ; [ DW_TAG_member ] [pciDeviceID] [line 1192, size 32, align 32, offset 4448] [from int]
!1484 = metadata !{i32 786445, metadata !1436, metadata !"pciDomainID", metadata !895, i32 1193, i64 32, i64 32, i64 4480, i32 0, metadata !153} ; [ DW_TAG_member ] [pciDomainID] [line 1193, size 32, align 32, offset 4480] [from int]
!1485 = metadata !{i32 786445, metadata !1436, metadata !"tccDriver", metadata !895, i32 1194, i64 32, i64 32, i64 4512, i32 0, metadata !153} ; [ DW_TAG_member ] [tccDriver] [line 1194, size 32, align 32, offset 4512] [from int]
!1486 = metadata !{i32 786445, metadata !1436, metadata !"asyncEngineCount", metadata !895, i32 1195, i64 32, i64 32, i64 4544, i32 0, metadata !153} ; [ DW_TAG_member ] [asyncEngineCount] [line 1195, size 32, align 32, offset 4544] [from int]
!1487 = metadata !{i32 786445, metadata !1436, metadata !"unifiedAddressing", metadata !895, i32 1196, i64 32, i64 32, i64 4576, i32 0, metadata !153} ; [ DW_TAG_member ] [unifiedAddressing] [line 1196, size 32, align 32, offset 4576] [from int]
!1488 = metadata !{i32 786445, metadata !1436, metadata !"memoryClockRate", metadata !895, i32 1197, i64 32, i64 32, i64 4608, i32 0, metadata !153} ; [ DW_TAG_member ] [memoryClockRate] [line 1197, size 32, align 32, offset 4608] [from int]
!1489 = metadata !{i32 786445, metadata !1436, metadata !"memoryBusWidth", metadata !895, i32 1198, i64 32, i64 32, i64 4640, i32 0, metadata !153} ; [ DW_TAG_member ] [memoryBusWidth] [line 1198, size 32, align 32, offset 4640] [from int]
!1490 = metadata !{i32 786445, metadata !1436, metadata !"l2CacheSize", metadata !895, i32 1199, i64 32, i64 32, i64 4672, i32 0, metadata !153} ; [ DW_TAG_member ] [l2CacheSize] [line 1199, size 32, align 32, offset 4672] [from int]
!1491 = metadata !{i32 786445, metadata !1436, metadata !"maxThreadsPerMultiProcessor", metadata !895, i32 1200, i64 32, i64 32, i64 4704, i32 0, metadata !153} ; [ DW_TAG_member ] [maxThreadsPerMultiProcessor] [line 1200, size 32, align 32, offset 4704]
!1492 = metadata !{i32 786445, metadata !1436, metadata !"streamPrioritiesSupported", metadata !895, i32 1201, i64 32, i64 32, i64 4736, i32 0, metadata !153} ; [ DW_TAG_member ] [streamPrioritiesSupported] [line 1201, size 32, align 32, offset 4736] [fr
!1493 = metadata !{metadata !1494}
!1494 = metadata !{metadata !1495, metadata !1496}
!1495 = metadata !{i32 786689, metadata !1429, metadata !"device", metadata !1430, i32 16777230, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 14]
!1496 = metadata !{i32 786689, metadata !1429, metadata !"prop", metadata !1430, i32 33554446, metadata !1434, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 14]
!1497 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaDeviceGetByPCIBusId", metadata !"cudaDeviceGetByPCIBusId", metadata !"", metadata !1430, i32 19, metadata !1498, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i8*)
!1498 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1499, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1499 = metadata !{metadata !1433, metadata !456, metadata !338}
!1500 = metadata !{metadata !1501}
!1501 = metadata !{metadata !1502, metadata !1503}
!1502 = metadata !{i32 786689, metadata !1497, metadata !"device", metadata !1430, i32 16777235, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 19]
!1503 = metadata !{i32 786689, metadata !1497, metadata !"pciBusId", metadata !1430, i32 33554451, metadata !338, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 19]
!1504 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaDeviceGetCacheConfig", metadata !"cudaDeviceGetCacheConfig", metadata !"", metadata !1430, i32 24, metadata !1505, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @
!1505 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1506, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1506 = metadata !{metadata !1433, metadata !1507}
!1507 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1414} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaFuncCache]
!1508 = metadata !{metadata !1509}
!1509 = metadata !{metadata !1510}
!1510 = metadata !{i32 786689, metadata !1504, metadata !"pCacheConfig", metadata !1430, i32 16777240, metadata !1507, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pCacheConfig] [line 24]
!1511 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaDeviceGetLimit", metadata !"cudaDeviceGetLimit", metadata !"", metadata !1430, i32 28, metadata !1512, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i64*, i32)* @cudaDev
!1512 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1513, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1513 = metadata !{metadata !1433, metadata !960, metadata !1420}
!1514 = metadata !{metadata !1515}
!1515 = metadata !{metadata !1516, metadata !1517}
!1516 = metadata !{i32 786689, metadata !1511, metadata !"pValue", metadata !1430, i32 16777244, metadata !960, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pValue] [line 28]
!1517 = metadata !{i32 786689, metadata !1511, metadata !"limit", metadata !1430, i32 33554460, metadata !1420, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 28]
!1518 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaDeviceGetPCIBusId", metadata !"cudaDeviceGetPCIBusId", metadata !"", metadata !1430, i32 32, metadata !1519, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*, i32, i32)
!1519 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1520, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1520 = metadata !{metadata !1433, metadata !338, metadata !153, metadata !153}
!1521 = metadata !{metadata !1522}
!1522 = metadata !{metadata !1523, metadata !1524, metadata !1525}
!1523 = metadata !{i32 786689, metadata !1518, metadata !"pciBusId", metadata !1430, i32 16777248, metadata !338, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [pciBusId] [line 32]
!1524 = metadata !{i32 786689, metadata !1518, metadata !"len", metadata !1430, i32 33554464, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 32]
!1525 = metadata !{i32 786689, metadata !1518, metadata !"device", metadata !1430, i32 50331680, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 32]
!1526 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaDeviceReset", metadata !"cudaDeviceReset", metadata !"", metadata !1430, i32 37, metadata !1527, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDeviceReset, null,
!1527 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1528, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1528 = metadata !{metadata !1433}
!1529 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaDeviceSetCacheConfig", metadata !"cudaDeviceSetCacheConfig", metadata !"", metadata !1430, i32 41, metadata !1530, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @c
!1530 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1531, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1531 = metadata !{metadata !1433, metadata !1414}
!1532 = metadata !{metadata !1533}
!1533 = metadata !{metadata !1534}
!1534 = metadata !{i32 786689, metadata !1529, metadata !"cacheConfig", metadata !1430, i32 16777257, metadata !1414, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [cacheConfig] [line 41]
!1535 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaDeviceSetLimit", metadata !"cudaDeviceSetLimit", metadata !"", metadata !1430, i32 45, metadata !1536, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32, i64)* @cudaDevi
!1536 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1537, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1537 = metadata !{metadata !1433, metadata !1420, metadata !922}
!1538 = metadata !{metadata !1539}
!1539 = metadata !{metadata !1540, metadata !1541}
!1540 = metadata !{i32 786689, metadata !1535, metadata !"limit", metadata !1430, i32 16777261, metadata !1420, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [limit] [line 45]
!1541 = metadata !{i32 786689, metadata !1535, metadata !"value", metadata !1430, i32 33554477, metadata !922, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [value] [line 45]
!1542 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaDeviceSynchronize", metadata !"cudaDeviceSynchronize", metadata !"", metadata !1430, i32 49, metadata !1527, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaDevice
!1543 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaGetDevice", metadata !"cudaGetDevice", metadata !"", metadata !1430, i32 53, metadata !1544, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDevice, null, n
!1544 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1545, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1545 = metadata !{metadata !1433, metadata !456}
!1546 = metadata !{metadata !1547}
!1547 = metadata !{metadata !1548}
!1548 = metadata !{i32 786689, metadata !1543, metadata !"device", metadata !1430, i32 16777269, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 53]
!1549 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaGetDeviceCount", metadata !"cudaGetDeviceCount", metadata !"", metadata !1430, i32 58, metadata !1544, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*)* @cudaGetDevic
!1550 = metadata !{metadata !1551}
!1551 = metadata !{metadata !1552}
!1552 = metadata !{i32 786689, metadata !1549, metadata !"count", metadata !1430, i32 16777274, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [count] [line 58]
!1553 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaGetDeviceProperties", metadata !"cudaGetDeviceProperties", metadata !"", metadata !1430, i32 63, metadata !1554, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cu
!1554 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1555, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1555 = metadata !{metadata !1433, metadata !1556, metadata !153}
!1556 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1436} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaDeviceProp]
!1557 = metadata !{metadata !1558}
!1558 = metadata !{metadata !1559, metadata !1560}
!1559 = metadata !{i32 786689, metadata !1553, metadata !"prop", metadata !1430, i32 16777279, metadata !1556, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [prop] [line 63]
!1560 = metadata !{i32 786689, metadata !1553, metadata !"device", metadata !1430, i32 33554495, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 63]
!1561 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaIpcCloseMemHandle", metadata !"cudaIpcCloseMemHandle", metadata !"", metadata !1430, i32 68, metadata !1562, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8*)* @cudaIpc
!1562 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1563, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1563 = metadata !{metadata !1433, metadata !342}
!1564 = metadata !{metadata !1565}
!1565 = metadata !{metadata !1566}
!1566 = metadata !{i32 786689, metadata !1561, metadata !"devPtr", metadata !1430, i32 16777284, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 68]
!1567 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaIpcGetEventHandle", metadata !"cudaIpcGetEventHandle", metadata !"", metadata !1430, i32 72, metadata !1568, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIp
!1568 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1569, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1569 = metadata !{metadata !1433, metadata !1570, metadata !1576}
!1570 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1571} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcEventHandle_t]
!1571 = metadata !{i32 786454, null, metadata !"cudaIpcEventHandle_t", metadata !1430, i32 1274, i64 0, i64 0, i64 0, i32 0, metadata !1572} ; [ DW_TAG_typedef ] [cudaIpcEventHandle_t] [line 1274, size 0, align 0, offset 0] [from cudaIpcEventHandle_st]
!1572 = metadata !{i32 786451, null, metadata !"cudaIpcEventHandle_st", metadata !895, i32 1271, i64 512, i64 8, i32 0, i32 0, null, metadata !1573, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcEventHandle_st] [line 1271, size 512, align 8, o
!1573 = metadata !{metadata !1574}
!1574 = metadata !{i32 786445, metadata !1572, metadata !"reserved", metadata !895, i32 1273, i64 512, i64 8, i64 0, i32 0, metadata !1575} ; [ DW_TAG_member ] [reserved] [line 1273, size 512, align 8, offset 0] [from ]
!1575 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 8, i32 0, i32 0, metadata !339, metadata !555, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 512, align 8, offset 0] [from char]
!1576 = metadata !{i32 786454, null, metadata !"cudaEvent_t", metadata !1430, i32 1303, i64 0, i64 0, i64 0, i32 0, metadata !1577} ; [ DW_TAG_typedef ] [cudaEvent_t] [line 1303, size 0, align 0, offset 0] [from ]
!1577 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1578} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from CUevent_st]
!1578 = metadata !{i32 786451, null, metadata !"CUevent_st", metadata !895, i32 1303, i64 0, i64 0, i32 0, i32 4, null, null, i32 0} ; [ DW_TAG_structure_type ] [CUevent_st] [line 1303, size 0, align 0, offset 0] [fwd] [from ]
!1579 = metadata !{metadata !1580}
!1580 = metadata !{metadata !1581, metadata !1582}
!1581 = metadata !{i32 786689, metadata !1567, metadata !"handle", metadata !1430, i32 16777288, metadata !1570, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 72]
!1582 = metadata !{i32 786689, metadata !1567, metadata !"event", metadata !1430, i32 33554504, metadata !1576, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 72]
!1583 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaIpcGetMemHandle", metadata !"cudaIpcGetMemHandle", metadata !"", metadata !1430, i32 76, metadata !1584, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.cudaIpcMem
!1584 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1585, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1585 = metadata !{metadata !1433, metadata !1586, metadata !342}
!1586 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1587} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaIpcMemHandle_t]
!1587 = metadata !{i32 786454, null, metadata !"cudaIpcMemHandle_t", metadata !1430, i32 1282, i64 0, i64 0, i64 0, i32 0, metadata !1588} ; [ DW_TAG_typedef ] [cudaIpcMemHandle_t] [line 1282, size 0, align 0, offset 0] [from cudaIpcMemHandle_st]
!1588 = metadata !{i32 786451, null, metadata !"cudaIpcMemHandle_st", metadata !895, i32 1279, i64 512, i64 8, i32 0, i32 0, null, metadata !1589, i32 0, i32 0, i32 0} ; [ DW_TAG_structure_type ] [cudaIpcMemHandle_st] [line 1279, size 512, align 8, offse
!1589 = metadata !{metadata !1590}
!1590 = metadata !{i32 786445, metadata !1588, metadata !"reserved", metadata !895, i32 1281, i64 512, i64 8, i64 0, i32 0, metadata !1575} ; [ DW_TAG_member ] [reserved] [line 1281, size 512, align 8, offset 0] [from ]
!1591 = metadata !{metadata !1592}
!1592 = metadata !{metadata !1593, metadata !1594}
!1593 = metadata !{i32 786689, metadata !1583, metadata !"handle", metadata !1430, i32 16777292, metadata !1586, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 76]
!1594 = metadata !{i32 786689, metadata !1583, metadata !"devPtr", metadata !1430, i32 33554508, metadata !342, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 76]
!1595 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaIpcOpenEventHandle", metadata !"cudaIpcOpenEventHandle", metadata !"", metadata !1430, i32 80, metadata !1596, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (%struct.CUev
!1596 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1597, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1597 = metadata !{metadata !1433, metadata !1598, metadata !1571}
!1598 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !1576} ; [ DW_TAG_pointer_type ] [line 0, size 64, align 64, offset 0] [from cudaEvent_t]
!1599 = metadata !{metadata !1600}
!1600 = metadata !{metadata !1601, metadata !1602}
!1601 = metadata !{i32 786689, metadata !1595, metadata !"event", metadata !1430, i32 16777296, metadata !1598, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [event] [line 80]
!1602 = metadata !{i32 786689, metadata !1595, metadata !"handle", metadata !1430, i32 33554512, metadata !1571, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 80]
!1603 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaIpcOpenMemHandle", metadata !"cudaIpcOpenMemHandle", metadata !"", metadata !1430, i32 84, metadata !1604, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i8**, %struct.cu
!1604 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1605, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1605 = metadata !{metadata !1433, metadata !952, metadata !1587, metadata !109}
!1606 = metadata !{metadata !1607}
!1607 = metadata !{metadata !1608, metadata !1609, metadata !1610}
!1608 = metadata !{i32 786689, metadata !1603, metadata !"devPtr", metadata !1430, i32 16777300, metadata !952, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [devPtr] [line 84]
!1609 = metadata !{i32 786689, metadata !1603, metadata !"handle", metadata !1430, i32 33554516, metadata !1587, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [handle] [line 84]
!1610 = metadata !{i32 786689, metadata !1603, metadata !"flags", metadata !1430, i32 50331732, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 84]
!1611 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaSetDevice", metadata !"cudaSetDevice", metadata !"", metadata !1430, i32 88, metadata !1612, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDevice, null, nu
!1612 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1613, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1613 = metadata !{metadata !1433, metadata !153}
!1614 = metadata !{metadata !1615}
!1615 = metadata !{metadata !1616}
!1616 = metadata !{i32 786689, metadata !1611, metadata !"device", metadata !1430, i32 16777304, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device] [line 88]
!1617 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaSetDeviceFlags", metadata !"cudaSetDeviceFlags", metadata !"", metadata !1430, i32 92, metadata !1618, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32)* @cudaSetDevice
!1618 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1619, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1619 = metadata !{metadata !1433, metadata !109}
!1620 = metadata !{metadata !1621}
!1621 = metadata !{metadata !1622}
!1622 = metadata !{i32 786689, metadata !1617, metadata !"flags", metadata !1430, i32 16777308, metadata !109, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [flags] [line 92]
!1623 = metadata !{i32 786478, i32 0, metadata !1430, metadata !"cudaSetValidDevices", metadata !"cudaSetValidDevices", metadata !"", metadata !1430, i32 96, metadata !1624, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 (i32*, i32)* @cudaS
!1624 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1625, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1625 = metadata !{metadata !1433, metadata !456, metadata !153}
!1626 = metadata !{metadata !1627}
!1627 = metadata !{metadata !1628, metadata !1629}
!1628 = metadata !{i32 786689, metadata !1623, metadata !"device_arr", metadata !1430, i32 16777312, metadata !456, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [device_arr] [line 96]
!1629 = metadata !{i32 786689, metadata !1623, metadata !"len", metadata !1430, i32 33554528, metadata !153, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [len] [line 96]
!1630 = metadata !{i32 786449, i32 0, i32 1, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", metadata !"clang version 3.2 (tags/RELEASE_32/final)", i1 true, i1 
!1631 = metadata !{metadata !1632}
!1632 = metadata !{metadata !894}
!1633 = metadata !{metadata !1634}
!1634 = metadata !{metadata !1635, metadata !1645, metadata !1648}
!1635 = metadata !{i32 786478, i32 0, metadata !1636, metadata !"cudaGetErrorString", metadata !"cudaGetErrorString", metadata !"", metadata !1636, i32 16, metadata !1637, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i8* (i32)* @cudaGetErrorS
!1636 = metadata !{i32 786473, metadata !"/home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c", metadata !"/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime", null} ; [ DW_TAG_file_type ]
!1637 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1638, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1638 = metadata !{metadata !856, metadata !1639}
!1639 = metadata !{i32 786454, null, metadata !"cudaError_t", metadata !1636, i32 1293, i64 0, i64 0, i64 0, i32 0, metadata !894} ; [ DW_TAG_typedef ] [cudaError_t] [line 1293, size 0, align 0, offset 0] [from cudaError]
!1640 = metadata !{metadata !1641}
!1641 = metadata !{metadata !1642, metadata !1643}
!1642 = metadata !{i32 786689, metadata !1635, metadata !"error", metadata !1636, i32 16777232, metadata !1639, i32 0, i32 0} ; [ DW_TAG_arg_variable ] [error] [line 16]
!1643 = metadata !{i32 786688, metadata !1644, metadata !"tmp", metadata !1636, i32 17, metadata !626, i32 0, i32 0} ; [ DW_TAG_auto_variable ] [tmp] [line 17]
!1644 = metadata !{i32 786443, metadata !1635, i32 16, i32 0, metadata !1636, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c]
!1645 = metadata !{i32 786478, i32 0, metadata !1636, metadata !"cudaGetLastError", metadata !"cudaGetLastError", metadata !"", metadata !1636, i32 22, metadata !1646, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaGetLastError, nu
!1646 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !1647, i32 0, i32 0} ; [ DW_TAG_subroutine_type ] [line 0, size 0, align 0, offset 0] [from ]
!1647 = metadata !{metadata !1639}
!1648 = metadata !{i32 786478, i32 0, metadata !1636, metadata !"cudaPeekAtLastError", metadata !"cudaPeekAtLastError", metadata !"", metadata !1636, i32 26, metadata !1646, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 true, i32 ()* @cudaPeekAtLast
!1649 = metadata !{metadata !1650}
!1650 = metadata !{metadata !1651}
!1651 = metadata !{i32 786484, i32 0, null, metadata !"msg", metadata !"msg", metadata !"", metadata !1636, i32 14, metadata !1652, i32 1, i32 1, [25 x i8]* @msg} ; [ DW_TAG_variable ] [msg] [line 14] [local] [def]
!1652 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 200, i64 8, i32 0, i32 0, metadata !339, metadata !1653, i32 0, i32 0} ; [ DW_TAG_array_type ] [line 0, size 200, align 8, offset 0] [from char]
!1653 = metadata !{metadata !1654}
!1654 = metadata !{i32 786465, i64 0, i64 24}     ; [ DW_TAG_subrange_type ] [0, 24]
!1655 = metadata !{i32 35, i32 0, metadata !145, null}
!1656 = metadata !{metadata !"int", metadata !1657}
!1657 = metadata !{metadata !"omnipotent char", metadata !1658}
!1658 = metadata !{metadata !"Simple C/C++ TBAA"}
!1659 = metadata !{i32 40, i32 0, metadata !145, null}
!1660 = metadata !{i32 41, i32 0, metadata !1661, null}
!1661 = metadata !{i32 786443, metadata !145, i32 40, i32 0, metadata !106, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!1662 = metadata !{i32 43, i32 0, metadata !1661, null}
!1663 = metadata !{i32 44, i32 0, metadata !1661, null}
!1664 = metadata !{i32 103, i32 0, metadata !1665, metadata !1666}
!1665 = metadata !{i32 786443, metadata !546, i32 102, i32 0, metadata !539, i32 38} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding//home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_function
!1666 = metadata !{i32 45, i32 0, metadata !1667, null}
!1667 = metadata !{i32 786443, metadata !1661, i32 44, i32 0, metadata !106, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!1668 = metadata !{i32 46, i32 0, metadata !1667, null}
!1669 = metadata !{i32 113, i32 0, metadata !1670, metadata !1671}
!1670 = metadata !{i32 786443, metadata !538, i32 112, i32 0, metadata !539, i32 37} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding//home/sawaya/Gklee/Gklee/include/cuda/sm_11_atomic_function
!1671 = metadata !{i32 49, i32 0, metadata !1672, null}
!1672 = metadata !{i32 786443, metadata !1667, i32 48, i32 0, metadata !106, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/./GPU_kernels.cu]
!1673 = metadata !{i32 56, i32 0, metadata !1661, null}
!1674 = metadata !{i32 57, i32 0, metadata !1661, null}
!1675 = metadata !{i32 58, i32 0, metadata !1661, null}
!1676 = metadata !{i32 59, i32 0, metadata !145, null}
!1677 = metadata !{i32 62, i32 0, metadata !209, null}
!1678 = metadata !{i32 66, i32 0, metadata !209, null}
!1679 = metadata !{i32 67, i32 0, metadata !213, null}
!1680 = metadata !{i32 68, i32 0, metadata !213, null}
!1681 = metadata !{i32 80, i32 0, metadata !213, null}
!1682 = metadata !{i32 81, i32 0, metadata !213, null}
!1683 = metadata !{i32 82, i32 0, metadata !213, null}
!1684 = metadata !{i32 83, i32 0, metadata !209, null}
!1685 = metadata !{i32 89, i32 0, metadata !222, null}
!1686 = metadata !{i32 100, i32 0, metadata !222, null}
!1687 = metadata !{i32 102, i32 0, metadata !222, null}
!1688 = metadata !{i32 104, i32 0, metadata !222, null}
!1689 = metadata !{i32 106, i32 0, metadata !222, null}
!1690 = metadata !{i32 117, i32 0, metadata !238, null}
!1691 = metadata !{i32 120, i32 0, metadata !238, null}
!1692 = metadata !{i32 121, i32 0, metadata !238, null}
!1693 = metadata !{i32 122, i32 0, metadata !238, null}
!1694 = metadata !{i32 124, i32 0, metadata !238, null}
!1695 = metadata !{i32 125, i32 0, metadata !238, null}
!1696 = metadata !{i32 126, i32 0, metadata !238, null}
!1697 = metadata !{i32 127, i32 0, metadata !238, null}
!1698 = metadata !{i32 128, i32 0, metadata !238, null}
!1699 = metadata !{i32 131, i32 0, metadata !238, null}
!1700 = metadata !{metadata !"float", metadata !1657}
!1701 = metadata !{i32 184, i32 0, metadata !1702, metadata !1699}
!1702 = metadata !{i32 786443, metadata !532, i32 184, i32 0, metadata !534, i32 36} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding//usr/lib/gcc/x86_64-linux-gnu/4.9/../../../../include/c++/4
!1703 = metadata !{i32 133, i32 0, metadata !238, null}
!1704 = metadata !{i32 134, i32 0, metadata !238, null}
!1705 = metadata !{i32 136, i32 0, metadata !238, null}
!1706 = metadata !{i32 137, i32 0, metadata !238, null}
!1707 = metadata !{i32 138, i32 0, metadata !238, null}
!1708 = metadata !{i32 139, i32 0, metadata !238, null}
!1709 = metadata !{i32 141, i32 0, metadata !238, null}
!1710 = metadata !{i32 142, i32 0, metadata !238, null}
!1711 = metadata !{i32 143, i32 0, metadata !238, null}
!1712 = metadata !{i32 144, i32 0, metadata !238, null}
!1713 = metadata !{i32 146, i32 0, metadata !238, null}
!1714 = metadata !{i32 147, i32 0, metadata !238, null}
!1715 = metadata !{i32 148, i32 0, metadata !238, null}
!1716 = metadata !{i32 149, i32 0, metadata !238, null}
!1717 = metadata !{i32 171, i32 0, metadata !274, null}
!1718 = metadata !{i32 132, i32 0, metadata !238, null}
!1719 = metadata !{i32 129, i32 0, metadata !238, null}
!1720 = metadata !{i32 172, i32 0, metadata !276, null}
!1721 = metadata !{i32 174, i32 0, metadata !279, null}
!1722 = metadata !{i32 175, i32 0, metadata !279, null}
!1723 = metadata !{i32 185, i32 0, metadata !291, null}
!1724 = metadata !{i32 186, i32 0, metadata !291, null}
!1725 = metadata !{i32 187, i32 0, metadata !291, null}
!1726 = metadata !{i32 188, i32 0, metadata !291, null}
!1727 = metadata !{i32 189, i32 0, metadata !291, null}
!1728 = metadata !{i32 190, i32 0, metadata !291, null}
!1729 = metadata !{i32 200, i32 0, metadata !303, null}
!1730 = metadata !{i32 201, i32 0, metadata !303, null}
!1731 = metadata !{i32 203, i32 0, metadata !303, null}
!1732 = metadata !{i32 211, i32 0, metadata !303, null}
!1733 = metadata !{i32 219, i32 0, metadata !303, null}
!1734 = metadata !{i32 227, i32 0, metadata !303, null}
!1735 = metadata !{i32 173, i32 0, metadata !279, null}
!1736 = metadata !{i32 176, i32 0, metadata !279, null}
!1737 = metadata !{i32 177, i32 0, metadata !286, null}
!1738 = metadata !{i32 179, i32 0, metadata !288, null}
!1739 = metadata !{i32 194, i32 0, metadata !296, null}
!1740 = metadata !{i32 178, i32 0, metadata !288, null}
!1741 = metadata !{i32 180, i32 0, metadata !288, null}
!1742 = metadata !{i32 181, i32 0, metadata !288, null}
!1743 = metadata !{i32 182, i32 0, metadata !291, null}
!1744 = metadata !{i32 183, i32 0, metadata !291, null}
!1745 = metadata !{i32 191, i32 0, metadata !291, null}
!1746 = metadata !{i32 192, i32 0, metadata !288, null}
!1747 = metadata !{i32 195, i32 0, metadata !298, null}
!1748 = metadata !{i32 196, i32 0, metadata !298, null}
!1749 = metadata !{i32 197, i32 0, metadata !298, null}
!1750 = metadata !{i32 199, i32 0, metadata !298, null}
!1751 = metadata !{i32 204, i32 0, metadata !303, null}
!1752 = metadata !{i32 205, i32 0, metadata !306, null}
!1753 = metadata !{i32 89, i32 0, metadata !222, metadata !1752}
!1754 = metadata !{i32 100, i32 0, metadata !222, metadata !1752}
!1755 = metadata !{i32 102, i32 0, metadata !222, metadata !1752}
!1756 = metadata !{i32 104, i32 0, metadata !222, metadata !1752}
!1757 = metadata !{i32 206, i32 0, metadata !306, null}
!1758 = metadata !{i32 207, i32 0, metadata !306, null}
!1759 = metadata !{i32 208, i32 0, metadata !306, null}
!1760 = metadata !{i32 212, i32 0, metadata !303, null}
!1761 = metadata !{i32 209, i32 0, metadata !306, null}
!1762 = metadata !{i32 213, i32 0, metadata !309, null}
!1763 = metadata !{i32 89, i32 0, metadata !222, metadata !1762}
!1764 = metadata !{i32 100, i32 0, metadata !222, metadata !1762}
!1765 = metadata !{i32 102, i32 0, metadata !222, metadata !1762}
!1766 = metadata !{i32 104, i32 0, metadata !222, metadata !1762}
!1767 = metadata !{i32 214, i32 0, metadata !309, null}
!1768 = metadata !{i32 215, i32 0, metadata !309, null}
!1769 = metadata !{i32 216, i32 0, metadata !309, null}
!1770 = metadata !{i32 220, i32 0, metadata !303, null}
!1771 = metadata !{i32 217, i32 0, metadata !309, null}
!1772 = metadata !{i32 221, i32 0, metadata !312, null}
!1773 = metadata !{i32 89, i32 0, metadata !222, metadata !1772}
!1774 = metadata !{i32 100, i32 0, metadata !222, metadata !1772}
!1775 = metadata !{i32 102, i32 0, metadata !222, metadata !1772}
!1776 = metadata !{i32 104, i32 0, metadata !222, metadata !1772}
!1777 = metadata !{i32 222, i32 0, metadata !312, null}
!1778 = metadata !{i32 223, i32 0, metadata !312, null}
!1779 = metadata !{i32 224, i32 0, metadata !312, null}
!1780 = metadata !{i32 228, i32 0, metadata !303, null}
!1781 = metadata !{i32 225, i32 0, metadata !312, null}
!1782 = metadata !{i32 229, i32 0, metadata !315, null}
!1783 = metadata !{i32 89, i32 0, metadata !222, metadata !1782}
!1784 = metadata !{i32 100, i32 0, metadata !222, metadata !1782}
!1785 = metadata !{i32 102, i32 0, metadata !222, metadata !1782}
!1786 = metadata !{i32 104, i32 0, metadata !222, metadata !1782}
!1787 = metadata !{i32 230, i32 0, metadata !315, null}
!1788 = metadata !{i32 231, i32 0, metadata !315, null}
!1789 = metadata !{i32 232, i32 0, metadata !315, null}
!1790 = metadata !{i32 233, i32 0, metadata !315, null}
!1791 = metadata !{i32 240, i32 0, metadata !238, null}
!1792 = metadata !{i32 241, i32 0, metadata !238, null}
!1793 = metadata !{i32 243, i32 0, metadata !238, null}
!1794 = metadata !{i32 244, i32 0, metadata !238, null}
!1795 = metadata !{i32 246, i32 0, metadata !238, null}
!1796 = metadata !{i32 247, i32 0, metadata !238, null}
!1797 = metadata !{i32 249, i32 0, metadata !238, null}
!1798 = metadata !{i32 250, i32 0, metadata !238, null}
!1799 = metadata !{i32 251, i32 0, metadata !238, null}
!1800 = metadata !{i32 40, i32 0, metadata !1801, null}
!1801 = metadata !{i32 786443, metadata !316, i32 39, i32 0, metadata !317, i32 24} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/CUDA_interface.cpp]
!1802 = metadata !{i32 61, i32 0, metadata !403, null}
!1803 = metadata !{i32 63, i32 0, metadata !403, null}
!1804 = metadata !{i32 64, i32 0, metadata !403, null}
!1805 = metadata !{i32 66, i32 0, metadata !403, null}
!1806 = metadata !{i32 68, i32 0, metadata !403, null}
!1807 = metadata !{i32 70, i32 0, metadata !403, null}
!1808 = metadata !{i32 71, i32 0, metadata !403, null}
!1809 = metadata !{i32 72, i32 0, metadata !403, null}
!1810 = metadata !{i32 76, i32 0, metadata !403, null}
!1811 = metadata !{i32 77, i32 0, metadata !1812, null}
!1812 = metadata !{i32 786443, metadata !403, i32 76, i32 0, metadata !317, i32 26} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/CUDA_interface.cpp]
!1813 = metadata !{i32 86, i32 0, metadata !403, null}
!1814 = metadata !{metadata !"any pointer", metadata !1657}
!1815 = metadata !{i32 87, i32 0, metadata !403, null}
!1816 = metadata !{i32 90, i32 0, metadata !403, null}
!1817 = metadata !{i32 91, i32 0, metadata !403, null}
!1818 = metadata !{i32 92, i32 0, metadata !403, null}
!1819 = metadata !{i32 95, i32 0, metadata !403, null}
!1820 = metadata !{i32 106, i32 0, metadata !403, null}
!1821 = metadata !{i32 111, i32 0, metadata !403, null}
!1822 = metadata !{i32 112, i32 0, metadata !403, null}
!1823 = metadata !{i32 113, i32 0, metadata !403, null}
!1824 = metadata !{i32 114, i32 0, metadata !403, null}
!1825 = metadata !{i32 115, i32 0, metadata !403, null}
!1826 = metadata !{i32 121, i32 0, metadata !403, null}
!1827 = metadata !{i32 123, i32 0, metadata !467, null}
!1828 = metadata !{i32 123, i32 0, metadata !1829, null}
!1829 = metadata !{i32 786443, metadata !467, i32 123, i32 0, metadata !317, i32 28} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/CUDA_interface.cpp]
!1830 = metadata !{i32 126, i32 0, metadata !403, null}
!1831 = metadata !{i32 328, i32 0, metadata !1832, metadata !1830}
!1832 = metadata !{i32 786443, metadata !504, i32 327, i32 0, metadata !475, i32 34} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding//home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h]
!1833 = metadata !{i32 127, i32 0, metadata !403, null}
!1834 = metadata !{i32 328, i32 0, metadata !1832, metadata !1833}
!1835 = metadata !{i32 128, i32 0, metadata !403, null}
!1836 = metadata !{i32 328, i32 0, metadata !1837, metadata !1835}
!1837 = metadata !{i32 786443, metadata !490, i32 327, i32 0, metadata !475, i32 33} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding//home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h]
!1838 = metadata !{i32 129, i32 0, metadata !403, null}
!1839 = metadata !{i32 328, i32 0, metadata !1840, metadata !1838}
!1840 = metadata !{i32 786443, metadata !473, i32 327, i32 0, metadata !475, i32 32} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding//home/sawaya/Gklee/Gklee/include/cuda/cuda_runtime.h]
!1841 = metadata !{i32 130, i32 0, metadata !403, null}
!1842 = metadata !{i32 328, i32 0, metadata !1832, metadata !1841}
!1843 = metadata !{i32 131, i32 0, metadata !403, null}
!1844 = metadata !{i32 132, i32 0, metadata !403, null}
!1845 = metadata !{i32 136, i32 0, metadata !403, null}
!1846 = metadata !{i32 138, i32 0, metadata !403, null}
!1847 = metadata !{i32 186, i32 0, metadata !403, null}
!1848 = metadata !{i32 187, i32 0, metadata !403, null}
!1849 = metadata !{i32 211, i32 0, metadata !403, null}
!1850 = metadata !{i32 217, i32 0, metadata !403, null}
!1851 = metadata !{i32 218, i32 0, metadata !403, null}
!1852 = metadata !{i32 219, i32 0, metadata !403, null}
!1853 = metadata !{i32 220, i32 0, metadata !403, null}
!1854 = metadata !{i32 221, i32 0, metadata !403, null}
!1855 = metadata !{i32 222, i32 0, metadata !403, null}
!1856 = metadata !{i32 223, i32 0, metadata !403, null}
!1857 = metadata !{i32 224, i32 0, metadata !470, null}
!1858 = metadata !{i32 224, i32 0, metadata !1859, null}
!1859 = metadata !{i32 786443, metadata !470, i32 224, i32 0, metadata !317, i32 30} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/CUDA_interface.cpp]
!1860 = metadata !{i32 139, i32 0, metadata !403, null}
!1861 = metadata !{i32 226, i32 0, metadata !403, null}
!1862 = metadata !{i32 227, i32 0, metadata !403, null}
!1863 = metadata !{i32 232, i32 0, metadata !403, null}
!1864 = metadata !{i32 234, i32 0, metadata !403, null}
!1865 = metadata !{i32 419, i32 0, metadata !525, metadata !1866}
!1866 = metadata !{i32 419, i32 0, metadata !517, metadata !1864}
!1867 = metadata !{i32 235, i32 0, metadata !1868, null}
!1868 = metadata !{i32 786443, metadata !403, i32 235, i32 0, metadata !317, i32 31} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/CUDA_interface.cpp]
!1869 = metadata !{i32 237, i32 0, metadata !1868, null}
!1870 = metadata !{i32 271, i32 0, metadata !403, null}
!1871 = metadata !{i32 272, i32 0, metadata !403, null}
!1872 = metadata !{i32 273, i32 0, metadata !403, null}
!1873 = metadata !{i32 274, i32 0, metadata !403, null}
!1874 = metadata !{i32 278, i32 0, metadata !403, null}
!1875 = metadata !{i32 279, i32 0, metadata !403, null}
!1876 = metadata !{i32 26, i32 0, metadata !647, null}
!1877 = metadata !{i32 27, i32 0, metadata !647, null}
!1878 = metadata !{i32 28, i32 0, metadata !647, null}
!1879 = metadata !{i32 29, i32 0, metadata !647, null}
!1880 = metadata !{i32 30, i32 0, metadata !647, null}
!1881 = metadata !{i32 31, i32 0, metadata !647, null}
!1882 = metadata !{i32 32, i32 0, metadata !647, null}
!1883 = metadata !{i32 33, i32 0, metadata !647, null}
!1884 = metadata !{i32 36, i32 0, metadata !647, null}
!1885 = metadata !{i32 37, i32 0, metadata !647, null}
!1886 = metadata !{metadata !"long", metadata !1657}
!1887 = metadata !{i32 38, i32 0, metadata !647, null}
!1888 = metadata !{i32 39, i32 0, metadata !647, null}
!1889 = metadata !{i32 40, i32 0, metadata !1890, null}
!1890 = metadata !{i32 786443, metadata !647, i32 39, i32 0, metadata !573, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1891 = metadata !{i32 41, i32 0, metadata !1890, null}
!1892 = metadata !{i32 43, i32 0, metadata !647, null}
!1893 = metadata !{i32 44, i32 0, metadata !647, null}
!1894 = metadata !{i32 45, i32 0, metadata !647, null}
!1895 = metadata !{i32 46, i32 0, metadata !647, null}
!1896 = metadata !{i32 47, i32 0, metadata !647, null}
!1897 = metadata !{i32 48, i32 0, metadata !647, null}
!1898 = metadata !{i32 49, i32 0, metadata !647, null}
!1899 = metadata !{i32 50, i32 0, metadata !647, null}
!1900 = metadata !{i32 52, i32 0, metadata !647, null}
!1901 = metadata !{i32 58, i32 0, metadata !1902, null}
!1902 = metadata !{i32 786443, metadata !734, i32 58, i32 0, metadata !573, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1903 = metadata !{i32 59, i32 0, metadata !1904, null}
!1904 = metadata !{i32 786443, metadata !1902, i32 58, i32 0, metadata !573, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1905 = metadata !{i32 62, i32 0, metadata !1904, null}
!1906 = metadata !{i32 66, i32 0, metadata !734, null}
!1907 = metadata !{i32 67, i32 0, metadata !734, null}
!1908 = metadata !{i32 68, i32 0, metadata !734, null}
!1909 = metadata !{i32 70, i32 0, metadata !734, null}
!1910 = metadata !{i32 72, i32 0, metadata !734, null}
!1911 = metadata !{i32 74, i32 0, metadata !734, null}
!1912 = metadata !{i32 75, i32 0, metadata !734, null}
!1913 = metadata !{i32 77, i32 0, metadata !734, null}
!1914 = metadata !{i32 78, i32 0, metadata !734, null}
!1915 = metadata !{i32 80, i32 0, metadata !734, null}
!1916 = metadata !{i32 81, i32 0, metadata !734, null}
!1917 = metadata !{i32 83, i32 0, metadata !746, null}
!1918 = metadata !{i32 84, i32 0, metadata !1919, null}
!1919 = metadata !{i32 786443, metadata !746, i32 83, i32 0, metadata !573, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1920 = metadata !{i32 279, i32 0, metadata !1921, metadata !1918}
!1921 = metadata !{i32 786443, metadata !825, i32 279, i32 0, metadata !534, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding//usr/lib/gcc/x86_64-linux-gnu/4.9/../../../../include/c++/4
!1922 = metadata !{i32 85, i32 0, metadata !1919, null}
!1923 = metadata !{i32 279, i32 0, metadata !1921, metadata !1922}
!1924 = metadata !{i32 86, i32 0, metadata !1919, null}
!1925 = metadata !{i32 279, i32 0, metadata !1921, metadata !1924}
!1926 = metadata !{i32 89, i32 0, metadata !734, null}
!1927 = metadata !{i32 110, i32 0, metadata !756, null}
!1928 = metadata !{i32 111, i32 0, metadata !756, null}
!1929 = metadata !{i32 114, i32 0, metadata !756, null}
!1930 = metadata !{i32 115, i32 0, metadata !756, null}
!1931 = metadata !{i32 116, i32 0, metadata !1932, null}
!1932 = metadata !{i32 786443, metadata !756, i32 115, i32 0, metadata !573, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1933 = metadata !{i32 118, i32 0, metadata !1932, null}
!1934 = metadata !{i32 120, i32 0, metadata !756, null}
!1935 = metadata !{i32 125, i32 0, metadata !756, null}
!1936 = metadata !{i32 128, i32 0, metadata !756, null}
!1937 = metadata !{i32 142, i32 0, metadata !756, null}
!1938 = metadata !{i32 143, i32 0, metadata !819, null}
!1939 = metadata !{i32 143, i32 0, metadata !1940, null}
!1940 = metadata !{i32 786443, metadata !819, i32 143, i32 0, metadata !573, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1941 = metadata !{i32 144, i32 0, metadata !756, null}
!1942 = metadata !{i32 145, i32 0, metadata !1943, null}
!1943 = metadata !{i32 786443, metadata !756, i32 144, i32 0, metadata !573, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1944 = metadata !{i32 146, i32 0, metadata !1943, null}
!1945 = metadata !{i32 149, i32 0, metadata !756, null}
!1946 = metadata !{i32 151, i32 0, metadata !756, null}
!1947 = metadata !{i32 152, i32 0, metadata !1948, null}
!1948 = metadata !{i32 786443, metadata !756, i32 151, i32 0, metadata !573, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1949 = metadata !{i32 153, i32 0, metadata !1948, null}
!1950 = metadata !{i32 156, i32 0, metadata !756, null}
!1951 = metadata !{i32 158, i32 0, metadata !756, null}
!1952 = metadata !{i32 159, i32 0, metadata !756, null}
!1953 = metadata !{i32 161, i32 0, metadata !756, null}
!1954 = metadata !{i32 169, i32 0, metadata !756, null}
!1955 = metadata !{i32 170, i32 0, metadata !756, null}
!1956 = metadata !{i32 186, i32 0, metadata !756, null}
!1957 = metadata !{i32 187, i32 0, metadata !756, null}
!1958 = metadata !{i32 188, i32 0, metadata !824, null}
!1959 = metadata !{i32 188, i32 0, metadata !1960, null}
!1960 = metadata !{i32 786443, metadata !824, i32 188, i32 0, metadata !573, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1961 = metadata !{i32 189, i32 0, metadata !756, null}
!1962 = metadata !{i32 190, i32 0, metadata !1963, null}
!1963 = metadata !{i32 786443, metadata !756, i32 189, i32 0, metadata !573, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/GkleeTests/SESABench/Table-3-Parboil/mri-gridding/mri_gridding/main.cpp]
!1964 = metadata !{i32 191, i32 0, metadata !1963, null}
!1965 = metadata !{i32 194, i32 0, metadata !756, null}
!1966 = metadata !{i32 199, i32 0, metadata !756, null}
!1967 = metadata !{i32 230, i32 0, metadata !756, null}
!1968 = metadata !{i32 231, i32 0, metadata !756, null}
!1969 = metadata !{i32 232, i32 0, metadata !756, null}
!1970 = metadata !{i32 236, i32 0, metadata !756, null}
!1971 = metadata !{i32 240, i32 0, metadata !756, null}
!1972 = metadata !{i32 241, i32 0, metadata !756, null}
!1973 = metadata !{i32 13, i32 0, metadata !1974, null}
!1974 = metadata !{i32 786443, metadata !832, i32 12, i32 0, metadata !833, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/Intrinsic//home/sawaya/Gklee/Gklee/runtime/Intrinsic/klee_div_zero_check.c]
!1975 = metadata !{i32 14, i32 0, metadata !1974, null}
!1976 = metadata !{i32 15, i32 0, metadata !1974, null}
!1977 = metadata !{i32 16, i32 0, metadata !854, null}
!1978 = metadata !{i32 17, i32 0, metadata !854, null}
!1979 = metadata !{i32 18, i32 0, metadata !854, null}
!1980 = metadata !{i32 14, i32 0, metadata !888, null}
!1981 = metadata !{i32 15, i32 0, metadata !888, null}
!1982 = metadata !{i32 16, i32 0, metadata !888, null}
!1983 = metadata !{i32 26, i32 0, metadata !1984, null}
!1984 = metadata !{i32 786443, metadata !905, i32 25, i32 0, metadata !906, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1985 = metadata !{i32 30, i32 0, metadata !1986, null}
!1986 = metadata !{i32 786443, metadata !933, i32 29, i32 0, metadata !906, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1987 = metadata !{i32 31, i32 0, metadata !1986, null}
!1988 = metadata !{i32 35, i32 0, metadata !1989, null}
!1989 = metadata !{i32 786443, metadata !939, i32 34, i32 0, metadata !906, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1990 = metadata !{i32 36, i32 0, metadata !1989, null}
!1991 = metadata !{i32 40, i32 0, metadata !1992, null}
!1992 = metadata !{i32 786443, metadata !945, i32 39, i32 0, metadata !906, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1993 = metadata !{i32 41, i32 0, metadata !1992, null}
!1994 = metadata !{i32 45, i32 0, metadata !1995, null}
!1995 = metadata !{i32 786443, metadata !949, i32 44, i32 0, metadata !906, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1996 = metadata !{i32 49, i32 0, metadata !1997, null}
!1997 = metadata !{i32 786443, metadata !957, i32 48, i32 0, metadata !906, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!1998 = metadata !{i32 53, i32 0, metadata !1999, null}
!1999 = metadata !{i32 786443, metadata !965, i32 52, i32 0, metadata !906, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2000 = metadata !{i32 57, i32 0, metadata !2001, null}
!2001 = metadata !{i32 786443, metadata !973, i32 56, i32 0, metadata !906, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2002 = metadata !{i32 61, i32 0, metadata !2003, null}
!2003 = metadata !{i32 786443, metadata !981, i32 60, i32 0, metadata !906, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2004 = metadata !{i32 65, i32 0, metadata !2005, null}
!2005 = metadata !{i32 786443, metadata !988, i32 64, i32 0, metadata !906, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2006 = metadata !{i32 69, i32 0, metadata !2007, null}
!2007 = metadata !{i32 786443, metadata !996, i32 68, i32 0, metadata !906, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2008 = metadata !{i32 73, i32 0, metadata !2009, null}
!2009 = metadata !{i32 786443, metadata !1000, i32 72, i32 0, metadata !906, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2010 = metadata !{i32 74, i32 0, metadata !2009, null}
!2011 = metadata !{i32 75, i32 0, metadata !2009, null}
!2012 = metadata !{i32 77, i32 0, metadata !2009, null}
!2013 = metadata !{i32 81, i32 0, metadata !2014, null}
!2014 = metadata !{i32 786443, metadata !1007, i32 80, i32 0, metadata !906, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2015 = metadata !{i32 86, i32 0, metadata !2016, null}
!2016 = metadata !{i32 786443, metadata !1021, i32 85, i32 0, metadata !906, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2017 = metadata !{i32 91, i32 0, metadata !2018, null}
!2018 = metadata !{i32 786443, metadata !1031, i32 90, i32 0, metadata !906, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2019 = metadata !{i32 95, i32 0, metadata !2020, null}
!2020 = metadata !{i32 786443, metadata !1041, i32 94, i32 0, metadata !906, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2021 = metadata !{i32 96, i32 0, metadata !2020, null}
!2022 = metadata !{i32 97, i32 0, metadata !2020, null}
!2023 = metadata !{i32 99, i32 0, metadata !2020, null}
!2024 = metadata !{i32 103, i32 0, metadata !2025, null}
!2025 = metadata !{i32 786443, metadata !1046, i32 102, i32 0, metadata !906, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2026 = metadata !{i32 108, i32 0, metadata !2027, null}
!2027 = metadata !{i32 786443, metadata !1055, i32 106, i32 0, metadata !906, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2028 = metadata !{i32 113, i32 0, metadata !2029, null}
!2029 = metadata !{i32 786443, metadata !1064, i32 112, i32 0, metadata !906, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2030 = metadata !{i32 119, i32 0, metadata !2031, null}
!2031 = metadata !{i32 786443, metadata !1076, i32 118, i32 0, metadata !906, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2032 = metadata !{i32 125, i32 0, metadata !2033, null}
!2033 = metadata !{i32 786443, metadata !1090, i32 124, i32 0, metadata !906, i32 20} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2034 = metadata !{i32 131, i32 0, metadata !2035, null}
!2035 = metadata !{i32 786443, metadata !1106, i32 130, i32 0, metadata !906, i32 21} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2036 = metadata !{i32 137, i32 0, metadata !2037, null}
!2037 = metadata !{i32 786443, metadata !1119, i32 136, i32 0, metadata !906, i32 22} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2038 = metadata !{i32 143, i32 0, metadata !2039, null}
!2039 = metadata !{i32 786443, metadata !1133, i32 142, i32 0, metadata !906, i32 23} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2040 = metadata !{i32 149, i32 0, metadata !2041, null}
!2041 = metadata !{i32 786443, metadata !1146, i32 148, i32 0, metadata !906, i32 24} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2042 = metadata !{i32 153, i32 0, metadata !2043, null}
!2043 = metadata !{i32 786443, metadata !1160, i32 152, i32 0, metadata !906, i32 25} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2044 = metadata !{i32 157, i32 0, metadata !2045, null}
!2045 = metadata !{i32 786443, metadata !1184, i32 156, i32 0, metadata !906, i32 26} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2046 = metadata !{i32 161, i32 0, metadata !2047, null}
!2047 = metadata !{i32 786443, metadata !1191, i32 160, i32 0, metadata !906, i32 27} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2048 = metadata !{i32 165, i32 0, metadata !2049, null}
!2049 = metadata !{i32 786443, metadata !1210, i32 164, i32 0, metadata !906, i32 28} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2050 = metadata !{i32 171, i32 0, metadata !2051, null}
!2051 = metadata !{i32 786443, metadata !1217, i32 170, i32 0, metadata !906, i32 29} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2052 = metadata !{i32 176, i32 0, metadata !2053, null}
!2053 = metadata !{i32 786443, metadata !1230, i32 175, i32 0, metadata !906, i32 30} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2054 = metadata !{i32 181, i32 0, metadata !2055, null}
!2055 = metadata !{i32 786443, metadata !1240, i32 180, i32 0, metadata !906, i32 31} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2056 = metadata !{i32 187, i32 0, metadata !2057, null}
!2057 = metadata !{i32 786443, metadata !1251, i32 186, i32 0, metadata !906, i32 32} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2058 = metadata !{i32 192, i32 0, metadata !2059, null}
!2059 = metadata !{i32 786443, metadata !1263, i32 191, i32 0, metadata !906, i32 33} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2060 = metadata !{i32 198, i32 0, metadata !2061, null}
!2061 = metadata !{i32 786443, metadata !1273, i32 197, i32 0, metadata !906, i32 34} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2062 = metadata !{i32 203, i32 0, metadata !2063, null}
!2063 = metadata !{i32 786443, metadata !1284, i32 201, i32 0, metadata !906, i32 35} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2064 = metadata !{i32 209, i32 0, metadata !2065, null}
!2065 = metadata !{i32 786443, metadata !1294, i32 207, i32 0, metadata !906, i32 36} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2066 = metadata !{i32 214, i32 0, metadata !2067, null}
!2067 = metadata !{i32 786443, metadata !1305, i32 213, i32 0, metadata !906, i32 37} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2068 = metadata !{i32 220, i32 0, metadata !2069, null}
!2069 = metadata !{i32 786443, metadata !1316, i32 219, i32 0, metadata !906, i32 38} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2070 = metadata !{i32 225, i32 0, metadata !2071, null}
!2071 = metadata !{i32 786443, metadata !1328, i32 224, i32 0, metadata !906, i32 39} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2072 = metadata !{i32 226, i32 0, metadata !2071, null}
!2073 = metadata !{i32 231, i32 0, metadata !2074, null}
!2074 = metadata !{i32 786443, metadata !1338, i32 230, i32 0, metadata !906, i32 40} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2075 = metadata !{i32 235, i32 0, metadata !2076, null}
!2076 = metadata !{i32 786443, metadata !1349, i32 234, i32 0, metadata !906, i32 41} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2077 = metadata !{i32 239, i32 0, metadata !2078, null}
!2078 = metadata !{i32 786443, metadata !1356, i32 238, i32 0, metadata !906, i32 42} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2079 = metadata !{i32 240, i32 0, metadata !2078, null}
!2080 = metadata !{i32 245, i32 0, metadata !2081, null}
!2081 = metadata !{i32 786443, metadata !1364, i32 244, i32 0, metadata !906, i32 43} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2082 = metadata !{i32 250, i32 0, metadata !2083, null}
!2083 = metadata !{i32 786443, metadata !1374, i32 249, i32 0, metadata !906, i32 44} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2084 = metadata !{i32 255, i32 0, metadata !2085, null}
!2085 = metadata !{i32 786443, metadata !1385, i32 254, i32 0, metadata !906, i32 45} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2086 = metadata !{i32 260, i32 0, metadata !2087, null}
!2087 = metadata !{i32 786443, metadata !1393, i32 259, i32 0, metadata !906, i32 46} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2088 = metadata !{i32 264, i32 0, metadata !2089, null}
!2089 = metadata !{i32 786443, metadata !1402, i32 263, i32 0, metadata !906, i32 47} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaMemManage.cpp]
!2090 = metadata !{i32 15, i32 0, metadata !2091, null}
!2091 = metadata !{i32 786443, metadata !1429, i32 14, i32 0, metadata !1430, i32 0} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2092 = metadata !{i32 16, i32 0, metadata !2091, null}
!2093 = metadata !{i32 20, i32 0, metadata !2094, null}
!2094 = metadata !{i32 786443, metadata !1497, i32 19, i32 0, metadata !1430, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2095 = metadata !{i32 21, i32 0, metadata !2094, null}
!2096 = metadata !{i32 25, i32 0, metadata !2097, null}
!2097 = metadata !{i32 786443, metadata !1504, i32 24, i32 0, metadata !1430, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2098 = metadata !{i32 29, i32 0, metadata !2099, null}
!2099 = metadata !{i32 786443, metadata !1511, i32 28, i32 0, metadata !1430, i32 3} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2100 = metadata !{i32 33, i32 0, metadata !2101, null}
!2101 = metadata !{i32 786443, metadata !1518, i32 32, i32 0, metadata !1430, i32 4} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2102 = metadata !{i32 34, i32 0, metadata !2101, null}
!2103 = metadata !{i32 38, i32 0, metadata !2104, null}
!2104 = metadata !{i32 786443, metadata !1526, i32 37, i32 0, metadata !1430, i32 5} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2105 = metadata !{i32 42, i32 0, metadata !2106, null}
!2106 = metadata !{i32 786443, metadata !1529, i32 41, i32 0, metadata !1430, i32 6} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2107 = metadata !{i32 46, i32 0, metadata !2108, null}
!2108 = metadata !{i32 786443, metadata !1535, i32 45, i32 0, metadata !1430, i32 7} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2109 = metadata !{i32 50, i32 0, metadata !2110, null}
!2110 = metadata !{i32 786443, metadata !1542, i32 49, i32 0, metadata !1430, i32 8} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2111 = metadata !{i32 54, i32 0, metadata !2112, null}
!2112 = metadata !{i32 786443, metadata !1543, i32 53, i32 0, metadata !1430, i32 9} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2113 = metadata !{i32 55, i32 0, metadata !2112, null}
!2114 = metadata !{i32 59, i32 0, metadata !2115, null}
!2115 = metadata !{i32 786443, metadata !1549, i32 58, i32 0, metadata !1430, i32 10} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2116 = metadata !{i32 60, i32 0, metadata !2115, null}
!2117 = metadata !{i32 64, i32 0, metadata !2118, null}
!2118 = metadata !{i32 786443, metadata !1553, i32 63, i32 0, metadata !1430, i32 11} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2119 = metadata !{i32 65, i32 0, metadata !2118, null}
!2120 = metadata !{i32 69, i32 0, metadata !2121, null}
!2121 = metadata !{i32 786443, metadata !1561, i32 68, i32 0, metadata !1430, i32 12} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2122 = metadata !{i32 73, i32 0, metadata !2123, null}
!2123 = metadata !{i32 786443, metadata !1567, i32 72, i32 0, metadata !1430, i32 13} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2124 = metadata !{i32 77, i32 0, metadata !2125, null}
!2125 = metadata !{i32 786443, metadata !1583, i32 76, i32 0, metadata !1430, i32 14} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2126 = metadata !{i32 81, i32 0, metadata !2127, null}
!2127 = metadata !{i32 786443, metadata !1595, i32 80, i32 0, metadata !1430, i32 15} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2128 = metadata !{i32 85, i32 0, metadata !2129, null}
!2129 = metadata !{i32 786443, metadata !1603, i32 84, i32 0, metadata !1430, i32 16} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2130 = metadata !{i32 89, i32 0, metadata !2131, null}
!2131 = metadata !{i32 786443, metadata !1611, i32 88, i32 0, metadata !1430, i32 17} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2132 = metadata !{i32 93, i32 0, metadata !2133, null}
!2133 = metadata !{i32 786443, metadata !1617, i32 92, i32 0, metadata !1430, i32 18} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2134 = metadata !{i32 97, i32 0, metadata !2135, null}
!2135 = metadata !{i32 786443, metadata !1623, i32 96, i32 0, metadata !1430, i32 19} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaDeviceManage.c]
!2136 = metadata !{i32 19, i32 0, metadata !1644, null}
!2137 = metadata !{i32 23, i32 0, metadata !2138, null}
!2138 = metadata !{i32 786443, metadata !1645, i32 22, i32 0, metadata !1636, i32 1} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c]
!2139 = metadata !{i32 27, i32 0, metadata !2140, null}
!2140 = metadata !{i32 786443, metadata !1648, i32 26, i32 0, metadata !1636, i32 2} ; [ DW_TAG_lexical_block ] [/home/sawaya/Gklee/build/Gklee/runtime/CudaRuntime//home/sawaya/Gklee/Gklee/runtime/CudaRuntime/cudaErrorHandling.c]
