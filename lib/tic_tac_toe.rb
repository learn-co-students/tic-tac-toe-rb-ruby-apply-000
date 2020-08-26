def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def play(board)
  until over?(board)
    turn(board)
  end
  if draw?(board)
    puts "Cat's Game!"
  elsif won?(board)
    puts "Congratulations #{winner(board)}!"
  end
end


def turn(board)
  puts "Where would you like to go?"
  puts "Please enter 1-9:"
  
  user_input = gets.strip
  index = input_to_index(user_input)
  
  until valid_move?(board, index)
    display_board(board)
    puts "That is an invalid move."
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
  end
  
  player = current_player(board)
  move(board, index, player)
  display_board(board)
end


def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end


def turn_count(board)
  board.count{|i| i != " "}
end


def input_to_index(user_input)
  user_input.to_i - 1
end


def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end


def position_taken?(board, index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    FALSE
  elsif board[index] == "X" || "O"
    TRUE
  end
end


def move(board, index, player)
  board[index] = player
end


WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]


def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    FALSE
  elsif
    WIN_COMBINATIONS.each do |win_combination|
   
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
   
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
   
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
  end
end


def full?(board)
  board.detect{|i| i == " "} == nil
end


def draw?(board)
  full?(board) && !won?(board)
end


def over?(board)
  won?(board) || draw?(board)
end


def winner(board)
  if !over?(board) || draw?(board)
    nil
  elsif board[won?(board)[0]] == "X"
    "X"
  elsif board[won?(board)[0]] == "O"
    "O"
  end
end









