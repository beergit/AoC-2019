#!/usr/bin/ruby
require_relative "advent7"
d = File.new('input').read.split(',').map(&:to_i)
puts "work: #{Advent7.new(d).part(1)}"
puts "work: #{Advent7.new(d).part(2)}"
