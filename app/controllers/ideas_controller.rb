class IdeasController < ApplicationController
  before_action :set_idea, only: %i[show edit update destroy]
  before_action :set_user
  before_action :current_user?


  def index
    @ideas = Idea.all
  end

  def show
    @images = @idea.images
  end

  def new
    @categories = Category.all
    @idea = Idea.new
  end

  def create
    @categories = Category.all
    @idea = @user.ideas.new(ideas_params)
    if @idea.save
      flash[:success] = "#{@idea.title} created!"
      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
  end

  def update
    if params[:image_id]
      @idea.images << Image.find(params[:image_id])
      redirect_to user_idea_path(current_user, @idea)
    else
      @idea.update(ideas_params)
      if @idea.save
        flash[:success] = "#{@idea.title} Updated!"
        redirect_to user_idea_path(@user, @idea)
      else
        render :edit
      end
    end
  end

  def destroy
    @idea.destroy

    flash[:success] = "#{@idea.title} Deleted!"
    redirect_to user_path(@user)
  end

  private
  private
  def current_user?
    render :file => '/public/404' if session[:user_id] == nil
  end

  def ideas_params
    params.require(:idea).permit(:title, :content, :category_id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
