class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explanatory_text, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_days_id
    validates :price, format: {with: /\A[0-9]+\z/, message:"Full-width number characters"}
  end
  
  belongs_to :user
  has_one :order
  has_one_attached :image
end
