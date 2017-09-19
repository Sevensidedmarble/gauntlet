require_relative 'actor'
require_relative 'player_controller'

# Heroes are the party members. Actors that the player controls.
class Hero < Actor
  attr_accessor :name, :max_hit_points, :hit_points, :dead


  def initialize(name, area, pos)
    super(name, area, pos)
    @max_hit_points = 24
    @hit_points = @max_hit_points
    @dead = false
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