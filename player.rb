class Player
  attr_accessor :name, :max_hit_points, :hit_points
  attr_accessor :x, :y # where is the player located

  def initialize(game)
    @game = game
    @name = 'Marble'
    @max_hit_points = 24
    @hit_points = @max_hit_points
  end

  def hit(dmg)
    @hit_points -= dmg
    check_if_dead
  end

  def alive?
    check_if_dead
  end

  def our_turn?

  end

  def check_if_dead
    @game.stop if @hit_points < 1
  end
end