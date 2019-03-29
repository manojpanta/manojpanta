require 'sendgrid-ruby'
require 'json'
class SendGridMailer
  include SendGrid

  def self.contact_me(name, email, message)
    count = 1
    until count == 500
      # from = Email.new(email: "FromMyWebSite@gmail.com")
      # subject = "#{email}"
      # to = Email.new(email: '7206832645@messaging.sprintpcs.com')
      # content = Content.new(type: 'text/plain', value: "You've Got An Email From Your Website")
      # mail = SendGrid::Mail.new(from, subject, to, content)
      # mail.to_json
      # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
      # response = sg.client.mail._('send').post(request_body: mail.to_json)
      # response.status_code
      # response.body
      # response.headers
      # #
      # from = Email.new(email: "FromMyWebSite@gmail.com")
      # subject = "Name: #{name} \nEmail: #{email} "
      # to = Email.new(email: 'manojpanta95@gmail.com')
      # content = Content.new(type: 'text/plain', value: "#{message}")
      # mail = SendGrid::Mail.new(from, subject, to, content)
      # mail.to_json
      # sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
      # response = sg.client.mail._('send').post(request_body: mail.to_json)
      # response.status_code
      # response.body
      # response.headers


      from = Email.new(email: "suroj.lamichhanae#{count}@gmail.com")
      subject = "suroj is here!!"
      to = Email.new(email: '7206488020@messaging.sprintpcs.com')
      content = Content.new(type: 'text/plain', value: "Please Do not reply:\n call 7208726884")
      mail = SendGrid::Mail.new(from, subject, to, content)
      mail.to_json
      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      response.status_code
      response.body
      response.headers
      count += 1
      sleep(5)
    end
  end
end
