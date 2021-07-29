class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :item_data, only: [:show, :edit, :update, :destroy]
  before_action :owner?, only: [:edit, :update]

  def index
    @items = Item.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :product_name, :text, :price, :category_id, :condition_id, :shipping_method_id, :prefecture_id,
                                 :days_before_shipping_id).merge(user_id: current_user.id)
  end

  def item_data
    @item = Item.find(params[:id])
  end

  def owner?
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end
