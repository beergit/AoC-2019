#!/usr/bin/ruby
require_relative "advent5"
require "test/unit"


class TestAdvent5 < Test::Unit::TestCase

  def setup
    @test1_1 = [[3,9,8,9,10,9,4,9,99,-1,8], 8, 1]
    @test1_2 = [[3,9,8,9,10,9,4,9,99,-1,8], 7, 0]
    @test1_3 = [[3,9,7,9,10,9,4,9,99,-1,8], 7, 1]
    @test1_4 = [[3,9,7,9,10,9,4,9,99,-1,8], 8, 0]
    @test1_5 = [[3,3,1108,-1,8,3,4,3,99], 8, 1]
    @test1_6 = [[3,3,1108,-1,8,3,4,3,99], 5, 0]
    @test1_7 = [[3,3,1107,-1,8,3,4,3,99], 6, 1]
    @test1_8 = [[3,3,1107,-1,8,3,4,3,99], 8, 0]
    @test1_9 = [[3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 0, 0]
    @test1_10 = [[3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], 5, 1]
    @test1_11 = [[3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 0, 0]
    @test1_12 = [[3,3,1105,-1,9,1101,0,0,12,4,12,99,1], 1, 1]

    @test1_13 = [[3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
    1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
    999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 7, 999]

    @test1_14 = [[3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
    1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
    999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 8, 1000]

    @test1_15 = [[3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
    1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
    999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], 9, 1001]
  end


  def test_parts
    assert_equal(@test1_1[2], Advent5.new(@test1_1[0], @test1_1[1]).part1_2)
    assert_equal(@test1_2[2], Advent5.new(@test1_2[0], @test1_2[1]).part1_2)
    assert_equal(@test1_3[2], Advent5.new(@test1_3[0], @test1_3[1]).part1_2)
    assert_equal(@test1_4[2], Advent5.new(@test1_4[0], @test1_4[1]).part1_2)
    assert_equal(@test1_5[2], Advent5.new(@test1_5[0], @test1_5[1]).part1_2)
    assert_equal(@test1_6[2], Advent5.new(@test1_6[0], @test1_6[1]).part1_2)
    assert_equal(@test1_7[2], Advent5.new(@test1_7[0], @test1_7[1]).part1_2)
    assert_equal(@test1_8[2], Advent5.new(@test1_8[0], @test1_8[1]).part1_2)
    assert_equal(@test1_9[2], Advent5.new(@test1_9[0], @test1_9[1]).part1_2)
    assert_equal(@test1_10[2], Advent5.new(@test1_10[0], @test1_10[1]).part1_2)
    assert_equal(@test1_11[2], Advent5.new(@test1_11[0], @test1_11[1]).part1_2)
    assert_equal(@test1_12[2], Advent5.new(@test1_12[0], @test1_12[1]).part1_2)
    assert_equal(@test1_13[2], Advent5.new(@test1_13[0], @test1_13[1]).part1_2)
    assert_equal(@test1_14[2], Advent5.new(@test1_14[0], @test1_14[1]).part1_2)
    assert_equal(@test1_15[2], Advent5.new(@test1_15[0], @test1_15[1]).part1_2)
  end
end
