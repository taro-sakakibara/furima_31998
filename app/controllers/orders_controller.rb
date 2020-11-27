class OrdersController < ApplicationController
  def index
    @order = Order.new
  end
  def create
    binding.pry
    order = Order.create(order_params)
    Order_address.create(order_address_params(order))

    if order.valid?
      pay_item
      order.save
      return redirect_to root_path
    else
      render 'index'
  end
end

  private

  def order_params
    params.merge(token: params[:token])
  end

  def order_address(order)
    params.permit(:postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number).merge(order_id: order.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_15c43d9f7b9d937f2f9ad981"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order.item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
