FactoryBot.define do
  sequence :user_emails do |n|
    "email#{n}@gmail"
  end
  
  factory :user do
    wallet { 1 }
    email { generate(:user_emails) }
    password {123456}
      is_admin { true }
    trait :admin do
      is_admin { true }
    end
  end
end
