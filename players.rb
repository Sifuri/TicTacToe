class Human
  attr_accessor :role
  
  # Requesting and returning the players move 
  def move(options, role)
    free = BOARD.free_moves(options)
    choice = nil
    
    until free.include? choice 
      choice = REF.req_num("Choose your next move:", 0, SPACES)
      unless free.include? choice
          puts "The chosen space is occupied, please choose another."
       end
     end
    puts "Placing #{role} in position #{choice}..."
    choice
  end
end


class Machine
  attr_accessor :role
  
  # Determine if CPU can win the next move
  def move(options, human_role, cpu_role)
    open_spaces = BOARD.free_moves(options)
    open_spaces.each do |s|
      options[s] = cpu_role
      unless BOARD.verify(BOARD.options) != cpu_role
        puts s
        return s
      end
      # undo assignment after verify
      options[s] = s
    end
    
    # Block human from winning next move
    open_spaces.each do |s|
      options[s] = human_role
      unless BOARD.verify(BOARD.options) != human_role
        puts s
        return s
      end
      # undo assignment after verify
      options[s] = s
    end
    # Choose best available spaces
    OPTIMAL_SPACES.each do |s|
      if open_spaces.include? s
        puts s
        return s
      end
    end
  end
end
  
  

