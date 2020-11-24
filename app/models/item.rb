class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :explanatory_text, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :shipping_day_id
    validates :price, format: {with: /\A[0-9]+\z/, message:"Full-width number characters"}
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipping_day_id
  end
  validates :prefecture_id, numericality: { other_than: 0 } 
  
  belongs_to :user
  has_one :order
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :shipping_day

end
