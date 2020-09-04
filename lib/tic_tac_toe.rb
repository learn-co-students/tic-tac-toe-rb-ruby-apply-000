# rspec spec/01_tic_tac_toe_spec.rb

# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1 
end

def move(board, index, player)
  board[index] = player
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    !true
  else
    return true
  end  
end 

def valid_move?(board, index)
  if position_taken?(board, index) == true && index.between?(0, 8) == true
    false
  elsif index.between?(0, 8) == false
    false
  else
    true
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(board, index) == true
    move(board, index, current_player(board)) 
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  num_of_turns_played = 0
  board.each do |space|
    if  space == "X" || space == "O"
      num_of_turns_played += 1
    end
  end  
  num_of_turns_played
end  

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else 
    "O"
  end
end  

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(board, combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
      return combo
    end
  end
  false
end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot =="O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if win = won?(board)
    board[win[0]]
  end
end

def play(board)
  turn(board) until over?(board)
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cat's Game!"
  end
end





