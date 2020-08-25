def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  
#   def won?(board)
#     WIN_COMBINATIONS.each do |wins|
#       if board[wins[0]] == "X" && board[wins[1]] == "X" && board[wins[2]] == "X"
#         return wins
#       elsif board[wins[0]] == "O" && board[wins[1]] == "O" && board[wins[2]] == "O"
#         return wins
#       end
#     end
#       false
#   end
  
#   def full?(board)
#     board.all? do |element|
#       element == "X" || element == "O"
#     end
#   end
  
#   def draw?(board)
#     if !won?(board) && full?(board)
#       true
#     end
#   end
  
#   def over?(board)
#     if won?(board) || draw?(board) || full?(board)
#       true
#     end
#   end
  
#   def winner(board)
#     WIN_COMBINATIONS.each do |wins|
#       if board[wins[0]] == "X" && board[wins[1]] == "X" && board[wins[2]] == "X"
#         return "X"
#       elsif board[wins[0]] == "O" && board[wins[1]] == "O" && board[wins[2]] == "O"
#         return "O"
#       end
#     end
#     if !won?(board)
#       return nil
#     end
#   end 
  
# def turn_count(board)
#   counter = 0
#   board.each do |element|
#     if element != " "
#       counter += 1
#     end
#   end
#   counter
# end

# def current_player(board)
#   turn_count(board).even? ? "X" : "O"
# end


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
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

# def turn(board)
#   puts "Please enter 1-9:"
#   input = gets.strip
#   index = input_to_index(input)
#   if valid_move?(board, index)
#     move(board, index, current_player(board))
#     display_board(board)
#   else
#     turn(board)
#   end
# end

# Define your play method below

# def play(board)
#   index = 0
# while index <= 8
#   turn(board)
#   index += 1
# end
# end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
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

def turn_count(array)
  counter = 0
  array.each do |element|
    if (element == "X" || element == "O")
      counter += 1
    else
      # do nothing
    end
  end
  return counter
end

def current_player(board)
  if (turn_count(board).even? == true)
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
    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combination
    else
      # do nothing
    end
  end
  return nil
end

def full?(array)
  counter = 0
  array.each do |element|
    if (element == "X" || element == "O")
      counter += 1
    else
      # do nothing
    end
  end
  if counter == 9
    return true
  else
    return false
  end
end

def draw?(array)
  if full?(array) && !won?(array)
    return true
  else
    return false
  end
end

def over?(array)
  if ( won?(array) || draw?(array) || full?(array) )
    return true
  else
    return false
  end
end

def winner(array)
  if won?(array)
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = array[win_combination[0]]
      position_2 = array[win_combination[1]]
      position_3 = array[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return "X"
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return "O"
      else
        # do nothing
      end
    end
  else
    return nil
  end
end

def play(board)
  while !over?(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
    #do nothing
  end
end

# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# play(board)


