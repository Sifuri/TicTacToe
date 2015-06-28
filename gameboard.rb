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
      unless board[s] != s
        moves << s
      end
    end 
  end

# Verify if the board has a winner, tie, or neither 
  def verify(board)
    # Check the board to see if there are 'X' or 'O' values in a row
    SOLUTIONS.each do |s|
      if board[s[0]] == board[s[1]] and board[s[1]] == board[s[2]]
        return board[s[0]]
      end
    end
    # If no one has won, check to see if there are any free spaces, if not declare tie
    unless board.all? {|i| i.is_a? Fixnum }
      return "Tie"
    end
    # No wins or ties, therefore game should resume.
    nil 
  end

end