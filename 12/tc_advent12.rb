#!/usr/bin/ruby
require_relative "advent1"
require "test/unit"
class TestAdvent1 < Test::Unit::TestCase
 
  def setup
    @test1_1  = [[12], 2]
    @test1_2  = [[14], 2]
    @test1_3  = [[1969], 654]
    @test1_4  = [[100756], 33583] 

    @test2_1  = [[14], 2] 
    @test2_2  = [[1969], 966] 
    @test2_3  = [[100756], 50346] 
  end  


  def test_part1
    assert_equal(@test1_1[1], Advent1.new(@test1_1[0]).part1)
    assert_equal(@test1_2[1], Advent1.new(@test1_2[0]).part1)
    assert_equal(@test1_3[1], Advent1.new(@test1_3[0]).part1)
    assert_equal(@test1_4[1], Advent1.new(@test1_4[0]).part1)
  end
  def test_part2
    assert_equal(@test2_1[1], Advent1.new(@test2_1[0]).part2)
    assert_equal(@test2_2[1], Advent1.new(@test2_2[0]).part2)
    assert_equal(@test2_3[1], Advent1.new(@test2_3[0]).part2)
  end
end
