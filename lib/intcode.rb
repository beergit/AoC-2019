module AoC
      
  class IntCode
    def initialize(args)
      @data = Array.new(args[:data])
      @data[1] = args[:noun] if args.has_key? :noun
      @data[2] = args[:verb] if args.has_key? :verb
      @input = args[:input]
      @pc = 0
      @output = []
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
            val = @input.shift
            raise "No input data" unless val
            write_data(1, val)
            @pc += 2
          when 4
              @output << read_data(1)              
              @pc += 2
          when 5
              if read_data(1) != 0
                @pc = read_data(2)
              else
                @pc += 3
              end  
          when 6
            if read_data(1) == 0
              @pc = read_data(2)
            else
              @pc += 3
            end  
          when 7
            write_data(3, (read_data(1) < read_data(2) ? 1 : 0))
            @pc += 4
          when 8
            write_data(3, (read_data(1) == read_data(2) ? 1 : 0))
            @pc += 4
          when 99
            break
          else  
            raise "Error @#{pc}"
        end
      end  
    end

    def result
      @data.first
    end

    def diagnostic
      @output.last
    end
     
    def write_data(offset, value)
      if @param_modes[offset - 1] == 0
        @data[@data[@pc + offset]] = value
      else
        @data[@pc + offset ] = value
      end  
    end  

    def read_data(offset)
      @param_modes[offset - 1] == 0 ?  @data[@data[@pc + offset]] : @data[@pc + offset]
    end  
  end

end


