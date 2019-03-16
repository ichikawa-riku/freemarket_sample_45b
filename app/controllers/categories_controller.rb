class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find(params[:id])
    if @category.main_category_id.nil? && @category.sub_category_id.nil?
      @relation_categories = Category.where("main_category_id = #{@category.id} and sub_category_id IS NOT NULL").limit(14)
      @products = Product.joins(:category).merge(Category.where(main_category_id: @category.id)).order("created_at DESC")
    elsif @category.main_category_id.present? && @category.sub_category_id.nil?
      @relation_categories = Category.where(["main_category_id = ? and sub_category_id = ?", @category.main_category_id, @category.id]).limit(14)
      @products = Product.joins(:category).merge(Category.where(sub_category_id: @category.id)).order("created_at DESC")
    else
      @relation_categories = Category.where(["main_category_id = ? and sub_category_id = ?", @category.main_category_id, @category.sub_category_id]).limit(14)
      @products = @category.products.order("created_at DESC")
    end
  end

  def sub_category
    @sub_categories = Category.sub_category(params[:id])
    respond_to do |format|
      format.json
    end
  end

  def category
    @categories = Category.category(params[:id])
    respond_to do |format|
      format.json
    end
  end
end
