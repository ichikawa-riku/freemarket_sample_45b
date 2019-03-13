FactoryBot.define do

  factory :area do
    prefecture                 { Faker::Address.city }
  end

end
