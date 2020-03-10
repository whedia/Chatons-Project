class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  def create
    @user = current_user
    user_cart = Cart.create(user: @user)
    flash[:notice] = "Cart created"
  end

  def update
    @user = current_user
    @item = Item.find(params[:itemId])

   current_user.cart.addToCart(@item)
   redirect_to cart_path(@user.cart.id)
  end

  def show
    @useritems = current_user.cart.items
    @price = 0
  end

end
