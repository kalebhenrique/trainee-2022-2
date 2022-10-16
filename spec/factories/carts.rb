FactoryBot.define do
  factory :cart do
    user { association :user }
    product { association :product }
  end
end
