class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

  def returnTotalPrice
    total_price = 0
    self.items.each do |item|
       total_price += item.price
    end 
    return total_price
  end
end
