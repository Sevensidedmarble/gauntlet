# TODO: make a custom Log class which supports logging to STDOUT and a file at the same time

require_relative 'input'
require_relative 'output'
require_relative 'hero'
require_relative 'scheduler'
require_relative 'area'
require_relative 'party'
require_relative 'gosu_window'
require_relative 'window_controller'
require 'logger'

class Game
  # the main game instance.

  def initialize
    # Global error log.
    $log = Logger.new(STDOUT)

    # The WindowController is the point of contact for the graphical instance that handles I/O.
    callbacks = { :draw => method(:draw), :update => method(:update)}
    @window_controller = WindowController.new(:gosu, "Gauntlet Engine", 640, 480, callbacks )

    # flags, variables, and settings
    @turn_count = 0
    @over = false

    # main containers
    @input = Input.new(@window_controller)
    @output = Output.new( @window_controller)
    @current_area = Area.new(30,40)
    party_members = [Hero.new("Marble", @current_area, @current_area.get_pos(5,5)),
                     Hero.new("Imoen", @current_area, @current_area.get_pos(5,6)),
                     Hero.new("Edwin", @current_area, @current_area.get_pos(5,7)),
                     Hero.new("Aerie", @current_area, @current_area.get_pos(5,8)),
                     Hero.new("Mazzy", @current_area, @current_area.get_pos(5,9))]
    @party = Party.new(5, party_members)
    @scheduler = Scheduler.new

    # begin the game loop after state is created
    start_game_loop
  end

  def draw
    @output.draw_string("Beginning turn #{@turn_count}.", 1, 1, 1)
    @output.draw_string("FPS: #{@window_controller.fps}", @window_controller.width - 65, @window_controller.height - 18, 1)
    @current_area.draw(@output)
  end

  def update
    @turn_count += 1
  end

  def is_party_dead?
    @party.list.all? {|hero| hero.dead?}
  end

  def stop
    @over = true
  end

  def start_game_loop
    @window_controller.start
  end
end
