class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items
  has_many :items, through: :cart_items

  def addToCart(item)
    self.items.push(item)
  end

  def removeFromCart(item)
    self.items.delete(item) 
  end
end
