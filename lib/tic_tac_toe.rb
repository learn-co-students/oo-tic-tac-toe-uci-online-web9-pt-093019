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
    index = input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] != " "
      true
    else
      false
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) == false
      if (0..8) === index
        true
      end
    end
  end
  
  def turn_count
    @board.select{|el| el != " "}.count
  end
  
  def current_player
    turn_count % 2 === 0 ? "X" : "O"
  end
  
  def turn
    puts "Please provide a number from 1 to 9"
    user_input = gets
    index = input_to_index(user_input)
    if valid_move?(index) == true
      move(index, current_player)
    else
      puts "Wrong input! Whether the position is already occupied or the input is not between 1 and 9"
      user_input = gets
    end
    display_board
  end
    
  def won?
    WIN_COMBINATIONS.each do |combo| 
      if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[2]] != " "
        return combo
      else 
        return false
      end
    end
  end
  
  def full?
    @board.select {|square| square != " "}.count == 9
  end
  
  def draw?
    if full? == true
      if  won? == false
        true
      end
    end
  end
  
  def over?
    if full? == true 
      true
    elsif won?
      true
    end
  end

  
end