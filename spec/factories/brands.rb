FactoryBot.define do

  factory :brand do
    name                   { Faker::WorldCup.team }
  end

end
