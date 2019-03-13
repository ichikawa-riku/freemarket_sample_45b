FactoryBot.define do

  factory :product do
    name                   { Faker::Games::Pokemon.name }
    description            { Faker::Food.description }
    price                  { Faker::Number.within(1..9999999) }
    condition              { Faker::Number.within(0..5) }
    shipping_method        { Faker::Number.within(0..1) }
    shipping_burden        { Faker::Number.within(0..8) }
    estimated_date         { Faker::Number.within(0..2) }
  end

end
