#!/usr/bin/ruby
require_relative "advent2"
require "test/unit"


class TestAdvent2 < Test::Unit::TestCase
 
  def setup
    @test1_1 = [[1,9,10,3,2,3,11,0,99,30,40,50], 3500]
    @test1_2 = [[1,0,0,0,99], 2]
    @test1_3 = [[2,3,0,3,99], 2]
    @test1_4 = [[2,4,4,5,99,0], 2]
    @test1_5 = [[1,1,1,4,99,5,6,0,99], 30]
  end

  def test_part1
    assert_equal(@test1_1[1], Advent2.new(@test1_1[0]).part1)
    assert_equal(@test1_2[1], Advent2.new(@test1_2[0]).part1)
    assert_equal(@test1_3[1], Advent2.new(@test1_3[0]).part1)
    assert_equal(@test1_4[1], Advent2.new(@test1_4[0]).part1)
    assert_equal(@test1_5[1], Advent2.new(@test1_5[0]).part1)
  end
end
