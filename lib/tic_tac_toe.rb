WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],

  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],

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

  def move(board, index, token)
    board[index] = token
    board.all?{|token| token == "X" || token == "O"}
end


  def position_taken?(board, position)
  if !(board[position] == " " || board[position] == "" || (board[position].nil?))
    true
  else
    false
  end
end

def valid_move?(board, user_input)
  user_input = user_input.to_i
  if !(user_input.between?(0,8))
  return false
end
if board[user_input] ==  " "
return true
end
 if (board[user_input] == "" || board[user_input] == nil ||
board[user_input] == "X" || board[user_input] == "O")
return false
 end
end

  def turn(board)
  puts "Please enter 1-9:"
    user_input = gets.strip
  user_input = user_input.to_i - 1
if valid_move?(board, user_input)
      move(board,user_input,current_player(board))
      display_board(board)
else
  # turn(board)
  #  !valid_move?(board, user_input)
  #     puts "Please enter 1-9:"
  #       user_input = gets.strip

end
end

  def play(board)
  counter = 0
   while counter < 9
   turn(board)
    counter = counter + 1
  end
  end

def turn_count(board)
pos_array = board.select do |pos|
 pos == ("X") || pos == ("O")
 end
  return pos_array.size
end

def current_player(board)
  turn_num = turn_count(board) + 1
  if turn_num.even? == true
    return "O"
  else
    return "X"
  end
end


  def full?(board)
  #  !board.any? { |x| x == " " }
    board.all?{|token| token == "X" || token == "O"}
  end

  def draw?(board)
    if won?(board) && full?(board)
    returns false
      end
    if full?(board) && !won?(board)
  puts "Cat's game!"
  returns true
end
end



  def over?(board)
    won?(board) || draw?(board)
    returns true
  end

  def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?(board, combo[0])
end
end

  def winner(board)
   if number1 = won?(board)
    return board[number1.first]
   end
end
