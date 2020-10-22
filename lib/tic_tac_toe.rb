# setting constant (constants are set using capital letter at beginning of name)
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

# displays current version of the board based on the array board as an argument
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# taking user input, which is a string, and turning it into an integer to match the players point of view (1-9) to the array index (0-8)
def input_to_index(user_input)
  new_user_input = user_input.to_i
  new_user_input -= 1
  return new_user_input
end

# takes index of given input passed in as argument and places the correct player character in that space
def move(board, index, current_player)
  board[index] = current_player
  return board
end

# taking player position put in by user and checking the corresponding index in the current board all being passed in as arguments
def position_taken?(board, index)
  !(board[index] == " " || board[index] == "" || board[index] == nil)
end

# accepts board and index to check if move is valid - is the position present on the board and is it not already filled with token
def valid_move?(board, index)
  if index.between?(0, 8) && position_taken?(board, index) == false
    return true
  else
    return false
  end
end

# takes board as argument and returns the number of turns played
def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  return turns
end

# takes argument of board and the turn count is even return X, if not even return O
def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end
end

def turn(board)
  puts "Please enter 1-9:" # ask for input
  user_input = gets.strip # get input
  index = input_to_index(user_input) # convert input to index
  if valid_move?(board, index) # pass valid_move the board and index as arguments to check if it is true
    move(board, index, current_player(board)) # if valid_move is true envoke move method
    display_board(board) # if valid_move is true envoke display board method
  else
    until valid_move?(board, index) # pass valid_move the board and index as arguments to check if it is true
      puts "Please enter 1-9:" # ask for input
      user_input = gets.strip # get input
      index = input_to_index(user_input) # convert input to index
    end
  end
end

# accept board as argument and return false is no winning combo or return winning combo if all three elements are equal to X or O
def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

# accepts board and returns true if all indexes are filled with X or O
def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end

# accepts board as argument and returns true if the board is full and nobody has won
def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

# accepts board and returns true if board is won, draw or lose
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

# accepts board and returns X or O depending on who has the winning board
def winner (board)
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

# accepts board and returns turn method until over method is true, puts output depending on whether there is a winner or it is a draw
def play(board)
  until over?(board)
    current_player(board)
    turn(board)
  end

  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
