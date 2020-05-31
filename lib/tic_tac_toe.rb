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

def display_board(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def input_to_index(input)
  index = input.to_i - 1
end

def move(board, index, character)
  board[index] = character
end

def position_taken?(board, index)
  if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
    return false

  elsif (board[index] == "X") || (board[index] == "O")
    return true
  end
end


def valid_move?(board, index)
  if index >= 0 && index <= 8 && board[index] == " " || board[index] == ''
    return true
  elsif board[index] == "X" || board[index] == "O" || index < 0 || index > 8
    return false
  end

end

=begin
def turn(board)
  run = "Y"
  while run == "Y" do
    puts "Please enter 1-9:"
    user_input = gets.strip.to_i
    if user_input >= 1 && user_input <= 9
      index = input_to_index(user_input)
      if valid_move?(board, index)
        input = "X"
        move(board, index, input)
        display_board(board)
        puts board
      else
        run = "Y"
      end
      run = "N"
    else
      run = "Y"
    end
  end
end
=end
#=begin
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index) && index % 2 == 0
    character = "X"
    move(board, index, character)
    display_board(board)
  elsif valid_move?(board, index) && index % 2 == 1
    character = "O"
    move(board, index, character)
    display_board(board)
  else
    turn(board)
  end
end
#=end

def turn_count(board)
    counter = 0
    turn_taken = 0

    board.each do |turn|

        if board[counter] == "X" || board[counter] == "O"
            turn_taken += 1
        end
        counter += 1
    end
    return turn_taken
end




def current_player(board)

  if turn_count(board).to_i % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?(board)

  i = 0
  j = 0
  array = []
  winner = []
  WIN_COMBINATIONS.each do |look|
        #win_index = win_combination[i]
        #puts win_index
        check = WIN_COMBINATIONS[i]
       # puts check
        position_1 = board[WIN_COMBINATIONS[i][0]]
        position_2 = board[WIN_COMBINATIONS[i][1]]
        position_3 = board[WIN_COMBINATIONS[i][2]]
        array << [position_1, position_2, position_3]
        #puts position_1, position_2, position_3
        #puts "this: #{array}"

        i += 1

  end


  while j < WIN_COMBINATIONS.length do
    if  array[j][0] == "X" && array[j][1] == "X" && array[j][2] == "X"
        winner = [WIN_COMBINATIONS[j][0], WIN_COMBINATIONS[j][1], WIN_COMBINATIONS[j][2]]
        return winner
    elsif array[j][0] == "O" && array[j][1] == "O" && array[j][2] == "O"
        winner = [WIN_COMBINATIONS[j][0], WIN_COMBINATIONS[j][1], WIN_COMBINATIONS[j][2]]
        return winner
    end
    j += 1
  end

  return false

end

def full?(board)
  i = 0
  while i < board.length do
    if board[i] == "X" || board[i] == "O"
      i += 1
    else
      return false
      break
    end

    if i == 8
      return true
    end
  end
end


def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true
    return true
  elsif full?(board) == true
    return true
  elsif won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)

    i = 0
    j = 0
    array = []
    winner = []
    WIN_COMBINATIONS.each do |look|
          #win_index = win_combination[i]
          #puts win_index
          check = WIN_COMBINATIONS[i]
         # puts check
          position_1 = board[WIN_COMBINATIONS[i][0]]
          position_2 = board[WIN_COMBINATIONS[i][1]]
          position_3 = board[WIN_COMBINATIONS[i][2]]
          array << [position_1, position_2, position_3]
          #puts position_1, position_2, position_3
          #puts "this: #{array}"

          i += 1

    end


    while j < WIN_COMBINATIONS.length do
      if  array[j][0] == "X" && array[j][1] == "X" && array[j][2] == "X"
          winner = [WIN_COMBINATIONS[j][0], WIN_COMBINATIONS[j][1], WIN_COMBINATIONS[j][2]]
          return "X"
      elsif array[j][0] == "O" && array[j][1] == "O" && array[j][2] == "O"
          winner = [WIN_COMBINATIONS[j][0], WIN_COMBINATIONS[j][1], WIN_COMBINATIONS[j][2]]
          return "O"
      end
      j += 1
    end
    return nil
end

def play(board)
  until over?(board) == true
    turn(board)
  end

  if winner(board) == "X"
    puts "Congratulations X!"
  elsif winner(board) == "O"
    puts "Congratulations O!"
  else
    puts "Cat's Game!"
  end
end
