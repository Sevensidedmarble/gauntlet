require 'input'

class Game
  # the main game instance.

  def initialize
    @input = Input.new
    @turn_count = 0
    @over = false
    @main_character = Hero.new(self)
    start_game
  end

  def update
    @turn_count += 1
    puts "Beginning turn #{@turn_count}."
    @input.getting_input
    @main_character.hit(2)
  end

  def stop
    @over = true
  end

  def start_game
    update until @over
  end
end
