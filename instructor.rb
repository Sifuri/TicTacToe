class Instructor
  # Open and present the rules of the game.
    def show_rules
      File.open('./rules.txt', 'r') do |f|
        f.each_line do |line|
          puts line
        end
      end
    end
  
  # determine if the user wants to play
    def play?
      loop do 
        puts "Are you ready to start?(y/n)"
        answer = gets.chomp.downcase
        if answer == 'y' 
          return true
        elsif answer == 'n'
          puts "Maybe next time. Bye"
          break
        end
      end
    end

  # determine which player will go first
    def choose_turn
      x = req_num("Who goes first? (1) Player 1 (2) Player 2",1,2)

      if x == 1
        puts "Player1: X"
        puts "Player2: O"
        P1.role = X
        $P2.role = O
      else
       puts("Player2: X")
       puts("Player1: O")   
       $P2.role = X
       P1.role = O
      end
    end

  # switch and keep track of the whose turn it is
    def switch_turn(turn)
      if turn == "X"
        return "O"
      else
        return "X"
      end
    end

  # request number from user within a range
    def req_num(question,low,high)
      # Ask for a number within a range 
      response = low-1
      until response.between?(low,high)
          puts question
          response = gets.chomp.to_i
      end
      return response
    end

  #Determine if the game mode is Human vs Machine or Human vs Human
    def mode
      x = REF.req_num("Play:\t(1) Human Vs. Machine\n\t(2) Human Vs. Human",1,2)
      if x == 1
        $P2 = Machine.new
      else
        $P2 = Human.new
      end
      x
    end

    def level
      #Determine if the machine is "Novice, Intermediate, or Advanced"
      lvl = REF.req_num("Play:\t(1) Novice\n\t(2) Intermediate\n\t(3) Advanced",1,3)
      if lvl == 1
        $skill = NOVICE_SPACES
      elsif lvl == 2
        $skill = BETTER_SPACES
      else
        $skill = OPTIMAL_SPACES
      end
    end

    def show_winner(winner)
      unless winner == "Tie"
        puts "#{winner}, wins!"
      else
        puts "It's a tie!"
      end
    end
end