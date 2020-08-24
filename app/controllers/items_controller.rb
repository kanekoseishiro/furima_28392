class ItemsController < ApplicationController
  before_action :move_to_user_session, except: [:index, :show]

  def index
    @items = Item.all
    # @item = Item.order("created_ESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private

  def move_to_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category, :user_id, :product_status, :shipping_area, :date_of_shipment, :delivery_fee)
  end
end
