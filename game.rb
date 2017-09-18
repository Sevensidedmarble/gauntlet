class Game
  # the main game instance.

  def initialize
    @over = false
    @player = Player.new(self)
    start_game
  end

  def update
    puts 'Updating.'
    @player.hit(2)
  end

  def stop
    @over = true
  end

  def start_game
    update until @over
  end
end
