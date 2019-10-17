class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
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
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    !position_taken?(index) && (0..8) === index
  end
  
  def turn_count
    @board.select{|el| el != " "}.count
  end
  
  def current_player
    turn_count % 2 === 0 ? "X" : "O"
  end
  
  def turn
    puts "Please provide a number from 1 to 9"
    user_input = gets.chomp
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Wrong input! Whether the position is already occupied or the input is not between 1 and 9"
      turn
    end
  end
    
  def won?
    WIN_COMBINATIONS.find {|combo| @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " " }
  end
  
  def full?
    @board.select {|square| square != " "}.count == 9
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    return @board[won?[0]] if won?
    nil
  end
  
  def play 
    until over?
      turn
    end
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end