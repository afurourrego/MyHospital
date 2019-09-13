json.extract! profile, :id, :identification_card, :email, :birthday, :eps, :full_name, :address, :city, :arl, :rh, :phone, :allergies, :disability, :notes, :created_at, :updated_at
json.url profile_url(profile, format: :json)
