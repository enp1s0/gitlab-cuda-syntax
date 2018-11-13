
__device__ half dev_square(half in){
	float4 f4 = make_float4(0.0f, 1.0f, 2.0f, 3.0f);
	return in * in;
}

template<int N>
__global__ void kernel(half* out_ptr, const half* in_ptr){
	int tid = blockIdx.x + blockDim.x + threadIdx.x;
	if(tid >= N)return;
	out_ptr[tid] = dev_square(in_ptr[tid]);
}
