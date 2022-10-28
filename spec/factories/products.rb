FactoryBot.define do
  sequence :product_names do |n|
    "Product #{n}"
  end
  sequence :product_description do |n|
    "Product #{n}"
  end
  
  factory :product do
    name { generate(:product_names) }
    price_in_cents { 1 }
    description { generate(:product_description) }
    inventory { 1 }
    brand { association :brand }
    category { association :category }
  end
end
