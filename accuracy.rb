class Accuracy
  @error
  @resolution
  @digits
  attr_accessor :error, :resolution, :digits
  def initialize values = nil
    return if values.nil?
    @error = values[:error].to_f
    @resolution = values[:resolution].to_f
    @digits = values[:digits].to_f
  end
  def fixed_error
    resolution * digits
  end
  def error_at reading
    max_reading = reading.to_f * ( (error + 100.0)/100.0 ) + fixed_error
    ( max_reading / reading.to_f - 1.0 ) * 100.0
  end
end
