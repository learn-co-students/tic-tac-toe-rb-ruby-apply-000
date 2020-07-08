WIN_COMBINATIONS = [
  [0,1,2],  # top row
  [3,4,5],  # middle row
  [6,7,8],  # bottom row
  [0,3,6],  # left col
  [1,4,7],  # center col
  [2,5,8],  # right col
  [0,4,8],  # left diag
  [2,4,6]   # right diag
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

def play(board)
  counter = 0
  while counter < 9
    turn(board)
    counter += 1
  end
end

def turn_count(board)
  count = 0
  board.each do |spaces|
    if spaces == "X" || spaces == "O"
      count += 1
    end
  end
  return count
end

def current_player(board)
  if turn_count(board).even?
    current_player = "X"
  else
    current_player = "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combos|
   
    test_square1 = combos[0]
    test_square2 = combos[1]
    test_square3 = combos[2]
 
    actual_square1 = board[test_square1]
    actual_square2 = board[test_square2]
    actual_square3 = board[test_square3]
    
    if actual_square1 == actual_square2 && actual_square2 == actual_square3 && position_taken?(board, test_square1)
      return combos
    end
  end
  return false
end

def full?(board)
  !board.any? {|index| index == " "}
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !full?(board) && !won?(board)
    return false
  else won?(board)
    return false
  end
end

def draw?(board)
   if !won?(board) && full?(board)
     return true
   elsif!full?(board) && !won?(board)
     return false
   else won?(board)
     return false
   end
end


def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combos|
   
    test_square1 = combos[0]
    test_square2 = combos[1]
    test_square3 = combos[2]
 
    actual_square1 = board[test_square1]
    actual_square2 = board[test_square2]
    actual_square3 = board[test_square3]
    
    if actual_square1 == actual_square2 && actual_square2 == actual_square3 && position_taken?(board, test_square1)
      return combos
    end
  end
  return false
end

def play(board)
  until over?(board) == true 
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end

