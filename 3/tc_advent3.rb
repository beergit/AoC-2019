#!/usr/bin/ruby
require_relative "advent3"
require "test/unit"
class TestAdvent3 < Test::Unit::TestCase

  def setup
    @test1_1 = ["R8,U5,L5,D3", "U7,R6,D4,L4", 6]
    @test1_2 = ["R75,D30,R83,U83,L12,D49,R71,U7,L72", "U62,R66,U55,R34,D71,R55,D58,R83", 159]
    @test1_3 = ["R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51", "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7", 135]
    @test2_1 = [@test1_1[0], @test1_1[1], 30]
    @test2_2 = [@test1_2[0], @test1_2[1], 610]
    @test2_3 = [@test1_3[0], @test1_3[1], 410]
  end


  def test_part1
    assert_equal(@test1_1[2], Advent3.new(@test1_1[0, 2]).part1)
    assert_equal(@test1_2[2], Advent3.new(@test1_2[0, 2]).part1)
    assert_equal(@test1_3[2], Advent3.new(@test1_3[0, 2]).part1)
  end
  def test_part2
    assert_equal(@test2_1[2], Advent3.new(@test2_1[0, 2]).part2)
    assert_equal(@test2_2[2], Advent3.new(@test2_2[0, 2]).part2)
    assert_equal(@test2_3[2], Advent3.new(@test2_3[0, 2]).part2)
  end
end
