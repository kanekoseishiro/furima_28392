class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all
    # @item = Item.order("created_at DESC")
  end

  def new
    @user = User.new
    @item = Item.new
    # if user_signed_in?
    #   redirect_to "/items/new"
    # else
    #   redirect_to "/devise/registrations/new"
    # end
  end

  def create
    Item.create(item_params)
  end
  
  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category, :user_id, :product_status, :shipping_area, :date_of_shipment, :delivery_fee)
  end
end
