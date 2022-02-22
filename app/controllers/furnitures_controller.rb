class FurnituresController < ApplicationController

  def index
    @furnitures = Furniture.all
  end

  def show
    @furniture = Furniture.find(params[:id])
  end

  def new
    @furniture = Furniture.new
  end

  def create
    @furniture = Furniture.new(set_furniture)
    @furniture.user_id = current_user.id
    @furniture.save!
    redirect_to '/furnitures'
  end

  private

  def set_furniture
    params.require(:furniture).permit(:name, :price, :location, :category_id)
  end
end
