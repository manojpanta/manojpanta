class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit show destroy update]
  before_action :current_user?

  def index
    @categories = Category.all
  end

  private
  def current_user?
    render :file => '/public/404' if session[:user_id] == nil
  end
end
