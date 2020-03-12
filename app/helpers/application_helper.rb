module ApplicationHelper
 
    def flash_class(level)
      case level
          when 'notice'
            "alert alert-primary"
          when 'success'
            "alert alert-success"
          when 'error'
            "alert alert-danger"
          when 'alert'
            "alert alert-danger"
          else
            "alert alert-info"
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
