require_relative '../test_helper'

describe Scissors do

  describe "#name" do

    it "returns scissors" do
      scissors = Scissors.new

      assert_equal :scissors, scissors.name
    end
  end

end
