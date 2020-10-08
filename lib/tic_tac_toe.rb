WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "

board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]
end

def input_to_index(user_input)
  index = "#{user_input}".to_i - 1
end

def move(board, index, token)
  board[index] = token
end

def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return FALSE
  else
    return TRUE
  end
end

def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == FALSE
    return TRUE
  else 
    return FALSE
  end
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) == TRUE
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  counter = 0
  board.each do |token|
  if token == "X" || token == "O"
    counter += 1
  end
  end
counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
   WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combo
      end
    end
    return FALSE 
end

def full?(board)
  if board.include?("")
    return FALSE
  elsif board.include?(" ")
    return FALSE
  else
    TRUE 
  end
end

def draw?(board)
  if full?(board) && !(won?(board))
    return TRUE 
  else
    return FALSE
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return TRUE
  else
    return FALSE
  end
end

def winner(board)
  winner = won?(board)
  if winner == FALSE
    return nil
  end
  return board[winner[0]] 
end 

def play(board)
  until over?(board)
  turn(board)
  end
  if won?(board) 
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end