class OffersController < ApplicationController
  before_action :find_furniture, only: %i[new]
  def index
    @offers = Offer.all
  end

  def show
    @offer = Offer.find(params[:furniture_id])
    @offer = Offer.new
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(set_offer)
    @offer.user_id = current_user.id
    @offer.furniture_id = params[:furniture_id]
    @offer.save!
    redirect_to '/offers'
  end

  private

  def set_offer
    params.require(:offer).permit(:start_date, :end_date, :furniture_id)
  end

  def find_furniture
    @furniture = Furniture.find(params[:furniture_id])
  end
end
