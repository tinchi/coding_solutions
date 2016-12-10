require_relative 'graph'

class Graph
  # can stuck in infinit loop
  def build_graph elements, dependancies
    self.nodes = elements.map {|n| Node.new(n) }

    dependancies.each do |(a, b)|
      # puts "#{a} => #{b}"

      self.add_edge(self.nodes.select {|node| node.name == b }[0], self.nodes.select {|node| node.name == a }[0])
    end
  end

  def build_order
    builds = []
    to_build = nodes.dup

    while to_build.any?
      currect = to_build.shift

      currect.adjacents.delete_if {|adj| builds.include?(adj)}

      if currect.adjacents.empty?
        builds << currect
      else
        to_build << currect
      end
    end

    builds
  end

  def build_order2
    @state = {}
    @order = []

    nodes.each do |node|
      return nil if !dfs(node)
    end

    @order
  end

  def dfs node
    return true if @order.include?(node)

    return false if @state[node.name] == :partial #stuck in to Cycle

    if @state[node.name].nil?
      @state[node.name] = :partial

      node.adjacents.each do |adj|
        dfs(adj) unless @order.include?(adj)
      end

      @state[node] = :complete
      @order << node
    end

    return true
  end
end

g = Graph.new()
g2 = Graph.new()

g.build_graph(%i(a b c d e f), [%i(a d), %i(f b), %i(b d), %i(f a), %i(d c)])

g2.build_graph(%i(a b c d e f), [%i(a d), %i(f b), %i(b d), %i(f a), %i(d c)])

p g.build_order.map(&:name) == %i(e f a b d c)
p g2.build_order2.map(&:name) == %i(f a b d c e)