WIN_COMBINATIONS = [
    [0,1,2], #Top Row
    [3,4,5], #Middle Row 
    [6,7,8], #Bottom Row
    [0,3,6], #First Col 
    [1,4,7], #Second Col
    [2,5,8], #Third Col 
    [0,4,8], #Back Diag 
    [2,4,6], #Forward Diag 
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

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
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

def turn_count(board)
  turns = 0
  board.each do |i| 
    if i == "X" || i == "O"
      turns += 1
    end
  end
  return turns
end  

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
  else 
    return "O"
  end
end 

def won?(board)
  WIN_COMBINATIONS.each do |win_combination| 
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
 
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
 
  if position_1 == "X" && position_2 == "X" && position_3 == "X" or position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
      end
   end
   false 
end

def full?(board)
  board.all? do |f|
   f == "X" or f == "O"
end
end

def draw?(board)
  full?(board) && !won?(board)
end
  
def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
end
end


def play(board)
  until over?(board)
    turn(board)
    end
   if won?(board)
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end