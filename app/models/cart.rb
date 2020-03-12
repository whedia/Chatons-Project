class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items
  has_many :items, through: :cart_items

  def addToCart(item)
    self.items.push(item)
  end

  def removeFromCart(item)
    
    # self.items.delete(item) 
    # self.items.where("items.id = ?", item.id).first.delete
    # user.cars.where("cars.id = ?", car.first.id).first.delete 
    self.cart_items.where(cart_id: self.id , item_id: item.id).first.delete
    # caruser.where("car_id = ? , user_id = ?", car.first.id, user.first.id).first.delete 

  end

  def clearCart
    self.items.delete_all
  end
 

  def returnTotalPrice
    total_price = 0
    self.items.each do |item|
       total_price += item.price
    end 
    return total_price
  end
end
