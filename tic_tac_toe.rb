# frozen_string_literal: true

# class for assigning the players
class Player
  attr_reader :name

  def initialize(name)
    @name = name
    @token = token
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

  def update_board(board)
    input = gets.chomp
    input_int = input.to_i
    board[0] = 'X' if input_int == 1
    board[1] = 'X' if input_int == 2
    board[2] = 'X' if input_int == 3
    board[3] = 'X' if input_int == 4
    board[4] = 'X' if input_int == 5
    board[5] = 'X' if input_int == 6
    board[6] = 'X' if input_int == 7
    board[7] = 'X' if input_int == 8
    board[8] = 'X' if input_int == 9
    display_board(board)
  end
end

# tic tac toe game
class Game
  def move(board, index, token)
    board[index] = token if position_taken == false
  end

  def position_taken?(board, index, token)
    if board[index] == nil? || board[index] == ' '
      false
    elsif board[index] == token
      true
    end
  end

  def valid_move(board, index) end

  def turn_count(board) end

  def current_player(board) end

  def turn
    puts 'Please make your choice of move from 1-9'
    input = gets.chomp.to_i
    if (input - 1) == valid_move(index)
      move
      current_board
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
