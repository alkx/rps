class Player

  attr_accessor :moves

  def initialize
    @moves = []
  end

  def has_moves?
    moves.size > 0
  end

  def add_move(move:)
    moves << move
  end

end
