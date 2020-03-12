class ApplicationController < ActionController::Base
  def create_cart(user)
    if user
      if !user.cart
        user_cart = Cart.create(user: user)
        flash[:notice] = "Cart created"
        puts "#"*200
        puts "cart created"
        if session[:current_cart]
          guest_cart = Cart.find(session[:current_cart])
          guest_cart.items.each { |item| user_cart.items.push(item)}
          guest_cart.destroy
          session[:current_cart] = nil
        end
      end
    end
  end

  def current_cart
    if user_signed_in?
      @cart = current_user.cart
    else
      if session[:current_cart]
        @cart = Cart.find(session[:current_cart])
      else
        @cart = Cart.create
        session[:current_cart] = @cart.id
      end
      
    end
    return @cart
  end

  
end
