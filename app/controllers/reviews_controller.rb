class ReviewsController < ApplicationController
  before_action :find_review, only: %i[destroy]

  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @review = Review.new(set_review)
    @user = User.find(params[:user_id])
    @reviews = @user.reviews
    @review.user = @user
    @furnitures = Furniture.all
    if @review.save
      redirect_to user_path(@user)
    else
      render 'users/show'
    end
  end

  def destroy
    @review.destroy
    redirect_to user_path(@review.user)
  end

  private

  def find_review
    @review = Review.find(params[:id])
  end

  def set_review
    params.require(:review).permit(:content, :rating)
  end
end
