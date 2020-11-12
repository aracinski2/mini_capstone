class Product < ApplicationRecord
  def tax
    price * 0.09
  end

  def is_discounted?
    # if price < 10
    #   return true
    # else
    #   return false
    # end
    price < 10
  end

  def total
    price + tax
  end
end
