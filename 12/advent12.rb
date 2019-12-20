class Moon
  def initialize(p)
    @position = p
    @velocity = [0]*3
  end
end  
class Advent1
  def initialize(d)
    d.each_line do |line|
      pm = /<x=(-?\d+),\s*y=(-?\d+),\s*z=(-?\d+)>/.match(line)
      @moons << Mon.new([pm[1].to_i, pm[2].to_i, pm[3].to_i])
    end
  def part1(steps)

  end  
  def part2
  end  

  private

end

