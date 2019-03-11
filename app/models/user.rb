class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable
  validates :nickname, length: { maximum: 20 }
  validates :password, length: { minimum: 6 },allow_nil: true
  validates :nickname, presence: true
end
