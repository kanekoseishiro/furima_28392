class ItemsController < ApplicationController
  before_action :move_to_user_session, except: [:index, :show]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
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
    params.require(:item).permit(:name, :price, :explanation, :category_id, :product_status_id, :shipping_area_id, :date_of_shipment_id, :delivery_fee_id, :image).merge(user_id: current_user.id)
  end
end
