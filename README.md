## usersテーブル

| Column           | Type    | Options                  |
|------------------|---------|--------------------------|
| name             | string  | null: false              |
| email            | string  | null: false unique: true |
| nickname         | string  | null: false              |
| password         | integer | null: false              |
| name in katakana | string  | null: false              |
| date of birth    | date    | null: false              |


### Association
- has_many :items
- has_many :shippings
- has_many :purchasses


## itemsテーブル

| Column                  | Type      | Options                       |
|-------------------------|-----------|-------------------------------|
| product name            | string    | null: false                   |
| product description     | text      | null: false                   |
| category information    | enum      | null: false                   |
| item condition          | enum      | null: false                   |
| shipping responsibility | enum      | null: false                   |
| processing time         | enum      | null: false                   |
| price                   | integer   | null: false                   |
| shipping origin         | enum      | null: false                   |
| user                    | references |  null: false foreign_key: true |

### Association
- belongs_to :users
- has_one shippings
- has_one purchasses


## shippingsテーブル

| Column                  | Type    | Options            |
|-------------------------|---------|--------------------|
| address                 | string  | null: false        |
| postal code             | integer | null: false        |
| prefecture              | string  | null: false        |
| city, ward, or town     | string  | null: false        |
| house number            | string  | null: false        |
| building name           | string  | null: false        |
| phone number            | integer | null: false        |
| user                    | references |  null: false foreign_key: true |
| item                    | references |  null: false foreign_key: true |


### Association
- belongs_to :users
- belongs_to :items
- has_one purchases


## purchasesテーブル

| Column                  | Type       | Options                       | 
|-------------------------|------------|-------------------------------|
| user                    | references | null: false foreign_key: true |
| item                    | references | null: false foreign_key: true |
| shipping                | references | null: false foreign_key: true |


### Association
- belongs_to :users
- belongs_to :items
- belongs_to :shippings
