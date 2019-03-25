require 'sendgrid-ruby'
require 'json'
class SendGridMailer
  include SendGrid

  def self.contact_me(name, email, message)
    from = Email.new(email: 'guccilove0304@gmail.com')
    subject = "You have new message from #{name} with email: #{email}"
    to = Email.new(email: 'manojpanta95@gmail.com')
    content = Content.new(type: 'text/plain', value: "#{message}")
    mail = SendGrid::Mail.new(from, subject, to, content)
    # puts JSON.pretty_generate(mail.to_json)
    mail.to_json
    sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
    response = sg.client.mail._('send').post(request_body: mail.to_json)
    response.status_code
    response.body
    response.headers
  end
end
