# Preview all emails at http://localhost:3000/rails/mailers/contact_me
class ContactMePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_me/contact
  def contact
    ContactMeMailer.contact
  end

end
