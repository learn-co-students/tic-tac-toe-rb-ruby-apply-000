board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, player = "X")
  board[index] = player
  return board
end

def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  if index.between?(0,8)
    if !position_taken?(board, index)
      return true
    end
end

  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  counter = 0
  board.each do |turn|

    if turn.upcase == "X" || turn.upcase == "O"
      counter += 1
    end
  end
  counter
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], #rows
                   [0, 3, 6], [1, 4, 7], [2, 5, 8],   #columns
                   [0, 4, 8], [2, 4, 6] ]             #diagonals


def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
  if (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") ||
     (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
     return win_combo
   end
 end
     false
   end

def full?(board)
  if board.include?(" ")
    false
  else
    true
  end
end

def draw?(board)
  if ((won?(board) == false) && (full?(board) == true))
    true
  else
    false
  end
end

def over?(board)
   if won?(board) || draw?(board) || full?(board)
     return true
   end
     return false
 end

def winner(board)
    if won?(board) != false
      return board[won?(board)[0]]
    end
    return nil
  end
