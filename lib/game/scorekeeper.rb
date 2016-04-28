require "ostruct"

class Scorekeeper

  attr_accessor :last_game

  def initialize
    @last_game = []
  end

  def update_score(player_move:, game_move:)
    game_result = GameLogic.determine_winner(player_move: player_move, game_move: game_move)
    update_results(result: game_result)
  end

  def scorecard
    @scorecard ||= OpenStruct.new(player_win_count: 0, player_loss_count: 0, tie_count: 0)
  end

  private

  def update_results(result:)
    if result[:winner] == :player
      scorecard.player_win_count += 1
    elsif result[:winner] == :game
      scorecard.player_loss_count += 1
    else
      scorecard.tie_count += 1
    end

    last_game[0] = result
  end

end
