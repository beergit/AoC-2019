$LOAD_PATH <<  '../lib'
require 'intcode'

class Robot
  attr_reader(:input, :output)
  def initialize(code, io)
    @input = io[0]
    @output = io[1]
    @intcode = AoC::IntCode.new(Array.new(code), [@input, @output])
  end

  def run
    @intcode.run
    @output
    end
    def to_s
      @output.map(&:chr)
    end  
end

class Advent17
  def initialize(c)
    @input = []
    @output = []
    code = c.split(',').map(&:to_i)
    @robot = Robot.new(code, [@input, @output])
  end  

  def part1
  @robot.run
  str = @robot.to_s
   end  
  
  def part2
  end  

end

adv = Advent17.new(File.new('input').read)
str = adv.part1
str.join.each_line{|line| puts line}
