class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
    elsif user_signed_in?
      redirect_to action: :index
    else
      redirect_to user_session_path
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def item_params
    params.require(:item).permit(:name, :explanatory_text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
