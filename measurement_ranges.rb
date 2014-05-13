require_relative 'accuracy.rb'
require_relative 'measurement_range.rb'

class MeasurementRanges
  @ranges
  def initialize
    @ranges = Array.new
  end
  def add_range range
    @ranges << range
    @ranges.sort!
  end
  def error_at reading
    range_of(reading).error_at(reading)
  end
  def range_of reading
    range = nil
    @ranges.reverse_each do |range_candidate|
      if reading <= range_candidate.max
        range = range_candidate
      end
    end
    raise 'Out of range!' if range.nil?
    range
  end
  def error steps
    error_array = Array.new
    last_range = nil
    @ranges.each do |range|
      if last_range.nil?
        start = 0.0
      else
        start = last_range.max
      end
      limit = range.max
      step = (limit - start) / steps
      start.step(to: limit, by: step) do |reading|
        error_array << [ reading, range.error_at(reading) ]
      end
      last_range = range
    end
    error_array
  end
end
