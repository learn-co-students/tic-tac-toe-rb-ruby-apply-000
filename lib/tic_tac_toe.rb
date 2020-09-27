WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

#display_board Method
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#input_to_index Method
def input_to_index(user_input)
  user_input.to_i - 1
end

#move Method
def move(board, index, current_player)
  board[index] = current_player
end

#position_taken Method
def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

#valid_move Method
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#turn_count Method
def turn_count(board)
  number_of_turns = 0
  board.each do |position|
    if position == "X" || position == "O"
      number_of_turns += 1
    end
  end
  return number_of_turns
end

#current_player Method
def current_player(board)
  if turn_count(board) % 2 != 1
    "X"
  else
    "O"
  end
end

#won? Method
def won?(board)
  temp = 0
  if board.all? {|i| i == " "}
    false
  end
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || position_1 == "O" && position_2 == "O" && position_3 == "O"
      temp = win_combination
      return win_combination
    else
      false
    end
  end
  if board.none? {|i| i == " "} && temp = 0
    false
  end
end

#full? Method
def full?(board)
  !board.any? {|i| i == " "}
end

#draw? Method
def draw?(board)
  !won?(board) && full?(board)
end

#over? Method
def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  else
    false
  end
end

#winner Method
def winner(board)
  if won?(board)
    combo = won?(board)
    position = combo[1]
    player = board[position]
    "#{player}"
  else
    return nil
  end
end

#turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index) == false
    turn(board)
  else
    character = current_player(board)
    move(board,index,character)
    display_board(board)
  end
end

#play Method
def play(board)
  if won?(board)
    puts "Congratulations " + winner(board) + "!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
  until over?(board)
    turn(board)
    play(board)
  end
end
