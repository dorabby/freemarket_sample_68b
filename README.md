# DB設計

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
|uid|integer|-------|
|provider|integer|-------|

## Association
- has_many  :items,dependent: :destroy
- has_many  :comments,dependent: :destroy
- has_many  :likes,dependent: :destroy
- has_one  :address,dependent: :destroy
- has_one  :card,dependent: :destroy




## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name| string |null: false|
|name|string|null: false|
|family_name_furigana|string|null: false|
|name_furigana|string|null: false|
|postalcode|integer|null: false|
|prefecture|string|null: false|
|municipalities|string|null: false|
|address|string|null: false|
|building_name|string||
|tel|integer|null: false|
|user|references|null: false, foreign_key|

## Association
- belongs_to :user



## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null: false|
|token|integer|null: false|
|expiration_date_year|integer|null: false|
|expiration_date_manth|integer|null: false|
|user|references|null: false, foreign_key|

## Association
- belongs_to :user



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|seller|references|null: false, foreign_key: { to_table: :users }|
|buyer|references|foreign_key: { to_table: :users }|
|name|string|null: false,index|
|description|string|null: false|
|condition|string|null: false|
|derivery_chage|integer|null: false|
|days|integer|null: false|
|prefecture|string|null: false|
|price|integer|null: false|
|category|references|null: false, foreign_key|
|brand|references|foreign_key|

## Association

- has_many  :comments,dependent: :destroy
- has_many  :likes,dependent: :destroy
- has_many  :images, dependent: :destroy
- belongs_to :users
- belongs_to :brand
- belongs_to :category







## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|gem|


## Association
- has_many  :items




## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Association
- has_many :items



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


## likesテーブル
|item|references|null: false, foreign_key|
|user|references|null: false, foreign_key|

## Association¥
- belongs_to :user
- belongs_to :item