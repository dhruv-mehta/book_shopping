require 'test_helper'

class OrderNotifyTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotify.received
    assert_equal "Received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
