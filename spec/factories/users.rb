FactoryBot.define do
  factory :user do
    wallet { 1 }
    is_admin { false }
    trait :admin do
      is_admin { true }
    end
  end
end
