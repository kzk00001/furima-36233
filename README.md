## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| first_name         | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthdate          | string | null: false               |

### Association
- has_many :items
- has_many :purchase_records



## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| text                 | text       | null: false                    |
| category             | string     | null: false                    |
| condition            | string     | null: false                    |
| shipping_method      | string     | null: false                    |
| ship-from_address    | string     | null: false                    |
| days_before_shipping | string     | null: false                    |
| price                | string     | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record



## purchase_records テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| shipping_address   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address



## shipping_addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| prefectures          | string     | null: false                    |
| municipalities       | string     | null: false                    |
| house_number         | string     | null: false                    |
| building_name        | string     | null: false                    |
| phone_number         | string     | null: false                    |
| purchase_record      | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase_record