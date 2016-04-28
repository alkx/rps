require_relative '../test_helper'

describe GameLogic do

  describe ".valid_strategy?" do
    describe "a valid strategy" do
      it "returns true" do
        valid_strategy = GameLogic.valid_strategy?(strategy: "favorite")
        assert_equal true, valid_strategy
      end
    end

    describe "an invalid strategy" do
      it "returns false" do
        invalid_strategy = GameLogic.valid_strategy?(strategy: "foobar")
        assert_equal false, invalid_strategy
      end
    end
  end

  describe ".validate_move" do
    describe "'r' is the input" do
      it "returns an instance of Rock" do
        validated_move = GameLogic.validate_move(input: "r")
        assert_instance_of Rock, validated_move
      end
    end

    describe "'p' is the input" do
      it "returns an instance of Papaer" do
        validated_move = GameLogic.validate_move(input: "p")
        assert_instance_of Paper, validated_move
      end
    end

    describe "'s' is the input" do
      it "returns an instance of Scissors" do
        validated_move = GameLogic.validate_move(input: "s")
        assert_instance_of Scissors, validated_move
      end
    end

    describe "a non-valid input is entered" do
      it "returns nil" do
        validated_move = GameLogic.validate_move(input: "foo")
        assert_nil validated_move
      end
    end

  end

  describe ".determine_move" do
    describe "Rock is the move" do
      it "returns an instance of Paper" do
        determined_move = GameLogic.determine_move(move: Rock.new)
        assert_instance_of Paper, determined_move
      end
    end

    describe "Paper is the move" do
      it "returns an instance of Scissors" do
        determined_move = GameLogic.determine_move(move: Paper.new)
        assert_instance_of Scissors, determined_move
      end
    end

    describe "Scissors is the move" do
      it "returns an instance of Rock" do
        determined_move = GameLogic.determine_move(move: Scissors.new)
        assert_instance_of Rock, determined_move
      end
    end
  end

  describe ".determine_winner" do
    describe "player wins" do
      it "returns hash declaring winner as player" do
        winner = GameLogic.determine_winner(player_move: Rock.new, game_move: Scissors.new)
        assert_instance_of Hash, winner
        assert_equal( { winner: :player }, winner)
      end
    end

    describe "game wins" do
      it "returns hash declaring winner as game" do
        winner = GameLogic.determine_winner(player_move: Rock.new, game_move: Paper.new)
        assert_instance_of Hash, winner
        assert_equal( { winner: :game }, winner)
      end
    end

    describe "tie" do
      it "returns hash declaring tie" do
        winner = GameLogic.determine_winner(player_move: Paper.new, game_move: Paper.new)
        assert_instance_of Hash, winner
        assert_equal( {winner: :tie }, winner )
      end
    end
  end
end
