#!/usr/bin/ruby
require_relative "advent1"

data = File.new('input').each_line.map(&:to_i)
puts "part1: #{Advent1.new(data).part1}"
puts "part2: #{Advent1.new(data).part2}"
