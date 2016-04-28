require "./lib/game/strategy"

module Strategies
  class FavoriteMove < Strategy

    def get_move
      super(player_favorite_move)
    end

    private

    def player_favorite_move
      return unless player.has_moves?
      grouped_moves = player.moves.group_by(&:class)
      grouped_moves.values.max_by(&:size).first
    end

  end
end
