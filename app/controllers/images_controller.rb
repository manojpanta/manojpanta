class ImagesController < ApplicationController
  before_action :current_user?

  def index
    if params[:idea_id]
      @idea = Idea.find(params[:idea_id])
    end
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  private

  def current_user?
    render file: '/public/404' unless current_user
  end
end
