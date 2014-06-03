require_relative 'ranges.rb'

class Multimeter
  attr_accessor :manufacturer, :model
  def initialize values
    @manufacturer = values[:manufacturer]
    @model = values[:model]
    @ranges = Hash.new
    @units = Hash.new
  end
  def add_range values
    measurement = values[:measurement]
    @units[measurement] = values[:unit]
    @ranges[measurement] = Ranges.new if @ranges[measurement].nil?
    @ranges[measurement].add_range({
      minimum: values[:minimum],
      maximum: values[:maximum],
      resolution: values[:resolution],
      error: values[:error],
      digits: values[:digits],
      })
  end
  def ranges measurement
    @ranges[measurement]
  end
end
