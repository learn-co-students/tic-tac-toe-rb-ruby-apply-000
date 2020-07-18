def display_board(board = [" "," "," "," "," "," "," "," "," "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(user_input)
  user_input = user_input.strip.to_i - 1
end


def move(array, index, value)
  array[index] = value
end


def position_taken?(board, index)
  if board[index] == " "
    return false
  elsif board[index] == ""
    return false
  elsif board[index] == nil
    return false
  elsif board[index] == "X"
    return true
  elsif board[index] == "O"
    return true 
  end
end


def valid_move?(board, index)
  if position_taken?(board, index)
    return false
  elsif index.between?(0,8)
    return true
  else
    return false
  end
end


def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    else turns += 0
    end 
  end
  return turns
end


def current_player(board)
  turn_count = turn_count(board)
  if turn_count == 0 || turn_count % 2 == 0
    current_player = "X"
  else current_player = "O"
  end
  return current_player
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
  output = false
  WIN_COMBINATIONS.each do |win_combination|
    moves = []
    win_combination.each do |board_index|
      moves << board[board_index]
    end
    if moves[0] == "X" && moves[1] == "X" && moves[2] == "X" || moves[0] == "O" && moves[1] == "O" && moves[2] == "O"
      output = win_combination
      break
    end
  end
  return output
end


def full?(board)
  output = true
  board.each do |board_index|
    if board_index == " "
      output = false
      break
    end
  end
  return output
end
    
    
def draw?(board)
  output = true
  if won?(board) != false
    output = false
  elsif full?(board) == false
    output = false
  else
    return output
  end
  return output
end


def over?(board)
  output = false
  if won?(board) != false
    output = true
  elsif draw?(board) == true
    output = true
  elsif full?(board) == true
    output = true
  else
    output = false
  end
  return output
end


def winner(board)
  output = nil
  won_board = won?(board)
  if won_board != false
    win_array = []
    won_board.each do |board_index|
      win_array << board[board_index]
    end
    if win_array == ["X","X","X"]
      output = "X"
    else
      output = "O"
    end
  end
  return output
end


def play(board)
  while over?(board) == false
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  else
  end
end