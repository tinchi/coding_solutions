def nulify_row matrix, i
  matrix[i].each_with_index do |_, j|
    matrix[i][j] = 0
  end
end

def nulify_column matrix, j
  matrix.each_with_index do |_, i|
    matrix[i][j] = 0
  end
end

def print text, matrix
  puts text

  matrix.each do |a|
    puts a.join(' ')
  end
end

def set_to_zero matrix
  print 'enter:', matrix

  row_has_zero = false
  col_has_zero = false

  matrix.each_with_index do |_, i|
    matrix[i].each_with_index do |_, j|
      if matrix[i][j] == 0
        row_has_zero = true if i == 0
        col_has_zero = true if j == 0

        matrix[i][0] = 0
        matrix[j][0] = 0
      end
    end
  end

  (1..matrix.length - 1).each do |i|
    nulify_row(matrix, i) if matrix[i][0] == 0
  end

  (1..matrix[0].length - 1).each do |j|
    nulify_column(matrix, j) if matrix[0][j] == 0
  end

  nulify_row(matrix, 0) if row_has_zero
  nulify_column(matrix, 0) if col_has_zero

  print 'results:', matrix
end

puts set_to_zero([[1, 1], [0, 1]]) == [[0, 1], [0, 0]]
puts set_to_zero([[0, 1, 1], [0, 1, 1]]) == [[0, 0, 0], [0, 0, 0]]