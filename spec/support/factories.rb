FactoryGirl.define do
  
  factory :store do
    sequence(:name) { |n| "Store#{n}" }
    address "San Jose and other places..."
  end
  
end