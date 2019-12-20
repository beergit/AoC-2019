require 'fibonacci_heap' # https://rubygems.org/gems/fibonacci_heap

class Cell
  include Comparable
  attr_reader(:distance, :position, :parent, :border)
  attr_accessor(:finished, :type)

  def initialize(t, p, b = nil)
    @type = t
    @position = p
    @finished = false
    @border = b
  end

  def set!(d, p)
    @distance = d
    @parent = p
  end

  def portal?
    not %w(# . AA ZZ).include?(type)
  end

  def <=>(other)
    distance <=> other.distance
  end

end
class Advent20
  def initialize(c)
    @heap = FibonacciHeap::Heap.new
    @lines = c.each_line.map(&:chop)
  end

  def part1
    map = gen_map(@lines, 1)
    dijkstra(map, :Part1)
    g = map.values.find{|v| v.key.type == 'ZZ'}.key
    g.distance if g
  end

  def part2
    g = nil
    levels = 29 #started with 50, evaluated with max_level
    map = nil
    until g and g.distance
      map = gen_map(@lines, levels)
      map.keys.select{|k| k[2] == 0 and map[k].key.portal? and map[k].key.border == :Outer}.each{|k| map[k].key.type = '#'}
      map.keys.select{|k| k[2] == levels - 1 and map[k].key.portal? and map[k].key.border == :Inner}.each{|k| map[k].key.type = '#'}
      map.keys.select{|k| (1..(levels - 2)).include?(k[2]) and (map[k].key.type == 'AA' or map[k].key.type == 'ZZ')}.each{|k| map[k].key.type = '#'}
      dijkstra(map, :Part2)
      g = map.values.find{|v| v.key.type == 'ZZ'}.key
      levels += 1
    end  
      #puts max_level(g)
      g.distance
  end  
  
  private 
  
  def dijkstra(map, mode)
    max_level = 0
    start = map.values.find{|v| v.key.type == 'AA'}
    start.key.set!(0, nil)
    @heap.insert(start)
    actual = nil
    until @heap.empty? or (actual and actual.type == 'ZZ')
      actual = @heap.pop.key
      actual.finished = true
      neighbors = get_neighbors(map, actual, mode)
      neighbors.each do |nb| 
        if nb.key.distance
          if actual.distance + 1 < nb.key.distance
            nb.key.set!(actual.distance + 1, actual.position)
            @heap.decrease_key(nb)
          end
        else
          nb.key.set!(actual.distance + 1, actual.position)
          @heap.insert(nb)
        end 
      end
    end 
  end

  def gen_map(lines, levels = 1)
    map = {}
    lines.each.with_index do |line, row|
      line.chars.each_with_index do |ch, col|
        r, c = row - 2, col - 2
        case ch
          when '#'
            levels.times{|t| map[[r, c, t]] = FibonacciHeap::Node.new(Cell.new(ch, [r, c, t]))}
          when '.'
            if(row > 1 and lines[row - 1][col] =~ /[A-Z]/)
             levels.times{|t| map[[r, c, t]] = FibonacciHeap::Node.new(Cell.new(lines[row - 2][col] + lines[row - 1][col], [r, c, t], row == 2 ? :Outer : :Inner))}
            elsif(col > 1 and lines[row][col - 1] =~ /[A-Z]/)
             levels.times{|t| map[[r, c, t]] = FibonacciHeap::Node.new(Cell.new(lines[row][col - 2] + lines[row][col - 1], [r, c, t], col == 2 ? :Outer : :Inner))}
            elsif(row < lines.size - 2 and lines[row + 1][col] =~ /[A-Z]/)
             levels.times{|t| map[[r, c, t]] = FibonacciHeap::Node.new(Cell.new(lines[row + 1][col] + lines[row + 2][col], [r, c, t], row == lines.size - 3 ? :Outer : :Inner))}
            elsif(col < line.size - 2 and lines[row][col + 1] =~ /[A-Z]/)
              levels.times{|t| map[[r, c, t]] = FibonacciHeap::Node.new(Cell.new(lines[row][col + 1] + lines[row][col + 2], [r, c, t], col == line.size - 3 ? :Outer : :Inner))}
            else
            levels.times{|t| map[[r, c, t]] = FibonacciHeap::Node.new(Cell.new(ch, [r, c, t]))}
            end
        end    
      end  
    end
    map
  end

  def get_neighbors(map, actual, mode)
    neighbors = [[-1, 0], [0, -1], [1, 0], [0, 1]].map{|p| map[[actual.position[0] + p[0], actual.position[1] + p[1], actual.position[2]]]}.reject{|nb| nb.nil? or nb.key.type == '#' or nb.key.finished}
    if actual.portal?
      if mode == :Part1
        neighbors << map.values.select{|v| v.key.type == actual.type and v.key != actual}[0] 
      else
        neighbors << map.values.select{|v| v.key.type == actual.type  and v.key.position[0, 2] != actual.position[0, 2] and v.key.position[2] == (actual.position[2] + (actual.border == :Outer ? -1 : 1))}[0] 
      end
    end
    neighbors
  end

  def max_level(g)
    max_level = 0
    if g
      p = g.position
      max_level = 0
      while p
        max_level = p[2] if p[2] > max_level 
        p = map[p].key.parent
      end
    end
    max_level
  end

end
