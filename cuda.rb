# -*- coding: utf-8 -*- #

module Rouge
  module Lexers
    load_lexer 'cpp.rb'

    class Cuda < Cpp
      title "CUDA"
      desc "The CUDA/C++ programming language"

      tag 'cuda'
      aliases 'cuda'
      # the many varied filenames of c++ source files...
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
                        __global__ __shared__ __device__
        ))
      end

      id = /[a-zA-Z_][a-zA-Z0-9_]*/

      prepend :root do
        # Offload C++ extensions, http://offload.codeplay.com/
        rule /(?:__offload|__blockingoffload|__outer)\b/, Keyword::Pseudo
      end

      # digits with optional inner quotes
      # see www.open-std.org/jtc1/sc22/wg21/docs/papers/2013/n3781.pdf
      dq = /\d('?\d)*/

      prepend :statements do
        rule /class\b/, Keyword, :classname
        rule %r((#{dq}[.]#{dq}?|[.]#{dq})(e[+-]?#{dq}[lu]*)?)i, Num::Float
        rule %r(#{dq}e[+-]?#{dq}[lu]*)i, Num::Float
        rule /0x\h('?\h)*[lu]*/i, Num::Hex
        rule /0[0-7]('?[0-7])*[lu]*/i, Num::Oct
        rule /#{dq}[lu]*/i, Num::Integer
        rule /\bnullptr\b/, Name::Builtin
        rule /(?:u8|u|U|L)?R"([a-zA-Z0-9_{}\[\]#<>%:;.?*\+\-\/\^&|~!=,"']{,16})\(.*?\)\1"/m, Str
      end

      state :classname do
        rule id, Name::Class, :pop!

        # template specification
        rule /\s*(?=>)/m, Text, :pop!
        mixin :whitespace
      end
    end
  end
end
