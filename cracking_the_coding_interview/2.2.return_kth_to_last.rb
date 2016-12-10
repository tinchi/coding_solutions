require 'minitest'
require 'minitest/autorun'

class Node < Struct.new(:data, :next)
  attr_accessor :size

  alias :length :size

  def append_to_tail d
    e = Node.new(d)
    n = self

    while n.next != nil
      n = n.next
    end

    n.next = e
  end

  def kth_from_last index
    p1 = self
    p2 = self

    index.times do
      p1 = p1.next
    end

    while p1.next != nil
      p1 = p1.next
      p2 = p2.next
    end

    p2
  end
end

class KthLast < Minitest::Test
  def test_run_kth_last
    head = Node.new(1)

    head.append_to_tail(2)
    head.append_to_tail(3)
    head.append_to_tail(4)
    head.append_to_tail(5)
    head.append_to_tail(6)

    assert_kind_of Node, head.kth_from_last(1)
    assert head.kth_from_last(1) == Node.new(5, Node.new(6))
  end
end