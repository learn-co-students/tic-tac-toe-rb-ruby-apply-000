WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(x)
  x_as_int = x.to_i - 1
  return x_as_int
end

def move(board, x_as_int, character)
  board[x_as_int] = character
  return character
end

def position_taken?(board, index)
  if (board[index] == 'X' || board[index] == 'O')
    return true
  else
    return false
 end
end

def valid_move?(board, index)
  if index.between?(0, board.size-1) && !position_taken?(board, index)
    return true
  end
  return false
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets
  user_input = user_input.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  counter
end

def current_player(board)
  turn_count(board) % 2 == 0? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combination
    end
  end
  return false
end

def full?(board)
  if board.any? {|index| index != "X" && index != "O" }
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
     return true
   elsif!full?(board) && !won?(board)
     return false
   else won?(board)
     return false
   end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board) 
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def play(board)
  until over?(board)
      turn(board)
  end
  if winner(board)
   puts "Congratulations #{winner(board)}!"
  else
   puts "Cat's Game!"
  end
end