def power_set set, index=0
  return [[]] if index == set.length

  all_sub_sets = power_set(set, index + 1)

  all_sub_sets += all_sub_sets.map do |sub_set|
    (sub_set + [set[index]])
  end
end

p power_set([]) # [[]]
p power_set([1]) # [[], [1]]
p power_set([1,2]) # [[], [2], [1], [2, 1]]
p power_set([1,2, 3]) # [[], [3], [2], [3, 2], [1], [3, 1], [2, 1], [3, 2, 1]]
