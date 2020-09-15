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
  WIN_COMBINATIONS.each do |win_combo|
    if board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && board[win_combo[0]] != " "
      return win_combo
    end
  end
  return false
end

def full?(board)
  board.all?{|position| position != " "}
end

def draw?(board)
  full?(board)&&!won?(board)? true : false
end

def over?(board)
  draw?(board)||won?(board)? true : false
end

def winner(board)
  combo = won?(board)
  combo ? (return board[combo[0]]) : nil
end

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter += 1
    end
  end
  return counter
end

def current_player(board)
  turn_count(board) % 2 == 0 ? (return "X") : (return "O")
end

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

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
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

def play(board)
  if over?(board)
    won?(board) ? (puts "Congratulations #{winner(board)}!") : (puts "Cat's Game!")
  else
    turn(board)
    play(board)
  end
end