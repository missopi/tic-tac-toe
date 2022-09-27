# frozen_string_literal: true

# class for designing tic tac toe board
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

  def current_board(board)
    display_board(board)
  end
end

# class for assigning players
class Player
  attr_reader :name

  def initialize(name)
    @name = name
    @token = token
  end
end

# tic tac toe game class
class Game
  def move(board, index, token) end

  def position_taken?(board, index, token) end

  def valid_move(board, index) end

  def turn_count(board) end

  def current_player(board) end

  def turn(board) end

  def win?(board)
    [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [6, 4, 2], [0, 4, 8]] # winning combos
  end

  def full?(board) end

  def draw?(board) end

  def over?(board) end

  def winner(board) end

  def play(board) end
end

