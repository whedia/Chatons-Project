class CartsController < ApplicationController
  # before_action :authenticate_user!, only: [:create, :update, :show]
  def create
    @user = current_user
    user_cart = Cart.create(user: @user)
    if session[:current_cart]
      guest_cart = Cart.find(session[:current_cart])
      guest_cart.items.each { |item| user_cart.items.push(item)}
      guest_cart.destroy
      session[:current_cart] = nil
    end
    flash[:notice] = "Votre compte a bien été créé. Vous êtes à présent connecté."
  end

  def update
    isCurrentUserAuthorizedToBeHere(params[:id])
    @user = current_user
    @item = Item.find(params[:itemId])
    
      case params[:operation]
      when "add"
        current_cart.addToCart(@item)
        flash[:sucess] = "Le chaton a été ajouté au panier."
        redirect_to cart_path(current_cart.id)
      when "remove"
        current_cart.removeFromCart(@item)
        flash[:sucess] = "Le chaton a été supprimé du panier."
        redirect_to cart_path(current_cart.id)
      else
        flash[:error] = "L'opération n'existe pas."
        redirect_to root_path
      end
    
   
  end

  def show
    isCurrentUserAuthorizedToBeHere(params[:id])
    @user_cart = current_cart
    @useritems = current_cart.items
    @price = 0
  end

  private

  def isCurrentUserAuthorizedToBeHere(id)
    # if current_cart.id != id.to_i
    #   flash[:alert] = "Vous ne pouvez pas accéder à ce panier car ce n'est pas le vôtre! petit malin ;) !"
    #   redirect_to root_path
    # end
  end

end
