require_relative 'inventory'
require_relative 'game_object'
require_relative 'stats'
require_relative 'actor'
require_relative 'actor_prototypes'

# Actors comprise both NPCs and Heroes. They're not just defined as objects that move, as other gameobjects can move too.
#
# Actors are very connected to the Scheduler instance, but they should not know about it. The Scheduler itself can handle
# calling Actors update methods without Actors knowing about the Scheduler.
class Actor < GameObject
  attr_accessor :hp, :max_hp, :hostile, :health, :stats

  def initialize(name, area, pos)
    super(name, area, pos)
    @max_hp = 24
    @hp = @max_hp
    @inventory = Inventory.new
    @hostile = false # Hostility only has consequences if the Actor is an NPC.
    @dead = false # I don't see a reason for anything to spawn dead at this time.
  end

  def hit(dmg)
    @hit_points -= dmg
    check_if_dead
  end

  def draw(output)
    # char = @char.nil? ? @name.chr : @char
    char = @name.chr
    output.draw_string(char, pos.x*12, pos.y*12, 1)
  end

  def dead?
    @dead = check_if_dead
  end

  def check_if_dead
    true if @hit_points < 1
  end

  def set_position(x, y)
    # Remove the actor from the old Position.
    @pos.remove_actor_here unless @pos.nil?
    @pos = @area.get_pos(x, y)
    # Add the actor to the new Position.
    @pos.put_actor_here(self)
  end
end

