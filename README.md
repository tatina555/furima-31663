# furimaのER図

## users テーブル

| Column              | Type   | Options              |
| ------------------- | ------ | -------------------- |
| nickname            | string | NOT NULL             |
| email               | string | foreign_key: true    |
| encrypted_password  | string | NOT NULL             |
| last_name           | string | NOT NULL             |
| first_name          | string | NOT NULL             |
| last_name_kana      | string | NOT NULL             |
| first_name_kana     | string | NOT NULL             |
| birthday            | date   | NOT NULL             |


### Association
- has_many :comments
- has_many :items
- has_many :credits


## comments テーブル
| Column    | Type       | Options             |
| --------- | ---------- | ------------------- |
| text      | text       | NOT NULL            |
| user      | references | foreign_key: true   |
| item      | references | foreign_key: true   |

### Association
- belongs_to :user
- belongs_to item


## items テーブル
| Column               | Type               | Options             |
| -------------------- | ------------------ | ------------------- |
| title                | string             | NOT NULL            |
| catch_copy           | text               | NOT NULL            |
| details_category_id  | integer            | NOT NULL            | 商品カテゴリー
| details_status_id    | integer            | NOT NULL            | 商品状態
| delivery_burden_id   | integer            | NOT NULL            | 送料負担
| delivery_source_id   | integer            | NOT NULL            | 発送元
| delivery_day_id      | integer            | NOT NULL            | 発送日数
| price                | integer            | NOT NULL            |
| user                 | references         | foreign_key: true   |

### Association
- belongs_to :user
- has_many :comments
- has_one :credit

## credit テーブル

| Column            | Type               | Options             |
| ----------------- | ------------------ | ------------------- |
| item              | references         | foreign_key: true   |
| user              | references         | foreign_key: true   |

### Association
belongs_to :user
belongs_to :item
has_one :street_address

## street_address テーブル

| Column            | Type               | Options            |
| ----------------- | ------------------ | ------------------ |
| postal_code       | string             | NOT NULL           |
| country_id        | integer            | NOT NULL           |
| city              | string             | NOT NULL           |
| address           | string             | NOT NULL           |
| building          | string             | ANY                |
| phone_number      | string             | NOT NULL           |
| credit            | references         | foreign_key: true  |

### Association
belongs_to :credit