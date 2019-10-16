FactoryBot.define do
  factory :order do
    doctor_id { Appointment.first.doctor_id }
    patient_id { Appointment.first.patient_id }
    appointment_id { Appointment.first.id }
    type_order { 1 }
    description { "MyText" }
  end
end
