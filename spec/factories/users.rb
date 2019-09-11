FactoryBot.define do
  factory :user do
    name { 'Juan' }
    sequence(:email) { |n| "email#{n+1}@gmail.com" }
    password { '123456' }
    role { 'super_admin' }
    phone { 1234567890 }
  end
end
