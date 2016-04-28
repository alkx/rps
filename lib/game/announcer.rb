class Announcer

  class << self

    def start_game
      puts "Type 'r', 'p', or 's'"
      puts ">"
    end

    def read_score(game_move:, scorekeeper:)
      winner = scorekeeper.last_game[0][:winner]
      puts "I chose '#{game_move.name}'. #{results_msg[winner]}"
      puts "You won #{scorekeeper.scorecard.player_win_count} times."
      puts "You lost #{scorekeeper.scorecard.player_loss_count} times."
      puts "We tied #{scorekeeper.scorecard.tie_count} times."
    end

    def incorrect_move
      puts "You must choose a valid move."
    end

    def incorrect_strategy
      puts "You must choose a valid strategy. Use 'last' or 'favorite'."
    end

    private

    def results_msg
      { tie: "It's a tie!", player: "You win!", game: "You lost." }
    end

  end
end
