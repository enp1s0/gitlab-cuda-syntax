# -*- coding: utf-8 -*- #

module Rouge
  module Lexers
    load_lexer 'cpp.rb'

    class Cuda < Cpp
      title "CUDA"
      desc "The CUDA/C,C++ programming language"

      tag 'cuda'
      aliases 'cuda'
      filenames '*.cu', '*.cuh'
      mimetypes 'text/x-cuhdr', 'text/x-cusrc'

      def self.keywords
        @keywords ||= super + Set.new(%w(
			threadIdx blockIdx blockDim
        ))
      end

      def self.keywords_type
        @keywords_type ||= super + Set.new(%w(
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

        ))
      end

      def self.reserved
        @reserved ||= super + Set.new(%w(
			__global__ __host__ __device__ __constant__  __shared__
        ))
      end
    end
  end
end
