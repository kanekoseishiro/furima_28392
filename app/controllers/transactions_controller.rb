class TransactionsController < ApplicationController

  def index
    @transactions = Item.find(params[:format])
  end

  def create
  end
  
end
