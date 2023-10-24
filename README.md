## usersテーブル

| Column                | Type    | Options                  |
|-----------------------|---------|--------------------------|
| nickname              | string  | null: false              |
| email                 | string  | null: false unique: true |
| encrypted_password    | string  | null: false              |
| name                  | string  | null: false              |
| last_name             | string  | null: false              |
| name_in_katakana      | string  | null: false              n
| last_name_in_katakana | string  | null: false              |
| date_of_birth         | date    | null: false              |


### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column                     | Type       | Options                       |
|----------------------------|------------|-------------------------------|
| product_name               | string     | null: false                   |
| product_description        | text       | null: false                   |
| category_information_id    | integer    | null: false                   |
| item_condition_id          | integer    | null: false                   |
| shipping_responsibility_id | integer    | null: false                    |
| processing_time_id         | integer    | null: false                    |
| price                      | integer    | null: false                    |
| shipping_origin_id         | integer    | null: false                    |
| user                       | references |  null: false foreign_key: true |


### Association
- belongs_to :user
- has_one :order


## addressテーブル

| Column                  | Type    | Options            |
|-------------------------|---------|--------------------|
| postal_code             | string  | null: false        |
| shipping_origin_id      | integer | null: false        |
| city_ward_or_town       | string  | null: false        |
| street_address          | string  | null: false        |
| building_name           | string  |                    |
| phone_number            | string  | null: false        |
| order                 | references |  null: false foreign_key: true |


### Association
- belongs_to :order


## ordersテーブル

| Column                  | Type       | Options                       | 
|-------------------------|------------|-------------------------------|
| user                    | references | null: false foreign_key: true |
| item                    | references | null: false foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :address
