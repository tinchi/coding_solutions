require_relative 'tree'

class Tree
  def level_list
    result = []
    current = [root]

    while current.size > 0
      result << current

      parents = current
      current = []

      parents.each do |parent|
        current << parent.left unless parent.left.nil?
        current << parent.right unless parent.right.nil?
      end
    end

    result
  end
end

tree = Tree.construct_BST([1, 2, 3, 4, 5, 6, 7, 8, 9])

tree.level_list.each_with_index do |array, i|
  p [i, array.map(&:data)]
end