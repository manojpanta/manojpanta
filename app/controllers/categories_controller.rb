class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.name} Created!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "#{@category} Deleted"
      redirect_to categories_path
    else
      flash[:success] = "#{@category} Can Not Be Deleted Because It is associated with at least one Idea"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    flash[:success] = "#{@category.name} has been Updated!"
    redirect_to category_path(@category)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end


end
