class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def tax
    subtotal * 0.09
  end

end
