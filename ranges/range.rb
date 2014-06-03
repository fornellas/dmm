require_relative 'range/accuracy.rb'

class Multimeter
  class Ranges
    class Range
      attr_accessor :maximum, :minimum, :accuracy
      def initialize values
        @minimum = values[:minimum].to_f
        @maximum = values[:maximum].to_f
        @accuracy = Accuracy.new({
          resolution: values[:resolution],
          error: values[:error],
          digits: values[:digits],
          })
      end
      def <=> other
        self.maximum <=> other.maximum
      end
      def error_at value
        raise 'Out of range!' if value > maximum or value < minimum
        accuracy.error_at value
      end
    end
  end
end
