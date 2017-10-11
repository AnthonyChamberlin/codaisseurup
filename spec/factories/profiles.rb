FactoryGirl.define do
  factory :profile do
    first_name    { Faker::Internet.first_name }
    last_name     { Faker::Internet.last_name }
    bio           { Faker::Lorem.sentence }
  end
end
