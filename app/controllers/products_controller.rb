class ProductsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]
before_action :set_product, only: [:edit, :update]
#トップページ
  def index
  end

#商品詳細ページ
  def show
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
    if @product.save
      @product.new_brand(params[:product][:brand_attributes][:name]) if params[:product][:brand_attributes][:name].present?
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @product_images = @product.product_images
    @product_sales_fee = ( @product.price * 0.1 ).floor
    @product_sales_profit = @product.price - @product_sales_fee
    @product_images.each do |product_image|
      product_image.image.cache!
    end
    @product.build_brand if @product.brand_id.nil?
  end

  def update
    if @product.user_id == current_user.id
      if @product.brand_id.present?
        @product.new_brand(params[:product][:brand_attributes][:name]) if @product.brand.name != params[:product][:brand_attributes][:name]
      else
        @product.new_brand(params[:product][:brand_attributes][:name]) if params[:product][:brand_attributes][:name].present?
      end
      if @product.update_attributes(product_params)
        brand_null_update
        redirect_to root_path
      else
        @product_images = @product.product_images
        @product.build_brand if @product.brand_id.nil?
        render :edit
      end
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :product_size_id, :brand_id, :condition, :shipping_method, :shipping_burden, :area_id, :estimated_date, :price, product_images_attributes:[:id, :image, :image_cache], brand_attributes:[:id, :name]).merge(user_id: current_user.id)
  end

  def brand_null_update
    @product.brand_id = nil if params[:product][:brand_attributes][:id].present? && params[:product][:brand_attributes][:name].blank?
    @product.save
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
