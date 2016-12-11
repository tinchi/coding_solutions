# Find the number of negative numbers in a column-wise / row-wise sorted matrix M[][]. 
# Suppose M has n rows and m columns.
# Example:
# Input:  M =  [-3, -2, -1,  1]
#              [-2,  2,  3,  4]
#              [4,   5,  7,  8]
# Output : 4
# We have 4 negative numbers in this matrix

def negative_integers_with_binary_search matrix
  search_max = matrix[0].length
  counter = 0

  matrix.each do |row|
    search_max = binary_search(row, 0, search_max)
    counter += search_max + 1
  end

  counter
end #(n * log(m))

def binary_search array, start, ending
  mid = (start + ending)/2

  return mid if start > ending

  if array[mid] >= 0
    binary_search(array, start, mid - 1)
  else
    binary_search(array, mid + 1, ending)
  end
end
# optimal solution

def negative_integers matrix
  x, y = matrix[0].length, 0
  counter = 0

  while y < matrix.length && x > 0

  end
end

matrix = [[-3, -2, -1,  1], [-2,  2,  3,  4], [4,   5,  7,  8]]

p negative_integers_with_binary_search(matrix) == 4

