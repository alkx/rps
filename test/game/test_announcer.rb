require_relative '../test_helper'

describe Announcer do

  describe ".start_game" do

    it "prints instructions to start the game" do
      $stdout.expects(:puts).with("Type 'r', 'p', or 's'")
      $stdout.expects(:puts).with(">")

      Announcer.start_game
    end
  end

  describe ".read_score" do

    it "prints the game move, winner, and the game counts" do
      game_move = Paper.new
      scorekeeper = Scorekeeper.new
      scorekeeper.update_score(player_move: Scissors.new, game_move: game_move)

      $stdout.expects(:puts).with("I chose '#{game_move.name}'. You win!")
      $stdout.expects(:puts).with("You won #{scorekeeper.scorecard.player_win_count} times.")
      $stdout.expects(:puts).with("You lost #{scorekeeper.scorecard.player_loss_count} times.")
      $stdout.expects(:puts).with("We tied #{scorekeeper.scorecard.tie_count} times.")

      Announcer.read_score(game_move: game_move, scorekeeper: scorekeeper)
    end
  end

  describe ".incorrect_move" do

    it "prints that a valid move must be chosen" do
      $stdout.expects(:puts).with("You must choose a valid move.")

      Announcer.incorrect_move
    end
  end

  describe ".incorrect_strategy" do

    it "prints that an incorrect strategy was chosen" do
      $stdout.expects(:puts).with("You must choose a valid strategy. Use 'last' or 'favorite'.")

      Announcer.incorrect_strategy
    end
  end

end
