require_relative 'tree'

class Tree
  class Node
    def print_chain
      "#{data} => #{left ? left.data : '' }, #{right ? right.data : ''} \n #{left ? left.print_chain : ''}                   #{right ? right.print_chain : ''}"
    end
  end
  def print
    puts root.print_chain

  end

  def find_in_order_successor node
    succ = nil
    temp_root = root

    while temp_root != nil
      if node.data < temp_root.data
        succ = temp_root
        temp_root = temp_root.left
      elsif node.data >= temp_root.data
        temp_root = temp_root.right
      end
    end

    succ
  end
end

# o(n)
tree = Tree.construct_BST([1, 2, 3, 4, 5, 6, 7, 8, 9])
tree2 = Tree.construct_BST([4, 8, 10, 12, 14, 20, 22])

p tree.find_in_order_successor(Tree::Node.new(7)).data == Tree::Node.new(8).data
p tree2.find_in_order_successor(Tree::Node.new(14)).data == Tree::Node.new(20).data