WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Back diagonal
  [2,4,6], #Forward diagonal
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

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def current_player(board)
  turn_count(board)%2 == 0 ? "X" : "O"
end

def turn_count(board)
  turn = 0
  board.each do |move|
    if move == "X" || move == "O"
      turn += 1
    end
  end
  return turn
end

def won?(board)
  WIN_COMBINATIONS.any? do |combination|
    if (combination.all? do |position|
      board [position] == "X"
    end) ||
      (combination.all? do |position|
      board [position] == "O"
    end)
      return combination
    end
  end
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if (won?(board) == false && full?(board) == true)
    return true
  else
    return false
  end
end

def over?(board)
  if (won?(board) != false) || (draw?(board) == true)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else
    combination = won?(board)
    return board[combination[0]]
  end
end

def play(board)
  until over?(board) == true do
    turn(board)
  end

  if won?(board) != false
    puts "Congratulations #{winner(board)}!"
  else
    puts "Cat's Game!"
  end
end
