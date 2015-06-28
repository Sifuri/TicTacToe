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
SPACES = 9
SOLUTIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
OPTIMAL_SPACES = [4,0,2,6,8,1,3,5,7]


ref = Instructor.new
board = GameBoard.new


puts "\t\t\tTic-Tac-Toe \n\n"

puts board.show

ref.show_rules
if ref.play?
  ref.choose_turn
  turn = X
  puts board.show
  
  # All working above
  unless board.verify(board.options)
    if turn == P1.role
      move = P1.move(board.options, P1.role)
      board.options[move] = P1.role
    else
      move = CPU.move(board.options, P1.role, CPU.role)
      board.options[move] = CPU.role
      puts board.show
      turn = switch_turn(turn)
    end
  end
  ref.show_winner(board.verify, CPU.role, P1.role)
  
end
      
      
  













