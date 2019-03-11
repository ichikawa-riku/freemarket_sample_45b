class CreditCardController < ApplicationController
  
  Payjp.api_key = 'sk_test_ee7ccb4870a47d2d5954d901'
  before_action :create_customer


  def index
  end
  
  def new
  end

  def create
    binding.pry
    customer = Payjp::Customer.retrieve(@customer.id)
    @card = customer.cards.create(card: params[:payjp_token])
    render :index
    # customer情報を＠customer.idで呼び出すことでカードを作成する準備に入る。
  end


  def create_customer
    @customer = Payjp::Customer.create
    @customer.id.to_i
  end
  # トークンが一回しか呼び出せないので、まず最初にcustomerを作成する。
  # この時json形式でレスポンスが返ってきていてその中身はbinding.pryや公式サイトから確認できる。

  
end
