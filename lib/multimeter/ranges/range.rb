require_relative 'range/accuracy.rb'

class Multimeter
  class Ranges
    class Range
      attr_accessor :maximum
      def initialize values
        @maximum = values[:maximum].to_f
        @accuracy = Accuracy.new({
          resolution: values[:resolution],
          error: values[:error],
          digits: values[:digits],
          })
      end
      def resolution
        @accuracy.resolution
      end
      def error
        @accuracy.error
      end
      def digits
        @accuracy.digits
      end
      def <=> other
        self.maximum <=> other.maximum
      end
      # Return values equally distributed inside the range, starting at
      # minimum
      def steps minimum, values
        steps_a = Array.new
        step = (maximum - minimum) / (values.to_f - 1.0)
        minimum.step(to: maximum, by: step) do |value|
            steps_a << value
        end
        steps_a
      end
      def error_at value
        raise 'Out of range!' if value > maximum or value < 0.0
        @accuracy.error_at value
      end
    end
  end
end
