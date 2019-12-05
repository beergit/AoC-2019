#!/usr/bin/ruby

part1 =  (146810..612564).map{|n| n.to_s.chars}.select{|n| n.sort == n and n.uniq != n}
part2 = part1.select{|n| n.any?{|m| n.count(m) == 2}}
puts "part1: #{part1.size}"
puts "part2: #{part2.size}"
