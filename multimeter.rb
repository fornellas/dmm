require_relative 'measurement_ranges.rb'
require_relative 'accuracy.rb'

class Multimeter
  @manufacturer
  @model
  @measurement_ranges
  attr_reader :manufacturer, :model
  def initialize values
    @manufacturer = values[:manufacturer]
    @model = values[:model]
    @measurement_ranges = Hash.new
  end
  def add_measurement_range values
    case values.class
    when Hash.class
      measurement = values[:measurement]
      max = values[:max]
      error = values[:error]
      resolution = values[:resolution]
      digits = values[:digits]
    when Array.class
      measurement = values[0]
      max = values[1]
      error = values[2]
      resolution = values[3]
      digits = values[4]
    else
      raise "Invalid type #{values.class.to_s}"
    end
    range = MeasurementRange.new({
      max: max,
      accuracy: Accuracy.new({
        error: error,
        resolution: resolution,
        digits: digits,
        }),
      })
    if @measurement_ranges[measurement].nil?
      @measurement_ranges[measurement] = MeasurementRanges.new
    end
    @measurement_ranges[measurement].add_range(range)
  end
  def error_at values
    measurement = values[:measurement]
    reading = values[:reading]
    @measurement_ranges[measurement].error_at reading
  end
  def measurement_error values
    measurement = values[:measurement]
    steps = values[:steps]
    error_array = @measurement_ranges[measurement].error(steps)
    error_array.unshift ['Reading', "#{manufacturer} #{model} / #{measurement.to_s}"]
    def error_array.to_s
      s = String.new
      self.each do |pair|
        s += "#{pair[0].to_s}\t#{pair[1].to_s}\n"
      end
      s
    end
    error_array
  end
end
