class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: %i[edit show destroy update]

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "#{@category.name} Created!"
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "#{@category} Deleted"
      redirect_to categories_path
    else
      flash[:success] = "#{@category} Can Not Be Deleted Because It is associated with at least one Idea"
    end
  end

  def edit; end

  def update
    @category.update(category_params)
    flash[:success] = "#{@category.name} has been Updated!"
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
