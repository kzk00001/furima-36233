class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: 'DESC')
    # binding.pry
  end
end