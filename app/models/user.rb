class User < ApplicationRecord
  has_many :products
  has_one :credit_cards
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  validates :nickname, length: { maximum: 20 }
  validates :password, length: { minimum: 6 },allow_nil: true
  validates :nickname, presence: true

  # omniauthのコールバック時に呼ばれるメソッド
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

end
