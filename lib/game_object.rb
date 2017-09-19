# GameObjects are the base class for every thing else that has position in the game.
class GameObject
  attr_accessor :name, :pos

  def initialize(name, area, pos)
    @name = name
    @area = area
    @pos = pos
  end

  # Set position changes the @pos variable and nothing else. Please move things by calling it's move methods instead.
  def set_position(x, y)
    @pos = @area.get_pos(x, y)
  end

  # Move methods will check if a position is occupied before moving there.
  def move_to(new_x, new_y)
    set_position(new_x, new_y) if @pos.is_not_occupied?
  end
end
