# furima

## アプリケーション概要
オンライン上でフリーマーケットを実現できるアプリケーションを作成しました。

## 開発状況
開発環境</br>
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code</br>
開発期間と平均作業時間</br>
開発期間：11/20~12/2(13日間)</br>
1日あたりの平均作業時間：7</br>
合計：91時間程度</br>

## 接続先情報
https://heroku.com/furima-31998</br>
ID/Pass</br>
ID: admin</br>
Pass: 2222</br>

## テスト用アカウント等
購入者用</br>
メールアドレス: furima@furima</br>
パスワード: 0914furima</br>
購入用カード情報</br>
番号：4242424242424242</br>
期限：12月/30年</br>
セキュリティコード：123</br>

出品者用</br>
メールアドレス名: jiro@jiro</br>
パスワード: jiro@jiro</br>

## 動作確認方法
WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
接続先およびログイン情報については、上記の通りです。
同時に複数の方がログインしている場合に、ログインできない可能性があります。
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
確認後、ログアウト処理をお願いします。

## データベース設計
### usersテーブル
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

#### Association
- has_many :items
- has_many :orders


### itemsテーブル
| Colunmn            | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| name               | string          | null: false       |
| explanatory_text   | text            | null: false       |
| category_id        | integer         | null: false       |
| condition_id       | integer         | null: false       |
| delivery_fee_id    | integer         | null: false       |
| prefecture_id      | integer         | null: false       |
| shipping_day_id    | integer         | null: false       |
| price              | integer         | null: false       |
| user               | references      | foreign_key: true |

#### Association
- belongs_to :user
- has_one :order



### order_addressesテーブル
| Colunmn            | Type            | Options           |
| ------------------ | --------------- | ----------------- |
| postal_code        | string          | null: false       |
| prefecture_id      | integer         | null: false       |
| municipalities     | string          | null: false       |
| address            | string          | null: false       |
| building_name      | string          |                   |
| phone_number       | string          | null: false       |
| order              | references      | foreign_key: true |

#### Association
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
