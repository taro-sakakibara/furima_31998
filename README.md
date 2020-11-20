# userテーブル
| Colunmn            | Type            | Options           |
| ----------         | --------------- | ----------------- |
| nickname           | text            | null false        |
| email              | string          | null false        |
| password           | string          | null false        |
| first_name_kanji   | text            | null false        |
| family_name_kanji  | text            | null false        |
| first_name_kana    | text            | null false        |
| family_name_kana   | text            | null false        |
| birthday           | string          | null false        |

### Association
- has_many :items

# itemsテーブル
| Colunmn            | Type            | Options           |
| ----------         | --------------- | ----------------- |
| image              | ActiveStorage   |                   |
| name               | text            | null false        |
| explanatory_text   | text            | null false        |
| category           | text            | null false        |
| condition          | text            | null false        |
| delivery_fee       | text            | null false        |
| shipment_source    | text            | null false        |
| shipping_days      | text            | null false        |
| price              | string          | null false        |
| user_id            | references      |                   |
| customer_id        | references      |                   |

### Association
- belongs_to :user

# customersテーブル
| Colunmn            | Type            | Options           |
| ----------         | --------------- | ----------------- |
| card_number        | string          | null false        |
| expiration date    | string          | null false        |
| security_code      | string          | null false        |
| postal_code        | string          | null false        |
| prefectures        | text            | null false        |
| municipalities     | text            | null false        |
| address            | string          | null false        |
| building_name      | text            | null false        |
| phone_number       | string          | null false        |

### Association
- has_many :items