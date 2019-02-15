require 'test_helper'

class PassengerMailerTest < ActionMailer::TestCase
  test "thank_you" do
    mail = PassengerMailer.thank_you
    assert_equal "Thank you", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
