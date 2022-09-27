
class Board
  def initialize
    @board = Array.new(9, ' ')
  end

  def display_board(board)
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts '_________'
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts '_________'
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end

end

class Player
  attr_reader :name :token

  def initialize(input)
    @name = name
    @token = token
  end
end

class Game

WIN_COMBOS = [[0, 1, 2], [3, 4, 5],[6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]]

end




  