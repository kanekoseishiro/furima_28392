
## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchases
- has_one  :address


## items テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| item_name | string  | null: false |
| price     | integer | null: false |
| users_id  | integer | null: false |

### Association

- berongs_to :users
- has_many   :comments


## comments テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| text     | string  | null: false |
| users_id | integer | null: false |
| items_id | integer | null: false |

### Association

- berongs_to :users
- berongs_to :items


## purchases

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| users_id   | integer | null: false |
| address_id | integer | null: false |

### Association

- berongs_to :users
- berongs_to :address


## address テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| house_number  | string  | null: false |
| building_name | string  | null: false |
| users_id      | integer | null: false |

### Association

- berongs_to :users
- has_one    :purchases