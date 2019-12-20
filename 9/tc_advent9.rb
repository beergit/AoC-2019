#!/usr/bin/ruby
require_relative "advent9"
require "test/unit"

class TestAdvent9 < Test::Unit::TestCase

  def setup
    code1 = [109,1,204,-1,1001,100,1,100,1008,100,16,101,1006,101,0,99]
    code3 = [104,1125899906842624,99]
    @test1_1 = [code1]*2
    @test1_2 = [[1102,34915192,34915192,7,4,7,99,0],16]
    @test1_3 = [code3, code3[1]]
  end

  def test_part1
    assert_equal(@test1_1[1], Advent9.new(@test1_1[0]).part)
    assert_equal(@test1_2[1], Advent9.new(@test1_2[0]).part[0].to_s.size)
    assert_equal([@test1_3[1]], Advent9.new(@test1_3[0]).part)
  end
end
