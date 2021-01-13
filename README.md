# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル
|Column|Type|Option|
|------|----|------|
|nickname|string|null: false, unique: true, index:true|
|email|string|null: false, unique: true, default: ""|
|encrypted_password|string|null: false, default: ""|
|familyname|string|null: false|
|familyname_kana|string|null: false|
|firstname|string|null: false|
|firstname_kana|string|null: false|
|birthday|date|null: false|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|
### Association
- has_one :adress
- has_one :card, dependent: :destroy
- has_many :items
- has_many :buyers


## adressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|
|prefecture|integer|
|city|text|
|house_number|text|
|building|text|
|telephone|integer|
|user_id|integer|
### Association
belongs_to :user, optional: true


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false, index:true|
|size_id|integer|null: false|
|item_condition_id|integer|null: false|
|postage_payer_id|integer| null: false|
|postage_type_id|integer|null: false|
|prefecture_id|integer|null: false|
|estimated_shipping_date_id|integer|null: false|
|item_description|text|null: false|
|price|integer|null: false|
|brand_id|string|foreign_key: true|
|trading_status|string|
|user|references|
|category_id|string|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :brand, optional: true
- belongs_to :category, optional: true
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :size
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :estimated_shipping_date
- belongs_to_active_hash :postage_type
- has_one :buyer
- has_many :item_images, dependent: :destroy
- accepts_nested_attributes_for :item_images, allow_destroy: true


## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
### Association
- has_many :items


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|src|string|null: false|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to :item, optional: true


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items


## buyersテーブル
|Column|Type|Options|
|------|----|-------|
|item|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user, optional: true
- belongs_to :item, optional: true



<!-- ## profilesテーブル

|Column|Type|Option|
|------|----|------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|text|null: false|
|house_number|text|null: false|
|building|text|
|telephone|integer|

### Association
- belongs_to :user -->


<!-- ## paymentsテーブル

|Column|Type|Option|
|------|----|------|
|card_company|string|null:false|
|card_number|integer|null: false|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false| -->

<!-- ### Association
- belongs_to :user
- belongs_to :confirm -->


<!-- ### statusesテーブル

|Column|Type|Options|
|------|----|-------|
|item_status|string|null: false|

### Association

- belongs_to  :item -->


<!-- ### conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|item_condition|string|null: false|

### Association

- belongs_to  :item -->


<!-- ### postage_payersテーブル
|Column|Type|Options|
|------|----|-------|
|postage_payer|string|null :false|

### Association

- belongs_to  :item -->


<!-- ### commentsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|	
|user_id|references|null: false, foreign_key: true|	
|comment|text|blank　:true|	
|input_time|date|null: false|

### Association

- belongs_to : item
- belongs_to : user -->


<!-- ## goodsテーブル

|Column|Type|Option|
|------|----|------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item -->


<!-- ## confirmsテーブル

|Column|Type|Option|
|------|----|------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|payment_id|references|null: false, foreign_key: true|
|purchase_time|timestamp|null: false|

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :payment -->






