$LOAD_PATH <<  '../lib'
require 'intcode'

Tiles = %w(. #)

class Advent19

  def initialize(code)
    @code = code
    @map = {}
  end  

  def part1(dim)
    output = []
    dim.times.each do |x| 
      dim.times.each do |y| 
        input = [x, y]
        AoC::IntCode.new(@code, [input, output]).run
        @map[[x, y]] = output.shift
      end
    end
    @map.values.count(1)
  end

  def part2(dim)
    y = dim
    x = 0
    output = []
    until output.shift == 0
      until output.shift == 1
        input = [x, y]
        AoC::IntCode.new(@code, [input, output]).run
        x += 1
      end
      input = [x + dim - 1, y - dim + 1]
      AoC::IntCode.new(@code, [input, output]).run
      if(output.shift == 1)
        input = [x + dim, y - dim + 1]
        AoC::IntCode.new(@code, [input, output]).run
      end
      y += 1
    end
    x*10000 + y - dim
  end

  def to_s
    s = '    ' + @dim[0].times.to_a.map{|t| t%10}.join + "\n"
    @dim[1].times do |row|
      s += ("%03d " % row)
      @dim[0].times{|col| s += Tiles[@map[[col, row]]]}
      s += "\n"
    end
    s
  end
end
