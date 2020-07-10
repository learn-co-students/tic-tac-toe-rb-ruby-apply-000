# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]]

def won?(board)
   empty = board.all? do |position|
     position == "" || position == " "
   end
   if empty
     return FALSE
   end
   
   
   WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
        break
    end
  end
  return nil
end

def full?(board)
  counter = 0 
  result= TRUE
  while counter<9
   if !position_taken?(board, counter)
     return FALSE
   end
   counter += 1
 end
  return result
 end
 
def draw?(board)
  if full?(board) && (won?(board)==nil)
    return TRUE
  else
    return FALSE
  end
end

def over?(board)
  inprogress = board.any?{|i| i == "" || i == " "}
  if inprogress && (won?(board)==nil)
    return FALSE
  end
  
  if (won?(board)!=nil) && !(full?(board))
    return TRUE
  end
  
  if (won?(board)!=nil) || draw?(board) || full?(board)
    return TRUE
  end
end

def winner(board)
  array= won?(board)
  if (won?(board)==nil)
    return nil
  else
    return board[array[0]]
  end
end


