class PurchasesController < ApplicationController
  before_action :authenticate_user!

  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  before_action :credit_info
#購入確認ページ
  def new
    @product = Product.find(product_params[:product_id])
  end

#購入完了ページ
  def create
    @product = Product.find(product_params[:product_id])
    if @credit_info == nil
      render action: :new
    elsif current_user.id == @credit_info.user_id
      @charge = Payjp::Charge.create(
      :amount => @product.price,
      :customer => @credit_info.customer_id,
      :currency => 'jpy',
      )
      Purchase.create(user_id: current_user.id, product_id: @product.id, total_payment: @product.price)
      @product.update(status: 3)
      redirect_to root_path
      
    end
  end

  def card
  end


  private
  def product_params
    params.permit(:product_id)
  end

  def credit_info
    @credit_info = CreditCard.find_by(user_id: current_user.id)
    if !@credit_info == nil
      @customer = Payjp::Customer.retrieve(@credit_info.customer_id)
      @card = @customer.cards.retrieve(@credit_info.card_id)
    end
  end
end
