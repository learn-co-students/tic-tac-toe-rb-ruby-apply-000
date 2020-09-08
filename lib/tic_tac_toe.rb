def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, index, current_player)
    board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
        move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end



def turn_count(board)
  turn = 0
  board.each do |token|
  if token == "O" || token == "X" 
  turn += 1
elsif token == "" || token == " " || token == nil
  turn += 0  
else
end
  end
  return turn
end

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  elsif turn_count(board) % 2 != 0
    return "O"
  else
    end
  end

def won?(board)
WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
   
  position_1 = board[win_index_1] 
  position_2 = board[win_index_2] 
  position_3 = board[win_index_3] 
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination  

  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return win_combination 
      end
    end
return false
end


def full?(board)
  board.each do |token|
    if token == " " || token == "" || token == nil
      return false
    end
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return TRUE
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return TRUE
  end
end

def winner(board)
  if over?(board) && won?(board)
    WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
   
  position_1 = board[win_index_1] 
  position_2 = board[win_index_2] 
  position_3 = board[win_index_3] 
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return "X"
      
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return "O"
    end
  end
  return FALSE
end
end


def play(board)
  play = 0
  until over?(board)
  turn(board)
  play += 1
end
if over?(board) && winner(board) == "X"
  puts "Congratulations X!"
  elsif over?(board) && winner(board) == "O"
  puts "Congratulations O!"
  elsif over?(board) && draw?(board)
  puts "Cat's Game!"
end
end





