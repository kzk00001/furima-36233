## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthdate          | date   | null: false               |

### Association
- has_many :items
- has_many :purchase_records



## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| product_name            | string     | null: false                    |
| text                    | text       | null: false                    |
| price                   | integer    | null: false                    |
| category_id             | integer    | null: false                    |
| condition_id            | integer    | null: false                    |
| shipping_method_id      | integer    | null: false                    |
| prefecture_id           | integer    | null: false                    |
| days_before_shipping_id | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record



## purchase_records テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address



## shipping_addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| prefecture_id        | integer    | null: false                    |
| municipality         | string     | null: false                    |
| house_number         | string     | null: false                    |
| building_name        | string     |                                |
| phone_number         | string     | null: false                    |
| purchase_record      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record