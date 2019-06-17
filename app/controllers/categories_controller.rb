class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
  end

  def update
    # @category = Category.update(category_params)
  end

  private

  def category_params
    params.require(:category).permit(:photo, :name)
  end
end
