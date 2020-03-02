class PurchaseController < ApplicationController
  before_action :set_item,only:[:index,:pay]
  before_action :set_card,only:[:index,:pay]

  require 'payjp'

  def index
    @address = Address.find_by(user_id: current_user.id)
    @images = @item.images
    if @card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
    
  end

  def pay
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

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_card
    @card = Card.find_by(user_id: current_user.id)
  end


end