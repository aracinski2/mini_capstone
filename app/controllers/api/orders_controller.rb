class Api::OrdersController < ApplicationController
  before_action :authenticate_user 

  def index
    @orders = Order.all
    render 'index.json.jb'
  end

  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: @product = Product.find_by(id: params[:product_id]).price,
      tax: @product = Product.find_by(id: params[:product_id]).tax,
      total: @product = Product.find_by(id: params[:product_id]).price + @product = Product.find_by(id: params[:product_id]).tax
    )
    @order.save
    render 'show.json.jb'
  end
end
# make these above order method without model
# update index action for one users orders not all