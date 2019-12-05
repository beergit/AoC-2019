#!/usr/bin/ruby
require_relative "advent3"

d = File.new('input').each_line.map(&:chop)
puts "part1: #{Advent3.new(d).part1}"
puts "part2: #{Advent3.new(d).part2}"
