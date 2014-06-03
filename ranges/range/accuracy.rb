class Multimeter
  class Ranges
    class Range
      class Accuracy
        attr_accessor :resolution, :error, :digits
        def initialize values
          @resolution = values[:resolution].to_f
          @error = values[:error].to_f
          @digits = values[:digits].to_f
        end
        def error_at value
          ( max_reading(value) / value.to_f - 1.0 ) * 100.0
        end
        private
        def max_reading value
          value.to_f * ( (error + 100.0)/100.0 ) + fixed_error
        end
        def fixed_error
          resolution * digits
        end
      end
    end
  end
end
