class FurnituresController < ApplicationController
  before_action :find_furniture, only: %i[show edit update destroy]

  def index
    if params[:query]
      @furnitures = Furniture.where('name iLIKE ?', "%#{params[:query]}%")
      @furnitures_mapped = Furniture.where('name iLIKE ?', "%#{params[:query]}%").geocoded
    elsif params[:format]
      if (Furniture.all.select { |furn| furn.user_id == params[:format].to_i }.size > 0)
        @furnitures = Furniture.where('user_id = ?', params[:format].to_i)
        @furnitures_mapped = @furnitures.geocoded
      else
        @furnitures = Furniture.where('name iLIKE ?', "%#{params[:format]}%")
        @furnitures_mapped = @furnitures.geocoded
      end
    else
      @furnitures = Furniture.all
      @furnitures_mapped = Furniture.geocoded
    end
    @markers = @furnitures_mapped.map do |furniture|
      {
        lat: furniture.latitude,
        long: furniture.longitude,
        info_window: render_to_string(partial: "info_window", locals: { furniture: furniture }),
        image_url: helpers.asset_url("logo.png")
      }
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
      redirect_to furnitures_path
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
    params.require(:furniture).permit(:name, :location, :category_id, :description, :photo, :price_cents)
  end

  def find_furniture
    @furniture = Furniture.find(params[:id])
  end

  def furniture_params
    params.require(:flat).permit(:name, :location)
  end
end
