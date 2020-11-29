class OrdersController < ApplicationController
  def index
    @order_order_address = OrderOrderAddress.new
  end

  def create
    @order_order_address = OrderOrderAddress.new(order_params)
    if @order_order_address.valid?
      pay_item
      @order_order_address.save
      redirect_to root_path
    else
      binding.pry
      render 'index'
  end
end

  private

  def order_params
    params.require(:order_order_address).permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_15c43d9f7b9d937f2f9ad981"
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
