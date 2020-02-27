class UsersController < ApplicationController
  def show
    @user = current_user
    @item = Item.where(saler_id: params[:id])
    @items = @item.includes(:images).order('created_at DESC')

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
end