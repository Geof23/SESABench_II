 

#include "lonestargpu.h"
#include "variants.h"
#include "cutil_subset.h"

__global__
void dverifysolution(foru *dist, Graph graph, unsigned *nerr) {
	unsigned int nn = (blockIdx.x * blockDim.x + threadIdx.x);
	  if (nn < graph.nnodes) {
		unsigned int nsrcedges = graph.getOutDegree(nn);
		for (unsigned ii = 0; ii < nsrcedges; ++ii) {
			unsigned int u = nn;
			unsigned int v = graph.getDestination(u, ii);
			foru wt = 1;

			if (wt > 0 && dist[u] + wt < dist[v]) {
			   
			  ++*nerr;
			}
		}
	  }	
}

 
 
 
 
 
 
 
 
 

 
 
 
 
 
 

 
 
 
 
 
 

void write_solution(const char *fname, Graph &graph, foru *dist)
{
  foru *h_dist;
  h_dist = (foru *) malloc(graph.nnodes * sizeof(foru));
  assert(h_dist != NULL);

   
  cudaMemcpy(h_dist, dist, graph.nnodes * sizeof(foru), cudaMemcpyDeviceToHost);
  
  printf("Writing solution to %s\n", fname);
  FILE *f = fopen(fname, "w");
   
  fprintf(f, "Computed solution (source dist): [");

  for(int node = 0; node < graph.nnodes; node++)
    {
      fprintf(f, "%d:%d\n ", node, h_dist[node]);
    }

  fprintf(f, "]");

  free(h_dist);
}

int main(int argc, char *argv[]) {
	unsigned intzero = 0;
	Graph hgraph, graph;
	unsigned *nerr, hnerr;
	KernelConfig kconf;
	foru *dist;

	 

	 
	 

	 
        printf("before read \n");
	 
	 
	hgraph.read("cycle-undir.gr");
        printf("after read \n");
	hgraph.cudaCopy(graph);

	if (cudaMalloc((void **)&dist, graph.nnodes * sizeof(foru)) != cudaSuccess) CudaTest("allocating dist failed");
	cudaMemset(dist, 0, graph.nnodes * sizeof(foru));

#if VARIANT==BFS_MERRILL
	bfs_merrill(graph, dist);
#else
	bfs(graph, dist);
#endif
	if (cudaMalloc((void **)&nerr, sizeof(unsigned)) != cudaSuccess) CudaTest("allocating nerr failed");

	 
	cudaMemcpy(nerr, &intzero, sizeof(intzero), cudaMemcpyHostToDevice);

	kconf.setProblemSize(graph.nnodes);
	kconf.setMaxThreadsPerBlock();
	printf("verifying.\n");
	 
	 
	 
	cudaMemcpy(&hnerr, nerr, sizeof(hnerr), cudaMemcpyDeviceToHost);
	printf("\tno of errors = %d.\n", hnerr);

	 

	 

	return 0;
}
