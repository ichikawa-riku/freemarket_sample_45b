class PurchasesController < ApplicationController

  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  before_action :credit_info
#購入確認ページ
  def new
    @product = Product.find(product_params[:product_id])
  end

#購入完了ページ
  def create
    if current_user.id == @credit_info.user_id
      @charge = Payjp::Charge.create(
      :amount => 50,
      :card => @credit_info.card_id,
      :currency => 'jpy',
      )
      @charge.captured == false
      redirect_to root_path
    else
      redirect_to action: :new
    end
  end

  def card
  end


  private 
  def product_params
    params.permit(:product_id)
  end

  def credit_info
    if @credit_info = CreditCard.find_by(user_id: current_user.id)
      @customer = Payjp::Customer.retrieve(@credit_info.customer_id)
      @card = @customer.cards.retrieve(@credit_info.card_id)
    end
  end
end
