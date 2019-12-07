#!/usr/bin/ruby
require_relative "advent5"

d = File.new('input').read.split(',').map(&:to_i)

puts "part1: #{Advent5.new(d, 1).part1_2}"
puts "part2: #{Advent5.new(d, 5).part1_2}"
