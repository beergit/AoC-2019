$LOAD_PATH <<  '../lib'
require 'intcode'
Colors = {:Black => 0, :White => 1}
Turn = [:Left, :Right]
Dirs = {
  [:North, :Right] => :East,
  [:North, :Left]  => :West,
  [:East, :Right]  => :South,
  [:East, :Left]   => :North,
  [:South, :Right] => :West,
  [:South, :Left]  => :East,
  [:West, :Right]  => :North,
  [:West, :Left]   => :South,
}
class Advent11
  def initialize(code)
    @code = code
    @input = []
    @output = []
    @int_code = AoC::IntCode.new(@code, [@output, @input])
    @pos = [0, 0]
    @map = {}
    @dir = :North
  end  

  def part1(start = Colors[:Black])
    @map[@pos] ||= start
    until @int_code.halted?
      @map[@pos] ||= Colors[:Black]
      @output << @map[@pos]
      @int_code.run
      @map[@pos] = @input.shift
      t = Turn[@input.shift] 
      @dir = Dirs[[@dir, t]]
      case @dir
        when :North
          @pos = [@pos[0], @pos[1] - 1]
        when :East
          @pos = [@pos[0] + 1, @pos[1]]
        when :South
          @pos = [@pos[0], @pos[1] + 1]
        when :West
          @pos = [@pos[0] - 1, @pos[1]]
      end
    end
    @map.size
  end  
  def part2
    s = ''
    part1(Colors[:White])
    dim = [
      @map.keys.map{|k| k[0]}.min,
      @map.keys.map{|k| k[0]}.max,
      @map.keys.map{|k| k[1]}.min,
      @map.keys.map{|k| k[1]}.max
    ]
    (dim[2]..dim[3]).each do |line|
      (dim[0]..dim[1]).each{|row| s += (@map[[row, line]] == 1 ? 'X' :  ' ')}
      s += "\n"
    end  
    s
  end  
end
      
