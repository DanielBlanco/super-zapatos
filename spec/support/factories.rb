FactoryGirl.define do
  
  factory :store do
    sequence(:name) { |n| "Store#{n}" }
    address "San Jose and other places..."
  end
  
  factory :article do
    sequence(:name) { |n| "Shoe#{n}" }
    description "nice shoe..."
    association :store, :factory => :store
  end
  
end