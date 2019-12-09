$LOAD_PATH <<  '../lib'
require 'intcode'
class Advent9

  def initialize(code, input = [])
    @code = code
    @pipes = [input, []]
    @int_code = AoC::IntCode.new(@code, @pipes)
  end  

  def part
    @int_code.run
    @int_code.output
  end

end














