class ItemsController < ApplicationController
  before_action :move_to_user_session, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order("created_at DESC")
    # @purchase = @purchase.find(params[:id])
    # @purchase.update( purchase_id: current_user.id )
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

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    if @item.valid?
      redirect_to root_path
    else
      render :show
    end
  end

  # def show
  #   binding.pry
  # end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :category_id, :product_status_id, :shipping_area_id, :date_of_shipment_id, :delivery_fee_id, :image).merge(user_id: current_user.id)
  end
end
