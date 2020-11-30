FactoryBot.define do
  factory :order_order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-1234' }
    prefecture_id { 2 }
    municipalities { '苗葉市緑区' }
    address { '緑一色506番地' }
    building_name { '森ビル' }
    phone_number { 12_345_678_900 }
  end
end
