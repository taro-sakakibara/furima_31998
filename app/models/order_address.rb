class OrderAddress < ApplicationRecord
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{11}\z/}

    belongs_to :order
  end
end
