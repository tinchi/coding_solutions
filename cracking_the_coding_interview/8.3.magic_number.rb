
def find_magic_number array
  array.each_with_index do |e, i|
    return i if e == i
  end
end

def find_magic_number_binary array
  binary_search(array, 0, array.length)
end

def binary_search array, start, _end
  return false if start > _end

  middle = (start + _end) / 2

  return middle if array[middle] == middle

  binary_search(array[start..middle - 1], start, middle) || binary_search(array[middle + 1.._end], middle, _end)
end

puts find_magic_number([0, 1, 2, 3 ,4])
puts find_magic_number_binary([-10, -5, 2, 2, 2, 3, 4, 7, 9, 12, 13])