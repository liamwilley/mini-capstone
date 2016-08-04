class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

  TAX = 0.09

  def sale_message
    if price.to_i < 2
      "Discount Item!"
    else
      "On Sale"
    end
  end

  def tax
    price * TAX
  end

  def total_price
    price + tax
  end

end
