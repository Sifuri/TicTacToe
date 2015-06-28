class Instructor
  def show_rules
    File.open('./rules.txt', 'r') do |f|
      f.each_line do |line|
        puts line
      end
    end
  end
  
  def play?
    loop do 
      puts "Are you ready to start?(y/n)"
      answer = gets.chomp
      if answer == 'y' 
        return true
      elsif answer == 'n'
        puts "Maybe next time. Bye"
        break
      end
    end
  end
  
  def choose_turn
    # return
    #default is human vs cpu, later human 1 vs human 2
    x = req_num("Who goes first? (1) Human (2) CPU",1,2)
    
    # where it says Player 1 can use string interpolation when Human vs Human
    if x == 1
      puts "Player1: X"
      puts "Machine: O"
      P1.role = X
      CPU.role = O
    else
      
     puts("Machine: X")
     puts("Player1: O")   
     CPU.role = X
     P1.role = O
      
    end
  end
  
  def req_num(question,low,high)
    # Ask for a number within a range - edit
    # between? does exclude low or high
    response = 0
    loop do 
      unless response.to_i.between?(low,high)
        puts question
        response = gets.chomp.to_i
      else
        return response
      end
    end
  end
  
  def mode
    #Determine if the game mode is Human vs Machine or Human vs Human
  end
  
  def level
    #Determine if the machine is "Novice, Intermediate, or Advanced"
  end
  
  def show_congrats
  end
end