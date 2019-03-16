class PurchasesController < ApplicationController

  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  before_action :credit_info
#購入確認ページ
  def new
  end

#購入完了ページ
  def create
  end

  def card
  end

  def credit_info
    if @credit_info = CreditCard.find_by(user_id: current_user.id)
      @customer = Payjp::Customer.retrieve(@credit_info.customer_id)
      @card = @customer.cards.retrieve(@credit_info.card_id)
    end
  end
end
