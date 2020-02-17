class ItemsController < ApplicationController
  def index
  end

  def show
    @items = Item.all
  end
end
