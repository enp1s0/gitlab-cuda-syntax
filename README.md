# GitLabでCUDAのSyntaxHighlightを行うための追加ファイル

> GitLab provides syntax highlighting on all files and snippets through the Rouge rubygem.

https://docs.gitlab.com/ee/user/project/highlighting.html

## How to install

1. Find GitLab Rouge lexers path
```
find / -name lexers -type d 2>/dev/null | grep gitlab
```

2. Copy cuda.rb
```
cp cuda.rb /path/to/gitlab/rouge/lexers/
```

3. Restart GitLab
```
gitlab-ctl restart
```


## Added keywords

- keywords
```cuda
blockIdx blockDim threadIdx
```

- types
```cuda
half half__ half2 half2__ dim3
char1 char2 char3 char4
uchar1 uchar2 uchar3 uchar4
short1 short2 short3 short4
ushort1 ushort2 ushort3 ushort4
int1 int2 int3 int4
uint1 uint2 uint3 uint4
long1 long2 long3 long4
ulong1 ulong2 ulong3 ulong4
longlong1 longlong2 longlong3 longlong4
ulonglong1 ulonglong2 ulonglong3 ulonglong4
float1 float2 float3 float4
double1 double2 double3 double4
```

- reserved
```cuda
__global__ __host__ __device__ __constant__  __shared__
```


## Reference
- https://docs.nvidia.com/cuda/cuda-c-programming-guide/#built-in-vector-types
