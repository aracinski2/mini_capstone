class Product < ApplicationRecord
  
  validates :name, :price, :description, presence: true
  validates :description , length: {in: 10..500}
  validates :price, numericality: {greater_than_or_equal_to: 0}
  # add if/ else condition to create/update action
  
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
