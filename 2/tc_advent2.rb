#!/usr/bin/ruby
require_relative "advent2"
require "test/unit"

Test1_1 = [[1,9,10,3,2,3,11,0,99,30,40,50], 3500]
Test1_2 = [[1,0,0,0,99], 2]
Test1_3 = [[2,3,0,3,99], 2]
Test1_4 = [[2,4,4,5,99,0], 2]
Test1_5 = [[1,1,1,4,99,5,6,0,99], 30]

class TestAdvent2 < Test::Unit::TestCase
 
  def test_part1
    assert_equal(Test1_1[1], Advent2.new(Test1_1[0]).part1)
    assert_equal(Test1_2[1], Advent2.new(Test1_2[0]).part1)
    assert_equal(Test1_3[1], Advent2.new(Test1_3[0]).part1)
    assert_equal(Test1_4[1], Advent2.new(Test1_4[0]).part1)
    assert_equal(Test1_5[1], Advent2.new(Test1_5[0]).part1)
  end
end
