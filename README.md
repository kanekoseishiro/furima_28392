
## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
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

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| price            | integer | null: false |
| category         | integer | null: false |
| users_id         | integer | null: false |
| product_status   | integer | null: false |
| shipping_area    | integer | null: false |
| date_of_shipment | integer | null: false |

### Association

- berongs_to :user
- has_many   :comments


## comments テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| text     | string  | null: false |
| users_id | integer | null: false |
| items_id | integer | null: false |

### Association

- berongs_to :user
- berongs_to :item


## purchases

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| user_id   | integer | null: false |
| address_id | integer | null: false |

### Association

- berongs_to :user
- has_one    :address


## address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  |             |
| users_id      | integer | null: false |
| phone number  | integer | null: false |

### Association

- berongs_to :purchases