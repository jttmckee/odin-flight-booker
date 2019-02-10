require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @LHR = airports(:LHR)
    @MAD = airports(:MAD)
  end

  test 'airport code should be 3 letters' do
    assert @LHR.valid?
    @LHR.code = 'LGGG'
    assert_not @LHR.valid?
    @LHR.code = 'LG'
    assert_not @LHR.valid?
  end
end
