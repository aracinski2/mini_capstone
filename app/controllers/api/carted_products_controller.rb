class Api::CartedProductsController < ApplicationController
  
  def index
    @carted_products = current_user.carted_products.where(status: "carted")
    render 'index.json.jb'
  end
  
  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
      )
    render 'show.json.jb'
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(status: "removed")
    render json: {message: "this item has been removed"}
  end

end
