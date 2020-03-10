class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @items = Item.all
    @item = Item.find_by(id: params[:id])
  end

end
