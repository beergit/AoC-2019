#!/usr/bin/ruby
require_relative "advent20"

d = File.new('input').read
puts "part1: #{Advent20.new(d).part1}"
puts "part2: #{Advent20.new(d).part2}"
