#!/usr/bin/ruby
require_relative "advent6"

puts "part1: #{Advent6.new(File.new('input').read, 'COM').part1}"
puts "part1: #{Advent6.new(File.new('input').read, 'YOU').part2}"
