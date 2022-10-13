FactoryBot.define do
  factory :user do
    wallet { 1 }
    is_admin { false }
  end
end
