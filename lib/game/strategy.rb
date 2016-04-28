require "./lib/game/game_logic"

class Strategy

  def initialize(player:)
    @player = player
  end

  def get_move(strategy_move=nil)
    move_to_beat = strategy_move || random_move
    GameLogic.determine_move(move: move_to_beat)
  end

  private

  attr_reader :player

  def random_move
    [Rock.new, Paper.new, Scissors.new].sample
  end

end
