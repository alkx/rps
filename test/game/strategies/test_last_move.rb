require_relative '../../test_helper'

describe Strategies::LastMove do

  let(:player) { Player.new }

  describe "#get_move" do

    describe "player has moves" do

      it "returns the move that beats the players last move" do
        player.moves = [Paper.new, Rock.new]
        strategy = Strategies::LastMove.new(player: player)

        assert_instance_of Paper, strategy.get_move
      end
    end

    describe "player has no moves" do

      it "returns a random move" do
        strategy = Strategies::LastMove.new(player: player)
        strategy.stubs(:random_move).returns(Paper.new)

        assert_instance_of Scissors, strategy.get_move
      end
    end


  end
end
