#!/usr/bin/ruby
require_relative "advent9"

d = File.new('input').read.split(',').map(&:to_i)
puts "part1: #{Advent9.new(d, [1]).part}"
puts "part2: #{Advent9.new(d, [2]).part}"
