
## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_Phonetic | string | null: false |
| last_name_Phonetic  | string | null: false |
| birthday            | date   | null: false |
| email               | string | null: false |
| password            | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases


## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | integer | null: false                    |
| explanation      | text    |                                |
| category         | integer | null: false                    |
| users_id         | integer | null: false, foreign_key: true |
| product_status   | integer | null: false                    |
| shipping_area    | integer | null: false                    |
| date_of_shipment | integer | null: false                    |
| delivery_fee     | integer | null: false                    |

### Association

- berongs_to :user
- has_many   :comments
- has_one    :purchase


## comments テーブル

| Column   | Type    | Options                        |
| -------- | ------- | ------------------------------ |
| text     | string  | null: false                    |
| users_id | integer | null: false, foreign_key: true |
| items_id | integer | null: false  foreign_key: true |

### Association

- berongs_to :user
- berongs_to :item


## purchases

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association

- berongs_to :user
- berongs_to :item
- has_one    :address


## addresses テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| postal_code   | string  | null: false                    |
| prefecture    | integer | null: false                    |
| city          | string  | null: false                    |
| house_number  | string  | null: false                    |
| building_name | string  |                                |
| purchase_id   | integer | null: false, foreign_key: true |
| phone_number  | string  | null: false                    |

### Association

- berongs_to :purchase