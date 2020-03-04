# freemarket_sample_68b
* 誰でも簡単に売り買いが楽しめる機能を再現したフリーマーケットアプリ。ユーザー登録、商品出品、商品購入などの機能が再現されていますが、実際の取引はできません。

## 機能一覧
* Basic認証
* ユーザー新規登録
* ユーザーログイン・ログアウト機能
* マイページ表示
* ユーザー情報編集機能
* 商品出品・編集・削除機能
* クレジットカード登録・削除機能
* 商品購入機能
* 商品詳細表示
* コメント機能
* 出品中と売却済商品表示機能
* 商品検索機能

## 使用技術一覧
|種別|名称|
|----|----|
|開発言語|Ruby(ver 2.5.1)|
|フレームワーク|Ruby on Rails(ver 5.2.4.1)|
|マークアップ|HTML(Haml),CSS(Sass)|
|フロントエンド|JavaScript(jQuery)|
|DB|MySQL|
|本番環境|AWS EC2|
|画像アップロード|carrierwave, AWS S3|
|自動デプロイ|capistrano|
|ユーザー管理|devise|
|クレジットカード管理|PayJP|


# 以降DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname| string |null: false|
|first_name| string |null: false|
|name| string |null: false|
|first_name_furigana| string |null: false|
|name_furigana| string |null: false|
|email|string|null: false|
|birthday|integer|null: false|
|password|string|null: false|
|image|text|-------|

## Association
- has_many  :items,dependent: :destroy
- has_many  :comments,dependent: :destroy
- has_one  :address,dependent: :destroy
- has_one  :card,dependent: :destroy



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name| string |null: false|
|name|string|null: false|
|family_name_furigana|string|null: false|
|name_furigana|string|null: false|
|postalcode|string|null: false|
|prefecture|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building_name|string||
|tel|string|null: false|
|user|references|null: false, foreign_key|

## Association
- belongs_to :user



## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|

## Association
- belongs_to :user



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|saler|references|null: false, foreign_key: { to_table: :users }|
|buyer|references|foreign_key: { to_table: :users }|
|name|string|null: false,index|
|description|string|null: false|
|condition|string|null: false|
|derivery_chage|string|null: false|
|days|string|null: false|
|prefecture_id|integer|null: false|
|price|integer|null: false|
|category|references|null: false, foreign_key|
|brand|references|foreign_key|

## Association

- has_many  :comments,dependent: :destroy
- has_many  :likes,dependent: :destroy
- has_many  :images, dependent: :destroy
- belongs_to :users
- belongs_to :brand, dependent: :destroy
- belongs_to :category


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item|references|null: false,foreign_key|

## Association

- has_many  :items




## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|gem|


## Association
- has_many  :items




## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item|references|null: false, foreign_key|

## Association
- belongs_to :item


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null:false|
|item|references|null: false, foreign_key|
|user|references|null: false, foreign_key|

## Association
- belongs_to :user
- belongs_to :item
