board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]
]

def input_to_index(user_move)
  index = user_move.to_i - 1
  return index 
end 

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] = nil 
    return false 
  else 
    return true 
  end 
end 

def valid_move?(board, index)
  if index > board.length || index < 0
    return false 
  elsif position_taken?(board, index)
    return false 
  else 
    return true 
  end
end

def turn(board)
  puts "Please enter 1-9:"
  player_move = gets.strip 
  index = input_to_index(player_move)
  player_icon = current_player(board)
  if valid_move?(board, index)
    move(board, index, player_icon)
  else 
    turn(board)
  end
  display_board(board)
end
  
def turn_count(board)
  counter = 0 
  board.each do |b| 
    if b == "X" || b == "O"
      counter += 1 
    end
  end
  counter 
end

def current_player(board)
  player_turn = turn_count(board)
  if player_turn.even? 
    "X"
  elsif player_turn.odd?
    "O"
  end
end
  
def move(board, index, player_char)
  return board[index] = player_char
end  

def won?(board)
  WIN_COMBINATIONS.each do |wc|
    wi_1 = wc[0]
    wi_2 = wc[1]
    wi_3 = wc[2]
    
    pos_1 = board[wi_1]
    pos_2 = board[wi_2]
    pos_3 = board[wi_3]
    
    if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
      return wc
    elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
      return wc
    end 
  end 
  false 
end 

def full?(board)
  board.all? { |b| b == "X" || b == "O" } 
end 

def draw?(board)
  if !(won?(board)) && full?(board)
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
  if won?(board)
    return board[won?(board)[0]]
  end 
end 

def play(board)
  until over?(board)
    turn(board)
  end 
  
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
    puts "Cat's Game!"
  end 
end




  
  
  
  
    
    
  
  
  