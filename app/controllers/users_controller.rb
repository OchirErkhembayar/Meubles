class UsersController < ApplicationController

  def show
    @review = Review.new
    @user = current_user
    @reviews = Review.where('user_id = ?', @user.id)
    @furnitures = Furniture.where('user_id = ?', current_user.id)
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
