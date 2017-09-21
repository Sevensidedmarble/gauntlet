# The main input controller for the game. All input should be taken in here, and anything that needs input should call
# these methods on the main Input instance of the Game object.


class Input
  attr_accessor :pressed

  def initialize(window_controller)
    @window_controller = window_controller
    # Here we set the callback in the WindowController to call our key_down method when the WindowController gets key_down
    # information. This pattern of callbacks should allow different IO systems to be swapped in with minimal work.
    @window_controller.set_io_callback(:key_down, method(:key_down))
  end

  def getting_input
    # if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
    #   @player.turn_left
    # end
  end

  def key_down(key)
    puts key
    if key.include?(:escape)
      @window_controller.exit
      puts 'Closing window.'
    end
  end
end