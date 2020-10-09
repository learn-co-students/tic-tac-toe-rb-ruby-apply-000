

WIN_COMBINATIONS = [
  
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #left to right diagonal
  [2,4,6]  #right to left diagonal
  ]
  
board = ["   ", "   ", "   ", "   ", "   ", "   ", "   ", "   ", "   "]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

" #{board[0]} | #{board[1]} | #{board[2]} "
"-----------"
" #{board[3]} | #{board[4]} | #{board[5]} "
"-----------"
" #{board[6]} | #{board[7]} | #{board[8]} "

end

def input_to_index(index)
  puts index.to_i - 1
  index.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken? (board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false
   else
    true
  end
end

def valid_move? (board, index)
  position = position_taken?(board, index) 
  if position == false && index.between?(0, 8)
    true
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  character = current_player(board)
  
  if valid_move?(board, index)
    move(board, index, character)
    display_board(board)
  else 
    turn(board)
 end
end

def turn_count(board)
  turn_counter = 0
  board.each do |character|
    if character != " " && character != ""
    turn_counter += 1 
    end 
  end
  turn_counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  all_match = false
  WIN_COMBINATIONS.each do |win_combo|
  
  if win_combo.all?{|win_index|board[win_index]=="X"}||win_combo.all?{|win_index|board[win_index]=="O"}
    all_match = win_combo
    end
  end
    all_match
end

def full?(board)
  all_full = board.all? do |slot|
    if slot =="X" || slot =="O"
        true
    else
        false
    end
  end
end

def draw?(board)
  if full?(board)&&!won?(board)
    true
  elsif won?(board)
    false
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  #[1,4,7]
  win_combo = won?(board)
  if win_combo
    return board[win_combo[0]]
  else
    puts "Cat's Game!"
  end
end

def play(board)
  until over?(board) == true
  turn(board)
  end
  puts "Congratulations #{winner(board)}!"
end



