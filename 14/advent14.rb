$LOAD_PATH <<  '../lib'
require 'intcode'
class Advent14
  def initialize(code)
    @code = code
    @reactions = {}
    @code.each_line do |line|
      reaction = line.scan(/\d+\s\w+/)
      @reactions[reaction.last.split[1].to_sym] = {
        :result => reaction.last.split[0].to_i,
        :reactants => reaction[0..-2].map(&:split).map{|c| [c[0].to_i, c[1].to_sym]}
      }  
    end  
  end  

  def part1()
  puts
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













