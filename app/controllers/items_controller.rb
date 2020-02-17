class ItemsController < ApplicationController
  def index
  end

  def show
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
    # パス後々変更予定
  end


  private
  def item_params
    params.require(:item).permit(:name,:seller,:buyer,:description,:condition,:size,:derivery_chage,:days,:prefecture,:price,:brand_id,:category_id).merge(saler: current_user.id,buyer: nil)
  end
end
