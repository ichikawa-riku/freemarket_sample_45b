class ProductsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

#トップページ
  def index
    @ladies_item = Product.joins(:category).merge(Category.where(main_category_id: 1)).limit(4).order(id: "DESC")
    @mens_item = Product.joins(:category).merge(Category.where(main_category_id: 2)).limit(4).order(id: "DESC")
    @baby_item = Product.joins(:category).merge(Category.where(main_category_id: 3)).limit(4).order(id: "DESC")
    @cosme_item = Product.joins(:category).merge(Category.where(main_category_id: 7)).limit(4).order(id: "DESC")
    @chanel = Product.where(brand_id: 1).limit(4).order(id: "DESC")
    @vuitton = Product.where(brand_id: 2).limit(4).order(id: "DESC")
    @supreme = Product.where(brand_id: 3).limit(4).order(id: "DESC")
    @nike = Product.where(brand_id: 4).limit(4).order(id: "DESC")
  end

#商品詳細ページ
  def show
    @product = Product.find(params[:id])
    @other_user_products = Product.where(user_id: @product.user_id).where.not(id: params[:id]).order("id DESC").limit(6)
  # ランダムに取得できていない
    @other_products = Product.where( 'id != ?', rand(Product.first.id..Product.last.id) ).first(2)
  end

#商品出品ページ
  def new
    @product = Product.new
    @product.product_images.build
    @product.build_brand
  end

#トップページへリダイレクト
  def create
    @product = Product.new(product_params)
    @product.update_brand(params[:product][:brand_attributes][:name]) if params[:product][:brand_attributes][:name].present?
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :product_size_id, :brand_id, :condition, :shipping_method, :shipping_burden, :area_id, :estimated_date, :price, product_images_attributes:[:image], brand_attributes:[:name]).merge(user_id: current_user.id)
  end
end
