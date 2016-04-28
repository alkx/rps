require_relative '../test_helper'

describe Paper do

  describe "#name" do

    it "returns paper" do
      paper = Paper.new

      assert_equal :paper, paper.name
    end
  end

end
