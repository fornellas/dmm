#!/home/fornellas/local/ruby21/bin/ruby

require_relative '../lib/multimeter.rb'
require 'csv'
require 'pp'

if ARGV.size != 2
  puts "Usage: #{$0} [CSV] [Measurement]"
  exit 1
end

csv = ARGV[0]
measurement_name = ARGV[1]

multimeters = Array.new
CSV.open(csv, "rb", {headers: true}).each do |row|
  # Add multimeter
  new_multimeter = Multimeter.new({
    brand: row['Brand'],
    model: row['Model'],
    })
  if index = multimeters.index(new_multimeter)
    multimeter = multimeters[index]
  else
    multimeters << new_multimeter
    multimeter = new_multimeter
  end
  # Add measurement
  multimeter.add_measurement(row['Measurement'], row['Unit'])
  # Add range
  multimeter.add_range(row['Measurement'], {
    maximum: row['Maximum'],
    resolution: row['Resolution'],
    error: row['Error'],
    digits: row['Digits'],
    })
end

