# furimaのER図

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | NOT NULL    |
| email            | string | NOT NULL    |
| password         | string | NOT NULL    |
| last_name        | string | NOT NULL    |
| first_name       | string | NOT NULL    |
| last_name_kana   | string | NOT NULL    |
| first_name_kana  | string | NOT NULL    |
| birthday         | string | NOT NULL    |


### Association
- has_many :comments
- has_many :items
- has_many :Purchases
- has_many :credit


## comments テーブル
| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | NOT NULL    |
| user-id   | references | key: true   |
| item_id   | references | key: true   |

### Association
- belongs_to :users
- belongs_to items


## items テーブル
| Column     | Type               | Options     |
| ---------- | ------------------ | ----------- |
| image      | ActiveStorageで実装 |             |
| title      | string             | NOT NULL    |
| catch_copy | text               | NOT NULL    |
| details    | string             | NOT NULL    |
| delivery   | string             | NOT NULL    |
| price      | string             | NOT NULL    |
| user_id    | references         | key: true   |

### Association
- belongs_to :users
- has_many :comments

## credit テーブル

| Column            | Type               | Options     |
| ----------------- | ------------------ | ----------- |
| Purchase date     | string             | NOT NULL    |
| items_id          | references         | key: true   |
| user_id           | references         | key: true   |

### Association
belongs_to :users
has_one :street_address

## street_address テーブル

| Column            | Type               | Options     |
| ----------------- | ------------------ | ----------- |
| postal code       | string             | NOT NULL    |
| prefectures       | string             | NOT NULL    |
| city              | string             | NOT NULL    |
| address           | string             | NOT NULL    |
| building          | string             | ANY         |
| phone number      | string             | NOT NULL    |
| credit_id         | references         | key: true   |

### Association
belongs_to :credit