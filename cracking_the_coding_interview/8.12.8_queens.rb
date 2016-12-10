SIZE = 8

@results = []

def place_queen row=0, colums=Array.new(SIZE) { 0 }
  if row == SIZE
    @results << colums.dup
  else
    (0..7).each do |col|
      if check_valid?(colums, row, col)
        colums[row] = col
        place_queen(row + 1, colums)
      end
    end
  end
end

def check_valid? colums, row, col
  (0..row - 1).each do |row2|
    col2 = colums[row2]

    return false if col2 == col || #same column
                    row - row2 == (col2 - col).abs #same diagonal
  end

  return true
end

place_queen()

p @results.size #92 solutions