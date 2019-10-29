require 'pry'
class TicTacToe
  WIN_COMBINATIONS  = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  attr_accessor :board, :token
  attr_reader :x_win, :o_win

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
    input.to_i - 1
  end

  def move(input_index, token = "X")
    @board[input_index] = token
  end

  def position_taken?(input_index)
    if (@board[input_index] == " " || @board[input_index] == "" || @board[input_index]== nil)
      return false
    else
      return true
    end
  end

  def valid_move?(input_index)
    if input_index >= 0 && input_index <= 8
      if !position_taken?(input_index)
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def turn
    puts "Please enter position (1-9):"
    input = gets.strip
    #binding.pry
    input_to_index_return = input_to_index(input)
    if valid_move?(input_to_index_return) == true
      move(input_to_index_return, current_player)
      display_board
    else
      puts "Not a valid move."
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |board_element|
      if board_element == "X" || board_element == "O"
        count +=1
      end
    end
    count
  end

  def current_player
    if turn_count.even?
      @token = "X"
    else
      @token = "O"
    end
    @token
  end

  def won?
    o_indexes = []
    x_indexes = []
    @board.each_with_index do |token, index|
      o_indexes << index if token == "O"
      x_indexes << index if token == "X"
    end
    WIN_COMBINATIONS.each do |combination_array|
      @o_win = combination_array.all? {|combination_element| o_indexes.include?(combination_element)}
      return combination_array if @o_win == true
      @x_win = combination_array.all? {|combination_element| x_indexes.include?(combination_element)}
      return combination_array if @x_win == true
    end
    false
  end

  def full?
    return true if @board.include?(" ") == false
  end

  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if draw? == true
      return true
    elsif won? != false
      return true
    else
      return false
    end
  end

  def winner
    if won? != false
      if current_player == "X"
        return "O"
      else
        return "X"
      end
    else
      nil
    end
  end

  def play
    latest_result = over?
    until latest_result == true
      turn
      latest_result = over?
    end

    if winner != nil
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end


