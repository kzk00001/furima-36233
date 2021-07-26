class ItemsController < ApplicationController
  def index
    # @items = Item.all.order(created_at: 'DESC')
    # binding.pry
  end

  private

  def item_params
    # params.require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
