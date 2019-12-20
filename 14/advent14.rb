$LOAD_PATH <<  '../lib'
require 'intcode'

class Advent14
  def initialize(code)
    @code = code
    @map = {}
    @code.each_line do |line|
      reaction = line.scan(/\d+\s\w+/)
      chem = reaction.last.split  
      @map[chem[1].to_sym] = [chem[0].to_i, {}]
      reaction[0..-2].each{|c| @map[chem[1].to_sym][1][c.split[1].to_sym] = c.split[0].to_i} 
    end  
  end  

  def part1()
#  lst = {@map[:FUEL[1]}
#  until lst.keys != [:ORE]
#    ch = lst.shift
#    val = @map[ch[0]]
#    lst[ch[0]] ||= 0
#    lst

    
puts
  end
  private

end

d = File.new('input').read
puts "part1: #{Advent14.new(d).part1}"













