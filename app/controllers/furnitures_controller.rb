class FurnituresController < ApplicationController
  before_action :find_furniture, only: %i[show edit update destroy]

  def index
    if params[:query]
      @furnitures = Furniture.where('name iLIKE ?', "%#{params[:query]}%")
    else
      @furnitures = Furniture.all

      @furnitures_mapped = Furniture.geocoded
      @markers = @furnitures_mapped.geocoded.map do |furniture|
        {
          lat: furniture.latitude,
          long: furniture.longitude,
          info_window: render_to_string(partial: "info_window", locals: { furniture: furniture }),
          image_url: helpers.asset_url("cara1.jpg")
        }
      end
    end
  end

  def show
  end

  def new
    @furniture = Furniture.new
  end

  def create
    @furniture = Furniture.new(set_furniture)
    @furniture.user_id = current_user.id
    if @furniture.save
      redirect_to '/furnitures'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @furniture.update(set_furniture)
      redirect_to furnitures_path(@furniture)
    else
      render :edit
    end
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
    params.require(:furniture).permit(:name, :price, :location, :category_id, :description, :photo)
  end

  def find_furniture
    @furniture = Furniture.find(params[:id])
  end

  def furniture_params
    params.require(:flat).permit(:name, :location)
  end
end
