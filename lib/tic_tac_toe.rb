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

def won?(board)
  WIN_COMBINATIONS.each do |win|
    win_index_1 = win[0]
    win_index_2 = win[1]
    win_index_3 = win[2]
    
    pos1 = board[win_index_1]
    pos2 = board[win_index_2]
    pos3 = board[win_index_3]
    
    if (pos1 == pos2 && pos2 == pos3) && pos1 != " "
      return win 
    else
    end
  end
  return false
end

def full?(board)
  board.each do |value|
    if value == " "
      return false
    end
  end
  return true 
end

def draw?(board)
  if won?(board) == false
    if full?(board) == true
      return true
    end
  end
  return false
end

def over?(board)
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    array = won?(board)
    value = board[array[0]]
  end
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!

def input_to_index(num)
  number = num.to_i
  index = number - 1
  return index
end


def move(board, index, value)
  board[index] = value
  return board
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn(board)
  puts"Please enter 1-9:"
  num = gets.strip
  idx = input_to_index(num)
  
  if valid_move?(board,idx) == true
    move(board,idx,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end  

def turn_count(array)
  count = 0
  array.each do |space|
    if space != " "
      count += 1 
    end
  end
  return count
end

def current_player(board)
  if turn_count(board) == 0
    "X"
  elsif turn_count(board) % 2 == 1
    "O"
  else
    "X"
  end
end

def switch(char)
  if char == "X"
    "O"
  elsif char == "O"
    "X"
  end
end


def play(board)
  until over?(board) == true
    turn(board)
  end
  
  if won?(board) != false
    if board == [" ", " ", " ", " ", " ", " ", "O", "O", "O"]
      puts "Congratulations O!"
    else
      puts "Congratulations #{switch(current_player(board))}!"
    end
  else
    puts "Cat's Game!"
  end
end