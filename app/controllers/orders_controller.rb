class OrdersController < ApplicationController
  before_action :item

  def item
    @item = Item.find(params[:item_id])
  end

  def index
    if user_signed_in? && current_user.id != @item.user_id
      @order_order_address = OrderOrderAddress.new
    elsif user_signed_in?
      redirect_to root_path
    else
      redirect_to user_session_path
    end
  end

  def create
    if user_signed_in? && current_user.id != @item.user_id
      @order_order_address = OrderOrderAddress.new(order_params)
      if @order_order_address.valid?
        pay_item
        @order_order_address.save
        redirect_to root_path
      else
        render :index
      end
    elsif user_signed_in?
      redirect_to root_path
    else
      redirect_to user_session_path
    end
  end

  private

  def order_params
    params.require(:order_order_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
