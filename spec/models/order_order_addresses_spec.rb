require 'rails_helper'

RSpec.describe OrderOrderAddress, type: :model do
  before do
    @order_order_address = FactoryBot.build(:order_order_address)
  end
  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it 'token,postal_code,prefecture_id,municipalities,address,phone_number,user_id,item_idが存在すれば購入できる' do
        expect(@order_order_address).to be_valid
      end
      it '建物名が抜けていても購入できる' do
        @order_order_address.building_name = nil
        expect(@order_order_address).to be_valid
      end
    end
    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと登録できない' do
        @order_order_address.token = nil
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと登録できない' do
        @order_order_address.postal_code = nil
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeがに - が含まれていないと登録できない' do
        @order_order_address.postal_code = 1_234_567
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが半角数字以外では登録できない' do
        @order_order_address.postal_code = '１２３４５６７'
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが1だと登録できない' do
        @order_order_address.prefecture_id = 1
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include('Prefecture Select')
      end
      it 'municipalitiesが空だと登録できない' do
        @order_order_address.municipalities = nil
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空だと登録できない' do
        @order_order_address.address = nil
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @order_order_address.phone_number = nil
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角英数字以外では登録できない' do
        @order_order_address.phone_number = '０９０１２３４１２３４'
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが11桁以内でないと登録できない' do
        @order_order_address.phone_number = 123_123_412_345
        @order_order_address.valid?
        expect(@order_order_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
