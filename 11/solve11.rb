#!/usr/bin/ruby
require_relative "advent11"

d = File.new('input').read.split(',').map(&:to_i)
puts "part1: #{Advent11.new(d).part1}"
puts "part2:\n#{Advent11.new(d).part2}"
