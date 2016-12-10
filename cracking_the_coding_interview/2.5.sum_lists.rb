require 'minitest'
require 'minitest/autorun'

# this algorithm is soo soo, need to put some more time later

class Node < Struct.new(:data, :next)
  attr_accessor :size

  alias :length :size

  def sum n2
    n1 = self

    new_head = Node.new(0)
    temp_list = new_head
    sum = 0

    while n1 != nil || n2 != nil
      sum = temp_list.data
      sum += n1.data if n1
      sum += n2.data if n2

      temp_list.data = sum % 10

      sum /= 10

      n1 = n1.next unless n1.nil?
      n2 = n2.next unless n2.nil?

      temp_list.next = Node.new(sum) if sum > 0

      if !n1.nil? || !n2.nil?
        temp_list = temp_list.next
      end
    end

    return new_head
  end
end

class LinkedListSum < Minitest::Test
  def test_simple_case
    head1 = Node.new(7, Node.new(1, Node.new(6)))
    head2 = Node.new(5, Node.new(9, Node.new(2)))
    head3 = Node.new(5, Node.new(9, Node.new(8)))
    head4 = Node.new(5, Node.new(9, Node.new(3)))

    puts head1.sum(head4)

    assert head1.sum(head2) == Node.new(2, Node.new(1, Node.new(9)))
    assert head1.sum(head3) == Node.new(2, Node.new(1, Node.new(5, Node.new(1))))
  end
end