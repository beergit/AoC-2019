module AoC
      
  class IntCode
    attr_reader(:output)

    def initialize(co, pipe = nil)
      @data = Array.new(co)
      (@input, @output) = pipe
      @pc = 0
      @base = 0 
    end

    def set_nv!(nv)
      @data[1, 2] = nv
    end  

    def run
      loop do
        opcode = @data[@pc]%100
        par = (@data[@pc]/100).to_s.reverse.chars[0, 3]
        @param_modes = 3.times.map{|n| par[n].to_i}
        case opcode
          when 1
            write_data(3, read_data(1) + read_data(2))
            @pc += 4
          when 2
            write_data(3, read_data(1) * read_data(2))
            @pc += 4
          when 3
            break if @input.empty?
            val = @input.shift
            write_data(1, val)
            @pc += 2
          when 4
            @output << read_data(1)              
            @pc += 2
          when 5
            @pc = (read_data(1) != 0  ? read_data(2) : @pc + 3)
          when 6
            @pc = (read_data(1) == 0  ? read_data(2) : @pc + 3)
          when 7
            write_data(3, (read_data(1) < read_data(2) ? 1 : 0))
            @pc += 4
          when 8
            write_data(3, (read_data(1) == read_data(2) ? 1 : 0))
            @pc += 4
          when 9
            @base += read_data(1)
            @pc += 2
          when 99
            @halt = true
            break
          else  
            raise "Error @#{@pc}"
        end
      end  
    end
    
    def halted?() @halt end
    def result() @data.first end
    def diagnostic() @output.last end

private 
    def write_data(offset, value)
      @data[modes(offset)] = value  
    end  

    def read_data(offset)
      @data[modes(offset)].to_i
    end

    def modes(offset)
      case @param_modes[offset - 1]
        when 0
          @data[@pc + offset]
        when 1
          @pc + offset
        when 2
          @base + @data[@pc + offset]
        else
          raise "mode error"
      end
    end
  end

end
