#!/usr/bin/ruby
require_relative "advent7"
d = File.new('input').read.split(',').map(&:to_i)
puts "part1: #{Advent7.new(d).part1}"
puts "part2: #{Advent7.new(d).part2}"
