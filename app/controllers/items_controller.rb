class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @user =User.new
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
