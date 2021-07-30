class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :purchaser?

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number
    ).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def purchaser?
    redirect_to root_path unless current_user.id != Item.find(params[:item_id]).user_id
  end
end
