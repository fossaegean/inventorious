class OrderMailer < ApplicationMailer
  include ActionView::Helpers::TextHelper

  def send_notification(mail_locals:, action:, subject:)
    mail(to:      ENV['ACTION_MAILER_SEND_TO'],
         subject: subject) do
      render "#{action}_order", locals: mail_locals
    end
  end
end
