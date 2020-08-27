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
  index = user_input.to_i
  index = index - 1
end 

def move(array, index, value)
  array[index] = value
  display_board(array)
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    false 
  else 
    true 
  end
end

def valid_move?(board, index)
  if index.between?(0,8)
    if position_taken?(board, index) == false 
      true
    else 
      false
    end
  else 
    false
  end
end

def turn(board)
  loop do 
    turn_count(board)
    value = current_player(board)
     puts "Please enter 1-9:"
     index = input_to_index(gets.strip)
    if valid_move?(board, index) 
      move(board, index, value)
       break
    end
  end
end

def turn_count(board)
  i = 0
  board.each do |value|
    if value == "X" || value == "O"
      i += 1
    end
  end
  i
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
      i1 = combo[0]
      i2 = combo[1]
      i3 = combo[2]
      
      position1 = board[i1]
      position2 = board[i2]
      position3 = board[i3]
      
      if position1 == "X" && position2 == "X" && position3 == "X"
        return combo
      elsif position1 == "O" && position2 == "O" && position3 == "O"
        return combo 
      end
    end
    return false
  end

 def full?(board)
    board.all? {|index| index == "X" || index == "O"}
  end
  
def draw?(board)
    if !won?(board) && full?(board)
      return true
    else
      return false
    end
  end

  def over?(board) 
    if won?(board) || draw?(board) || full?(board)
      return true
    else 
      return false
    end 
  end

def winner(board)
   index = []
   index = won?(board)
   
   if index == false
      return nil
    end
    if board[index[0]] == "X"
      return "X"
    elsif board[index[0]] == "O"
      return "O"
  end
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







