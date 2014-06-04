require_relative 'ranges/range.rb'

class Multimeter
  class Ranges
    def initialize
      @ranges = Array.new
    end
    # Add new range
    def add_range values
      @ranges << Range.new({
        maximum: values[:maximum],
        resolution: values[:resolution],
        error: values[:error],
        digits: values[:digits],
        })
      @ranges.sort!
    end
    # Return Array containing errors for values_per_range equally distributed
    # inside the range.
    def errors values_per_range
      error_a = Array.new
      minimum = 0.0
      @ranges.each do |range|
        range.steps(minimum, values_per_range).each do |value|
          error_a << {
            value: value,
            error: range.error_at(value)
            }
        end
        minimum = range.maximum
      end
      error_a
    end
  end
end
