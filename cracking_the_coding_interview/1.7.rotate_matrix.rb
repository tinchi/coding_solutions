# before i should draw rotation on paper

def rotate_matrix matrix
  n = matrix.length
  (0..n/2).each do |i|
    j = i

    while j < n - i - 1
      top = matrix[i][j]

      matrix[i][j] = matrix[j][n - i - 1]

      matrix[j][n - i - 1] = matrix[n - i - 1][n - j - 1]
      matrix[n - i - 1][n - j - 1] = matrix[n - j - 1][i]
      matrix[n - j - 1][i] = top
      j += 1
    end
  end

  p  matrix
end

matrix = [
  %w(1  2  3),
  %w(4  5  6),
  %w(7  8  9)
]

result = [%w(3  6  9),
          %w(2  5  8),
          %w(1  4  7)
]

matrix2 = [%w(1  2  3  4), 
 %w(5  6  7  8), 
 %w(9 10 11 12), 
%w(13 14 15 16)]

result2 = [%w(4  8 12 16),
 %w(3 7 11 15),
 %w(2 6 10 14),
 %w(1 5 9 13)]

puts rotate_matrix(matrix) == result
puts rotate_matrix(matrix2) == result2


# 1 2 => 3 1
# 3 4 => 4 2

# rotate 3d cude