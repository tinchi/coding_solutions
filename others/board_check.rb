# ['x', 'o']
# m,n,k game
# k = 3,  Tic-tac-toe

def board_checker board, player
  dig_counter = 0
  dig2_counter = 0

  (0..2).each do |i|
    counter = 0
    column_counter = 0

    (0..2).each do |j|
      if i == j 

      end

      counter += 1 if board[i][j] == player
      column_counter += 1 if board[j][i] == player

      return true if counter == 3
    end

    dig_counter += 1 if board[i][i] == player
    dig2_counter += 1 if board[i][2 - i] == player
  end

  return true if dig_counter == 3 or dig2_counter == 3

  false
end

board1 = [%w(x x x), ['', '', ''], ['', '', ''] ]
board2 = [%w(x x o), ['x', '', ''], ['x', '', ''] ]
board3 = [%w(x x o), ['c', 'x', ''], ['c', '', 'x'] ]
board4 = [%w(c x x), ['c', 'x', ''], ['x', '', 'x'] ]

puts(board_checker(board1, 'x'))
puts(board_checker(board2, 'x'))
puts(board_checker(board3, 'x'))
puts(board_checker(board4, 'x'))

board_test = [
  [1, 1, 1],
  [0, 0, 0],
  [0, 0, 0]
]

def board_to_int board
  sum = 0
  3.times do |i|
    3.times do |j|
      sum *= 3
      sum += board[i][j]
    end
  end

  return sum
end

puts board_to_int(board_test)
