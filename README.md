# アプリケーション名
BookHub（ブックハブ）

# アプリケーション概要
オフィス内にある本をアプリケーションに登録して本の貸し借りができる。

# URL
https://bookhub-bh9c.onrender.com

# テスト用アカウント
- Basic認証ID : admin
- Basic認証パスワード : 2222
- ログイン用メールアドレス : aaa@hoge.com
- ログイン用パスワード : a000000 

# 利用方法

## 本を登録し貸出返却をする
1. 社費で購入した本やオフィス内に置いてある本を登録する
2. 社員は登録されている本の貸出申請をして本を借りることができる

## 社員同士でコミュニケーション（追加実装予定）
1. 自身が読んだ本を登録しておすすめコメントを投稿する
2. 他者はおすすめコメントなどを参考に本を選択
3. コメント投稿機能から質問や感想などのコミュニケーションを取ることができる

# アプリケーションを作成した背景
オフィス内に散在する本が活用されていない状況を勿体無いと思ったことがきっかけ。
アプリケーションで管理すれば、備品としても管理しやすく、
かつ社員に貸し出すことで資料として活用することができると思ったため。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1Vmngigcma3A-DWuDpacijJWO6sQYdDQlLaKbuy0ALBk/edit?usp=sharing

# 実装予定の機能
現在、書籍の新規登録と貸出返却機能を実装中。
以下の機能を今後追加予定。
- コメント機能
- 貸出本ランキング
- 管理者機能

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


# 開発環境
Ruby / Ruby on Rails / MySQL / Github / Render / Visual Studio Code