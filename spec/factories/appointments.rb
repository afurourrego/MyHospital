FactoryBot.define do
  factory :appointment do
    date { "2019-09-13 21:31:03" }
    creator_id { 1 }
    doctor_id { 1 }
    patient_id { 1 }
    diagnostic { "MyText" }
    assistance { false }
  end
end
