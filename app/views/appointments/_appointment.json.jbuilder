json.extract! appointment, :id, :date, :creator_id, :doctor_id, :patient_id, :diagnostic, :assistance, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
