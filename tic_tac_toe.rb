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

  def self.create_player(token)
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

  def current_player
    (turn_count % 2).zero ? 'X' : 'O'
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(board, index, token)
    puts "#{name}, please make your choice of move from 1-9"
    input_to_index
    if valid_move(board, index)
      board[index] = token
      display_board
      turn_count
    else
      puts 'Please choose a valid number as your move'
    end
  end

  def win?(board)
    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]] # winning combos
  end

  def full?(board)
    return true if board[index].any? == 'X' || board[index].any? == 'O'
  end

  def draw?(board)
    return true unless win?(board)
  end

  def over?(board) end

  def winner(board) end

  def play
    move until over == true
    if win == true
      puts "Congratulations #{player}"
    else
      puts "It's a draw"
    end
  end
end
