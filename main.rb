# Author: Wayne Tatum
# Date: 6/24/2015

#Title: Tic Tac Toe

require_relative 'players'
require_relative 'gameboard'
require_relative 'instructor'


# Global Constants

P1 = Human.new

X = "X"
O = "O"
SPACES = 9

# An array of all the ways a player can win. 
SOLUTIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

# An array of optimal spaces the CPU AI may take after the first lvl reasoning.
OPTIMAL_SPACES = [4,0,2,6,8,1,3,5,7]


REF = Instructor.new
BOARD = GameBoard.new

# Variable representing the current state of the board.
options = BOARD.options

#introduction
puts "\t\t\tTic-Tac-Toe \n\n"

puts BOARD.show

REF.show_rules
if REF.play?
    REF.mode
    REF.choose_turn
    turn = X
    puts BOARD.show
  
  #game session
    until BOARD.verify(options)
      if turn == P1.role
        move = P1.move(options, P1.role)
        options[move] = P1.role
      elsif $P2.instance_of? Human 
        move = $P2.move(options, $P2.role)
        options[move] = $P2.role
      else
        move = $P2.move(options, P1.role, $P2.role)
        options[move] = $P2.role
      end

      puts BOARD.show
      turn = REF.switch_turn(turn)
    end
    
    #end game - declare winner or tie
    REF.show_winner(BOARD.verify(options))
end
      
      
  













