class Player
  attr_reader :lives, :name

  def initialize(name)
    # Initialize a player with 3 lives
    @lives = 3
    @name = name
  end

  def alive?
    @lives > 0
  end

  def receive_praise
    puts "#{ @name }: Yes! You are correct."
  end

  def suffer_consequences
    @lives -= 1
    puts "#{ @name }: Seriously? No!"
  end
end
