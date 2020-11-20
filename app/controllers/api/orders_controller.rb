class Api::OrdersController < ApplicationController
  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: @product = Product.find_by(id: params[:product_id]).price,
      tax: @product = Product.find_by(id: params[:product_id]).tax,
      total: @product = Product.find_by(id: params[:product_id]).price + @product = Product.find_by(id: params[:product_id]).tax
    )
    # @order.save
    render 'show.json.jb'
  end
end
