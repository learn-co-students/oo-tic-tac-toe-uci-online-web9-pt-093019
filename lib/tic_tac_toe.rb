class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

def initialize
@board = Array.new(9," ")
end

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------------------------------------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------------------------------------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(string)
index = string.to_i - 1
end

def move(index, token)
@board[index] = token
end

def position_taken?(index)
  tokens = ["X", "O"]
  taken = false
  tokens.each {|x| taken = true if x == @board[index]}
  taken
end

def valid_move?(index)
  valid = true
  valid = false if (position_taken?(index) == true || index < 0 || index > 8)
  valid
end

def turn_count
count = 0
@board.each {|space| count += 1 if space != " "}
count
end

def current_player
if turn_count % 2 == 0
  current = "X"
else
  current = "O"
end
current
end

def turn
this_turn = gets.chomp
index = input_to_index(this_turn) #get input

#check if input is valid and keep prompting until we get valid input
while (valid_move?(index)==false) do
  puts "Please enter a valid move"
  this_turn = gets.chomp
  index = input_to_index(this_turn)
end

token = current_player
move(index, token)
display_board
end #end of turn method

def won?
tokens = ["X", "O"]
won = false
@x_win = false
@o_win = false
winning_combo = []

WIN_COMBINATIONS.each do |combination|
  @x_win = combination.all?{|index| @board[index] == tokens[0]} if true
  @o_win = combination.all?{|index| @board[index] == tokens[1]} if true
  if @x_win || @o_win
    won = true
    winning_combo = combination
  end
end

if won #what should we return
  winning_combo
else
  false
end
end #end of won method

def full?
  full = false
  full = true if turn_count == 9
  full
end #end of full method

def draw?
  draw = false
  draw = true if full? && !won?
  draw
end

def over?
 over = false
 over = true if draw? || won?
 over
end

def winner
#  winner = ""
#  combo = won? #returns winning combo or false
#  if combo != false #if there is no winner, return ""

#this should work but doesn't pass tests
#    if @x_win
#      winner = "X"
#    elsif @o_win
#      winner = "O"
#    end # end of set the winner if block
#  end #end of combo if block
#  winner
winner = nil
winning_combo = won?
winner = @board[winning_combo[0]] if won? != false
winner
end #end of method

def play
  while over? == false
puts "Tell me your move"
turn
end #game loop
#game is over, what next?
if draw? == false
  puts "Congratulations #{winner}!"
else
  puts "Cat's Game!"
end

end #end of play method



end #end of tictactoe class
