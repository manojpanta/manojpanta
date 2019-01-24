class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.sent_message.subject
  #
  def sent_message
    mail(to: "manojpanta95@gmail.com", from: "guccilove0304@gmail.com",subject: "love",  message: ".")
  end
end
