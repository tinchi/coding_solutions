# trick is to iterate over shorter string, and always increace iterator for a shorter one

def is_one_away string1, string2
  s1, s2 = [string1, string2].sort_by(&:length)
  error = false
  i = 0; j = 0;

  while(i < s1.length && j < s2.length)
    if s1[i] != s2[j]
      return false if error
      error = true

      i += 1 if s1.length == s2.length

    else
      i += 1
    end

    j += 1
  end

  return true
end

puts is_one_away('pale', 'ple') == true
puts is_one_away('pales', 'pale') == true
puts is_one_away('pale', 'bale') == true
puts is_one_away('pale', 'bake') == false