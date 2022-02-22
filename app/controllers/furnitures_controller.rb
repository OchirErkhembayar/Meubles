class FurnituresController < ApplicationController
  before_action :find_furniture, only: %i[show]
  def index
    @furnitures = Furniture.all
  end

  def show
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

  def find_furniture
    @furniture = Furniture.find(params[:id])
  end
end
