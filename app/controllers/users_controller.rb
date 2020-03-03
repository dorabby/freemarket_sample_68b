class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @item = Item.where(saler_id: params[:id])
    @items = @item.includes(:images).order('created_at DESC')
    @f_user = User.find(params[:id])
    @f_items = @user.items
    @favorite_items = @user.favorite_items
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    user = current_user
    redirect_to new_session_path(resource_name)
  end

  private

  def user_params
    params.require(:user).permit(:nick_name,:family_name,:name,:family_name_furigana,:name_furigana,:birthday,:email)
  end

  def item_params
    params.require(:items).permit(:id, :name, :saler_id, :buyer_id, :description, :condition, :derivery_charge, :days, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end