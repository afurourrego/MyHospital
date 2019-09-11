FactoryBot.define do
  factory :user do
    name { 'Juan' }
    sequence(:email) { |n| "email#{n+1}@gmail.com" }
    password { '123456' }
    role { 'super_admin' }
    phone { 1234567890 }

    factory :administrator do
      name { 'Carlos' }
      role { 'administrator' }
    end

    factory :doctor do
      name { 'Pato' }
      role { 'doctor' }
    end
  end
end
