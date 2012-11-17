# encoding: UTF-8

# Copyright 2012 Twitter, Inc
# http://www.apache.org/licenses/LICENSE-2.0

module TwitterCldr
  module Normalization
    class Base

      class << self

        def normalize(string)
          code_points = TwitterCldr::Utils::CodePoints.from_string(string)
          normalized_code_points = normalize_code_points(code_points)
          puts normalized_code_points.inspect
          TwitterCldr::Utils::CodePoints.to_string(normalized_code_points)
        end

        def combining_class_for(code_point)
          TwitterCldr::Shared::CodePoint.find(code_point).combining_class.to_i
        rescue NoMethodError
          0
        end

        def requires_normalization?(code_point)
          TwitterCldr::Normalization::QuickCheck.requires_normalization?(code_point, self.name.split("::").last.to_sym)
        end

      end

    end
  end
end