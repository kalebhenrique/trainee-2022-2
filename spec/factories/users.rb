FactoryBot.define do
  factory :user do
    wallet { 1 }
    email {'listaaut@gmail'}
    password {123456}
      is_admin { true }
    trait :admin do
      is_admin { true }
    end
  end
end
