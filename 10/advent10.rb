Pi = Rational(160/50) 

class Advent10
def initialize(pattern)
@asteriods = pattern.each_line.with_index.map{|line, idx| [line.chop, idx]}.map{|idx| idx[0].size.times.find_all{|c| idx[0][c] != '.'}.map{|x| [idx[1], x]}}.inject(:+)
end  

  def part1(steps = 3)
    max_count = 0
    max_target = []
    @asteriods.each do |target|
      ast_map = do_map(target, steps)
      count = ast_map.size
      if count > max_count
        max_count = count 
        max_target = target
      end
    end
    puts max_target.join(', ')
    max_count
  end

def part2(target)

  ast_map = do_map(target)
  puts
end
private
  def do_map(target, steps)
    ast_map  = {}
    @asteriods.each do |ast|
      next if ast == target
      (y, x) = target[0] - ast[0], target[1] - ast[1]
      if x == 0
        ang = (y > 0 ? 0.to_r : Pi)
      else
        a = Rational(y, x)
        wa = steps.times.inject(0.to_r){|s, k| s += Rational(((-1)**k)*(a**(2*k + 1)), 2*k + 1)}
        wa = Math.atan(a).to_r
#wa = a
        ang =  (x > 0.0 ? Pi/4 :3*Pi/4) - wa
      end
      ast_map[ang] ||= []
      ast_map[ang] << ast
    end
    ast_map
  end

end
d = File.new('input').read
puts "part1: #{Advent10.new(d).part1(3)}"


