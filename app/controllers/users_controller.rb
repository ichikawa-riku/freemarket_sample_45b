class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update]
  before_action :set_cuttenr_user, only: [:published, :trading, :sold]
  before_action :authenticate_user!, except: :new
  def new
  end


  def show
  end

  def edit

  end

  def update
    if @user.id == current_user.id
      @user.update(user_params)
    end
    redirect_to :action => "edit"
  end

  def signout
  end

  def identification
  end

  def published
    @products = @user.products.where(status: 0..1)
  end

  def trading
    @products = @user.products.where(status: 2)
  end

  def sold
    @products = @user.products.where(status: 3)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_cuttenr_user
    @user = User.find(current_user.id)
  end

end
