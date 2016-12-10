def is_uniq string
  # one approuch is to use hash map memory O(n) and time O(n)
  # sorting is O(n log n) and O(1)
  string = string.chars.sort.join

  i = 0
  while (i < string.length)
    return false if string[i] == string[i + 1]

    i += 1
  end

  return true
end


puts("{is_uniq('aaa')}, #{is_uniq('aaa') == false}")
puts("{is_uniq('abc')}, #{is_uniq('abc') == true}")
puts("{is_uniq('aac')}, #{is_uniq('aac') == false}")