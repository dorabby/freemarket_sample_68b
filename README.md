# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null:false|
|name|string|null:false|
|family_name-furigana|string|null:false|
|name-furigana|string|null:false|
|email|string|null:false|
|password|string|null:false|
|birthday|integer|null:false|

## Association
- belongs_to :address
- belongs_to :card
- belongs_to :user_image
- has_many :items



## cardsテーブル
|card_number|integer|null:false|
|token|integer|null:false|
|expiration_date_year|integer|null:false|
|expiration_date_manth|integer|null:false|
|user_id|integer|null: false,foreign_key: true|

## Association
- belong_to :user



## itemsテーブル
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
|category_1_id|integer|null: false,foreign_key: true|
|brand_id|integer||

## Association
- belong_to :user
- belongs_to :brand
- has_many :categorys
- has_many :comments
- has_many :images






## categoryテーブル
|name|string|null:false|
|category_id|integer|null: false,foreign_key: true|
|ancestry|gem|

## Association
- belong_to : item
- has_ancestry




## brandテーブル
|name|string|null:false|

## Association
- belongs_to :item



## item_imagesテーブル
|image_url|text|null:false|

## Association
- belong_to :item



## user_imagesテーブル
|image_url|text|null:false|
|user_id|integer|null: false,foreign_key: true|

## Association
- belong_to :user



## addressesテーブル
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
|comment|string|null:false|

## Association
- belong_to :item



<!-- 追加？ -->
## snsテーブル
|uid|----|-------|
|provider|----|-------|
|------|----|-------|
## Association
