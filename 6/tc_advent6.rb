#!/usr/bin/ruby
require_relative "advent6"
require "test/unit"

Orbs1 = <<EOF
COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
EOF
Orbs2 = <<EOF
COM)B
B)C
C)D
D)E
E)F
B)G
G)H
D)I
E)J
J)K
K)L
K)YOU
I)SAN
EOF


class TestAdvent6 < Test::Unit::TestCase
  def setup
    @test1_1 = [Orbs1, 42]
    @test2_1 = [Orbs2, 4]
  end

  def test_part1
    assert_equal(@test1_1[1], Advent6.new(@test1_1[0], 'COM').part1)
  end
  def test_part2
    assert_equal(@test2_1[1], Advent6.new(@test2_1[0], 'YOU').part2)
  end
end
