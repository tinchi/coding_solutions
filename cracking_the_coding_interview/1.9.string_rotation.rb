def is_rotation s1, s2
  return false if s1.length != s2.length

  s2.chars.each_with_index do |_, i|
    return is_sub_string s2[i..-1] + s2[0..i - 1], s1
  end

  return false
end

def is_rotation2 s1, s2
  (s1 + s1).include?(s2)
end

def is_sub_string s1, s2
  s1.include?(s2)
end

puts is_rotation("waterbottle", "erbottlewat")
puts is_rotation2("waterbottle", "erbottlewat")
