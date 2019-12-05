$LOAD_PATH <<  '../lib'
require 'intcode'
class Advent5
  def initialize(ag)
    @args = ag
  end

  def part1_2
    AoC::IntCode.new(@args).diagnostic
  end
end
