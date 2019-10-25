require 'pry'
class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

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
  def input_to_index(input)
    index = input.to_i - 1
  end
  def move(index, token = "X")
    @board[index] = token
  end
  def position_taken?(index)
    # @board[index] !== " "
    @board[index] == "X" || @board[index] == "O"
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:" #ask for input
    input = gets
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def won?
    # iterate through arrays of winning combinations and
    # see if there are any instances on @board where there is
    # the same character in all three elements of a winning combos array
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
    end
  end
  def full?
    @board.none?{ |position| position == " "}
  end
  def draw?
    !won? && full?
  end
  def over?
    won? || draw?
  end
  def winner
    if won?
      @board[won?[0]]
    end
  end
  def play
    turn until over?
    if draw?
      puts "Cat's Game!"
    elsif won?
        puts "Congratulations #{winner}!"
    end
  end

end
