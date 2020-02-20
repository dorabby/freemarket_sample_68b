class ItemsController < ApplicationController
  before_action :move_to_root, except: [:index]
  before_action :set_item, except: [:index, :new, :create]
  def index
    @items = Item.includes(:images).order('created_at DESC')
  end

  def show
    @items = Item.all
  end

  def new
    @item = Item.new
    @parents = Category.all.order("id ASC").limit(13)
    @item.images.new
    @item.build_brand
  end


  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
    # パス後々変更予定
  end


  def edit

  end

  def update
    if @item.update(item_params)
      redirect_to root_path
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
    params.require(:item).permit(:name,:description,:price,:condition,:derivery_chage,:days,:prefecture_id,category_ids: [],brand_attributes: [:id, :name],images_attributes:[:id,:_destroy,:image]).merge(saler: current_user.id,buyer: nil)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def move_to_root
    redirect_to action: :index unless user_signed_in?
  end
end
