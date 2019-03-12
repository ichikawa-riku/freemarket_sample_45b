class ProductsController < ApplicationController

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
    params.require(:product).permit(:name, :description, :category_id, :product_size_id, :brand_id, :condition, :shipping_method, :shipping_burden, :area_id, :estimated_date, :price, product_images_attributes:[:image]).merge(user_id: 1)
  end
end
