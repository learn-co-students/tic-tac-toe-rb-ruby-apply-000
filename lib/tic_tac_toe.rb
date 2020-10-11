WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], 
  [2, 4, 6] 
  ]
  
#Display Board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end 

#Input to index 
def input_to_index(user_input)
  user_input = user_input.to_i - 1
end


#MOVE
def move(array, index, current_player)
  array[index] = current_player
end


#POSITION TAKEN 
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil 
    return false 
  end

  if board[index] == "X" ||  board[index] == "O"
    return true 
  end
end


#VALIDMOVE
def valid_move?(board, index)
  if position_taken?(board, index) == false && index.between?(0, 8) 
    return true 

  else 
    return false  
  end
end


#TURN
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


#CURRENT PLAYER 
def current_player(board)
   turn_count(board) % 2 == 0 ? "X" : "O"
end


#TURN COUNT 
def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1   
    end
  end 
  counter
end


#WON 
def won?(board)
  WIN_COMBINATIONS.each do |winning_combination|
    win_index_1 = winning_combination[0]
    win_index_2 = winning_combination[1]
    win_index_3 = winning_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
   
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return winning_combination
    end
  end
  return false
end


#FULL 
def full?(board)
  if board.any? {|index| index == nil || index == " "}
    return false
  else
    return true
  end
end


#DRAW
def draw?(board)
  if !won?(board) && full?(board)
    return true 
  else 
    return false
  end
end


#OVER?
def over?(board)
  if won?(board)
    return true
  elsif draw?(board)
    return true 
  elsif full?(board)
    return true 
  end
end
  
  
#WINNER
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end


#PLAY 

def play(board)
  
  turn(board) until over?(board)
    # turn(board)
  
 
  if won?(board)
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat's Game!"
  end
end