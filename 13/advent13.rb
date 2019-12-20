$LOAD_PATH <<  '../lib'
require 'intcode'

Tiles = [' ', '#', 'X', '-', 'O']
class Advent13
  def initialize(code)
    @code = code
    @code[0] = 2
    @input = [1, 1, 1]
    @output = []
    @int_code = AoC::IntCode.new(@code, [@input, @output])
  end  

  def part1()
    @int_code.run
    @map = []
    (@output.size/3).times do |idx|
      p = @output[3*idx, 3]
      @map[p[1]] ||= []
      @map[p[1]][p[0]] = p[2]
    end
    str = "\n"
    @map.each do |y|
      str += y.inject(''){|s, x| s += Tiles[x]} + "\n"
    end
    puts str
      

  end
  private

end

d = File.new('input').read.split(',').map(&:to_i)
puts "part1: #{Advent13.new(d).part1}"













