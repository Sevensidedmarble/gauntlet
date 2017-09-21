# The Party is a container of Heroes. If the Party is all dead, the game ends!
class Party
  attr_accessor :list

  def initialize(size, actors)
    @list = Array.new(size)
    actors.each do |actor|
      add(actor)
    end
  end

  def add(actor)
    @list.push(actor)
  end
end
