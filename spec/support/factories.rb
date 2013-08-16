FactoryGirl.define do
  
  factory :store do
    sequence(:name) { |n| "Store#{n}" }
    address "San Jose and other places..."
  end
  
  factory :article do
    sequence(:name) { |n| "Shoe#{n}" }
    description "nice shoe..."
    total_in_shelf 1
    total_in_vault 100
    association :store, :factory => :store
  end
  
end