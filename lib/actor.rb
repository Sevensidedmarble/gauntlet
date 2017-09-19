require 'inventory'
require 'game_object'

# Actors comprise both NPCs and Heroes. They're not just defined as objects that move, as other gameobjects can move too.
#
# Actors are very connected to the Scheduler instance, but they should not know about it. The Scheduler itself can handle
# calling Actors update methods without Actors knowing about the Scheduler.
class Actor < GameObject
  attr_accessor :pos

  def initialize(name, area, pos)
    super(name, area, pos)
    @inventory = Inventory.new
  end


end