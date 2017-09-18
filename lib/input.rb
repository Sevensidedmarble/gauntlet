# The main input controller for the game. All input should be taken in here, and anything that needs input should call
# these methods on the main Input instance of the Game object.
class Input
  attr_accessor :pressed

  def getting_input
    @pressed = gets
  end
end