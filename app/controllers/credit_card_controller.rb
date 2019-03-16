class CreditCardController < ApplicationController
  
  Payjp.api_key = ENV['PAYJP_SECRET_KEY']
  
  def index
    @credit_info = CreditCard.find_by(user_id: params[:user_id])
    if @credit_info
      customer = Payjp::Customer.retrieve(@credit_info.customer_id) 
      @card = customer.cards.retrieve(@credit_info.card_id)
    end
  end
  
  def new
    if CreditCard.find_by(user_id: params[:user_id]).present?
      redirect_to action: :index
    end
  end

  def create
    customer = Payjp::Customer.create(card: params[:payjp_token])
    card = CreditCard.new(customer_id: customer.id, card_id: customer.default_card, user_id: credit_params[:user_id])
    if card.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    credit_info = CreditCard.find_by(user_id: params[:user_id])
    if current_user.id == credit_info.user_id
      credit_info.delete
      customer = Payjp::Customer.retrieve(credit_info.customer_id)
      card = customer.cards.retrieve(credit_info.card_id)
      card.delete
      customer.delete
      redirect_to action: :index
    else 
      redirect_to :index, alert: "その権限はありません"
    end
  end

  private 
  def credit_params
    params.permit(:user_id)
  end
end
  
