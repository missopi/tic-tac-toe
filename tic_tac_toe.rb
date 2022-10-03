# frozen_string_literal: true

# class for assigning the players and tokens
class Player
  attr_reader :player_one, :player_two

  def initialize
    puts 'Player One, please enter your name'
    @player_one = gets.chomp
    puts "#{player_one.capitalize!}, you will be playing as X."
    puts ' '
    puts 'Player Two, please enter your name'
    @player_two = gets.chomp
    puts "#{player_two.capitalize!}, you will be playing as O."
    puts ' '
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
    puts "#{board[0]} | #{board[1]} | #{board[2]}"
    puts '_________'
    puts "#{board[3]} | #{board[4]} | #{board[5]}"
    puts '_________'
    puts "#{board[6]} | #{board[7]} | #{board[8]}"
  end
end

# class for playing the tic tac toe game
class Game
  WIN_COMBOS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]].freeze
  def initialize
    puts ' '
    puts 'Welcome to Tic Tac Toe!'
    puts ' '
    @players = Player.new
  end

  def position_taken?(board)
    return false if board[@player_choice] == '' || board[@player_choice] == ' ' || board[@player_choice] == nil?
  end

  def valid_move(board)
    return true if !position_taken?(board) && @player_choice.between?(0, 8)
  end

  def turn_count(board)
    counter = 0
    board.each do |index|
      counter += 1 if index.include? %w[X O]
    end
    counter
  end

  def current_player
    (turn_count % 2).zero ? turn(@players.player_one, 'X') : turn(@players.player_one, 'O')
  end

  def move
    over? false
    @board = Board.new
    turn
    current_player while turn_count(board) < 10
  end

  def turn(player, token)
    puts "#{player}, please make your choice of move from 1-9"
    @player_choice = gets.chomp.to_i - 1
    if valid_move?(board, index) && over? == false
      @board.update_board(@player_choice, token)
      turn_count(board)
      win?
      draw?
    else
      puts 'Please choose a valid number as your move'
    end
  end

  def win?(board)
    WIN_COMBOS.each do |win_combo|
      win_combo[0]
      win_combo[1]
      win_combo[2]
      win_combo[3]
      win_combo[4]
      win_combo[5]
      win_combo[6]
      win_combo[7]
    end
  end

  def full?(board)
    return true if board.all? { |index| index.include?('X', 'O') }
  end

  def draw?(board)
    return true if !win?(board) && full?(board)
  end

  def over?(board)
    return true if win?(board) || draw?(board) || full?(board)
  end

  def winner(player, board)
    if win?(board)
      puts "Congratulations #{player}"
    elsif draw?(board)
      puts "It's a draw"
    end
  end

  def play(board)
    move(board) until over?(board)
  end
end

tic_tac_toe = Game.new
tic_tac_toe.move
