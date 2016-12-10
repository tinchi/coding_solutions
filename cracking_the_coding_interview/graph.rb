require 'set'

class Node < Struct.new(:name, :adjacents)
  def initialize(name, adjacents=[]) #set provide uniqness
    super
  end

  def to_s
    name
  end
end

class Graph < Struct.new(:nodes)
  def initialize(nodes=[])
    super
  end

  def add_edge node1, node2
    node1.adjacents << node2
  end

  def check_path node1, node2
    @visited = []

    [dfs(node1, node2), bfs(node1, node2)]
  end

  def dfs node1, node2
    return true if node1 == node2

    @visited << node1

    node1.adjacents.each do |n|
      next if @visited.include?(n)

      return true if dfs(n, node2)
    end

    return false
  end

  def bfs node1, node2
    @visited = []

    queue = [node1]

    while queue.any?
      current_node = queue.shift

      return true if current_node == node2

      current_node.adjacents.each do |adjacent_node|
        next if @visited.include?(adjacent_node)

        queue << adjacent_node
        @visited << adjacent_node
      end
    end

    false
  end
end
