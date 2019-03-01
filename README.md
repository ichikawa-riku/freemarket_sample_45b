*** DB設計 ***

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true|
|introduction|text|

## Association


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


## aresテーブル
|Column|Type|Options|
|------|----|-------|
|prefecture|string|null: false|

## Association



## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|payment_card_no|integer|null: false|
|expire_month|integer|null: false|
|expire_year|integer|null: false|
|security_code|integer|null: false|

## Association


## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

## Association


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|price|integer|null: false|
|condition_id|references|null: false, foreign_key: true|
|size_id|references|foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|area_id|references|null: false, foreign_key: true|
|estimated_date_id|references|null: false, foreign_key: true|
|shipping_charge_id|references|null: false, foreign_key: true|
|delivery_method_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

## Association


## items_imageテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image|string|null: false|

## Association


## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|status|string|null: false|

## Association


## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|list|string|null: false|

## Association


##categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|large_category|references|null: false, foreign_key: true|
|middle_category|references|null: false, foreign_key: true|
|small_category|references|null: false, foreign_key: true|

## Association



## large_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|sort_by|integer|

## Association



## middle_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|sort_by|integer|

## Association



## small_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|sort_by|integer|

## Association


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

## Association


## estimated_datesテーブル
|Column|Type|Options|
|------|----|-------|
|select|string|null: false|

## Association



## shipping_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|

## Association


## delivery_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|way|string|null: false|

## Association
