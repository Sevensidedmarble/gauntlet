require_relative 'inventory'
require_relative 'game_object'
require_relative 'stats'
require_relative 'actor'

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

  def dead?
    @dead = check_if_dead
  end

  def check_if_dead
    true if @hit_points < 1
  end
end

# A list of the Actors that can be instantiated (Monsters or NPCs, the latter are Actors which are hostile by default)
#
# Right now this is hardcoded, but it should be serialized from outside data (json). The outside file should get loaded
# during game initialization.
module ActorPrototypes
  def get(symbol)
    begin
      list[symbol]
    rescue => e
      $log.error("ActorPrototypes attempted to get a prototype that didn't exist. Symbol: #{symbol}")
      $log.error(e.class.name)
      $log.error(e.message)
      $log.error(e.backtrace)
      list[:default]
    end
  end

  list = Hash.new
  list[:default] = { :name => "Default Problem Man", :hp => "999", :stats => Stats.new }
  list[:orc] = { :name => "Orc Warrior", :hp => "24", :stats => Stats.new}
end

# Actors is a singleton container for the actors in a scene, and also has helpful factory methods for creating Actors.
class Actors
  attr_accessor :list

  include ActorPrototypes

  def initialize
    @list = Array.new
  end

  # Pass in the symbol in the EnemyP area and position to spawn a particular Actor
  def spawn(symbol, area, pos)
    proto       = EnemyPrototypes.get(symbol)
    actor       = Actor.new(proto[:name], area, pos)
    actor.hp    = proto[:hp]
    actor.stats = proto[:stats]
  end
end

