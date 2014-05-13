require_relative 'accuracy.rb'

class MeasurementRange
  @max
  @accuracy
  attr_reader :max, :accuracy
  def initialize values
    @max = values[:max].to_f
    @accuracy = values[:accuracy]
  end
  def <=> other
    self.max <=> other.max
  end
  def error_at reading
    raise 'Out of range!' if reading > max
    accuracy.error_at reading
  end
end
