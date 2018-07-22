
__device__ half dev_square(half in){
	return in * in;
}

template<int N>
__global__ void kernel(half* out_ptr, const half* in_ptr){
	int tid = blockIdx.x + blockDim.x + threadIdx.x;
	if(tid >= N)return;
	out_ptr[tid] = dev_square(in_ptr[tid]);
}
