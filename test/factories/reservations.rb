FactoryGirl.define do
  factory :reservation do
    name Faker::Name.name
    time { Time.now + 6.hours }
  end
end
