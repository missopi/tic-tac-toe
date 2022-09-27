
class Board
  def initialise
    @board = ['','','','','','','','','']
  end

  def display_board(board)
    puts row = ['#{board[0]}','|', '#{board[1]}', '|', '#{board[2]}']
    puts spacer_row = ['_____']
    puts row
    puts spacer_row
    puts row
  end
end
  