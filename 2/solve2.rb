#!/usr/bin/ruby
require_relative "advent2"

Final = 19690720
d = File.new('input').read.split(',').map(&:to_i)

puts "part1: #{Advent2.new({:data => d, :noun => 12, :verb => 2}).part1}"
puts "part2: #{Advent2.new({:data => d, :final => Final}).part2}"
