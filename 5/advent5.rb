$LOAD_PATH <<  '../lib'
require 'intcode'
class Advent5
  def initialize(co, phase)
    @int_code = AoC::IntCode.new(co, [[phase], []])
  end

  def part1_2
    @int_code.run
    @int_code.diagnostic
  end
end
