# frozen_string_literal: true

# class for assigning the players
class Player
  attr_reader :name, :token

  def initialize(name, token)
    @name = name
    @token = token
  end

  def self.name
    puts 'Please enter your name'
    self.name = gets.chomp
  end

  def self.token
    puts "#{name}, you will be playing as #{token}."
  end
end

# class for designing the tic tac toe board
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

# tic tac toe game
class Game
  def move(board, index, token)
    board[index] = token if position_taken == false
    display_board
  end

  def position_taken?(board, index, token)
    true if board[index] == token
  end

  def valid_move(board, index)
    true if position_taken == false
    board[index]
  end

  def turn_count(board) end

  def current_player() end

  def turn
    puts 'Please make your choice of move from 1-9'
    input = gets.chomp.to_i
    if (input - 1) == valid_move(index)
      move
      update_board
    else
      puts 'Please choose a valid number as your move'
    end
  end

  def win?
    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]] # winning combos
  end

  def full?(board) end

  def draw?(board) end

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
