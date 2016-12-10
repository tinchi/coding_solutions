require_relative 'graph'

g = Graph.new()

g.nodes = (0..9).map {|i| Node.new(i) }

(0..8).each do |i|
  g.add_edge(g.nodes[i], g.nodes[i + 1])
end

p g.check_path(g.nodes[0], g.nodes[8]) == [true, true]
p g.check_path(g.nodes[8], g.nodes[0]) == [false, false]