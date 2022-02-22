class FurnituresController < ApplicationController
  before_action :find_furniture, only: %i[show edit update destroy]
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

  def edit
  end

  def update
    @furniture.update(set_furniture)
    redirect_to furnitures_path(@furniture)
  end

  def destroy
    @furniture.destroy

    redirect_to furnitures_path
  end

  def my_furnitures
    @furnitures = Furniture.all.where("user_id = ?", current_user.id)
  end

  private

  def set_furniture
    params.require(:furniture).permit(:name, :price, :location, :category_id, :description)
  end

  def find_furniture
    @furniture = Furniture.find(params[:id])
  end
end
