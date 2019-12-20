$LOAD_PATH <<  '../lib'
require 'intcode'

Tiles = [:Wall, :Moved, :Oxygen_System, :Visited]
Dirs = [[0, -1], [0, 1], [-1, 0], [1, 0]]
class Advent13
  def initialize(code)
    @code = code
    @input = []
    @output = []
    @int_code = AoC::IntCode.new(@code, [@output, @input])
    @map = {[0, 0] => :Moved}
    @walls = []
  end  


  def part1()
    pos = [0, 0]
    until @map[pos] == :Oxygen_System
      pos = @map.keys.select{|k| @map[k] == :Moved}.sort{|a, b| (a[0] - a[1]).abs  <=> (b[0] - b[1]).abs }.first
      puts pos.join(', ')  
      move(pos)
    end

      
      
  end
  private
  def move(pos)
    @map[pos] = :Visited
    (1..4).each do |dir|
      new_pos = [pos[0] + Dirs[dir - 1][0], pos[1] + Dirs[dir - 1][1]]
      next if @map[new_pos]
      @output << dir
      @int_code.run
      @map[new_pos] = Tiles[@input.shift]
    end
  end
end

d = File.new('input').read.split(',').map(&:to_i)
puts "part1: #{Advent13.new(d).part1}"













