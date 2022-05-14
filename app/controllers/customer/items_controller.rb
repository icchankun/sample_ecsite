class Customer::ItemsController < ApplicationController
  def index
    if params[:id]
      @items = Item.where(genre_id: params[:id])
    else
      @items = Item.all
    end
    
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
