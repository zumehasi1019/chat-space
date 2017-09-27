FactoryGirl.define do
  factory :group do
    name "test_group"
    created_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
    updated_at { Faker::Time.between(5.days.ago, 3.days.ago, :all) }
  end
end
