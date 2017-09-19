require_relative 'tile'

module Tiles
  FLOOR = Tile.new("Floor", ".", true)
  WALL = Tile.new("Wall", "#", true)
  GRASS = Tile.new("Desert", ",", true)
end