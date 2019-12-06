#!/usr/bin/ruby

class Orb
  include Comparable
  attr_reader(:neighbors)
  attr_accessor(:distance, :finished)
  def initialize
    @neighbors = []
    @distance = nil
  end
  def add_neighbor(n)
    @neighbors << n unless @neighbors.include? n
  end
  def finish!() @finished = true end
  def finished?()  @finished end  
  def <=>(other) distance <=> other.distance end
end

class Advent6
  def initialize(d, start)
    @orbs = {}
    d.split.map{|d| d.split(')')}.each do |n|
      @orbs[n[0]] ||= Orb.new
      @orbs[n[0]].add_neighbor(n[1]) 
      @orbs[n[1]] ||= Orb.new
      @orbs[n[1]].add_neighbor(n[0]) 
    end
    @orbs[start].distance = 0
    pr_queue  = [@orbs[start]]
    until pr_queue.empty?
      pr_queue.sort!
      orb = pr_queue.shift
      orb.finish!
      orb.neighbors.each do |nb|
        nb_orb = @orbs[nb]
        next if nb_orb.finished?
        if(nb_orb.distance)
          nb_orb.distance = orb.distance + 1 if orb.distance + 1 < nb_orb.distance
        else
          nb_orb.distance = orb.distance + 1
          pr_queue << nb_orb
        end
      end
    end
  end

  def part1
    @orbs.values.inject(0){|s, c| s += c.distance}
  end

  def part2
    @orbs['SAN'].distance - 2
  end  

end
