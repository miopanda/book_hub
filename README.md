# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| is_admin           | boolean | default: false |

### Association

- has_many :books
- has_many :loans
- has_many :borrowed_books, through: :loans, source: :book

## books テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| title  | string | null: false |
| publisher  | string |         |
| image_url  | string |         |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :loans
- has_many :borrowers, through: :loans, source: :user

## loans テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |
| due_date   | date   | null: false |
| returned   | boolean   | null: false, default: false |

### Association

- belongs_to :user
- belongs_to :book
