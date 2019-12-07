$LOAD_PATH <<  '../lib'
require 'intcode'
class Advent7
def initialize(code)
  @code = code
end  

  def part1
   max = nil
   out = 0
   5.times.to_a.permutation.each do |phases|
     pipes = 5.times.map{|p| [phases[p]]}
     pipes[0] << 0
     5.times.each do |amp|
       int_code = AoC::IntCode.new(@code, [pipes[amp], pipes[amp == 4 ? 0 : amp + 1]])
       int_code.run
       out = int_code.diagnostic
     end
     max = out if max.nil? or out > max
   end  
   max
  end

  def part2
    max = nil
    5.times.to_a.permutation.each do |phases|
      pipes = 5.times.map{|p| [phases[p] + 5]}
      pipes[0] << 0
      int_codes = 5.times.map{|amp| AoC::IntCode.new(@code, [pipes[amp], pipes[amp == 4 ? 0 : amp + 1]])}
      loop do
        5.times.each{|amp| int_codes[amp].run}  
        break if int_codes.any?{|ic| ic.halted?}
      end
      last_out = int_codes[4].diagnostic
      max = last_out if max.nil? or last_out > max
    end  
    max
  end
end














