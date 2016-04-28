require_relative '../test_helper'

describe Player do

  let(:player) { Player.new }

  describe "#has_moves?" do

    describe "player has no moves" do
      it "returns false" do
        assert_equal false, player.has_moves?
      end
    end

    describe "player has moves" do
      it "returns true" do
        player.add_move(move: Paper.new)

        assert_equal true, player.has_moves?
      end
    end
  end

  describe "#add_move" do

    it "adds the move the player's moves array" do
      player.add_move(move: Rock.new)

      assert_instance_of Rock, player.moves.last
      assert_equal 1, player.moves.size
    end
  end

end
