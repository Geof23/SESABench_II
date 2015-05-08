#include <cassert>
#include <cstdio>

#ifndef N
#error N must be defined
#endif

#if rwidth == 8
  #define rtype unsigned char
  #define MAX_RTYPE 0xff
#elif rwidth == 16
  #define rtype unsigned short
  #define MAX_RTYPE 0xffff
#elif rwidth == 32
  #define rtype unsigned int
  #define MAX_RTYPE 0xffffffff
#elif rwidth == 64
  #define rtype unsigned long
  #define MAX_RTYPE 0xffffffffffffffff
#else
  #error rwidth must be defined
#endif

#ifdef BINOP_ADD
  #define OP(x,y) (x <= MAX_RTYPE - y ? (x + y) : MAX_RTYPE)
#elif BINOP_OR
  #define OP(x,y) (x | y)
#elif BINOP_MAX
  #define OP(x,y) (x < y ? y : x)
#else
  #error Must define one of BINOP_ADD|BINOP_OR|BINOP_MAX
#endif

#ifdef _SYM
  #define ASSERT_NO_CUDA_ERROR( callReturningErrorstatus ) callReturningErrorstatus
#else
  #define ASSERT_NO_CUDA_ERROR( callReturningErrorstatus ) {     \
    cudaError_t err = callReturningErrorstatus;                  \
    if (err != cudaSuccess) {                                    \
      fprintf(stderr,                                            \
              "Cuda error (%s/%d) in file '%s' in line %i\n",    \
              cudaGetErrorString(err), err, __FILE__, __LINE__); \
      exit(1);                                                   \
    }                                                            \
  } while(0);
#endif

__global__ void blelloch(rtype *len, rtype *out) {
  __shared__ rtype result[N];

  unsigned offset;
  unsigned t = threadIdx.x;

  if (t < N/2) {
    result[2*t]   = len[2*t];
    result[2*t+1] = len[2*t+1];
  }

  offset = 1;
  for (unsigned d = N/2; d > 0; d /= 2) {
    __syncthreads();
    if (t < d) {
      unsigned ai = offset * (2 * t + 1) - 1;
      unsigned bi = offset * (2 * t + 2) - 1;
      result[bi] = OP(result[ai],result[bi]);
    }
    offset *= 2;
  }

  if (t == 0) {
    result[N-1] = 0;
  }

  for (unsigned d = 1; d < N; d *= 2) {
    offset /= 2;
    __syncthreads();
    if (t < d) {
      unsigned ai = offset * (2 * t + 1) - 1;
      unsigned bi = offset * (2 * t + 2) - 1;
      rtype temp = result[ai];
      result[ai] = result[bi];
      result[bi] = OP(result[bi],temp);
    }
  }
  __syncthreads();

  if (t < N/2) {
    out[2*t]   = result[2*t];
    out[2*t+1] = result[2*t+1];
  }
}

int main(int argc, char **argv) {
  // test data
  size_t ArraySize = N * sizeof(rtype);
  rtype *in  = (rtype *)malloc(ArraySize);
  rtype *out = (rtype *)malloc(ArraySize);
#ifdef _SYM
  klee_make_symbolic(in, ArraySize, "in");
#else
  for (unsigned i=0; i<N; ++i) {
    in[i] = 101+i;
  }
#endif

  // create arrays on device
  rtype *d_in;
  rtype *d_out;
  ASSERT_NO_CUDA_ERROR(cudaMalloc((void **)&d_in, ArraySize));
  ASSERT_NO_CUDA_ERROR(cudaMalloc((void **)&d_out, ArraySize));

  // memcpy into arrays
  ASSERT_NO_CUDA_ERROR(cudaMemcpy(d_in, in, ArraySize, cudaMemcpyHostToDevice));

  // run the kernel
  ASSERT_NO_CUDA_ERROR(cudaDeviceSynchronize());
#ifndef _SYM
  cudaError_t err = cudaGetLastError();
  if (err != cudaSuccess) {
    printf("Pre-kernel error: %s.\n", cudaGetErrorString(err));
    return 1;
  }
#endif
  blelloch<<<1,(N/2)>>>(d_in, d_out);
#ifndef _SYM
  ASSERT_NO_CUDA_ERROR(cudaDeviceSynchronize());
  err = cudaGetLastError();
  if (err != cudaSuccess) {
    printf("Post-kernel Error: %s\n", cudaGetErrorString(err));
    return 1;
  }
#endif

  // memcpy back the result
  ASSERT_NO_CUDA_ERROR(cudaMemcpy(out, d_out, ArraySize, cudaMemcpyDeviceToHost));

  // check monotonic specification
#ifdef _SYM
  unsigned i,j;
  klee_make_symbolic(&i, sizeof(unsigned), "i");
  klee_make_symbolic(&j, sizeof(unsigned), "j");
  klee_assume(i < N);
  klee_assume(j < N);
  klee_assume(i < j);
  if (!( OP(out[i], in[i]) <= out[j] )) {
    printf("TEST FAIL: MONOTONIC SPECIFICATION\n");
    assert(false);
  }
#else
  // check full specification
  rtype sum = 0;
  for (unsigned i=0; i<N; ++i) {
    printf("out[%d] = %d (%d)\n", i, out[i], sum);
    assert(sum == out[i]);
    sum = OP(sum,in[i]);
  }
#endif
  printf("TEST PASSED\n");

  // cleanup
  free(in);
  free(out);
  ASSERT_NO_CUDA_ERROR(cudaFree(d_in));
  ASSERT_NO_CUDA_ERROR(cudaFree(d_out));
  return 0;
}
