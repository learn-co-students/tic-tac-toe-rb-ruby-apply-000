WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def display_board (board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(x)
  x = x.to_i
  x = x - 1
end

def move(array, index, value)
  array[index] = value
  return array
end

def position_taken? (board, index)
  if (board[index] == nil || board[index] == " " || board[index] == "")
    return false
  else  
    return true
  end
end

def valid_move? (board, index)
  if (position_taken?(board, index) == false && index.between?(0,8) == true)
    return true
  else
    return false
  end
end

def current_player (board)
  if (turn_count(board) % 2 == 0)
    return "X"
  else 
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  user_input2 = input_to_index(user_input)
  if (valid_move?(board, user_input2) == true)
    move(board, user_input2, current_player(board))
  else
    turn(board)
  end
end

def turn_count (board)
  counter = 0
  board.each do |position|
    if (position == "X" || position == "O")
      counter += 1
    end
  end
  return counter
end

def won?(board)
  WIN_COMBINATIONS.each do |element|
    index1 = element[0]
    index2 = element[1]
    index3 = element[2]
    if ((board[index1] == "X" && board[index2] == "X" && board[index3] == "X") || (board[index1] == "O" && board[index2] == "O" && board[index3] == "O"))
      return element
    end
  end
  return false
end

def full?(board)
  board.all? {|element| element == "X" || element == "O"}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    return true
  else
    return false
  end
end

def winner (board)
  if won?(board) == false
    return nil
  else
    if (board[won?(board)[0]] == "X")
        return "X"
    elsif (board[won?(board)[0]] == "O")
        return "O"
    end
  end
end

def play(board)
  
  until over?(board) == true
    turn(board)
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board) == true
    puts "Cat's Game!"
  end
end
