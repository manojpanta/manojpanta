class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    redirect_to root_path
    if ContactMeMailer.contact(user.name, user.email, user.message).deliver_now
      flash[:success] = 'Sent Successfully!!'
    else
      flash[:failed] = 'Try Again'
      render :create
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :message)
  end
end
