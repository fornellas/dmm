require_relative 'ranges/range.rb'

class Multimeter
  class Ranges
    def initialize
      @ranges = Array.new
    end
    def add_range values
      @ranges << Range.new({
        minimum: values[:minimum],
        maximum: values[:maximum],
        resolution: values[:resolution],
        error: values[:error],
        digits: values[:digits],
        })
      @ranges.sort!
    end
    def steps values_per_range
      step_array = Array.new
      @ranges.each do |range|
        start = range.minimum
        limit = range.maximum
        step = (limit - start) / (values_per_range.to_f - 1.0)
        resolution = range.accuracy.resolution
        start.step(to: limit, by: step) do |value|
            step_array << value
        end
      end
      step_array.sort
    end
    def errors_at value
      errors = Array.new
      ranges_of(value).each do |range|
        errors << range.error_at(value)
      end
      errors
    end
    private
    def ranges_of value
      ranges = Array.new
      @ranges.reverse_each do |range_candidate|
        if value <= range_candidate.maximum and value >= range_candidate.minimum
          ranges << range_candidate
        end
      end
      raise 'Out of range!' if ranges.empty?
      ranges
    end
  end
end
