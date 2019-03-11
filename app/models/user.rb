class User < ApplicationRecord
  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  validates :nickname, length: { maximum: 20 }
  validates :password, length: { minimum: 6 },allow_nil: true
  validates :nickname, presence: true
end
