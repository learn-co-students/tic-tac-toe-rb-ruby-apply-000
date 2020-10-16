WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]
  
def display_board(board)
  puts " #{board[0]} ""| #{board[1]} |"" #{board[2]} "
  puts "-----------"
  puts " #{board[3]} ""| #{board[4]} |"" #{board[5]} " 
  puts "-----------"
  puts " #{board[6]} ""| #{board[7]} |"" #{board[8]} "
end

def input_to_index(input)
  return "#{input}".to_i - 1 
end

def turn_count(board)
    counter = 0 
    board.each do |xo| 
      if xo == "X" || xo == "O"
        counter += 1 
      end
    end
    return counter
end 

def current_player(board)
  count = turn_count(board) 
  if count % 2 == 0 
    return "X"
  end
  return "O"
end

def move(board, index, cur_player)
   board[index] = cur_player
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
  
def position_taken?(board, index)
  return board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
   if !index.between?(0, 8)
   return false
  end
  
  if board[index] == " " || board[index] == "" || board[index] == nil
    return true
  end
  
  return !position_taken?(board, index)
end

def won?(board)
    win1 = WIN_COMBINATIONS[0]
    win2 = WIN_COMBINATIONS[1]
    win3 = WIN_COMBINATIONS[2]
    win4 = WIN_COMBINATIONS[3]
    win5 = WIN_COMBINATIONS[4]
    win6 = WIN_COMBINATIONS[5]
    win7 = WIN_COMBINATIONS[6]
    win8 = WIN_COMBINATIONS[7]
    
    if (board[win1[0]] == "X" && board[win1[1]] == "X" && board[win1[2]] == "X") || (board[win1[0]] == "O" && board[win1[1]] == "O" && board[win1[2]] == "O")
      return WIN_COMBINATIONS[0]
    end
    
     if (board[win2[0]] == "X" && board[win2[1]] == "X" && board[win2[2]] == "X") || (board[win2[0]] == "O" && board[win2[1]] == "O" && board[win2[2]] == "O")
      return WIN_COMBINATIONS[1]
    end
    
     if (board[win3[0]] == "X" && board[win3[1]] == "X" && board[win3[2]] == "X") || (board[win3[0]] == "O" && board[win3[1]] == "O" && board[win3[2]] == "O")
      return WIN_COMBINATIONS[2]
    end
    
    
    if (board[win4[0]] == "X" && board[win4[1]] == "X" && board[win4[2]] == "X") || (board[win4[0]] == "O" && board[win4[1]] == "O" && board[win4[2]] == "O")
      return WIN_COMBINATIONS[3]
    end
    
    
    if (board[win5[0]] == "X" && board[win5[1]] == "X" && board[win5[2]] == "X") || (board[win5[0]] == "O" && board[win5[1]] == "O" && board[win5[2]] == "O")
      return WIN_COMBINATIONS[4]
    end
    
   if (board[win6[0]] == "X" && board[win6[1]] == "X" && board[win6[2]] == "X") || (board[win6[0]] == "O" && board[win6[1]] == "O" && board[win6[2]] == "O")
      return WIN_COMBINATIONS[5]
    end
    
   if (board[win7[0]] == "X" && board[win7[1]] == "X" && board[win7[2]] == "X") || (board[win7[0]] == "O" && board[win7[1]] == "O" && board[win7[2]] == "O")
      return WIN_COMBINATIONS[6]
    end
    
    if (board[win8[0]] == "X" && board[win8[1]] == "X" && board[win8[2]] == "X") || (board[win8[0]] == "O" && board[win8[1]] == "O" && board[win8[2]] == "O")
      return WIN_COMBINATIONS[7]
    end
  end
  
  
  def full?(board)
    board.each do |positions|
      if positions == "" || positions == " " || positions == nil
        return false
      end
    end
  end
  
  def draw?(board)
    if !won?(board) && full?(board)
      return true 
    end
  end
  
  def over?(board)
    if draw?(board) || won?(board)
      return true
    end
  end
  
  def winner(board)
    win1 = WIN_COMBINATIONS[0]
    win2 = WIN_COMBINATIONS[1]
    win3 = WIN_COMBINATIONS[2]
    win4 = WIN_COMBINATIONS[3]
    win5 = WIN_COMBINATIONS[4]
    win6 = WIN_COMBINATIONS[5]
    win7 = WIN_COMBINATIONS[6]
    win8 = WIN_COMBINATIONS[7]
    
    if board[win1[0]] == "X" && board[win1[1]] == "X" && board[win1[2]] == "X"
      return "X"
    end
    
    if board[win1[0]] == "O" && board[win1[1]] == "O" && board[win1[2]] == "O"
      return "O"
    end
    
    if board[win2[0]] == "X" && board[win2[1]] == "X" && board[win2[2]] == "X"
      return "X"
    end
    
    if board[win2[0]] == "O" && board[win2[1]] == "O" && board[win2[2]] == "O"
      return "O"
    end
    
    if board[win3[0]] == "X" && board[win3[1]] == "X" && board[win3[2]] == "X"
      return "X"
    end
    
    if board[win3[0]] == "O" && board[win3[1]] == "O" && board[win3[2]] == "O"
      return "O"
    end
        
    if board[win4[0]] == "X" && board[win4[1]] == "X" && board[win4[2]] == "X"
      return "X"
    end
    
    if board[win4[0]] == "O" && board[win4[1]] == "O" && board[win4[2]] == "O"
      return "O"
    end
    
    if board[win5[0]] == "X" && board[win5[1]] == "X" && board[win5[2]] == "X"
      return "X"
    end
    
    if board[win5[0]] == "O" && board[win5[1]] == "O" && board[win5[2]] == "O"
      return "O"
    end
    
    if board[win6[0]] == "X" && board[win6[1]] == "X" && board[win6[2]] == "X"
      return "X"
    end
    
    if board[win6[0]] == "O" && board[win6[1]] == "O" && board[win6[2]] == "O"
      return "O"
    end
    
    if board[win7[0]] == "X" && board[win7[1]] == "X" && board[win7[2]] == "X"
      return "X"
    end
    
    if board[win7[0]] == "O" && board[win7[1]] == "O" && board[win7[2]] == "O"
      return "O"
    end
    
    if board[win8[0]] == "X" && board[win8[1]] == "X" && board[win8[2]] == "X"
      return "X"
    end
    
    if board[win8[0]] == "O" && board[win8[1]] == "O" && board[win8[2]] == "O"
      return "O"
    end
  end
  
  
  def play(board)
    until over?(board)
      turn(board)
    end
  
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board)
      puts "Cat's Game!"
    end
  end
  
      