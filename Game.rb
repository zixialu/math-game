class Game
  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")

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

  def current_player
    @is_p1_turn ? p1 : p2
  end

  def ask(player)
    question = Question.new

    puts "#{ current_player.name }: #{ question.query }"
    print "> "

    handle_answer(player, question)
  end

  def handle_answer(player, question)
    answer = gets.chomp
    if question.correct?(answer)
      player.receive_praise
    else
      player.suffer_consequences
    end
  end

  def print_scores
    puts "P1: #{ p1.lives }/3 vs P2: #{ p2.lives }/3"
  end

  def game_over
    # Determine the winner and their score by whose turn it is after the
    # game-ending turn
    puts "#{ current_player.name } wins with a score of #{ current_player.lives }/3"
    puts "----- GAME OVER -----"
  end
end
