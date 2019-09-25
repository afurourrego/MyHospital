json.extract! order, :id, :doctor_id, :patient_id, :appointment_id, :type_order, :description, :created_at, :updated_at
json.url order_url(order, format: :json)
