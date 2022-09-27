
class Board
  def initialise
    @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  end

  def display_board(board)
    puts "#{board[0]}", '|', "#{board[1]}", '|', "#{board[2]}"
    puts '_______'
    puts "#{board[3]}", '|', "#{board[4]}", '|', "#{board[5]}"
    puts '_______'
    puts "#{board[6]}", '|', "#{board[7]}", '|', "#{board[8]}"
  end
end


  