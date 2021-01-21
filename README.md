![gif](https://i.gyazo.com/192196c3bdbf249e0c71875d1417af01.png)

# Watch World

## URL
https://watch-world-0730.herokuapp.com/

## Test Acount
email: test@test.com
password: test01

## できること

###　画像の投稿
右上のNew Shareから記事の投稿
![png](https://i.gyazo.com/ef34ebbf7e04e60988e278405d0bf97f.png)

### コメントの投稿
記事詳細画面から、下のコメントフォームでコメント
![png](https://i.gyazo.com/6eb9fd3e5036e81a7442f5a6649fd192.jpg)

### タグ別、カテゴリ別表示
![png](https://i.gyazo.com/b88747b1f3bca983b9c6856fea63c10e.jpg)

## Requirement
- macOS
- Ruby 
- Ruby on Rails 
- MySQL 
- Docker
- VScode (Visual Studio Code）

## Usage
記事の閲覧、投稿

## Features
- 記事の投稿
- 記事の閲覧
- コメント投稿
- タイトル、本文から記事の検索
- カテゴリ別、タグ別に記事の表示
- 記事お気に入り

## Licence
Free

# Table

## user

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| name               | string  |                           |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| prefecture_id      | integer |                           |
| birthday           | date    |                           |
| self_introduction  | text    |                           |
| avatar             |         |                           |
| admin              | boolean | default: false            |

### Association
- has_many :articles
- has_many :comments
- has_many :follow_users
- has_many :favorite_categories
- has_many :favorite_articles
- has_many :favorite_comments


## article

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| title  | string     | null: false       |
| text   | string     | null: false       |
| image  |            |                   |
| user   | references | foreign_key: true |

### Association
- has_many :comments
- has_many :article_categories
- has_many :article_tags
- belongs_to :user
- belongs_to :favorite_article


## comment

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user    | references | foreign_key: true |
| article | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :article
- belongs_to :favorite_comment

## tag

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| name   | string     | null: false, uniqueness: true |

### Association
- has_many :article_tags


## article_tag

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| article | references | foreign_key: true |

### Association
- belongs_to :article
- belongs_to :tag

## follow_user

| Column | Type       | Options                           |
| ------ | ---------- | --------------------------------- |
| user   | references | foreign_key: true                 |
| follow | references | foreign_key: { to_table: :users } |

### Association
- belongs_to :user


## favorite_article

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| article | references | foreign_key: true |

### Association
- has_many :articles
- belongs_to :user


## article_category

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| category_id | integer    | null: false       |
| article     | references | foreign_key: true |

### Association
- belongs_to :article
