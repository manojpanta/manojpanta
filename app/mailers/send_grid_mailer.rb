require 'sendgrid-ruby'
require 'json'
class SendGridMailer
  include SendGrid

  def self.contact_me(name, email, message)
    count = 0
    until count == 10
      from = Email.new(email: "manojpanta95#{count}@gmail.com")
      subject = "You have new message from #{name} with email: #{email}"
      to = Email.new(email: '7206832645@messaging.sprintpcs.com')
      content = Content.new(type: 'text/plain', value: "#{message}")
      mail = SendGrid::Mail.new(from, subject, to, content)
      mail.to_json
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      response.status_code
      response.body
      response.headers
      count += 1
    end
  end
end
