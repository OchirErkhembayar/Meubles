class OrdersController < ApplicationController
  def create
    @furniture = Furniture.find(params[:furniture_id])
    @order = Order.create!(furniture: @furniture, furniture_sku: @furniture.name, amount: @funiture.price_cents, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @furniture.name,
        images: [@furniture.photo],
        amount: @furniture.price_cents,
        currency: 'eur',
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
  end
end
