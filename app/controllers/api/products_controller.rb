class Api::ProductsController < ApplicationController
  
  def index
    # @products = Product.all
    p "current_user"
    p current_user
    
    search_term = params[:search]
    @products = Product.where("name ILIKE '%#{search_term}%'")
    if params[:sort] == "price"
      @products = Product.order("price #{params[:sort_order]}")
    else
      @products = Product.order("id asc")
    end

    # if params[:discount] == true
    #   @products = Product.where("price < 300.00")
    # end

    render 'index.json.jb'
  end

  def show
    the_id = params[:id]
    @product = Product.find_by(id: the_id)
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:input_name],
      price: params[:input_price],
      description: params[:input_description],
      image_url: params[:input_image_url]
    )
    @product.save
    
    render 'show.json.jb'
  end

  def update
    @product = Product.find_by(id: params[:id])
    # now to update product
    @product.name = params[:input_name]
    @product.price = params[:input_price]
    @product.description = params[:input_description]
    @product.image_url = params[:input_image_url]

    @product.save

    render 'show.json.jb'
  end

  def delete
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product DELETED"}
  end
end
