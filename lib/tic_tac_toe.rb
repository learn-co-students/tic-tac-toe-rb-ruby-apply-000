#WIN_COMBINATIONS
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]

#display_board
def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


#input_to_index
def input_to_index(index)
    index.to_i - 1
end


#position_taken?
def position_taken?(board, index)
    if board[index] == " "
        false
    elsif board[index] == ""
        false
    elsif board[index] == nil
        false
    elsif board[index] == "X" || board[index] == "O"
        true
    end
end


#valid_move?
    def valid_move?(board, index)
    if index.between?(0, 8) == false || position_taken?(board, index) == true
        false
    elsif index.between?(0, 8) == true || position_taken?(board, index) == false
        true
    end
end

# Move
def move(board,input_to_index,value)
    board[input_to_index] = value
end

#turn
def turn(board)
    puts "Please enter 1-9:"
    index = gets.strip
    index = input_to_index(index)
    if valid_move?(board, index)
        move(board, index, current_player(board))
        display_board(board)
    else
        turn(board)
    end
end

#turn_count
def turn_count(board)
    counter = 0
    board.each do |index|
      if index == "X" || index == "O"
        counter += 1
      end
    end
    counter
end

  #current_player
  def current_player(array)
    if turn_count(array) % 2 == 0
      "X"
    else
      "O"
    end
  end

def won?(board)
     WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board[win_index_1]
        position_2 = board[win_index_2]
        position_3 = board[win_index_3]

        if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
            return win_combination
        else
        end
    end
    false
end

#full?
def full?(board)
    if board.any? {|index| index == nil || index == " "}
      return false
    else
      return true
    end
  end

#draw?
def draw?(board)
    if full?(board) == true && won?(board) == false
      return true
    else
      false
    end
  end

#over?
def over?(board)
    if won?(board) || full?(board) || draw?(board)
      return true
    else
      return false
    end
  end

#winer
def winner(board)
    if won?(board)
        return board[won?(board)[0]]
    end
end

#play
def play(board)
  until over?(board)
    turn(board)
  end
  if won?(board)
    winner(board) == "X" || winner(board) == "O"
    puts "Congratulations #{winner(board)}!"
  else draw?(board)
    puts "Cat\'s Game!"
  end
end
