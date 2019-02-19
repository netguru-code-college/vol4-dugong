class CategoriesController < ApplicationController
  def show
    @category = Category.friendly.find(params[:id])
  end

  def bad
     redirect_to category_path(Category.first)
  end
end
