require_relative 'multimeter/ranges.rb'

class Multimeter
  attr_accessor :brand, :model
  def initialize values
    @brand = values[:brand]
    @model = values[:model]
    @units = Hash.new
    @ranges = Hash.new
    @measurements = Array.new
  end
  # Add new measurement / unit
  def add_measurement name, unit
    unless @measurements.include? name
      @measurements << name
      @units[name] = unit
      @ranges[name] = Ranges.new
    else
      raise "Unit '#{unit}' different from previously unit '#{@units[name]}' added." if @units[name] != unit
    end
  end
  
  # Add new Range to measurement.
  def add_range measurement_name, values
    @ranges[measurement_name].add_range({
      maximum: values[:maximum],
      resolution: values[:resolution],
      error: values[:error],
      digits: values[:digits],
      })
  end
  # Return Array of errors for given measurement_name, with values_per_range
  # for each range
  def errors measurement_name, values_per_range
    @ranges[measurement_name].errors values_per_range
  end
  def == other
    brand == other.brand and model = other.model
  end
end
