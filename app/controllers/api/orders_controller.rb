class Api::OrdersController < ApplicationController
  before_action :authenticate_user 

  def index
    @orders = Order.all
    render 'index.json.jb'
  end

  def create
    product = Product.find_by(id: params[:product_id])
    subtotal = product.price * params[:quantity].to_i
    tax_value = 0.09
    tax = subtotal * tax_value
    
    
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: subtotal,
      tax: tax,
      total: subtotal + tax
    )
    @order.save
    render 'show.json.jb'
  end
end
# update index action for one users orders not all