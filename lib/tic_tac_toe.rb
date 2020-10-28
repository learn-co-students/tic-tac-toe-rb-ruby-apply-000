
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First collum
  [1,4,7],  # Second collum
  [2,5,8],  # Third collum
  [0,4,8],  # Diagonal left
  [2,4,6]   # Diagonal right
  
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

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  count = 0
  board.each do |token|
    if token == "X" || token == "O"
      count +=1
  end
end
count
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
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    if
      win_combo.all? do |win_index|
        board[win_index]=="X"
      end
      true
    elsif
      win_combo.all? do |win_index|
        board[win_index]=="O"
      end
      true
    else
      false
    end
  end
end

def full?(board)
  board.all? do |index|
    index=="X" || index=="O"
  end
  
end

def draw?(board)
  if full?(board)==true && won?(board)==nil
    true
end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    true
  else
    false
  end
  
end

def winner(board)
  if won?(board)!=nil
    board[won?(board).detect {|index| board[index]=="X" || board[index]=="O"}]
  else
    nil
  end
end




def play(board)
  if !over?(board)
    turn(board)
    play(board)
  end  
 
  if won?(board)
    winner = winner(board)
    puts "Congratulations #{winner}!"
    end
  if draw?(board)
    puts "Cat's Game!"
  end
 end

    