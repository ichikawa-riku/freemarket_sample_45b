class Product < ApplicationRecord

  belongs_to :user
  belongs_to :area
  belongs_to :product_size
  belongs_to :brand, optional: true
  accepts_nested_attributes_for :brand, reject_if: :reject_brand_blank
  has_many :product_images
  accepts_nested_attributes_for :product_images, limit: 10
  belongs_to :category

  enum condition:       {"新品、未使用": 0, "未使用に近い": 1, "目立った傷や汚れなし": 2, "やや傷や汚れあり": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5}

  enum shipping_method: {"送料込み(出品者負担)": 0, "着払い(購入者負担)": 1}

  enum shipping_burden: {"未定": 0, "らくらくメルカリ便": 1, "ゆうメール": 2, "レターパック": 3, "普通郵便(定形、定形外)": 4, "クロネコヤマト": 5, "ゆうパック": 6, "クリックポスト": 7, "ゆうパケット": 8}

  enum estimated_date: {"1~2日で発送": 0, "2~3日で発送": 1, "4~7日で発送": 2}

  validates :name, length: { maximum: 40 }, presence: true
  validates :description, length: { maximum: 1000 }, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999 }, presence: true
  validates :area_id, presence: true
  validates :condition, presence: true
  validates :product_size_id, presence: true
  validates :shipping_method, presence: true
  validates :shipping_burden, presence: true
  validates :estimated_date, presence: true
  validates :user_id, presence: true

  def reject_brand_blank(attributes)
    exists = Brand.find_by(name: attributes[:name])
    empty = attributes[:name].blank?
    exists || empty
  end

  def update_brand(brand_name)
    self.brand = Brand.find_by(name: brand_name) if Brand.find_by(name: brand_name)
  end

end
