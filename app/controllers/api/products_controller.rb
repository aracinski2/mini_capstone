class Api::ProductsController < ApplicationController
  def one_product_action
    @product = Product.first
    render 'one_product.json.jb'
  end
  
  def all
    render 'all_products.json.jb'
  end
end
