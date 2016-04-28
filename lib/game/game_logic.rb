require "./lib/models/scissors"
require "./lib/models/paper"
require "./lib/models/rock"

class GameLogic

  class << self

    def valid_strategy?(strategy:)
      %W(last favorite).include?(strategy)
    end

    def validate_move(input:)
      valid_moves[input]
    end

    def determine_move(move:)
      move_hierarchy[move.name]
    end

    def determine_winner(player_move:, game_move:)
      if player_move.name == game_move.name
        { winner: :tie }
      elsif move_hierarchy[game_move.name].name == player_move.name
        { winner: :player }
      else
        { winner: :game }
      end
    end

    private

    def move_hierarchy
      { rock: Paper.new, paper: Scissors.new, scissors: Rock.new }
    end

    def valid_moves
      { "r" => Rock.new, "p" => Paper.new, "s" => Scissors.new }
    end

  end

end
