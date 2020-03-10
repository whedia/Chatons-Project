class CartsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update]
  def create
    @user = current_user
    user_cart = Cart.create(user: @user)
    flash[:notice] = "Cart created"
  end

  def update
    @user = current_user
  end

  def show
    @useritems = current_user.items
  end

end
