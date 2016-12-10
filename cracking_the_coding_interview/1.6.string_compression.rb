def compress string
  counter = 0
  new_string = "a"

  string.chars.each do |e|
    if new_string[-1] != e
      new_string += "#{counter}#{e}"

      counter = 1
    else
      counter += 1
    end
  end

  new_string += counter.to_s
  puts new_string

  return string.length < new_string.length ? string : new_string
end

puts compress('aabcccccaaa') == 'a2b1c5a3'
puts compress('abcaa') == 'abcaa' #this one is longer sa1b1c1a2