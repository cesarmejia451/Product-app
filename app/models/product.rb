class Product < ActiveRecord::Base

  belongs_to :supplier
  has_many :images
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  
  has_many :carted_products
  has_many :orders, through: :carted_products


  def sale_message
    if price < 9
      "Discount Item!"
    else
      "On Sale"
    end
  end

  def tax 
    price * 0.09 
  end

  def total
    price + tax
  end

end
