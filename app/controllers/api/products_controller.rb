class Api::ProductsController < ApplicationController
  def one_product_action
    render 'one_product.json.jb'
  end
end
