class UsersController < ApplicationController

  def show
    @review = Review.new
    @user = User.find(params[:id])
    @reviews = Review.where('user_id = ?', @user.id)
    @average_rating = @reviews.sum { |review| review.rating }.fdiv(@reviews.count).round(1)
    @furnitures = Furniture.where('user_id = ?', @user.id)
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
