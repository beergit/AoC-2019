#!/usr/bin/ruby
require_relative "advent5"
require "test/unit"


Test1_1 = [[3,9,8,9,10,9,4,9,99,-1,8], [8], 1]
Test1_2 = [[3,9,8,9,10,9,4,9,99,-1,8], [7], 0]
Test1_3 = [[3,9,7,9,10,9,4,9,99,-1,8], [7], 1]
Test1_4 = [[3,9,7,9,10,9,4,9,99,-1,8], [8], 0]
Test1_5 = [[3,3,1108,-1,8,3,4,3,99], [8], 1]
Test1_6 = [[3,3,1108,-1,8,3,4,3,99], [5], 0]
Test1_7 = [[3,3,1107,-1,8,3,4,3,99], [6], 1]
Test1_8 = [[3,3,1107,-1,8,3,4,3,99], [8], 0]
Test1_9 = [[3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], [0], 0]
Test1_10 = [[3,12,6,12,15,1,13,14,13,4,13,99,-1,0,1,9], [5], 1]
Test1_11 = [[3,3,1105,-1,9,1101,0,0,12,4,12,99,1], [0], 0]
Test1_12 = [[3,3,1105,-1,9,1101,0,0,12,4,12,99,1], [1], 1]

Test1_13 = [[3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], [7], 999]

Test1_14 = [[3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], [8], 1000]

Test1_15 = [[3,21,1008,21,8,20,1005,20,22,107,8,21,20,1006,20,31,
1106,0,36,98,0,0,1002,21,125,20,4,20,1105,1,46,104,
999,1105,1,46,1101,1000,1,20,4,20,1105,1,46,98,99], [9], 1001]

class TestAdvent5 < Test::Unit::TestCase
 
  def test_parts
    assert_equal(Test1_1[2], Advent5.new({:data => Test1_1[0], :input => Test1_1[1]}).part1_2)
    assert_equal(Test1_2[2], Advent5.new({:data => Test1_2[0], :input => Test1_2[1]}).part1_2)
    assert_equal(Test1_3[2], Advent5.new({:data => Test1_3[0], :input => Test1_3[1]}).part1_2)
    assert_equal(Test1_4[2], Advent5.new({:data => Test1_4[0], :input => Test1_4[1]}).part1_2)
    assert_equal(Test1_5[2], Advent5.new({:data => Test1_5[0], :input => Test1_5[1]}).part1_2)
    assert_equal(Test1_6[2], Advent5.new({:data => Test1_6[0], :input => Test1_6[1]}).part1_2)
    assert_equal(Test1_7[2], Advent5.new({:data => Test1_7[0], :input => Test1_7[1]}).part1_2)
    assert_equal(Test1_8[2], Advent5.new({:data => Test1_8[0], :input => Test1_8[1]}).part1_2)
    assert_equal(Test1_9[2], Advent5.new({:data => Test1_9[0], :input => Test1_9[1]}).part1_2)
    assert_equal(Test1_10[2], Advent5.new({:data => Test1_10[0], :input => Test1_10[1]}).part1_2)
    assert_equal(Test1_11[2], Advent5.new({:data => Test1_11[0], :input => Test1_11[1]}).part1_2)
    assert_equal(Test1_12[2], Advent5.new({:data => Test1_12[0], :input => Test1_12[1]}).part1_2)
    assert_equal(Test1_13[2], Advent5.new({:data => Test1_13[0], :input => Test1_13[1]}).part1_2)
    assert_equal(Test1_14[2], Advent5.new({:data => Test1_14[0], :input => Test1_14[1]}).part1_2)
    assert_equal(Test1_15[2], Advent5.new({:data => Test1_15[0], :input => Test1_15[1]}).part1_2)
  end
end
