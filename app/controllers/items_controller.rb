class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def item_params
    params.require(:item).permit(:name, :explanatory_text, :category_id,:condition_id, :delivery_fee_id, :prefecture_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
