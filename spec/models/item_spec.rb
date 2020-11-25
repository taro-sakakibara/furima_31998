require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'image, name, explanatory_id, category_id, conditon_id, delivery_fee_id, prefecture_id, shipping_day_id, price が存在すれば出品できる'do
      expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'imageが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")

      end
      it 'explanatory_textが空だと出費できない' do
        @item.explanatory_text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanatory text can't be blank")

      end
      it 'category_idが空だと出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")

      end
      it 'condition_idが空だと出品できない' do
        @item.condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")

      end
      it 'delivery_fee_idが空だと出品できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")

      end
      it 'prefecture_idが空だと出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")

      end
      it 'shipping_day_idが空だと出品できない' do
        @item.shipping_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")

      end
      it 'priceが空だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")

      end
      it 'priceの範囲が、¥300未満だと出品できない' do
        @item.price = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceの範囲が、¥9,999,999より大きいと出品できない' do
        @item.price = "12345678"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'priceが半角数字以外では出品できない' do
        @item.price = 'sakakibara'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
        
      end
      it 'category_idの値が1だと保存できない' do
        @item.category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it 'condition_idの値が1だと保存できない' do
        @item.condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition Select")
      end
      it 'delivery_fee_idの値が1だと保存できない' do
        @item.delivery_fee_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it 'prefecture_idの値が1だと保存できない' do
        @item.prefecture_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it 'shipping_day_idの値が1だと保存できない' do
        @item.shipping_day_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day Select")
      end
    end
  end
end
