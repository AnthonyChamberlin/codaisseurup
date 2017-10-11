FactoryGirl.define do
  factory :event do
    name                { Faker::Lorem.sentence(1) }
    description         { Faker::Lorem.sentence(40) }
    location            { Faker::Address.city }
    price               { Faker::Commerce.price }
    capacity            25
    includes_food       true
    includes_drink      true
    starts_at           DateTime.parse("10/11/2009 08:00")
    ends_at             DateTime.parse("10/11/2009 19:30")
    user                { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
  
end
