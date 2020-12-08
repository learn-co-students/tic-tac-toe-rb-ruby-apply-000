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

def input_to_index(user_input)
  return user_input.to_i - 1 
end

def move(board, placement, player)
  board[placement] = player
  return board
end

def position_taken?(board, placement)
  if board[placement] == " " || board[placement] == ""
    false
  else
    true
  end
end

def valid_move?(board, placement)
  position_taken?(board,placement) != true && placement.between?(0,8)
end

def turn_count(board)
  counter = 0 
  board.each do |num| 
    if num == "X" || num == "O"
      counter += 1
    end
  end
  return counter
end 

def current_player(board)
  if turn_count(board) % 2 == 0 
    "X"
  else
    "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) 
    move(board, index, current_player(board))
  else
    turn(board)
  end
  display_board(board)
end

def won?(board)
  WIN_COMBINATIONS.each do |w|
  win_index_1 = w[0]
  win_index_2 = w[1]
  win_index_3 = w[2]
  
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return w
    else
      false
    end
  end
  false
end

def full?(board)
 board.all? {|full| full == "X"||"O" && full != " "}
end

def draw?(board)
  if won?(board) || full?(board) == false 
    false
  else
    true
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board) == true
    true
  end
end

def winner(board)
  if w = won?(board)
    board[w[0]]
  end
end

def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  
  if won?(board) 
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end