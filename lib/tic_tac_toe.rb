# all the ways to get three in a row
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
 
 # displays the board and fills it up from board array 
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  # zero indexed so changing input
  def input_to_index(input)
    input.to_i - 1
  end
  
 #receives input from turn, and checks if it is possible given the current state of play
  def move(board, move, char)
    if valid_move?(board,move)
      board[move] = char
    else
      turn(board)
    end
  end
  
  # makes sure it is on the board and available spot
  def valid_move?(board, pos)
    if pos.between?(0,8)
      !position_taken?(board,pos)
    end
  end
  
  # checks if player has previously moved there
  def position_taken?(board,pos)
    if board[pos] == "X" || board[pos] == "O"
      true
    else
      false
    end
  end
  
  # alternates who goes, also makes sure that we don't double display board on first call (see turn)
  # also checks to see if it is either X or O, ideally will number spaces in board for easier gameplay
  def turn_count(board)
    count = 0
    board.each do |square|
      if square == "X" || square == "O"
        count+=1
      end
    end
    count
  end
  
  # returns char for move
  def current_player(board)
    if turn_count(board) % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  # gameplay asks for/receives input, alternates the char 
  def turn(board)
    if turn_count(board) != 0
      display_board(board)
    end
    char = current_player(board)
    puts "Please Enter a move 1-9: "
    input = gets.strip
    pos = input_to_index(input)
    move(board, pos, char)
  end
  
  # checks all possible combinations after each turn.  Could also only be initated after if turn count > 5
  def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = win_combination[0]
      position_2 = win_combination[1]
      position_3 = win_combination[2]
      if (board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X") || (board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O")
        return win_combination
      end
    end
    if full?(board)
        false
    end
  end
  
  # makes sure there are no spots empty.  Would change to .match?(XO) and all if using numbered spots
  def full?(board)
    board.none? do |spot|
      spot == " "
    end
  end
  
  # checks if we are full and noone won
  def draw?(board)
    full?(board) && !won?(board)
  end
  
  # checks if draw and if someone won
  def over?(board)
    draw?(board) || won?(board)
  end
  
  # receives the winning combination and takes the board character from that to return who won
  def winner(board)
    if over?(board)
      board[won?(board)[0]]
    end
  end
  
  # keeps playing until someone wins, if won middle of turn breaks out of the loop, the unitl is a catchall
  def play(board)
    until over?(board)
      turn(board)
      if won?(board)
        break
      end
    end
    if won?(board)
      puts "Congratulations #{winner(board)}!"
    else
      puts "Cat's Game!"
    end
  end