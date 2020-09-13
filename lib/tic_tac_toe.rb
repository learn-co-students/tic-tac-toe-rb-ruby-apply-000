WIN_COMBINATIONS = [
  [0,1,2], #1
  [3,4,5], #2
  [6,7,8], #3
  [0,3,6], #4
  [1,4,7], #5
  [2,5,8], #6
  [0,4,8], #7
  [6,4,2]  #8
]

#Tic Tac Toe Board Display
def display_board(board)
  separator = "|"
  lines = "-----------"
  
  puts " #{board[0]} #{separator} #{board[1]} #{separator} #{board[2]} "
  puts "#{lines}"
  puts " #{board[3]} #{separator} #{board[4]} #{separator} #{board[5]} "
  puts "#{lines}"
  puts " #{board[6]} #{separator} #{board[7]} #{separator} #{board[8]} "
end

#Conversion of users's input into index
def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
  return index
end

#Move Method for either X || O
def move(board, index, token)
  board[index] = token
end

#Position_Taken? Method
def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

#Valid_Move? Method 
def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    return true
  else 
    return false
  end
end

#Turn_Count Method
def turn_count(board)
  turn = 0
  board.each do |index|
    if index != " "
      turn += 1
    end
  end
    turn
 end

#Current_Player Method
def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

#Turn Method
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(board, index)
    turn(board)
  else
    move(board, index, current_player(board))
  end
  display_board(board)
end

#Won? Method
def won?(board)
  WIN_COMBINATIONS.each {|win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  end
}
  return false
end

#Full? Method
def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

#Draw? Method
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

#Over? Method
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

#Winner Method
def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == 'X'
      return "X"
    else
      return "O"
    end
  end
end

#Play Method - MAIN Method
def play(board)
  
  while !over?(board) && !won?(board) && !draw?(board)
    turn(board)
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end
  
  if draw?(board)
    puts "Cat's Game!"
  end
  
end