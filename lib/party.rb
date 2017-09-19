# The Party is a container of Heroes. If the Party is all dead, the game ends!
class Party
  attr_accessor :list

  def initialize(size)
    @list = Array.new(size)
  end

  def add(actor)
    @list.push(actor)
  end
end
