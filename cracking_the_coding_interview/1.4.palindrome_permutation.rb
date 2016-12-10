
def is_permutation_of_palidrome string
  count_odds = 0
  hash_map = {}
  string.chars.each do |c|
    hash_map[c] ||= 0
    hash_map[c] += 1

    hash_map[c] % 2 == 1 ? count_odds += 1 : count_odds -= 1
  end

  return count_odds <= 1
end


puts(is_permutation_of_palidrome('aaa') == true)
puts(is_permutation_of_palidrome('civil') == false)
puts(is_permutation_of_palidrome('livci') == false)