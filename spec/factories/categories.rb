FactoryBot.define do
  sequence :category_names do |n|
    "Category #{n}"
  end
  
  factory :category do
    name { generate(:category_names) }
  end
end
