
class Board
  def initialise
    @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
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
  attr_accessor :name
  attr_reader :token

  def initialise(name)
    @name = name
    @token = token
  end
end




  