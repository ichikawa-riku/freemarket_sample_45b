class BrandsController < ApplicationController
  before_action :set_category, only: [:show]

  def show
    if @category.main_category_id.nil? && @category.sub_category_id.nil?
      @relation_categories = Category.where("main_category_id = #{@category.id} and sub_category_id IS NOT NULL").limit(14)
      @products = Product.find_products_match_category(@category)
    elsif @category.main_category_id.present? && @category.sub_category_id.nil?
      @relation_categories = Category.where(["main_category_id = ? and sub_category_id = ?", @category.main_category_id, @category.id]).limit(14)
      @products = Product.find_products_match_category(@category)
    else
      @relation_categories = Category.where(sub_category_id: @category.sub_category_id).limit(14)
      @products = @category.products.order("created_at DESC")
    end
    @brand = Brand.find(params[:id])
    @products = Product.where(brand_id: params[:id]).order(id: "DESC")
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

private
  def set_category
    @category = Category.find(params[:id])
  end

end
