class TransactionsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
  end

  private

  def transaction_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: transaction_params[:@item.price],
      card: transaction_params[:token],
      currency: 'jpy'
    )
  end
end
