class CreditCard < ApplicationRecord
  belongs_to :users
  validates :user_id, presence: true
end
