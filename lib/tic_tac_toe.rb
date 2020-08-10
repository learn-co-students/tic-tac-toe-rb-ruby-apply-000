x = "X"
o = "O"
board = ["o", " ", " ", " ", "x", "o", "o", "o", "x"]
def display_board(board)
 puts  " #{board[0]} | #{board[1]} | #{board[2]} \n"
 puts  "-----------\n"
 puts  " #{board[3]} | #{board[4]} | #{board[5]} \n"
 puts  "-----------\n"
 puts  " #{board[6]} | #{board[7]} | #{board[8]} \n"
end
display_board(board)

def input_to_index(player_input)
  new_input = player_input.to_i
  new_input -= 1 
  return new_input
end

def move(board, index, character)
  board[index] = character
end


board = [" "," "," "," "," "," "," "," "," "]
def position_taken?(board,index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    return false
  else
    return true 
end
end

def valid_move?(board, index)
  def on_board?(index)
    if index.between?(0, 8) == true
      return true
    else
      return false
    end
  end


def position_taken?(board,index)
  if board[index] == "" || board[index] == " " || board[index] == nil
    return false
  else
    return true 
  end
end

if position_taken?(board,index) == false && on_board?(index) == true
  return true
else 
  return false
end
end

def turn(board)
  puts "Please enter 1-9:"
  answer = gets.strip
  index = input_to_index(answer)
  if valid_move?(board, index)
    player_move = current_player(board)
    move(board, index, player_move)
    display_board(board)
  else
    turn(board)
  end
end

def current_player(board)
  turn = turn_count(board)
  if
    turn % 2 == 0 
    return "X"
  else
    return "O"
  end
end

def turn_count(board)
  turn = 0 
  board.each do |space|
    if
      space == "X" || space == "O"
      turn = turn + 1 
    end
  end 
    return turn 
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [1,4,7],
  [0,3,6],
  [2,5,8]
  ]
def won?(board)
  WIN_COMBINATIONS.each {|winning_set|
  index_0 = winning_set[0]
  index_1 = winning_set[1]
  index_2 = winning_set[2]
  
  
  position_1 = board[index_0]
  position_2 = board[index_1]
  position_3 = board[index_2]
  
  if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    return winning_set  
  end
  }
    return false
  end
    
def full?(board)
  board.all? {|letter| letter == "X" || letter == "O"}
end

def draw?(board)
  if (!won?(board) && full?(board)) 
    return true 
  else
    return false 
end
end

def over?(board)
   if (won?(board) || full?(board) || draw?(board)) 
    return true 
  else
    return false 
end
end

def winner(board)
  letter = []
  letter = won?(board)
  if
    letter == false
    return nil 
  else
    if
      board[letter[0]] == "X"
      return "X" 
    else
      return "O"
    end
  end
end 

def play(board)
  until over?(board) == true
  turn(board)
end

if won?(board)
  puts "Congratulations #{winner(board)}!"
elsif draw?(board)
puts "Cat's Game!"
end
end