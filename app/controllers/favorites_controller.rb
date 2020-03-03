class FavoritesController < ApplicationController
  def index
    
  end

  def create
    favorite = current_user.favorites.build(item_id: params[:item_id])
    favorite.save
    redirect_to root_path
  end

  def destroy
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    redirect_to root_path
  end
end
