
require "pry"

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, input_to_index, value) #value = X)
  board[input_to_index] = value
end

def position_taken?(board, index)
  board[index] == "O" || board[index] == "X"
end

def valid_move?(board, index)
  !(position_taken?(board, index)) && index.between?(0, 8)
end

def turn(board)
  #binding.pry
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Please Enter a Valid Move"
    turn(board)
  end
end

def turn_count(board_array)
counter = 0
board_array.each do |turn|
  if turn == "X" || turn == "O"
    counter += 1
  end
end
counter
end

def current_player(board_array)
  if turn_count(board_array) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.each_with_index do |slot, index|
    #binding.pry#!(board[index].nil? || board[index] == " ")
    if !(position_taken?(board,index))
      return false
    end
  end
end

def draw?(board)
  #board.each do |slot|
    #binding.pry
  if full?(board) && !(won?(board))
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)

  if combo = won?(board)
    #binding.pry
    board[combo[0]]
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  #if winner(board) == current_player(board_array) && current_player(board_array) == "X"
  #  "Congratulations X!"
  #elsif winner(board) == "O"
  #  "Congratulations O!"
  #else
  #  "Cat's Game!"
  #end
  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    draw?(board)
    puts "Cat's Game!"
  end
end
