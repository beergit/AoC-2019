$LOAD_PATH <<  '../lib'
require 'intcode'
class Advent2
  def initialize(code)
    @int_code = AoC::IntCode.new(code)
  end
  def part1(nv = nil)
    @int_code.set_nv!(nv) if nv
    @int_code.run
    @int_code.result
  end
  def part2(final)
    (0..99).to_a.repeated_permutation(2).each do |p|
      @int_code.reset!
      @int_code.set_nv!(p)
      @int_code.run
      return 100*p[0] + p[1] if final == @int_code.result
    end
    nil
  end
end
