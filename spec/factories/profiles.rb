FactoryBot.define do
  factory :profile do
    identification_card { "123456789" }
    email { "patient1@myhospital.com" }
    birthday { "2019-09-12" }
    full_name { "paciente uno" }
    address { "calle 123" }
    rh { 1 }
    phone { 1234567890 }
    allergies { "ninguna" }
    disability { "ninguna" }
    notes { "" }
  end
end
