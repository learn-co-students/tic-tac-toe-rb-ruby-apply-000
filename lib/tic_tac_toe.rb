#All possible winning combinations
WIN_COMBINATIONS = [
    [0, 1, 2], #Top row
    [3, 4, 5], #Middle row
    [6, 7, 8], #Bottom row
    [0, 3, 6], #Left column
    [1, 4, 7], #Middle column
    [2, 5, 8], #Right column
    [0, 4, 8], #Left to right diagonal
    [6, 4, 2]  #Right to left diagonal
]

#Representing the current game board
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#Converting what the user inputs into an in index for the board
def input_to_index(user_input)
  index = user_input.to_i
  index -= 1
end

#Placing the move the user inputs on the board
def move(board, index, character = "X")
  board[index] = character
end

#Checking if the move someone made is in a spot already filled
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

#Checking to see if the move the user made is possible
def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#Asking a user for the number and checking to see if the move is valid, and if not, asking again
def turn(board)
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
    the_player = current_player(board)
    move(board, index, the_player)
    display_board(board)
  else
    turn(board)
  end
end

#Counting how many moves have been made
def turn_count(board)
  moves = 0
  board.each { |turn|
    if turn == "X" || turn == "O"
      moves +=1
    end
  }
  return moves
end

#Checking who's turn it is, if its odd than it's X's turn
def current_player(board)
  turn_counter = turn_count(board)
  if turn_count(board) % 2 == 0
    player = 'X'
  else
    player = 'O'
  end
  return player
end

#Checking to see who won
def won?(board)
  WIN_COMBINATIONS.each {|winning_combo|
    index0 = winning_combo[0]
    index1 = winning_combo[1]
    index2 = winning_combo[2]

    position_1 = board[index0]
    position_2 = board[index1]
    position_3 = board[index2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return winning_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winning_combo
    end
  }
  return false
end

#Checking to see if every space on the board is taken
 def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

 #Checking to see if there's a draw
 def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

 #Checking to see if the game is over
 def over?(board)
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

#Showing the "X" or "O" that has won the game
 def winner(board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end

#Connecting methods to create game loop
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
