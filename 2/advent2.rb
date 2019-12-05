$LOAD_PATH <<  '../lib'
require 'intcode'
class Advent2
  def initialize(ag)
    @args = ag
  end

  def part1
    AoC::IntCode.new(@args).result
  end
  def part2
    (0..99).to_a.repeated_permutation(2).each do |p|
      @args[:noun] = p[0]      
      @args[:verb] = p[1]      
      return 100*p[0] + p[1] if @args[:final] == AoC::IntCode.new(@args).result
    end
  end
end
