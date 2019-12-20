#!/usr/bin/ruby
require_relative "advent19"

d = File.new('input').read.split(',').map(&:to_i)
adv = Advent19.new(d)
puts "part1: #{adv.part1(50)}"
#puts adv.to_s
puts "part2: #{adv.part2(100)}"
