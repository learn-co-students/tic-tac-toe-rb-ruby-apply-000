WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
]

board = Array.new(9, " ")

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


def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  board[index] != " " && board[index] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if valid_move?(board, index)
    players_move = current_player(board)
    move(board, index, players_move)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  i = 0
  board.each do |count|
    if count == "X" or  count == "O"
      i += 1
    end
  end
  return i
end


def current_player(board)
  num_turns = turn_count(board)
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif
    position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.all? do |move| move  == "X" || move == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end


def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
  false
end


def winner(board)
  winner_move = []
  winner_move = won?(board)
  if winner_move == false
    return nil
  else
    if board[winner_move[0]].include?("X")
      return "X"
    else
      return "O"
    end
  end
end

def play(board)
  until over?(board) == true do
    turn(board)
  end
  if won?(board)
    return puts "Congratulations #{winner(board)}!"
  else draw?(board)
  return puts "Cat's Game!"
  end
end