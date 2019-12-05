Dirs = {
  'R' => [1, 0],
  'L' => [-1, 0],
  'D' => [0, 1],
  'U' => [0, -1]
}
class Advent3
  def initialize(data)
    wx = [[[[0, 0], 0]], [[[0, 0], 0]]]
    [0, 1].each do |wire|
      data[wire].split(',').each do |d|
        dist = d[1..-1].to_i
        dist.times{ wx[wire] << [[wx[wire].last[0][0] + Dirs[d[0]][0], wx[wire].last[0][1] + Dirs[d[0]][1]], wx[wire].last[1] + 1]}
      end  
      w = [0, 1].map{|idx| wx[idx].map{|w| w[0]}[1..-1]} 
      @crosses = w[0] & w[1]
      @wires = wx.map{|w| w.to_h}
    end
  end
  
  def part1
    f = @crosses.min{|a, b| (a[0].abs + a[1].abs) <=> (b[0].abs + b[1].abs)}
    f[0].abs + f[1].abs
  end  

  def part2
    f = @crosses.min{|a, b| (@wires[0][a] + @wires[1][a]) <=> (@wires[0][b] + @wires[1][b])}
    @wires[0][f] + @wires[1][f]
  end  
end
