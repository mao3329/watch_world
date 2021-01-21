# name
Watch World
![gif](https://i.gyazo.com/9e64145c1eea34c4d38ccac671b8b1ea.gif)


## Overview
記事投稿アプリ

## Requirement
- macOS
- Ruby 2.6.5
- Ruby on Rails 6
- MySQL 0.4.4
- Docker 20.10.0

## Usage
記事の閲覧、投稿ができます

## Features
- 記事の投稿
- 記事の閲覧
- コメント投稿
- タイトル、本文から記事の検索
- カテゴリ別、タグ別に記事の表示
- 記事お気に入り

## Licence
Free

# テーブル設計

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
