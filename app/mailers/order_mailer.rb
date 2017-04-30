class OrderMailer < ApplicationMailer
  include ActionView::Helpers::TextHelper

  def send_notification(subject:)
    mail to: ENV['ACTION_MAILER_SEND_TO'], subject: subject
  end
end
