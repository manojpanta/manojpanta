class IdeasController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @ideas = Idea.all
  end

  def show
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
  end


  def new
    @user = User.find(params[:user_id])
    @categories = Category.all
    @idea = Idea.new
  end


  def create
    @user = User.find(params[:user_id])
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
    @user = User.find(params[:user_id])
    @categories = Category.all
    @idea = Idea.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
    @idea.update(ideas_params)
    if @idea.save
      flash[:success] = "#{@idea.title} Updated!"
      redirect_to user_idea_path(@user, @idea)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    idea = Idea.find(params[:id])
    idea.destroy

    flash[:success] = "#{idea.title} Deleted!"
    redirect_to user_ideas_path(@user)
  end


  private

  def ideas_params
    params.require(:idea).permit(:title, :content, :category_id)
  end




end
