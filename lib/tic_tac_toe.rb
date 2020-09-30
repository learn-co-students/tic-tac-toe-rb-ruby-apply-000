WIN_COMBINATIONS = 
  [[0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [6, 4, 2],
  [0, 4, 8]]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  index = input.to_i
  index -= 1
  return index
end


def move(board, index, character)
  board[index] = character
  return board
end


def position_taken?(board, index)
  if board[index] == " "
    return false
  elsif board[index] == ""
    return false
  elsif board[index] == nil
    return false
  else 
    return true
  end
end


def valid_move?(board, index)
   def position_taken?(board, index)
    if board[index] == " " 
      return false
    elsif board[index] == "" 
      return false
    elsif board[index] == nil
      return false
    else
      return true
    end
  end
  def spot_taken?(num)
      if num.between?(0,8) == true
        return true
      else
        return false
      end
  end
  if position_taken?(board, index) == false && spot_taken?(index) == true
    return true
  else
    return false
  end
end

 
def turn(board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end


def turn_count(board)
  counter = 0
  board.each do |i|
    if i == "X" || i == "O"
      counter += 1
    end
  end
    counter
end


def current_player(board)
  if turn_count(board) % 2 == 0
   current_player = "X"
  else 
    current_player = "O"
  end
  return current_player
end


def won?(board)
  WIN_COMBINATIONS.each { |possible_wins|
    win_index0 = possible_wins[0]
    win_index1 = possible_wins[1]
    win_index2 = possible_wins[2]

    position_1 = board[win_index0]
    position_2 = board[win_index1]
    position_3 = board[win_index2]
  
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return possible_wins
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
     return possible_wins 
    end }
  return nil
end


def full?(board)
  if board.detect { |i| i == " " || i == false }
    return false
  else
    return true
  end
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
  else 
    return false
  end
end


def over?(board)
  if full?(board) || draw?(board) || won?(board)
    return true
  else 
    return false
  end
end


def winner(board)
  index = []
  index = won?(board)
  if index == nil
    return nil
  else 
    if board[index[0]] == "X"
      return "X"
    else 
      return "O"
    end
  end
end


def play(board)
  while over?(board) == false
    turn(board)
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end