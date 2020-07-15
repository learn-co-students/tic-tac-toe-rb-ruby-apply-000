#board
board = [" "," "," "," "," "," "," "," "," "]
#WIN_COMBINATIONS
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
#input_to_index
def input_to_index(user_input)
  converted_input = "#{user_input}".to_i
  converted_input -= 1
  return converted_input
end
#move
def move(board, index, value)
  board[index] = value
  return board
end
#position_taken?
def position_taken?(board, index)
  if board[index] == " " or board[index] == "" or board[index] == nil
    then return false
  elsif board[index] == "X" or board[index] == "O"
    then return true
  end
end
#valid_move?
def valid_move?(board, index)
  if position_taken?(board, index) == false and index.between?(0,8)
    then true
  else
    false
  end
end
#turn_count
def turn_count(board)
  counter = 0
  board.each do |pos|
    if pos == "X" or pos == "O"
      then counter += 1
    end
  end
  return counter
end
#current_player
def current_player(board)
  turns = turn_count(board)
  if turns % 2 == 0
    then return "X"
  else
    return "O"
  end
end
#turn
def turn(board)
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  if valid_move?(board, index)
    then move(board, index, current_player(board))
         display_board(board)
  else
    turn(board)
  end
end
#won?
def won?(board)
  WIN_COMBINATIONS.each {|combo|
    index_0 = combo[0]
    index_1 = combo[1]
    index_2 = combo[2]

    pos1 = board[index_0]
    pos2 = board[index_1]
    pos3 = board[index_2]

    if pos1 == "X" and pos2 == "X" and pos3 == "X"
      return combo
    elsif pos1 == "O" and pos2 == "O" and pos3 == "O"
      return combo
    end
  }
  return false
end
#full?
def full?(board)
  if !board.any?{|input|input == " " }
    return true
  else
    return false
  end
end
#draw?
def draw?(board)
  if !won?(board) and full?(board)
    return true
  else
    return false
  end
end
#over?
def over?(board)
  if won?(board) or full?(board) or draw?(board)
    return true
  else
    return false
  end
end
#winner?
def winner(board)
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end
#play
def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
