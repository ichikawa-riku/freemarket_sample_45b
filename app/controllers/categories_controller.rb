class CategoriesController < ApplicationController
  def index
  end

  def show
  end

  def sub_category
    @sub_categories = Category.sub_category(params[:main])
    respond_to do |format|
      format.json
    end
  end
end
