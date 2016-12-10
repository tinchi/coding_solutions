require_relative 'tree'

class Tree
  def is_sub_tree another_tree
    sub_tree(self.root, another_tree.root)
  end

  def sub_tree node1, node2
    return false if node1.nil?

    if node1.data == node2.data && match_tree(node1, node2)
      return true
    else
      return sub_tree(node1.left, node2) || sub_tree(node1.right, node2)
    end
  end

  def match_tree node1, node2
    if node1 == nil && node2 == nil
      return true
    elsif node1 == nil || node2 == nil
      return false
    elsif node1.data != node2.data
      return false
    else
      match_tree(node1.left, node2.left) && match_tree(node1.right, node2.right)
    end
  end
end

tree = Tree.construct_BST([1, 2, 3, 4, 5, 6, 7, 8, 9])

tree2 = Tree.construct_BST([1, 2, 3])
tree3 = Tree.construct_BST([2, 5, 7])

tree4 = Tree.construct_BST([1, 2, 3, 4, 5, 6, 7, 8, 9])

p tree.is_sub_tree tree2
p tree.is_sub_tree tree3
p tree.is_sub_tree tree4
