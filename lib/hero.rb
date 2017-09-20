require_relative 'actor'
require_relative 'player_controller'

# Heroes are the party members. Actors that the player controls.
class Hero < Actor

  def initialize(name, area, pos)
    super(name, area, pos)
  end

end