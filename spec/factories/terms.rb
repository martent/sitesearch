FactoryGirl.define do
  factory :term do
    sequence(:name) { |n| "Term-#{n}" }
  end
end
