def recursive_multiply a, b
  min, max = [a, b].min, [a, b].max

  return 0 if min == 0
  return max if min == 1

  half_prod = recursive_multiply(min/2, max)

  if min % 2 == 0
    return half_prod + half_prod
  else
    return half_prod + half_prod + max
  end
end

p recursive_multiply 1, 3
p recursive_multiply 2, 3

p recursive_multiply 1000000000000000000000, 1000000000000000000000