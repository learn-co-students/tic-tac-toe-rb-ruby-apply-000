def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
      position_taken?(board,combo[0]) && board[combo[0]] == board[combo[1]] && board[combo[0]]== board[combo[2]]
  end
end

def full?(board)
  board.none? do |index|
    index == " " || index == nil
  end
end

def draw?(board)
  if full?(board) && won?(board) == nil
    true 
  end
end

def over?(board)
  if won?(board) != nil || draw?(board)
    true
  end
end

def winner(board)
  if won?(board) != nil
    board[won?(board)[0]]
  end
end

def turn_count(board)
  turn = 0
  board.each do |square|
    if square != " "
      turn += 1 
    end
  end
  turn
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

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

def move(board, index, current_player)
  board[index] = current_player
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  elsif won?(board) != nil
    puts "Congratulations #{winner(board)}!"
  end
end
      
      

