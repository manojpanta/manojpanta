class CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit show destroy update]

  def index
    @categories = Category.all
  end
end
