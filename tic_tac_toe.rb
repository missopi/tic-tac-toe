# frozen_string_literal: true

puts ' '
puts 'Welcome to Tic Tac Toe!'
puts ' '

# class for assigning the players
class Player
  attr_reader :name, :token

  def initialize(name, token)
    @name = name
    @token = token
  end

  def assign_token(token)
    %w[X O].sample
    token
  end

  def create_player(token)
    puts 'Please enter your name'
    name = gets.chomp
    puts "#{name.capitalize!}, you will be playing as #{token}."
    puts ' '
  end
end

# class for designing the tic tac toe board
class Board < Player
  attr_accessor :board

  def initialize(name, token, board)
    super(name, token)
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

Board.initial_board

# tic tac toe game
class Game < Board
  def initialize
    super(name, token, board)
  end

  def position_taken?(board, index)
    return false if board[index] == '' || board[index] == ' ' || board[index] == nil?
  end

  def valid_move(board, index)
    return true if !position_taken?(board, index) && index.between?(0, 8)
  end

  def turn_count
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
    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]] # winning combos
  end

  def full?(board)
    board.all? { |i| i.include?('X', 'O') }
  end

  def draw?(board)
    return true if !win?(board) && full?(board)
  end

  def over?(board) end

  def winner(board) end

  def play(name, board)
    move(board) until over?(board)
    if win?(board)
      puts "Congratulations #{name}"
    elsif draw?(board)
      puts "It's a draw"
    end
  end
end
