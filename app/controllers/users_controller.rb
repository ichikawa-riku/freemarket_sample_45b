class UsersController < ApplicationController

  def new
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
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
    params.permit(:nickname, :introduction)
  end

end
