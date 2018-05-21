class IdeasController < ApplicationController

  def index
    @ideas = Idea.all
  end

  def show
    @idea = Idea.find(params[:id])
  end


  def new
    @categories = Category.all
    @idea = Idea.new
  end


  def create
    @categories = Category.all
    @idea = Idea.new(ideas_params)
    if @idea.save
      flash[:success] = "#{@idea.title} created!"
      redirect_to ideas_path
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(ideas_params)
    if @idea.save
      flash[:success] = "#{@idea.title} Updated!"
      redirect_to idea_path(@idea)
    else
      render :edit
    end
  end

  def destroy
    idea = Idea.find(params[:id])
    idea.destroy

    flash[:success] = "#{idea.title} Deleted!"
    redirect_to ideas_path
  end


  private

  def ideas_params
    params.require(:idea).permit(:title, :content, :category_id)
  end




end
