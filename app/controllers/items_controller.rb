class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item, except: [:index, :new, :create]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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
  end

  def edit
    if @item.order.present? && user_signed_in?
      redirect_to action: :index
    elsif user_signed_in? && current_user.id == @item.user_id
    else
      redirect_to user_session_path
    end
  end

  def update
    if user_signed_in? && current_user.id == @item.user_id
      @item.update(item_params)
    elsif user_signed_in?
      redirect_to action: :index
    else
      redirect_to user_session_path
    end

    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
    @item.destroy
  end

  def item_params
    params.require(:item).permit(:name, :explanatory_text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end

private

def item
  @item = Item.find(params[:id])
end
