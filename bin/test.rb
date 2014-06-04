#!/home/fornellas/local/ruby21/bin/ruby

require_relative '../lib/multimeter.rb'
require 'pp'

ex330 = Multimeter.new({
  brand: 'Extech',
  model: 'EX330',
  })
ex330.add_measurement 'Volts DC', 'V'

ex330.add_range( 'Volts DC', {
  maximum: 0.4,
  resolution: 0.0001,
  error: 0.5,
  digits: 2,
  })
ex330.add_range('Volts DC', {
  maximum: 4,
  resolution: 0.001,
  error: 1,
  digits: 2,
  })
ex330.add_range('Volts DC', {
  maximum: 40,
  resolution: 0.01,
  error: 1,
  digits: 2,
  })
ex330.add_range('Volts DC', {
  maximum: 400,
  resolution: 0.1,
  error: 1,
  digits: 2,
  })
ex330.add_range('Volts DC', {
  maximum: 600,
  resolution: 1,
  error: 1.5,
  digits: 2,
  })

puts "V\tError"
ex330.errors('Volts DC', 20).each do |entry|
  puts "#{entry[:value]}\t#{entry[:error]}"
end
#ex330.
