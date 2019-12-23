$LOAD_PATH <<  '../lib'
require 'intcode'

class Nic
  attr_reader(:input, :address)
  def initialize(code, adr)
    @address = adr
    @input = [adr]
    @output = []
    @intcode = AoC::IntCode.new(Array.new(code), [@input, @output])
  end

  def run
    @intcode.run
    @output
    end
end

class Advent23
  def initialize(c)
    @nics = []
    code = c.split(',').map(&:to_i)
    50.times{|adr| @nics << Nic.new(code, adr)} 
  end  

  def part1
    loop do
      @nics.each do |nc|
        nc.input << -1 if nc.input.empty?
        out = nc.run
        return out[2] if out[0] == 255
        until out.empty?
          @nics[out[0]].input.shift if @nics[out[0]].input[0] == -1
          @nics[out[0]].input << out[1] << out[2] 
          out.shift(3)
        end
      end
    end  
    -1
  end  
  
  def part2

    nat = []
    last_y = nil
    loop do
      if @nics.all?{|nc| nc.input.empty?}
        return last_y if not last_y.nil? and (last_y == nat[1])
        last_y = nat[1]  
        @nics[0].input << nat[0] << nat[1]
      end
      @nics.each do |nc|
        nc.input << -1 if nc.input.empty?
        out = nc.run
        until out.empty?
          if out[0] == 255
            nat = out[1, 2]
          else  
            @nics[out[0]].input.shift if @nics[out[0]].input[0] == -1
            @nics[out[0]].input << out[1] << out[2] 
          end
          out.shift(3)
        end
      end
    end
    -1
  end  

end














