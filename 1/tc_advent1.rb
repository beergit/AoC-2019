#!/usr/bin/ruby
require_relative "advent1"
require "test/unit"
Test1_1  = [[12], 2]
Test1_2  = [[14], 2]
Test1_3  = [[1969], 654]
Test1_4  = [[100756], 33583] 

Test2_1  = [[14], 2] 
Test2_2  = [[1969], 966] 
Test2_3  = [[100756], 50346] 

class TestAdvent1 < Test::Unit::TestCase
 
  def test_part1
    assert_equal(Test1_1[1], Advent1.new(Test1_1[0]).part1)
    assert_equal(Test1_2[1], Advent1.new(Test1_2[0]).part1)
    assert_equal(Test1_3[1], Advent1.new(Test1_3[0]).part1)
    assert_equal(Test1_4[1], Advent1.new(Test1_4[0]).part1)
  end
  def test_part2
    assert_equal(Test2_1[1], Advent1.new(Test2_1[0]).part2)
    assert_equal(Test2_2[1], Advent1.new(Test2_2[0]).part2)
    assert_equal(Test2_3[1], Advent1.new(Test2_3[0]).part2)
  end
end

