# http://stackoverflow.com/questions/4261332/optimization-chance-for-following-bit-operations
# // return whether newboard includes a win
# bool haswon2(uint64_t newboard)
# {
#     uint64_t y = newboard & (newboard >> 6);
#     uint64_t z = newboard & (newboard >> 7);
#     uint64_t w = newboard & (newboard >> 8);
#     uint64_t x = newboard & (newboard >> 1);
#     return (y & (y >> 2 * 6)) | // check \ diagonal
#            (z & (z >> 2 * 7)) | // check horizontal -
#            (w & (w >> 2 * 8)) | // check / diagonal
#            (x & (x >> 2));      // check vertical |
# }
# http://codereview.stackexchange.com/questions/90171/m-n-k-game-i-e-generalized-tic-tac-toe

board_test = [
  [1, 1, 1],
  [0, 0, 0],
  [0, 0, 0]
]

class Board
  attr_accessor :board

  class <<self
    attr_accessor :look_up_hash
  end
  @look_up_hash = {}

  def initialize b
    @board = b
  end

  def get_winner
    return self.class.look_up_hash[get_code] unless self.class.look_up_hash[get_code].nil?

    self.class.look_up_hash[get_code] = find_winner
  end

  protected

  def get_code
    board.flatten.inject(0) { |sum, obj|
      sum * 3 + obj
    }
  end

  def find_winner
    3.times do |i|
      return board[i][0] if board[i][0] == board[i][1] && board[i][0] == board[i][2] && board[i][0] != 0
      return board[0][i] if board[0][i] == board[1][i] && board[0][i] == board[2][i] && board[0][i] != 0
      return board[0][0] if board[0][0] == board[1][1] && board[0][0] == board[2][2] && board[0][0] != 0
      return board[0][2] if board[0][2] == board[1][1] && board[0][2] == board[2][0] && board[0][2] != 0
    end

    return 0
  end
end

new_board = Board.new(board_test)

# print(new_board.get_winner)

# now mega board that 1000 x 1000

class MegaBoard
  attr_accessor :board, :n

  def initialize n
    @n = n

    @board = Array.new(n) { Array.new(n,true) {[0, 1, 2].sample()  } } )
  endsd

  def find_winner
    n.times do |i|
      n.times do |j|
        small_board = Board.new(board[i..i+2][j..j+2])
        winner = small_board.get_winner

        return winner unless winner == 0
      end
    end

    return 0
  end
end

mega_board = MegaBoard.new(1000)


puts "Our winner #{mega_board.find_winner}"
