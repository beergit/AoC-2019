class Advent1
  def initialize(d)
    @input = d
  end
  def part1
    @input.inject(0){|s, c| s += c/3 - 2}
  end  
  def part2
     @input.inject(0){|s, c| s += fuel(c)}
  end  

  private
   def fuel(f)
     sum = 0
     while(f > 0)
       f = f/3 - 2
       sum += f if f > 0
     end
     sum
   end  

end

