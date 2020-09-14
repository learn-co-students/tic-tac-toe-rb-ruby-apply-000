WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
   ]
   
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  user_input = user_input.to_i
  user_input = user_input - 1
end

def move(board, index, player)
   board[index] = player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
            counter += 1
    end
  end
  counter
end

def current_player(board)
  if turn_count(board) % 2 == 0 
    return "X"
 else
   return "O"
 end
end

   def won?(board)
       
     WIN_COMBINATIONS.detect do |combo|
      
        board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0])
        end
   end
      
   
   def full?(board)
     !board.include?(" ") && !board.include?("")
   end
   
   def draw?(board)
     full?(board) && !won?(board)
   end
   
   def over?(board)
     won?(board) || draw?(board)
   end
   
   def winner(board)
     winning_board = won?(board)
   #binding.pry
    if winning_board
      return board[winning_board[0]] 
    end
 
    end

# Define your play method below
def play(board)
  counter = 0
  until counter == 9
  turn(board)
  counter += 1
 end
end
