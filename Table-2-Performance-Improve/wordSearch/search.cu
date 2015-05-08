/*
 * search_kernel.cu
 * 
 * Search through an unsorted text file for a specific word or phrase. 
 *
 * http://supercomputingblog.com/cuda/search-algorithm-with-cuda/
 */

#include <cstdlib>
#include "stdio.h"

#ifndef NUM1
#error NUM1 must be defined
#endif

#ifndef NUM2
#error NUM2 must be defined
#endif

#ifdef REPLAY

#include "search.cc"

#else

__global__ void wordSearchSimple(char *pszData, int dataLength, 
                                 char *pszTarget, int targetLen, int *pFound) {
  int startIndex = blockDim.x*blockIdx.x + threadIdx.x;
  if (*pFound > startIndex) {
    // only continue if an earlier instance hasn't already been found
    int fMatch = 1;
    for (int i=0; i < targetLen; i++) {
      if (pszData[startIndex+i] != pszTarget[i]) 
        fMatch = 0;
      }
      if (fMatch) 
        atomicMin(pFound, startIndex);
  }
}

#endif

// *************************************************************
//  Driver 
// *************************************************************

int main() {
  char *h_data;
  char *h_target;
  h_data = (char*)malloc(sizeof(char)*NUM1);
  h_target = (char*)malloc(sizeof(char)*NUM2);

  klee_make_symbolic(h_data, sizeof(char) * NUM1, "h_data_input");
  klee_make_symbolic(h_target, sizeof(char) * NUM2, "h_target_input");

  char *d_data;
  char *d_target;
  cudaMalloc((void**)&d_data, sizeof(char)*NUM1);
  cudaMalloc((void**)&d_target, sizeof(char)*NUM2);
  cudaMemcpy(d_data, h_data, sizeof(char) * NUM1, cudaMemcpyHostToDevice);
  cudaMemcpy(d_target, h_target, sizeof(char) * NUM2, cudaMemcpyHostToDevice);

  int found = NUM1;
  
  // the following is equivalent to calling the kernel using <<<...>>>(BitonicKernel)
  wordSearchSimple<<<1, NUM1-NUM2>>>(d_data, sizeof(char)*NUM1, d_target, sizeof(char)*NUM2, &found);

  return 0;
}
