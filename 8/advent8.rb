class Advent8
  def initialize(d, w, h)
    (@width, @height) = w, h
    @pix =  d.scan(/.{#{@width*@height}}/)
  end
  def part1
    m =  @pix.min{|a, b| a.count('0') <=> b.count('0')}
    m.count('1')*m.count('2')
  end  
  def part2
    layers = @pix.map{|d| d.scan(/.{#{@width}}/)}
    px = (@width*@height).times.map{|idx| layers.size.times.map{|l| layers[l][idx/@width][idx%(@width)]}.find{|p| p != '2'}}  
    px.inject(''){|s, p| s += (p == '0' ? ' ' : 'X')}.scan(/.{#{@width}}/).join("\n")
  end
end
