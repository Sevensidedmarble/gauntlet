require 'input'
require 'hero'
require 'scheduler'

class Game
  # the main game instance.

  def initialize
    # flags, variables, and settings
    @input = Input.new
    @turn_count = 0
    @over = false

    # main containers
    @current_area = Area.new(30,40)
    @main_character = Hero.new("Marble", @current_area, @current_area.get_pos(1,1))
    @party = Party.new(5)
    @scheduler = Scheduler.new

    # begin the game loop after state is created
    start_game_loop
  end

  def update
    @turn_count += 1
    puts "Beginning turn #{@turn_count}."
    @input.getting_input
  end

  def is_party_dead?
    @party.list.all? {|hero| hero.dead?}
  end

  def stop
    @over = true
  end

  def start_game_loop
    update until @over
  end
end
