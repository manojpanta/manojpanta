class SendmailController < ApplicationController
  def create
    SendGridMailer.contact_me(params[:name], params[:email], params[:message])
    redirect_to root_path
  end
end
