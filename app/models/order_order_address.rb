class OrderOrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :phone_number, :token, :user_id, :item_id
 
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    OrderAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id )

  end

end