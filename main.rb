# Author: Wayne Tatum
# Date: 6/24/2015

#Title: Tic Tac Toe

require_relative 'players'
require_relative 'gameboard'
require_relative 'instructor'


# Global Constants

# Human and CPU objects are created based on answer to MODE in the future

P1 = Human.new
CPU = Machine.new

X = "X"
O = "O"
OPEN = " "
TIE = "TIE"
SPACES = 9
SOLUTIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


ref = Instructor.new
board = GameBoard.new


puts "\t\t\tTic-Tac-Toe \n\n"

puts board.show

ref.show_rules
if ref.play?
  ref.choose_turn
  puts board.show
end












