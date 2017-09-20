class Stats
  attr_accessor :strength, :constitution, :dexterity, :intelligence, :willpower

  def initialize(str = 12, con = 12, dex = 12, int = 12, will = 12)
    @strength, @constitution, @dexterity, @intelligence, @willpower = str, con, dex, int, will
  end
end