require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test '#send_notification' do
    ClimateControl.modify ACTION_MAILER_SEND_TO: 'TEST_TO_FROM_ENV' do
      subject     = 'test subject'
      mail_locals = { order: orders(:one), user: users(:one) }

      mail = OrderMailer.send_notification(mail_locals: mail_locals,
                                           action:      :create,
                                           subject:     subject)
      assert_equal ['TEST_TO_FROM_ENV'], mail.to
      assert_equal subject, mail.subject
    end
  end
end
