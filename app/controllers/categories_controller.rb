class CategoriesController < ApplicationController
#TODO: implement
  def show
    @category = Category.find(params[:id])
  end
end
