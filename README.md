# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname| string |null: false|
|first-name| string |null: false|
|name| string |null: false|
|first-name-furigana| string |null: false|
|name-furigana| string |null: false|
|email|string|null: false|
|birthyear|integer|null: false|
|birthmonth|integer|null: false|
|birthday|integer|null: false|
|password|string|null: false|
|image|text|-------|
|uid|integer|-------|
|provider|integer|-------|

## Association
- has_many  :items,dependent: :destroy
- has_many  :comments
- has_many  :likes,dependent: :destroy
- has_one  :address
- has_one  :card




## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name| string |null: false|
|name|string|null: false|
|family_name-furigana|string|null: false|
|name-furigana|string|null: false|
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
|expiration-date-year|integer|null: false|
|expiration-date-manth|integer|null: false|
|user|references|null: false, foreign_key|

## Association
- belongs_to :user



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: { to_table: :users }|
|buyer_id|references|foreign_key: { to_table: :users }|
|name|string|null: false,index|
|description|string|null: false|
|condition|string|null: false|
|size|integer|null: false|
|derivery_chage|integer|null: false|
|days|integer|null: false|
|prefecture|string|null: false|
|price|integer|null: false|
|image|references|null: false|
|category|references|null: false|
|brand|references||

## Association
- has_many  :users
- has_many  :comments
- has_many  :likes,dependent: :destroy
- has_many  :images, dependent: :destroy
- belongs_to:brand
- belongs_to:category







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
|item|references|null: false, foreign_key|

## Association
- has_many :items



## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item|references|null: false, foreign_key|

## Association
- belong_to :item



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