class Appointment < ApplicationRecord

  has_many :orders

  belongs_to :creator, class_name: 'User', optional: true
  belongs_to :doctor, class_name: 'User', optional: true
  belongs_to :patient, class_name: 'Profile', optional: true

  date_time_attribute :date

  validates :doctor, presence: true
  validates :patient, presence: true
  validates :date, presence: true

  validate :conflict_date

  def self.search(appointments, params)
    appointments = where('date >= ?', Date.parse(params['date']).beginning_of_day) unless params['date'].blank?
    appointments = appointments.where('date <= ?', Date.parse(params['date']).end_of_day) unless params['date'].blank?

    appointments = appointments.where(doctor_id: params['doctor_id']) unless params['doctor_id'].blank?
    appointments = appointments.where(patient_id: params['patient_id']) unless params['patient_id'].blank?

    appointments
  end

  def conflict_date
    return if date.blank?
    
    dates = Appointment.all.where('date >= ?', date.beginning_of_day)
    dates = dates.where('date <= ?', date.end_of_day)
    dates = dates.where(doctor_id: doctor_id)
    dates.each do |appointment|
      next if appointment.id == id
      if appointment.date.between?(date - 9.minutes, date + 9.minutes)
        errors.add(:date, "conflict date with appointment date at #{appointment.date.strftime("%b %-e, %Y %I:%M %p")}")
        return false
      end
    end
    true
  end

end
