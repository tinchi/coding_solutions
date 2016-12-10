def print_pass_fail true_false
  puts(true_false ? 'pass' : 'fail')
end

# hash map
def is_permutation string1, string2
  return false if string1.length != string2.length

  hash_map = {}

  string1.chars.each do |c|
    hash_map[c] ||= 0
    hash_map[c] += 1
  end

  string2.chars.each do |c|
    hash_map[c] ||= 0
    hash_map[c] -= 1
  end

  hash_map.each do |key, val|
    return false if val != 0
  end

  return true
end

def is_permutation_sort string1, string2
  string1.chars.sort == string2.chars.sort
end

print_pass_fail is_permutation('abc', 'abc') == true
print_pass_fail is_permutation('abc', 'cba') == true
print_pass_fail is_permutation('abc', 'aaa') == false
print_pass_fail is_permutation('abc', 'abca') == false

print_pass_fail is_permutation_sort('abc', 'abc') == true
print_pass_fail is_permutation_sort('abc', 'cba') == true
print_pass_fail is_permutation_sort('abc', 'aaa') == false
print_pass_fail is_permutation_sort('abc', 'abca') == false