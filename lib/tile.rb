class Tile
  attr_accessor :name, :char, :walkable

  def initialize(name, char, walkable)
    @name = name
    @char = char
    @walkable = walkable
  end
end