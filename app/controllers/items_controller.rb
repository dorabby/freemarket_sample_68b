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
    @category_parent_array = ["--"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
    @item.images.new
    @item.build_brand
  end

    # 親カテゴリーが選択された後に動くアクション
    def get_category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
   end
  
    # 子カテゴリーが選択された後に動くアクション
   def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    params.require(:item).permit(:name,:description,:price,:condition,:derivery_chage,:days,:prefecture_id,:category_id,brand_attributes: [:id, :name],images_attributes:[:id,:_destroy,:image]).merge(saler: current_user.id,buyer: nil)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  def move_to_root
    redirect_to action: :index unless user_signed_in?
  end

  
end
