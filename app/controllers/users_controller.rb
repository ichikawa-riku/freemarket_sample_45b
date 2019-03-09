class UsersController < ApplicationController

  before_action :set_user only: [:edit]

  def new
  end

  def show
  end

  def edit

  end

  def update
    user = User.find(params[:id])
    if user.id == current_user.id
      user.update(user_params)
    end
    redirect_to :action => "edit"
  end

  def signout
  end

  def identification
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :introduction)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
