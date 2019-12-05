require 'erb'

t1 = ERB.new <<EOF
#!/usr/bin/ruby
require_relative "advent<%= day %>"
require "test/unit"

class TestAdvent<%= day %> < Test::Unit::TestCase
 
  def test_part1
    assert(false)
  end
  def test_part2
    assert(false)
  end
end
EOF

t2 = ERB.new <<EOF
class Advent<%= day %>
  def part1
  end  
  def part2
  end  
end
EOF

t3 = ERB.new <<EOF
#!/usr/bin/ruby
require_relative "advent<%= day %>"

puts Advent<%= day %>.new.part1
puts Advent<%= day %>.new.part2
EOF
templates = [t1, t2, t3]
fnames = %w(tc_advent advent solve)

1.upto(25) do |day|
  d = day.to_s
  Dir.mkdir(d, 0755) unless Dir.exist?(d)
  fnames.size.times do |idx|
    tc_fname = "#{day}/#{fnames[idx]}#{day}.rb"
    if File.exist?(tc_fname)
      puts "Skip " + tc_fname
    else
      fd =  File.new(tc_fname, File::CREAT|File::RDWR, 0755)
      fd.write(templates[idx].result(binding))
      fd.close
    end    
  end
end  
