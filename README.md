 *** DB設計 ***

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true|
|introduction|text|

## Association
has_many :likes
has_many :item_comments
has_many :purchases
has_many :items
has_one :user_details
has_one :addresses
has_one :credit_cards


## user_detailsテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|user_id|references|null: false, foreign_key: true|

## Association
belongs_to :user


## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|integer|null: false|
|area_id|references|null: false, foreign_key: true|
|city|string|null: false|
|address1|string|null: false|
|address2|string|
|user_id|references|null: false, foreign_key: true|

## Association
belongs_to :user
belongs_to :area


## aresテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|

## Association
has_many :addresses
has_many :items


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|payment_card_no|integer|null: false|
|expire_month|integer|null: false|
|expire_year|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|

## Association
belongs_to :user


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

## Association
belongs_to :user
belongs_to :item


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|area_id|references|null: false, foreign_key: true|
|condition_id|references|null: false, foreign_key: true|
|size_id|references|foreign_key: true|
|brand_id|references|foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|estimated_date_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

## Association
belongs_to :area
belongs_to :condition
belongs_to :size
belongs_to :brand
belongs_to :delivery_method
belongs_to :estimated_date
belongs_to :user
has_many :item_images
has_many :categories, through: :category_items
has_many :category_items


## items_imageテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

## Association
belongs_to :item


## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

## Association
has_many :items


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|list|string|null: false|

## Association
has_many :items


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|parent|references|null: false, foreign_key: true|

## Association
has_many :items, through: :category_items
has_many :category_items
belongs_to :parent_id, class_name: "Category"
has_many :childern, class_name: "Category", foreign_key: :parent_id


## category_itemsテーブル
|Column|Type|Options|
|------|----|-------|
|category_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

## Association
belongs_to :category
belongs_to :item


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Association
has_many :items


## delivery_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|way|string|null: false|

## Association
has_many :items


## estimated_datesテーブル
|Column|Type|Options|
|------|----|-------|
|day|string|null: false|

## Association
has_many :items


## item_commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

## Association
belongs_to :user
belongs_to :item


## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

## Association
belongs_to :user
belongs_to :item
