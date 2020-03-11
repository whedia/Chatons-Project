class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :show]
  def create
    @user = current_user
    user_cart = Cart.create(user: @user)
    flash[:notice] = "Cart created"
  end

  def update
    isCurrentUserAuthorizedToBeHere(params[:id])
    @user = current_user
    @item = Item.find(params[:itemId])
    
      case params[:operation]
      when "add"
        current_user.cart.addToCart(@item)
        flash[:sucess] = "Le chaton a été ajouté au panier."
        redirect_to cart_path(@user.cart.id)
      when "remove"
        current_user.cart.removeFromCart(@item)
        flash[:sucess] = "Le chaton a été supprimé du panier."
        redirect_to cart_path(@user.cart.id)
      else
        flash[:error] = "L'opération n'existe pas."
        redirect_to root_path
      end
    
   
  end

  def show
    isCurrentUserAuthorizedToBeHere(params[:id])
    @user_cart = current_user.cart
    @useritems = current_user.cart.items
    @price = 0
  end

  private

  def isCurrentUserAuthorizedToBeHere(id)
    if current_user.cart.id != id.to_i
      flash[:alert] = "Vous ne pouvez pas accéder à ce panier car ce n'est pas le vôtre! petit malin ;) !"
      redirect_to root_path
    end
  end

end
