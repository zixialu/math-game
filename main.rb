class Game
end

class Player
  def initialize
    # Initialize to 3 lives
    @lives = 3
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
  def ask
    "What does #{x} + #{y} equal?"
  end

  # Computes whether or not the answer is correct
  def correct?(answer)
    answer == @x + @y
end
