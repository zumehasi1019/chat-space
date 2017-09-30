FactoryGirl.define do

  factory :message do
    detail                "aaaaa!"
    image                 "sample.jpg"
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }

    association :group
    association :user

  end
end
