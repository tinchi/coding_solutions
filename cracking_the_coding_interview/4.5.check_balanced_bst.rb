require_relative 'tree'

class Tree
  def bst_balanced?
    check_BST(root)
  end

  def check_BST node, min=nil, max=nil
    return true if node == nil

    return false if (min && node.data < min) || (max && node.data > max)

    check_BST(node.left, min, node.data) && check_BST(node.right, node.data, max)
  end
end

# o(n)
tree = Tree.construct_BST([1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9])
tree2 = Tree.construct_BST([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

p tree.bst_balanced? == true
p tree2.bst_balanced? == true