class ItemsController < ApplicationController

  def index
    # @items = Item.all
    @items = Item.where(hidden: false).rank(:row_order).all
  end

end
