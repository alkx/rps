require_relative '../test_helper'

describe Strategy do

  let(:strategy) { Strategy.new(player: Player.new) }

  describe "#get_move" do
    it "returns a move" do
      move = strategy.get_move(Rock.new)

      assert_instance_of Paper, move
    end

    describe "a strategy's move is used" do
      it "returns a move that beats the injected move" do
        move = strategy.get_move(Rock.new)

        assert_instance_of Paper, move
      end
    end

    describe "no strategy move is used" do
      it "returns a random move" do
        strategy.stubs(:random_move).returns(Paper.new)
        move = strategy.get_move

        assert_instance_of Scissors, move
      end
    end

  end

end
