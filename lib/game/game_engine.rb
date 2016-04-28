require "./lib/game/strategies/favorite_move"
require "./lib/game/strategies/last_move"
require "./lib/models/player"
require "./lib/models/scissors"
require "./lib/models/paper"
require "./lib/models/rock"
require "./lib/game/announcer"
require "./lib/game/game_logic"
require "./lib/game/scorekeeper"

class GameEngine

  def initialize(strategy_name:)
    @strategy = strategy_klass(strategy_name)
    @player = Player.new
  end

  def begin_game
    Announcer.start_game
    player_move = GameLogic.validate_move(input: $stdin.gets.chomp)

    if player_move
      game_move = strategy.new(player: player).get_move
      scorekeeper.update_score(player_move: player_move, game_move: game_move)
      player.add_move(move: player_move)
      Announcer.read_score(game_move: game_move, scorekeeper: scorekeeper)
    else
      Announcer.incorrect_move
    end

    start_another_round
  end

  private

  attr_accessor :strategy, :player

  def strategy_klass(strategy_name)
    Object.const_get("Strategies::#{strategy_name.capitalize}Move")
  end

  def scorekeeper
    @scorekeeper ||= Scorekeeper.new
  end

  def start_another_round
    begin_game
  end

end
