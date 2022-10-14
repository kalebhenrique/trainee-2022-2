FactoryBot.define do
  factory :product do
    name { "MyString" }
    price { 1 }
    description { "MyString" }
    inventory { 1 }
    brand { nil }
    category { nil }
  end
end
