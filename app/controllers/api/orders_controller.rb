class Api::OrdersController < ApplicationController
  before_action :authenticate_user 

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def create
    # product = Product.find_by(id: params[:product_id])
    # subtotal = product.price * params[:quantity].to_i
    # tax_value = 0.09
    # tax = subtotal * tax_value
    carted_products = current_user.carted_products.where(status: "carted")
    
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end
    tax_rate = 0.09
    tax = subtotal * tax_rate
    total = tax + subtotal


    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    ) 
    @order.save
    
    render 'show.json.jb'
  end
end
