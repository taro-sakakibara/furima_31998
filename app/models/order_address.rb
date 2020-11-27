class OrderAddress < ApplicationRecord
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id
    validates :municipalitiesformat: { with: /\A\d{11}\z/}
    validates :address
    validates :phone_number

    belongs_to :order
  end
end
