def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def input_to_index(input)
  input.to_i - 1
end

def move(board, index, character)
  if valid_move?(board,index)
    board[index] = character
  end
  board
end

def position_taken?(board, index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board, index)
  index >= 0 && index <= 8 && !position_taken?(board,index)
end

def turn(board)
  puts "Welcome! Take your turn by inputting 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  count = turn_count(board)
  char = count % 2 == 0 ? "X" : "O"
  if valid_move?(board, index)
    board = move(board,index, char)
    display_board(board)
  else 
    turn(board)
  end
end

def turn_count(board)
  count = 0
  board.each do |tile|
    if tile == "X" || tile == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  count = turn_count(board)
  count % 2 == 0? "X" : "O"
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    index1 = combo[0]
    index2 = combo[1]
    index3 = combo[2]
    
    if (board[index1] == "X" && board[index2] == "X" && board[index3] == "X")
      return combo
    elsif (board[index1] == "O" && board[index2] == "O" && board[index3] == "O")
      return combo
    end
  end
  return false
end

def full?(board)
  board.each do |tile|
    if tile == "" || tile == " " || tile == nil
      return false
    end
  end
  return true
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  false
end

def over?(board)
  if draw?(board) || full?(board) || won?(board)
    return true
  end
  false
end

def winner(board)
  index = won?(board)
  if index != false
    return board[index[0]]
  end
  return nil
end

def play(board)
  while !over?(board)
    turn(board)
  end
  
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  else 
    puts "Cat's Game!"
  end
end

