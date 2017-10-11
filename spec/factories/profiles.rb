FactoryGirl.define do
  factory :profile do
    first_name    { Faker::Internet.name }
    last_name     { Faker::Internet.name }
    bio           { Faker::Lorem.sentence }
  end
end
