require_relative 'test_helper'

describe Rps do

  describe ".start" do

    describe "valid strategy is found" do
      before do
        GameEngine.any_instance.stubs(:begin_game)
      end

      it "announces an invalid strategy" do
        GameEngine.any_instance.expects(:begin_game)

        Rps.start(strategy: "last")
      end
    end

    describe "no valid strategy is found" do

      it "announces an invalid strategy" do
        Announcer.expects(:incorrect_strategy)

        Rps.start(strategy: "none")
      end
    end
  end

end
