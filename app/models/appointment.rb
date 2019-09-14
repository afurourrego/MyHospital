class Appointment < ApplicationRecord

  belongs_to :creator, class_name: 'User', optional: true
  belongs_to :doctor, class_name: 'User', optional: true
  belongs_to :patient, class_name: 'Profile', optional: true

  date_time_attribute :date

  def self.search(appointments, params)
    appointments = where('date >= ?', Date.parse(params['date']).beginning_of_day) unless params['date'].blank?
    appointments = appointments.where('date <= ?', Date.parse(params['date']).end_of_day) unless params['date'].blank?

    appointments = appointments.where(doctor_id: params['doctor_id']) unless params['doctor_id'].blank?
    appointments = appointments.where(patient_id: params['patient_id']) unless params['patient_id'].blank?

    appointments
  end

end
