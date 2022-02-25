class OrdersController < ApplicationController
  def create
    @furniture = Furniture.find(params[:@furniture_id])
    @offer = Offer.find_by(furniture_id: params[:@furniture_id])
    @order = Order.create!(furniture: @furniture, furnitures_sku: @furniture.name, amount: (@furniture.price_cents * ((@offer.end_date - @offer.start_date).to_i)), state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @furniture.name.capitalize,
        images: [@furniture.photo],
        amount: (@furniture.price_cents * ((@offer.end_date - @offer.start_date).to_i))*100,
        currency: 'gbp',
        quantity: 1
      }],
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    @order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

  def show
    @order = current_user.orders.find(params[:id])
    @furniture = @order.furniture
    furniture_id = @furniture.id
    @offer = Offer.find_by(furniture_id: furniture_id)
    @offer.paid = true
    @offer.save
    @offer.furniture.rented = true
    @offer.furniture.save
    redirect_to offers_path
  end
end
