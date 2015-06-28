# GameBoard Class

class GameBoard
  attr_accessor :options
  
  # Represent a new board with an array of numerical elements for each board space.
  def initialize
    @options = []
    SPACES.times do |s|
      options << s
    end
  end
  
  #Display the current board.
  def show(new_options = nil)
    @options = new_options if new_options
    
    puts "\t\t\t--#{options[0]}--|--#{options[1]}--|--#{options[2]}--"
    puts "\t\t\t--#{options[3]}--|--#{options[4]}--|--#{options[5]}--"
    puts "\t\t\t--#{options[6]}--|--#{options[7]}--|--#{options[8]}--"
  end

  # Determine and store all available options
  def free_moves(options)
    moves = []
    SPACES.times do |s|
      unless options[s] != s
        moves << s
      end
    end 
    moves
  end

# Verify if the board has a winner, tie, or neither 
  def verify(options)
    # Check the board to see if there are 'X' or 'O' values in a row
    SOLUTIONS.each do |s|
      if options[s[0]] == options[s[1]] and options[s[1]] == options[s[2]]
        return options[s[0]]
      end
    end
    # If no one has won, check to see if there are any free spaces, if not declare tie
    unless options.all? {|i| i.is_a? String }
      return false
    else
      "Tie"
    end
  end
end