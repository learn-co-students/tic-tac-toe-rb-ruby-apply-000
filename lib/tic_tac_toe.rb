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
  
 def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
board = [" "," "," "," "," "," "," "," "," "]

def input_to_index(user_input)
  user_input.to_i - 1 
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil 
    taken = false 
  else
    taken = true 
  end
end

def valid_move?(board, index)
  if position_taken?(board, index) || !index.between?(0, 8)
    false
  else
    true
  end
end

def turn_count(board)
  turn = 0 
  board.each do |player|
    if player == "X" || player == "O"
      turn += 1 
    end 
  end
  turn 

end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else return "O"
end 
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true 
    move(board, index, current_player(board))
  else turn(board)
end
display_board(board)
end

  
def won?(board)
  winning_combination=nil
  winning_combination = WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] != " " && board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]]
end
end


def full?(board)
  !board.any?{ |i| i == " "}
end
    
def draw?(board)
  true if !won?(board) && full?(board)
  
end

def over?(board)
  true if draw?(board) || won?(board) || full?(board)
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo
    board[winning_combo[0]]
  end
end

def play(board)
  until over?(board)
  turn(board)
end
if won?(board)
puts "Congratulations #{winner(board)}!"
else draw?(board)
  puts "Cat's Game!"
end
end