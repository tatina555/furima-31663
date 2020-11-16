# furimaのER図

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | NOT NULL    |
| email               | string | NOT NULL    |
| encrypted_password  | string | NOT NULL    |
| last_name           | string | NOT NULL    |
| first_name          | string | NOT NULL    |
| last_name_kana      | string | NOT NULL    |
| first_name_kana     | string | NOT NULL    |
| birthday            | date   | NOT NULL    |


### Association
- has_many :comments
- has_many :items
- has_many :credit


## comments テーブル
| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | NOT NULL    |
| user_id   | references | key: true   |
| item_id   | references | key: true   |

### Association
- belongs_to :users
- belongs_to items


## items テーブル
| Column               | Type               | Options     |
| -------------------- | ------------------ | ----------- |
| title                | string             | NOT NULL    |
| catch_copy           | text               | NOT NULL    |
| details_category_id  | integer            | NOT NULL    | 商品カテゴリー
| details_status_id    | integer            | NOT NULL    | 商品詳細
| delivery_burden_id   | integer            | NOT NULL    | 送料負担
| delivery_source_id   | integer            | NOT NULL    | 発送元
| delivery_day_id      | integer            | NOT NULL    | 発送日数
| price                | integer            | NOT NULL    |
| user_id              | references         | key: true   |

### Association
- belongs_to :users
- has_many :comments
- has_one :credit

## credit テーブル

| Column            | Type               | Options     |
| ----------------- | ------------------ | ----------- |
| items_id          | references         | key: true   |
| user_id           | references         | key: true   |

### Association
belongs_to :users
belongs_to :items
has_one :street_address

## street_address テーブル

| Column            | Type               | Options     |
| ----------------- | ------------------ | ----------- |
| postal_code       | string             | NOT NULL    |
| country_id        | integer            | NOT NULL    |
| city              | string             | NOT NULL    |
| address           | string             | NOT NULL    |
| building          | string             | ANY         |
| phone_number      | string             | NOT NULL    |
| credit_id         | references         | key: true   |

### Association
belongs_to :credit