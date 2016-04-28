require './lib/game/game_logic'
require './lib/game/game_engine'
require './lib/game/announcer'

class Rps

  def self.start(strategy:)
    if GameLogic.valid_strategy?(strategy: strategy)
      GameEngine.new(strategy_name: strategy).begin_game
    else
      Announcer.incorrect_strategy
    end
  end

end

Rps.start(strategy: ARGV[0])
