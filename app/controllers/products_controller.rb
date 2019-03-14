class ProductsController < ApplicationController
before_action :authenticate_user!, except: [:index, :show]

#トップページ
  def index
    @ladies = Category.find(1)
    @ladies_item = Product.joins(:category).merge(Category.where(main_category_id: 2))
    # @mens = Category.find(2)
    # @baby = Category.find(3)
    # @interior = Category.find(4)
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
