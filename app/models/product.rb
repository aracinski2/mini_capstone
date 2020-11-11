class Product < ApplicationRecord
  def tax
    price * 0.09
  end   
end
