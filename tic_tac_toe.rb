# frozen_string_literal: true

puts ' '
puts 'Welcome to Tic Tac Toe!'
puts ' '

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
  attr_accessor :board

  def initialize
    @board = board
  end

  def self.initial_board
    puts ' '
    puts ' 1 | 2 | 3 '
    puts '___________'
    puts ' 4 | 5 | 6 '
    puts '___________'
    puts ' 7 | 8 | 9 '
    puts ' '
  end

  def self.display_board
    board = Array.new(9, ' ')
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
    @players = Player.new
  end

  def position_taken?(board, index)
    return false if board[index] == '' || board[index] == ' ' || board[index] == nil?
  end

  def valid_move(board, index)
    return true if !position_taken?(board, index) && index.between?(0, 8)
  end

  def turn_count(board)
    counter = 0
    board.each do |index|
      counter += 1 if index.include? %w[X O]
    end
    counter
  end

  def current_player(board)
    (turn_count % 2).zero ? 'X' : 'O'
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(board)
    puts 'Please make your choice of move from 1-9'
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(board, index)
      move(board, index, current_player(board))
      turn(board)
    else
      puts 'Please choose a valid number as your move'
    end
    display_board(board)
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
    board.all? { |index| index.include?('X', 'O') }
  end

  def draw?(board)
    return true if !win?(board) && full?(board)
  end

  def over?(board)
    return true if win?(board) || draw?(board) || full?(board)
  end

  def winner(name, board)
    if win?(board)
      puts "Congratulations #{name}"
    elsif draw?(board)
      puts "It's a draw"
    end
  end

  def play(board)
    move(board) until over?(board)
  end
end
