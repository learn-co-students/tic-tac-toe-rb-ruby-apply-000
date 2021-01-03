WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(board,index,token)
  board[index] = token
end
  
def position_taken?(board,index)
  board[index] == "X" || board[index] == "O"
end

def valid_move?(board,index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn_count(board)
  count = 0
  board.each do |element|
    if element == "X" or element == "O"
      count += 1
    end
  end
  count
end

def current_player(board)
  if board.count(' ') % 2 == 1
    "X"
  else
    "O"
  end
end

def turn(board)
  puts "Position 1-9?"
  input = gets
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index,current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board,combo[0])
  end
end

def full?(board)
  !board.include?(" ")
end

def draw?(board)
  full?(board) and !won?(board)
end

def over?(board)
  draw?(board) or won?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
  return nil
end

def play(board)
  until over?(board) do
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  end
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end
