require 'inventory'

# this is a flyweight to point towards a more complex tile definition. This is useful so that the Area arrays don't have
# to store huge amounts of complicated tile objects in memory, instead they just need to store these small position
# objects that point towards reusable information.
class Position
  attr_accessor :x, :y, :actor_here, :items_here, :tile_def, @occupied

  def initialize(x, y, tile_def)
    @x = x
    @y = y
    @tile_def = tile_def
    @occupied = false
    @actor_here = nil
    @items_here = Inventory.new
  end

  def is_not_occupied?
    !@occupied
  end
end

