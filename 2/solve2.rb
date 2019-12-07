#!/usr/bin/ruby
require_relative "advent2"

Final = 19690720
d = File.new('input').read.split(',').map(&:to_i)
adv = Advent2.new(d)
puts "part1: #{adv.part1([12, 2])}"
puts "part2: #{adv.part2(Final)}"
