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

  def length
    counter = 1
    self.each { counter += 1}
    counter
  end

  def delete d
    self.each do |n|
      temp = n.next
      n.next = temp.next if n.data == d
    end
  end

  def remove_dup!
    hash_map = {}
    n = self
    priv = nil

    while n.next != nil
      n = n.next

      if hash_map[n.data].nil?
        priv = n
        hash_map[n.data] = true
      else
        priv.next = n.next
      end
    end
  end

  def each &block
    n = self
    while n.next != nil
      yield(n)

      n = n.next
    end
  end
end

head = Node.new(1)

head.append_to_tail(2)
head.append_to_tail(3)
head.append_to_tail(2)
head.append_to_tail(2)
head.append_to_tail(3)

puts head.length

head.remove_dup!

puts head.length == 3
