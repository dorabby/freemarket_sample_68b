class AddressesController < ApplicationController

  def edit
    @user = current_user
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  protected

  def address_params
    params.require(:address).permit(:family_name, :name, :family_name_furigana, :name_furigana, :potalcode, :address, :prefectures,  :municipalities, :building_name, :tel )
  end
  
end
