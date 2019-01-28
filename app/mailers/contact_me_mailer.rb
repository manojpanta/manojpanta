class ContactMeMailer < ApplicationMailer
  default from: "guccilove0304@gmail.com"

  def contact(from, from_email, message)
    @from = from
    @from_email = from_email
    @message= message
    mail to: "manojpanta95@gmail.com", subject: "New Message From Website."
  end
end
