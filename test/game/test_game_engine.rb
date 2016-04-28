require_relative '../test_helper'

describe GameEngine do

  describe "#begin_game" do

    let(:game_engine) { GameEngine.new(strategy_name: "last") }

    it "sets the strategy" do
      assert_equal Strategies::LastMove, game_engine.instance_variable_get(:@strategy)
    end

    it "creates a player" do
      assert_instance_of Player, game_engine.instance_variable_get(:@player)
    end

    describe "player move is valid" do

      before do
        $stdin.stubs(:gets).returns("p")
        Announcer.stubs(:start_game)
        Announcer.stubs(:read_score)
        Scorekeeper.any_instance.stubs(:update_score)
        game_engine.stubs(:start_another_round)
      end

      it "announces the start of the game" do
        Announcer.expects(:start_game)

        game_engine.begin_game
      end

      it "get the games move" do
        Strategies::LastMove.any_instance.expects(:get_move)

        game_engine.begin_game
      end

      it "updates the score" do
        Scorekeeper.any_instance.expects(:update_score)

        game_engine.begin_game
      end

      it "adds the move to player" do
        Player.any_instance.expects(:add_move)

        game_engine.begin_game
      end

      it "reads the score" do
        Announcer.expects(:read_score)

        game_engine.begin_game
      end
    end

    describe "player move is invalid" do

      before do
        $stdin.stubs(:gets).returns("z")
        Announcer.stubs(:start_game)
        Announcer.stubs(:incorrect_move)
        game_engine.stubs(:start_another_round)
      end

      it "announces the start of the game" do
        Announcer.expects(:start_game)

        game_engine.begin_game
      end

      it "announces an incorrect move" do
        Announcer.expects(:incorrect_move)

        game_engine.begin_game
      end
    end

  end
end
