WIN_COMBINATIONS = [ #parent array that contains 8 children
#arrays w 3 elements each
  [0,1,2], # top row 
  [3,4,5], #middle row 
  [6,7,8], #bottom row 
  [0,3,6], #left column
  [1,4,7], # middle column
  [2,5,8], # right column 
  [0,4,8], # left to right diagonal 
  [2,4,6] # right to left diagonal 
  ]
  
  def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1 
end

def move(board, index, player_token)
  board[index]= player_token
end

def position_taken?(board, input)
  if board[input] == " " || board[input] == "" || board[input] == nil
    return false
  else
    return true
  end 
end 

def valid_move?(board,index)
  if !position_taken?(board,index) && index.between?(0,8)
    return true 
  else 
    return nil || false 
  end 
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index) == true
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
  num_of_turn = turn_count(board)
  if num_of_turn % 2 == 0 
    return "X"
  else 
    return "O" 
  end 
end 
def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      
      position_1 = board[win_index_1] #value of board at win_index 1
      puts position_1
      position_2 = board[win_index_2] #value of board at win_index 2
      puts position_2
      position_3 = board[win_index_3] #value of board at win_index_3
      puts position_3
      if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combo
    end
  end
  return false
end

def full?(board)
  board.all? do |index| 
    index == "X" || index == "O"
  end 
end 

def draw?(board)
  if !won?(board) && full?(board) 
    return true 
    elsif! full?(board) && !won?(board)
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
  if won?(board)
    return board[won?(board)[0]]
  end 
end 

def play(board)
  i = 0 
  while i < 9 
  turn(board) 
  i += 1 
  end 
end 

def play(board)
  until over?(board)
  turn(board) 
end
if won?(board)
  winner(board) == "X" || winner(board) == "O"
  puts "Congratulations #{winner(board)}!"
else draw?(board)
  puts "Cat's Game!"
end
end