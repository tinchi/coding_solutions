class HashTable
  class Node
    attr_accessor :key, :val, :prev, :next

    def initialize key, val
      @key, @val = key, val
    end
  end

  attr_reader :items

  def initialize size
    @items = Array.new(size)
  end

  def put key, val
    node = get(key)

    unless node.nil?
      old_value = node.val
      node.val = val
      return old_value
    end

    new_node = Node.new(key, val)

    i = get_index(key)

    unless items[i].nil?
      new_node.next = items[i]
      new_node.next.prev = node

    end

    @items[i] = new_node #set new node as head node

    return nil
  end

  def get key
    node = get_node(key)

    return node.val if node

    nil
  end

  def remove key
    node = get_node(key)

    return nil if node.nil?

    if node.prev
      node.prev.next = node.next
    else #prev == nil
      @items[get_index(node.key)] = node.next
    end

    unless node.next.nil?
      node.next.prev = node.prev
    end

    return node.val
  end

  protected

  def get_node key
    current = @items[get_index(key)]

    while !current.nil?
      return current if current.key == key

      current = current.next
    end

    return nil
  end

  def get_index key
    hash_code(key).size % items.size
  end

  def hash_code string
    string.size
  end
end

hash_table = HashTable.new(100)

hash_table.put("abc", 1)
hash_table.put("cba", 2)
hash_table.put("cbqweqweqweqweqweqwea", 100)

puts hash_table.get("abc") == 1
puts hash_table.get("aaa") == nil
puts hash_table.get("cba") == 2
puts hash_table.get("cbqweqweqweqweqweqwea")
puts hash_table.remove("cbqweqweqweqweqweqwea")
puts hash_table.get("cbqweqweqweqweqweqwea")
