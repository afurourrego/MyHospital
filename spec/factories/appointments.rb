FactoryBot.define do
  factory :appointment do
    date { "2019-09-13 21:31:03" }
    creator_id { 1 }
    doctor_id { User.last.id }
    patient_id { Profile.first.id }
    diagnostic { "MyText" }
    assistance { false }
  end
end
