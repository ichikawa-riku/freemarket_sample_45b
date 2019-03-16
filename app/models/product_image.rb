class ProductImage < ApplicationRecord
  mount_uploader :image, ProductImagesUploader
  belongs_to :product, optional: true
end
