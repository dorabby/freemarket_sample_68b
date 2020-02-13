# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null:false|
|name|string|null:false|
|family_name-furigana|string|null:false|
|name-furigana|string|null:false|
|nickname|string|null:false|
|email|string|null:false|
|password|string|null:false|
|birthday|integer|null:false|

## Association
- belongs_to :address
- belongs_to :card
- belongs_to :user_image
- has_many :items



## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|null:false|
|token|integer|null:false|
|expiration_date_year|integer|null:false|
|expiration_date_manth|integer|null:false|
|user_id|integer|null: false,foreign_key: true|

## Association
- belong_to :user



## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|description|string|null:false|
|condition|string|null:false|
|derivery_charge|integer|null:false|
|price|integer|null:false|
|size|integer|null:false|
|days|integer|null:false|
|buyer_id|integer||
|saler_id|integer||
|user_id|integer|null: false,foreign_key: true|
|item_images_id|integer|null: false,foreign_key: true|
|category_id|integer|null: false,foreign_key: true|
|brand_id|integer||

## Association
- belong_to :user
- belongs_to :brand
- has_many :categorys
- has_many :comments
- has_many :images






## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|item_id|integer|null: false,foreign_key: true|
|ancestry|gem|

## Association
- belong_to : item
- has_ancestry




## brandテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|

## Association
- belongs_to :item



## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|text|null:false|

## Association
- belong_to :item



## user_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|text|null:false|
|user_id|integer|null: false,foreign_key: true|

## Association
- belong_to :user



## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null:false|
|name|string|null:false|
|family_name-furigana|string|null:false|
|name-furigana|string|null:false|
|postalcode|string|null:false|
|prefectures|string|null:false|
|municipalities|string|null:false|
|address|string|null:false|
|building_name|string|null:false|
|tel|integer||

## Association
- belong_to :user



## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null:false|

## Association
- belong_to :item


## snsテーブル
|Column|Type|Options|
|------|----|-------|
|uid|----|-------|
|provider|----|-------|
## Association
