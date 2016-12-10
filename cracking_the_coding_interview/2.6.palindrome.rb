require 'minitest'
require 'minitest/autorun'

class Node < Struct.new(:data, :next)
  def is_palidrome?
    slow = self
    fast = self
    stack = []

    while fast != nil && fast.next != nil
      stack << slow.data
      slow = slow.next
      fast = fast.next.next
    end
    # if case of odd
    slow = slow.next if fast != nil

    while slow != nil
      return false if stack.pop != slow.data

      slow = slow.next
    end

    return true
  end
end

class LinkedListPalidrom < Minitest::Test
  def test_simple_case
    head = Node.new(7, Node.new(1, Node.new(7)))
    head2 = Node.new(5, Node.new(9, Node.new(2)))

    assert head.is_palidrome?
    assert head2.is_palidrome? == false
  end
end