#!/usr/bin/ruby
require_relative "advent14"

data = File.new('input').read
puts "part1: #{Advent14.new(data).part1}"
puts "part2: #{Advent14.new(data).part2}"
