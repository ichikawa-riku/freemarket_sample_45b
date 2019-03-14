FactoryBot.define do

  factory :product_size do
    size            { Faker::Food.vegetables }
  end

end
