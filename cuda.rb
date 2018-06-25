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
