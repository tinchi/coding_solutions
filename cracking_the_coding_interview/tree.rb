class Tree < Struct.new(:root)
  Node = Struct.new(:data, :left, :right)

  def self.construct_BST array
    @array = array
    root = create_minimal_BST(0, array.length - 1)
    Tree.new(root)
  end

  def self.create_minimal_BST start, _end
    return nil if _end < start

    mid = (start + _end) / 2

    node = Node.new(@array[mid])

    node.left = create_minimal_BST(start, mid - 1)
    node.right = create_minimal_BST(mid + 1, _end)

    return node
  end
end