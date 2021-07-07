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
  puts (" #{board[0]} | #{board[1]} | #{board[2]} ")
  puts ("-----------")
  puts (" #{board[3]} | #{board[4]} | #{board[5]} ")
  puts ("-----------")
  puts (" #{board[6]} | #{board[7]} | #{board[8]} ")
end
def input_to_index(user_input)
  user_input.to_i-1
end
def valid_move?(board, index)
  index.between?(0, 8) && !position_taken?(board, index)

end

def move(board,index, current_player)
  board[index]=current_player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
    else
      return true

end
end


def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  
  if valid_move?(board, index)
    move(board,index, current_player(board)) 
  else 
    turn(board) 
  end 
  
  display_board(board)
end

  
def turn_count(board)

turn_count = 0
board.each do |count|
# binding.pry  
if count != " "
turn_count += 1 
end 
end
turn_count
end

def current_player(board)
  if turn_count(board).even? 
    return "X"
  else
    return "O"
  end 
end

  def won?(board)
   WIN_COMBINATIONS.detect do |combination| 
  board[combination[0]] == board[combination[1]] && board[combination[0]] == board[combination[2]] &&  position_taken?(board, combination[0])
  
  end
  end
  
def full?(board)
  board.all? do |combination|
    if combination == "X" || combination == "O" 
    true
  else
    false

end  
end
end 

def draw?(board)
full?(board) && !won?(board)
end

def over?(board)
 if won?(board) || draw?(board) || full?(board)
 true 
  end
end


def winner(board)
  winning_array = won?(board) 
  if winning_array
    board[winning_array[0]]
    
  end  
end

def play(board)
  
# puts "Please enter 1-9:"
#   user_input = gets.strip
#   index = input_to_index(user_input)
 while !over?(board)
  turn(board)
 end 
if winner(board)
  puts "Congratulations #{winner(board)}!"
else 
puts "Cat's Game!"  
end 

end 
