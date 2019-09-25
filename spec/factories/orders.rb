FactoryBot.define do
  factory :order do
    doctor_id { 1 }
    patient_id { 1 }
    appointment_id { 1 }
    type { 1 }
    description { "MyText" }
  end
end
