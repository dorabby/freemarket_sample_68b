class PurchaseController < ApplicationController

  require 'payjp'

  def index
    @user = current_user
    @address = Address.find_by(user_id: current_user.id)
    @item = Item.find_by(id: params[:item_id])
    @images = Image.where(item_id: @item.id)
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      # redirect_to controller: "card", action: "pay"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
    
  end

  def pay
    @item = Item.find_by(id: params[:item_id])
    @card = Card.where(user_id: current_user.id).first
  
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => @card.customer_id,
    :currency => 'jpy',
  )

  @item_buyer= Item.find_by(id: params[:item_id])
  @item_buyer.update( buyer_id: current_user.id)
  redirect_to action: 'done'

  end

  def  done 
    @item_purchaser= Item.find_by(id: params[:item_id])
    @item_purchaser.update( buyer_id: current_user.id)
   end

end