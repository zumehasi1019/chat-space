FactoryGirl.define do
  factory :user do
    email     Faker::Internet.email
    password  Faker::Internet.password(8)
    name      Faker::Name.name
    id        1
  end
end
