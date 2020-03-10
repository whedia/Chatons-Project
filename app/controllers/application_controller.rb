class ApplicationController < ActionController::Base
  def create_cart(user)
    if !user.cart
      user_cart = Cart.create(user: user)
      flash[:notice] = "Cart created"
      puts "#"*200
      puts "cart created"
    end
  end
end
