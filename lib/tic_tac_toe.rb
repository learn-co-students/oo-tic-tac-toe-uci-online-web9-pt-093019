class TicTacToe
  attr_accessor :board
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(raw_input)
    input = (raw_input.to_i) - 1
    return input
  end
  
  def move(input, token)
    @board[input] = token
  end
  
  def position_taken?(input)
    @board[input] != " "
  end
  
  def valid_move?(input)
    input.between?(0, 8) && !position_taken?(input)
  end
  
  def turn
    puts "Need and input between 1-9:"
    raw_input = gets.strip
    input = input_to_index(raw_input)

    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    @board.count {|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count.odd? ? "O" : "X"
  end
  
  def won?
    WIN_COMBINATIONS.find do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
    end
  end
  
  def full?
    turn_count == 9
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    return @board[won?[0]] if won?
    nil
  end
  
  def play
    turn until over?
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end