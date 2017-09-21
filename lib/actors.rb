require_relative 'actor_prototypes'

# Actors is a singleton container for the actors in a scene, and also has helpful factory methods for creating Actors.
class Actors
  include Enumerable
  attr_accessor :list

  def each(&block)
    @list.each(&block)
  end

  def initialize
    @list = Array.new
  end

  # Pass in the symbol in the EnemyP area and position to spawn a particular Actor
  def spawn(symbol, area, pos)
    proto       = ActorPrototypes.get(symbol)
    actor       = Actor.new(proto[:name], area, pos)
    actor.hp    = proto[:hp]
    actor.stats = proto[:stats]
  end
end

