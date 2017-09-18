class Game
  # the main game instance.

  def initialize
    @turn_count = 1
    @over = false
    @main_character = Hero.new(self)
    start_game
  end

  def update
    puts "Beginning turn #{@turn_count}."
    @main_character.hit(2)
  end

  def stop
    @over = true
  end

  def start_game
    update until @over
  end
end
