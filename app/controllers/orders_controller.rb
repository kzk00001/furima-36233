class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :item_data
  before_action :purchasable?

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def item_data
    @item = Item.find(params[:item_id])
  end

  def purchasable?
    redirect_to root_path if current_user.id == @item.user_id || PurchaseRecord.exists?(item_id: @item.id)
  end
end
