class Product < ApplicationRecord
  
  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  
  has_many :carted_products
  has_many :orders, through: :carted_products
  
  validates :name, :description, :price, presence: true
  validates :price, numericality: {greater_than: 0}


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
