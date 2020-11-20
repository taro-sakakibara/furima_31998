# usersテーブル
| Colunmn            | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| nickname           | string          | null: false       |
| email              | string          | null: false       |
| encrypted_password | string          | null: false       |
| first_name_kanji   | string          | null: false       |
| family_name_kanji  | string          | null: false       |
| first_name_kana    | string          | null: false       |
| family_name_kana   | string          | null: false       |
| birthday           | date            | null: false       |

### Association
- has_many :items
- has_many :orders


# itemsテーブル
| Colunmn            | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| name               | string          | null: false       |
| explanatory_text   | text            | null: false       |
| category_id        | integer         | null: false       |
| condition_id       | integer         | null: false       |
| delivery_fee_id    | integer         | null: false       |
| order_source_id    | integer         | null: false       |
| shipping_days_id   | integer         | null: false       |
| price              | integer         | null: false       |
| user               | references      | foreign_key: true |

### Association
- belongs_to :user
- has_one :order



# order_addressesテーブル
| Colunmn            | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| postal_code        | string          | null: false       |
| prefecture_id      | integer         | null: false       |
| municipalities     | string          | null: false       |
| address            | string          | null: false       |
| building_name      | string          |                   |
| phone_number       | string          | null: false       |
| order              | references      | foreign_key: true |

### Association
- belongs_to :order


# ordersテーブル
| Colunmn            | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| user               | references      | foreign_key: true |
| item               | references      | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :order_address
