require_relative 'stats'

# A list of the Actors that can be instantiated (Monsters or NPCs, the latter are Actors which are hostile by default)
#
# Right now this is hardcoded, but it should be serialized from outside data (json). The outside file should get loaded
# during game initialization.
module ActorPrototypes

  @@list = Hash.new
  @@list[:default] = { :name => "Default Problem Man", :hp => "999", :stats => Stats.new }
  @@list[:orc] = { :name => "Orc Warrior", :hp => "24", :stats => Stats.new}

  def self.get(symbol)
    begin
      @@list[symbol]
    rescue => e
      $log.error("ActorPrototypes attempted to get a prototype that didn't exist. Symbol: #{symbol}")
      $log.error(e.class.name)
      $log.error(e.message)
      $log.error(e.backtrace)
      @@list[:default]
    end
  end
end
