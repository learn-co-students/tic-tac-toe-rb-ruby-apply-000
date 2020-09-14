WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board(board_state)
  #row 1
  puts " #{board_state[0]} | #{board_state[1]} | #{board_state[2]} "
  puts "-----------"
  #row 2
  puts " #{board_state[3]} | #{board_state[4]} | #{board_state[5]} "
  puts "-----------"
  #row 3
  puts " #{board_state[6]} | #{board_state[7]} | #{board_state[8]} "
end

def input_to_index(position)
  position.to_i - 1
end

def move(board, position, xo)
  board[position] = xo
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
  if index.between?(0,8) == true
    if position_taken?(board, index) == false
      true
    end
  else
    #else not valid move
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  position = gets.strip
  index = input_to_index(position)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    puts "Invalid move, please enter a different number:"
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |index|
    if index == "X" || index == "O"
      turns += 1
    end
  end
  return turns
end 

def current_player(board)
  if turn_count(board).even?
    current_player = "X"
  elsif turn_count(board).odd?
    current_player = "O"
  end
  return current_player
end

def won?(board)
  WIN_COMBINATIONS.each do |win_option|
    if position_taken?(board, win_option[0])
      if board[win_option[0]] == board[win_option[1]] && board[win_option[0]] == board[win_option[2]]
        return win_option
      end
    end
  end
  return false 
end

def full?(board)
  counter = 0 
  while counter < 9
    if !position_taken?(board, counter)
      return false
    end
    counter += 1 
  end
  return true 
end 

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end 
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end 

def winner(board)
  if won?(board)
    win_line = won?(board)
    return "#{board[win_line[0]]}"
  else 
    return nil
  end 
end

def play(board)
  while !over?(board)
    turn(board)
  end
  
  if draw?(board)
    puts "Cat's Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end 
