class Game
  def initialize
    @p1 = Player.new
    @p2 = Player.new

    @is_p1_turn = true
  end

  # Start the game loop
  def start
    # Game loop
    while p1.alive? && p2.alive? do
      # Ask a math question
      ask

      # Alternate turns
      @is_p1_turn = !@is_p1_turn

      print_scores
    end

    # Handle death/game over
    game_over
  end

  def ask
    question = Question.new

    puts "Player #{ @is_p1_turn ? "1" : "2" }: #{ question.query }"
    print "> "

    handle_answer
  end

  def handle_answer
    answer = gets.chomp
    if question.correct?(answer)
      # Handle correct
    else
      suffer_consequences
    end
  end

  def print_scores
    puts "P1: #{ p1.lives }/3 vs P2: #{ p2.lives }/3"
  end

  def game_over
    # Determine the winner and their score by whose turn it is after the
    # game-ending turn
    winner, lives = @is_p1_turn ? *["1", @p1.lives] : *["2", @p2.lives]

    puts "Player #{ winner } wins with a score of #{ lives }/3"
    puts "----- GAME OVER -----"
  end
end

class Player
  attr_reader :lives

  def initialize
    # Initialize a player with 3 lives
    @lives = 3
  end

  def alive?
    @lives > 0
  end

  private
    def suffer_consequences
      @lives -= 1
    end
end

class Question
  def initialize
    # Randomly generate 2 numbers between 1 and 20
    rng = Random.new
    @x = rng(1..20)
    @y = rng(1..20)
  end

  # Returns a string containing the question
  def query
    "What does #{ @x } + #{ @y } equal?"
  end

  # Computes whether or not the answer is correct
  def correct?(answer)
    answer == @x + @y
  end
end
