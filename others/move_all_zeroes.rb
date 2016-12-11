# more zerous to the end

def move_zerous array
  count = 0

  array.each_with_index do |e, i|
    if e != 0
      array[count] = array[i]
      count += 1
    end
  end

  while count < array.length
    array[count] = 0
    count += 1
  end

  array
end

p move_zerous([1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0])