WIN_COMBINATIONS =[
[0,1,2],
[3,4,5],
[6,7,8],
[0,4,8],
[2,4,6],
[0,3,6],
[1,4,7],
[2,5,8]
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

def move(board, index, player)
  board[index] = player
end

def valid_move?(board, index)

    index.between?(0,8)  && !position_taken?(board,index)
end

def position_taken?(board, index)
 !(board[index].nil? || board[index] == " ")
end


def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index , current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
 board.count{|game_piece| game_piece == "X" || game_piece =="O"}
end

 def current_player(turn)
   if turn_count(turn).even?
     player ="X"
   else
    player =  "O"
   end
   player
 end


 def won? (board)
   WIN_COMBINATIONS.detect do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]
     board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] && position_taken?(board,win_index_1)
   end

 end

 def full?(board)
   board.all? {|board_test|  board_test == "X" || board_test == "O" }
 end


 def draw? (board)
   !won?(board) && full?(board)
 end

 def over?(board)
   won?(board) || full?(board) || draw?(board)
 end



def winner(board)
  if won?(board) != nil
  board[won?(board)[0]]
  end
end

def greeting (players_name)
  puts "Hello #{players_name}!"
end


def play (board)

  while  !over?(board) == true
    turn(board)
  end

  if winner(board) != nil
    puts "Congratulations #{winner(board)}!"
  end
  if draw?(board) == true
    puts "Cat's Game!"
  end

end
