class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    # @items = Item.all.order(created_at: 'DESC')
    # binding.pry
  end

  def new
    @item=Item.new
  end

  def create
    @item=Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:product_name,:text,:price,:category_id,:condition_id,:shipping_method_id,:prefecture_id,:days_before_shipping_id).merge(user_id: current_user.id)
  end
end
