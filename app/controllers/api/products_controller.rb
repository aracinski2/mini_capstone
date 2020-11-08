class Api::ProductsController < ApplicationController
  
  def index
    render 'index.json.jb'
  end

end
