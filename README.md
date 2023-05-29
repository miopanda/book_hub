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

## 本を登録する
1. トップページのヘッダーからユーザー新規登録を行う
2. 「本を登録する」ボタンから、登録する本をキーワードで検索する
3. 検索結果から該当の本を「選択」し「登録する」を押す
  （登録が完了するとトップページへ遷移し、登録した本は一覧に追加される）

## 本の貸出・返却をする
1. トップページの書籍一覧から本を選択する
2. 「貸出を申請する」から「貸出申請」ボタンをクリックして貸出を行う
3. 返却は、トップページ書籍一覧またはヘッダーのユーザーマイページ貸出履歴から書籍詳細ページへアクセスし、
   「返却する」から「返却」ボタンクリックで返却が完了する（返却完了でトップページへ遷移する）

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

[![Image from Gyazo](https://i.gyazo.com/2d748cb817285927087f9d6f1956cad9.png)](https://gyazo.com/2d748cb817285927087f9d6f1956cad9)

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
| book   | references | null: false, foreign_key: true |
| due_date   | date   | null: false |
| returned   | boolean   | null: false, default: false |

### Association

- belongs_to :user
- belongs_to :book


# 開発環境
Ruby / Ruby on Rails / MySQL / Github / Render / Visual Studio Code / Figma

# 工夫したポイント
・本の登録時、タイトル等の書籍情報は、Google Books APIから取得することで手入力せずに登録できるようにしました。
・貸出・返却は、boolean型（真偽値）で状態の判断ができるようにしました。