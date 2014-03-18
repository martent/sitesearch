FactoryGirl.define do
  factory :recommendation do
    sequence(:name) { |n| "Recommendation-#{n}" }
    sequence(:link) { |n| "http://rspec.info/#{n}" }
  end
end
