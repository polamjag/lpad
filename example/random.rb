require 'unimidi'
require 'lpad'

lp = Lpad::Device::Base.new UniMIDI::Output.gets.open

(1..8).each do |y|
  (1..8).each do |x|
    red = rand 4; green = rand 4
    lp.set x: x, y: y, red: red, green: green
    sleep 0.1
  end
end
