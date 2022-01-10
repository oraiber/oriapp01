# テーブル設計

## users テーブル

| column             | Type   | options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

has_many :tweets
has_many :comments
has_many :likes

## tweets テーブル

| column   | type       | options                        |
| -------- | ---------- | ------------------------------ |
| text     | string     | null: false                    |
| user_id  | references | null: false, foreign_key: true |

belongs_to :user
has_many :comments
has_many :likes

## comments テーブル

| column   | type    | options                        |
| -------- | ------- | ------------------------------ |
| content  | text    |                                |
| tweet_id | integer | null: false, foreign_key: true |
| user_id  | integer | null: false, foreign_key: true |

belongs_to :user
belongs_to :tweet

## likes テーブル

| column   | type       | options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| tweet_id | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :tweet