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

   current_user.cart.addToCart(@item)
   redirect_to cart_path(@user.cart.id)
  end

  def show
    isCurrentUserAuthorizedToBeHere(params[:id])
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
