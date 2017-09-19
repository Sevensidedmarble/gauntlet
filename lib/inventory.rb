# An inventory is a container for Items.
# Many things might have Inventories. Actors have Inventories, a Position can have an Inventory, a Store can have an
# Inventory., etc., so it needs to be easily plugged into things.
class Inventory
  attr_accessor :list

  def initialize
    @list = Array.new
  end

  def add(item)
    @list.push(item)
  end

  def remove_index(index)
    @list.delete_at(index)
  end
end