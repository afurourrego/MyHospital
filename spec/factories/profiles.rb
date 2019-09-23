FactoryBot.define do
  factory :profile do
    identification_card { "MyString" }
    email { "MyString" }
    birthday { "2019-09-12" }
    eps { 1 }
    full_name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    arl { 1 }
    rh { 1 }
    phone { 1 }
    allergies { "MyText" }
    disability { "MyString" }
    notes { "MyText" }
  end
end
