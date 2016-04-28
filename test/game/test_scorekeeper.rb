require_relative '../test_helper'

describe Scorekeeper do

  let(:scorekeeper) { Scorekeeper.new }

  describe "#update_score" do

    it "stores the results of the last game" do
      results = { winner: :tie }
      GameLogic.stubs(:determine_winner).returns(results)
      scorekeeper.update_score(player_move: Rock.new, game_move: Paper.new)

      assert_instance_of Array, scorekeeper.last_game
      assert_equal( results, scorekeeper.last_game[0])
    end

    describe "player wins" do

      it "only increments the player wins count" do
        scorekeeper.update_score(player_move: Paper.new, game_move: Rock.new)
        assert_equal 1, scorekeeper.scorecard.player_win_count
        assert_equal 0, scorekeeper.scorecard.player_loss_count
        assert_equal 0, scorekeeper.scorecard.tie_count
      end
    end

    describe "player loses" do

      it "only increments the player count" do
        scorekeeper.update_score(player_move: Rock.new, game_move: Paper.new)
        assert_equal 0, scorekeeper.scorecard.player_win_count
        assert_equal 1, scorekeeper.scorecard.player_loss_count
        assert_equal 0, scorekeeper.scorecard.tie_count
      end
    end

    describe "player tie" do

      it "only increments the tie count" do
        scorekeeper.update_score(player_move: Paper.new, game_move: Paper.new)
        assert_equal 0, scorekeeper.scorecard.player_win_count
        assert_equal 0, scorekeeper.scorecard.player_loss_count
        assert_equal 1, scorekeeper.scorecard.tie_count
      end
    end
  end

  describe "#scorecard" do

    it "returns an openstruct" do
      assert_instance_of OpenStruct, scorekeeper.scorecard
    end

    it "sets initial game counts to 0" do
      assert_equal 0, scorekeeper.scorecard.player_win_count
      assert_equal 0, scorekeeper.scorecard.player_loss_count
      assert_equal 0, scorekeeper.scorecard.tie_count
    end

  end

end
