class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.balance += params[:user][:balance].to_f
    if @user.save
      redirect_to furnitures_path
    else
      render :edit
    end
  end
end
