require_relative 'tree'

class Tree
  class Node
    def hight
      min_max = [0]

      min_max << left.hight + 1 unless left.nil?
      min_max << right.hight + 1 unless right.nil?

      min_max.max
    end
  end

  def balanced?
    puts [root.left.hight, root.right.hight]
    (root.left.hight - root.right.hight).abs <= 1
  end

  def balanced2?
    check_hight(root) != -2
  end

  def check_hight node
    return -1 if node == nil

    return -2 if (left_hight = check_hight(node.left)) == -2
    return -2 if (right_hight = check_hight(node.right)) == -2

    return -2 if (left_hight - right_hight).abs > 1

    [left_hight, right_hight].max + 1
  end

  def hight node
    node
  end
end
tree = Tree.construct_BST([1, 2, 3, 4, 5, 6, 7, 8, 9])

p tree.balanced? == true
p tree.balanced2? == true