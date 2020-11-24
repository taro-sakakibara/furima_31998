class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
     else
      render new_item_path
     end
  end

  def item_params
    params.require(:item).permit(:name, :explanatory_text, :category_id,:condition_id, :delivery_fee_id, :prefecture_id, :shipping_days_id, :price, :image).merge(user_id: current_user.id)
  end
end
