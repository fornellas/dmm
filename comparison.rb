#!/home/fornellas/local/ruby21/bin/ruby
require 'pp'

require_relative 'accuracy.rb'
require_relative 'multimeter.rb'
require_relative 'measurement_range.rb'

##
## Extech EX330
##

ex330 = Multimeter.new({
  manufacturer: 'Extech',
  model: 'EX330',
  })

ex330.add_measurement_range({
  measurement: 'V DC',
  max: 0.4,
  error: 0.5,
  resolution: 0.0001,
  digits: 2,
  })
ex330.add_measurement_range({
  measurement: 'V DC',
  max: 4,
  error: 1,
  resolution: 0.001,
  digits: 2,
  })
ex330.add_measurement_range({
  measurement: 'V DC',
  max: 40,
  error: 1,
  resolution: 0.01,
  digits: 2,
  })
ex330.add_measurement_range({
  measurement: 'V DC',
  max: 400,
  error: 1,
  resolution: 0.1,
  digits: 2,
  })
ex330.add_measurement_range({
  measurement: 'V DC',
  max: 600,
  error: 1.5,
  resolution: 1,
  digits: 2,
  })

puts ex330.measurement_error({ measurement: 'V DC', steps: 20 }).to_s
puts ''

##
## Victor
##

vc830l = Multimeter.new({
  manufacturer: 'Victor',
  model: 'VC830L',
  })

vc830l.add_measurement_range({
  measurement: 'V DC',
  max: 0.2,
  error: 0.5,
  resolution: 0.0001,
  digits: 4,
  })
vc830l.add_measurement_range({
  measurement: 'V DC',
  max: 2,
  error: 0.5,
  resolution: 0.001,
  digits: 4,
  })
vc830l.add_measurement_range({
  measurement: 'V DC',
  max: 20,
  error: 0.5,
  resolution: 0.01,
  digits: 4,
  })
vc830l.add_measurement_range({
  measurement: 'V DC',
  max: 200,
  error: 0.5,
  resolution: 0.1,
  digits: 4,
  })
vc830l.add_measurement_range({
  measurement: 'V DC',
  max: 600,
  error: 1,
  resolution: 1,
  digits: 5,
  })

puts vc830l.measurement_error({ measurement: 'V DC', steps: 20 }).to_s
puts ''

##
## Extech MN35
##

mn35 = Multimeter.new({
  manufacturer: 'Extech',
  model: 'MN35',
  })

mn35.add_measurement_range({
  measurement: 'V DC',
  max: 0.2,
  error: 0.5,
  resolution: 0.0001,
  digits: 2,
  })
mn35.add_measurement_range({
  measurement: 'V DC',
  max: 2,
  error: 0.5,
  resolution: 0.001,
  digits: 2,
  })
mn35.add_measurement_range({
  measurement: 'V DC',
  max: 20,
  error: 0.5,
  resolution: 0.01,
  digits: 2,
  })
mn35.add_measurement_range({
  measurement: 'V DC',
  max: 200,
  error: 0.5,
  resolution: 0.1,
  digits: 2,
  })
mn35.add_measurement_range({
  measurement: 'V DC',
  max: 600,
  error: 0.8,
  resolution: 1,
  digits: 2,
  })

puts mn35.measurement_error({ measurement: 'V DC', steps: 20 }).to_s
puts ''

##
## Fluke 101
##

fluke101 = Multimeter.new({
  manufacturer: 'Fluke',
  model: '101',
  })

fluke101.add_measurement_range({
  measurement: 'V DC',
  max: 6,
  error: 0.5,
  resolution: 0.001,
  digits: 3,
  })
fluke101.add_measurement_range({
  measurement: 'V DC',
  max: 60,
  error: 0.5,
  resolution: 0.01,
  digits: 3,
  })
fluke101.add_measurement_range({
  measurement: 'V DC',
  max: 600,
  error: 0.5,
  resolution: 0.1,
  digits: 3,
  })

puts fluke101.measurement_error({ measurement: 'V DC', steps: 20 }).to_s
puts ''

##
## Fluke 107
##

fluke107 = Multimeter.new({
  manufacturer: 'Fluke',
  model: '107',
  })

fluke107.add_measurement_range({
  measurement: 'V DC',
  max: 6,
  error: 0.5,
  resolution: 0.001,
  digits: 3,
  })
fluke107.add_measurement_range({
  measurement: 'V DC',
  max: 60,
  error: 0.5,
  resolution: 0.01,
  digits: 3,
  })
fluke107.add_measurement_range({
  measurement: 'V DC',
  max: 600,
  error: 0.5,
  resolution: 0.1,
  digits: 3,
  })

puts fluke107.measurement_error({ measurement: 'V DC', steps: 60 }).to_s
puts ''
