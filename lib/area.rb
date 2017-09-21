require_relative 'position'
require_relative 'tiles'
require_relative 'actors'

# An area is a collection of Positions. A position is a flyweight used as a reference to a tile.
#
# Areas also hold all the 'things' in the Area. The Actors, the Weapons, etc. It's an important unit of content to the engine.
class Area

  attr_accessor :width, :height

  # Create a new area.
  #
  # width, height - width  and height of the area
  def initialize (width, height)
    @width = width
    @height = height
    @map = Array.new(@width) {Array.new(@height)} # a 2d array to hold the positions
    @actors = Actors.new
    make_default_area
  end

  def make_default_area
    map = Array.new(@width) {Array.new(@height)}
    each_position do |x, y|
      map[x][y] = Position.new(x, y, Tiles::FLOOR)
    end
    @map = map

    # Spawn some enemies
    @actors.spawn(:orc, self, random_unoccupied_position)
  end

  def each_position
    @map.each_index do |x|
      @map[x].each_index do |y|
        yield x, y
      end
    end
  end

  def random_position
    @map[rand(@width-1)][rand(@height-1)]
  end

  def random_unoccupied_position
    pos = random_position
    until pos.not_occupied? do
      pos = random_position
    end
    pos
  end

  def draw(output)
    draw_map(output)
    draw_actors(output)
  end

  def draw_map(output)
    each_position do |x, y|
      pos = @map[x][y]
      # Draw the tile unless there's an item or actor or something else blocking the tiles view.
      output.draw_string(pos.char, x*12, y*12, 1) unless pos.occupied
    end
  end

  def draw_actors(output)
    @actors.each do |actor|
      actor.draw(output)
    end
  end

  def get_pos(x, y)
    @map[x][y]
  end

  def add (x, y, pos)
    @map[x][y] = pos
  end

end