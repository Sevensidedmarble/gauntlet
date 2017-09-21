require_relative 'position'
require_relative 'tiles'

# An area is a collection of Positions. A position is a flyweight used as a reference to a tile.
class Area

  attr_accessor :width, :height

  # Create a new area.
  #
  # width, height - width  and height of the area
  def initialize (width, height)
    @width = width
    @height = height
    @map = Array.new(@width) {Array.new(@height)} # a 2d array to hold the positions
    @map = make_basic_area
  end

  def make_basic_area
    map = Array.new(@width) {Array.new(@height)}
    # Make entire area floor as a default state
    # map.each_index do |x|
    #   map[x].each_index do |y|
    #     map[x][y] = Position.new(x, y, Tiles::FLOOR)
    #   end
    # end
    each_position do |x, y|
      map[x][y] = Position.new(x, y, Tiles::FLOOR)
    end
    map
  end

  def each_position
    @map.each_index do |x|
      @map[x].each_index do |y|
        yield x, y
      end
    end
  end

  def draw(output)
    each_position do |x, y|
      pos = @map[x][y]
      output.draw_string(pos.char, x*12, y*12, 1)
    end
  end

  def get_pos(x, y)
    @map[x][y]
  end

  def add (x, y, pos)
    @map[x][y] = pos
  end

end