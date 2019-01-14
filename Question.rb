class Question
  def initialize
    # Randomly generate 2 numbers between 1 and 20
    prng = Random.new
    @x = prng.rand(1..20)
    @y = prng.rand(1..20)
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
