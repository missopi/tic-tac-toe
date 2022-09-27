
class Board
  def initialise
    @board = ['','','','','','','','','']
  end

  def display_board(board)
    puts row_1 = ['#{board[0]}','|', '#{board[1]}', '|', '#{board[2]}']
    puts spacer_row = ['_____']
    puts row_2 = ['#{board[3]}','|', '#{board[4]}', '|', '#{board[5]}']
    puts spacer_row
    puts row_3 = ['#{board[6]}','|', '#{board[7]}', '|', '#{board[8]}']
  end
end
  