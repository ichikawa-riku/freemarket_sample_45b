class ProductImage < ApplicationRecord
  mount_uploader :image, ProductImagesUploader
  belongs_to :prodoct, optional: true
end
