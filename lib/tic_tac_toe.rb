
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
  board_index = user_input.to_i - 1
  return board_index
end

def move(board, position, player_token)
  board[position] = player_token
end

def position_taken?(board, position)
  board[position] != " "
end

def valid_move?(board, position)
  !position_taken?(board, position) && (0..8).include?(position)
end

def turn(board)
  puts "Please select an available position."
  position = gets.strip
  index = input_to_index(position)
  character = current_player(board)
  if valid_move?(board, index)
    move(board, index, character)
  else
    puts "Invalid Move."
    turn(board)
  end
end

def turn_count(board)
  board.count { |x| x != " "}
end

def current_player(board)
  if turn_count(board) % 2 == 0
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.each do | winning_combo |
    pos_1 = board[winning_combo[0]]
    pos_2 = board[winning_combo[1]]
    pos_3 = board[winning_combo[2]]

    #if winning_combo.none? { | position | position == " " }  &&
    #  pos_1 == pos_2 &&
    #  pos_2 == pos_3
    #  return winning_combo
    #end

    if pos_1 == pos_2 && pos_2 == pos_3 && pos_1 != " "
      return winning_combo
    end
  end
  false
end

def full?(board)
  board.none? { |position| position == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    win_pos_1 = winning_combo[0]
    return board[win_pos_1]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end

  if won?(board)
      puts "Congratulations #{winner(board)}!"
      puts "You won!"
  elsif draw?(board)
      puts "Cat's Game!"
      puts "The game is a draw. See you next time."
  end

end
