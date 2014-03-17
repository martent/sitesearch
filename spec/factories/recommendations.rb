FactoryGirl.define do
  factory :recommendation do
    sequence(:name) { |n| "Recommendation-#{n}" }
    link 'http://rspec.info/'
  end
end
