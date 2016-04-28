require_relative '../test_helper'

describe Rock do

  describe "#name" do

    it "returns rock" do
      rock = Rock.new

      assert_equal :rock, rock.name
    end
  end

end
