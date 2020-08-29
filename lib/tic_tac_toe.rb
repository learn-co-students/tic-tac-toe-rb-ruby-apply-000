WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
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

def move(board, index, player)
  board[index] = player
end  

def position_taken?(board, index)
    if board[index] == " "
    return false
   elsif board[index] == ""
    return false
   elsif board[index] == nil
    return false
   else board[index] == "X" || "O"
    return true
  end  
end  

def valid_move?(board, index)
  def position_taken?(board, index)
    if board[index] == " "
     return false
    elsif board[index] == ""
     return false
    elsif board[index] == nil
     return false
    else board[index] == "X" || "O"
     return true
    end 
   end    
  if index.between?(0,8) && !position_taken?(board,index)
    return true
  else 
    return false
 end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index)
  move(board, index, current_player(board))
  else  
    turn(board)
  end
  display_board(board)
end

def turn_count(argument)
  counter = 0
  argument.each do |token| 
   if token == "X" || token == "O"
   counter += 1
   end    
 end
   counter
end 

def current_player(board)
   if turn_count(board) % 2 == 0
     return "X"
   else 
     return "O"
   end   
end 

def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?(board)
  board.all? {|index| index == "X" || index == "O"
  }
end  
      
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end  

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  index = []
  index = won?(board)
  
  if index == false
    return nil
  elsif
    board[index[0]]== "X"
    return "X"
  else
    board[index[0]] == "O"
    return "O"
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end  
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  else draw?(board)
    puts "Cat's Game!"
 end
end

 