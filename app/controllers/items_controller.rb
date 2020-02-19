class ItemsController < ApplicationController
  # before_action :move_to_root, except: [:index]
  def index
  end

  def show
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.new
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
    params.require(:item).permit(:name,:description,:price,:brand,:condition,:derivery_chage,:days,:prefecture,:category,image_attributes:[:image]).merge(seller: current_user.id,buyer: nil)
  end


  def move_to_root
    redirect_to action: :index unless user_signed_in?
  end
end
