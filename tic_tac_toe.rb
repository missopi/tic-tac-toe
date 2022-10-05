# frozen_string_literal: true

# class for assigning the players
class Player
  attr_reader :name

  def initialize
    puts 'Please enter your name.'
    @name = gets.chomp.capitalize!
  end
end

# class for designing and displaying the tic tac toe board
class Board
  attr_reader :board

  def initialize
    puts 'Take turns choosing a number from the Tic Tac Toe board. The first player to get 3 in a row wins.'
    puts ' '
    puts ' 1 | 2 | 3 '
    puts '___________'
    puts ' 4 | 5 | 6 '
    puts '___________'
    puts ' 7 | 8 | 9 '
    puts ' '
    @board = Array.new(9, ' ')
  end

  def update_board(index, token)
    board[index] = token
    display_board(board)
  end

  def display_board(board)
    puts ' '
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '___________'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '___________'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
    puts ' '
  end
end

# class for playing the tic tac toe game
class Game
  WIN_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # horizontal
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # vertical
    [6, 4, 2], [0, 4, 8] # diagonal
  ].freeze

  def initialize
    puts ' '
    puts '====== TIC TAC TOE ======'
    puts ' '
    @player_one = Player.new
    puts "#{@player_one.name}, you will be playing as X."
    puts ' '
    @player_two = Player.new
    puts "#{@player_two.name}, you will be playing as O."
    puts ' '
  end

  def space_not_taken?
    return true if @board.board[@player_choice] == ' ' || @board.board[@player_choice] == nil?
  end

  def valid_move?
    return true if space_not_taken? && @player_choice.between?(0, 8)
  end

  def current_player
    @turn.odd? ? player_turn(@player_one.name, 'X') : player_turn(@player_two.name, 'O')
  end

  def move
    over?
    @board = Board.new
    @turn = 1
    current_player while @turn < 10
  end

  def player_turn(player, token)
    puts "#{player}, please put your #{token} in a space from 1-9"
    @player_choice = gets.to_i - 1
    if valid_move? == true
      @board.update_board(@player_choice, token)
      @turn += 1
      win
      draw
    else
      puts 'You must choose a valid number as your move'
    end
  end

  def win
    WIN_COMBOS.each do |line| # check if line has all three tokens the same
      if (@board.board[line[0]] == @board.board[line[1]] && @board.board[line[1]] == @board.board[line[2]]) &&
         @board.board[line[0]] != ' '
        winner
      end
    end
  end

  def winner
    case @win = true
    when @board.board[@player_choice] == 'X'
      puts "Congratulations #{@player_one.name}! YOU WIN!"
    when @board.board[@player_choice] == 'O'
      puts "Congratulations #{@player_two.name}! YOU WIN!"
    end
    @turn = 10
  end

  def draw
    puts "It's a draw" if @turn == 10 && !@win
  end

  def over
    win || draw
  end

  def play
    move until over?
  end
end

tic_tac_toe = Game.new
tic_tac_toe.move
