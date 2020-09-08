require_relative './chemical'

class Advent14
  def initialize(receipes)
  @chemicals= {}
    receipes.each_line do |line|
      chem = Chemical.new(line)
      @chemicals[chem.name] = chem
    end
    @chemicals[:ORE] = Chemical.new(:ORE)
  end

  def produce(receipe)
    rep = {} 
    receipe.keys.each do |k|
      unless  k == :ORE
        r = @chemicals[k].produce(receipe[k])
        r.each{|k, v| rep.has_key?(k) ? rep[k] += v : rep[k] = v}
      end
    end
    rep
  end

  def part1
    rep = produce(@chemicals[:FUEL].receipe)
    ore = rep[:ORE].to_i
    while rep.size > 1
      rep = produce(rep)
      ore += rep[:ORE].to_i
    end
    ore
  end

  def part2()
    count = 0
    reserve = 1000000000000
    while reserve >= 0
      reserve -= part1
      count += 1
    end
    count - 1
  end  
end  
     
