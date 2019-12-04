def turn(board)
  #get the user input
  puts "Please enter 1-9:"
  user_input =gets.strip;
  index = input_to_index(user_input);
  token = currentPlayerToken(board)

    if valid_move?(board, index)
        puts 'Valid Move!'
        move(board, index, token)
        display_board(board)
    else
        puts 'Try Again!'
        turn(board)
    end
    display_board(board)
end


def currentPlayerToken(board)
  if turn_count(board)%2 == 0
    token = 'X'
  else
    token = 'O'
  end
end


def turn_count(board)
  counter = 0
  board.each do |space|
    if space == "X" || space == "O"
      counter +=1
    end
  end
  return counter
end

def input_to_index(input)
   index = input.to_i - 1
   return index
end

def move(board, index, token)
  board[index] = token
end

def display_board(board)
  puts" #{board[0]} | #{board[1]} | #{board[2]}  "
  puts"-----------"
  puts" #{board[3]} | #{board[4]} | #{board[5]} "
  puts"-----------"
  puts" #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  valid_move = boolean

  if index.between?(0,8) && !position_taken?(board,index)
    return valid_move = true
  else
    return valid_move = false
  end
end

def position_taken?(board, index)
  position_taken = boolean

  if board[index] == " " || board[index] == "" || board[index] == nil
      return position_taken = false
  elsif board[index] == "X" || board[index] == "O"
    return position_taken = true
  else
    return position_taken = true
  end
end
