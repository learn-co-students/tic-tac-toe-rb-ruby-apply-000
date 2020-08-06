WIN_COMBINATIONS = 
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]


def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
   a=input.to_i
   return a - 1
  end

def move (board, index, char)
  def update_array_at_with(array, index, value)
    array[index]=value
  end
  update_array_at_with(board, index, char)
  return board
end

def position_taken? (board, index)
  if (board[index]==" " || board[index]=="" || board[index]==nil)
    return FALSE
  else 
    return TRUE
  end
end

def valid_move? (board,index)
  if ((index>=0 && index<=8) && !position_taken?(board,index))
    return true
  else 
    return false
end 
end


def turn_count(board)
  num_turns=0
  board.each do |turns|
    if turns=="X" || turns=="O"
      num_turns+=1 
    end
  end
  return num_turns
end

def turn(board)
  puts "Please enter 1-9:"
  input= gets.strip
  index= input_to_index(input)
  if (valid_move?(board,index)) && (turn_count(board)%2==0)
    move(board,index,token='X')
    display_board(board)
    elsif (valid_move?(board,index)) && turn_count(board)%2==1
    move(board,index,token='O')
    display_board(board)
  else
    turn(board)
  end
end

def current_player(board)
  if (turn_count(board)%2==0) || (turn_count(board)==0)
    return "X"
  else
    return "O"
  end
end


  def won? (board)
    if board.all?("") || board.all?(" ") || board.all?(nil)
      return nil
    end
        
    WIN_COMBINATIONS.each do |win_index|
        if board[win_index[0]]=="X" && board[win_index[1]]=="X" && board[win_index[2]]=="X"
            return win_index
        elsif board[win_index[0]]=="O" && board[win_index[1]]=="O" && board[win_index[2]]=="O"
            return win_index
          end
        end
        if board.none?("") && board.none?(" ") && board.none?(nil)
        return nil
      end
  end
  
  def full?(board)
    if board.none?(" ") && board.none?("") && board.none?(nil)
      return true
    else
      return false
    end
  end

def draw? (board)
  if won?(board) != nil
    return false
  end
  if (board[0]==board[4] && board[4]==board[8]) || (board[2]==board[4] && board[4]==board[6])
    return false
  end
  if full?(board) == true
    return true
  end
end

def over? (board)
  if draw?(board)==true
    return true
  end
  if (won?(board) != nil)
    return true
  end
  if full?(board) == true
  return true
end
end

def winner(board)
  if won?(board)==nil || draw?(board)
    return nil
  end
  WIN_COMBINATIONS.each do |win_index|
        if board[win_index[0]]=="X" && board[win_index[1]]=="X" && board[win_index[2]]=="X"
            return "X"
        elsif board[win_index[0]]=="O" && board[win_index[1]]=="O" && board[win_index[2]]=="O"
            return "O"
          end
        end
end

def play(board)
  until over?(board)==true 
    if won?(board)!=nil
      return over?(board)==true
      play(board)
    end
    if draw?(board)==true
      return over?(board)==true
      play(board)
    end
      if winner(board)!=nil
        return over?(board)==true
        play(board)
    else 
      turn(board)
      won?(board)
    end
  end
  
if draw?(board)==true
  puts "Cat's Game!"
  elsif winner(board)=="X"
    puts "Congratulations X!"
  elsif winner(board)=="O"
    puts "Congratulations O!"
  end
end