require "./lib/game/strategy"

module Strategies
  class LastMove < Strategy

    def get_move
      super(player_last_move)
    end

    private

    def player_last_move
      return unless player.has_moves?
      player.moves.last
    end

  end
end
