class Appointment < ApplicationRecord

  belongs_to :creator, class_name: 'User', optional: true
  belongs_to :doctor, class_name: 'User', optional: true
  belongs_to :patient, class_name: 'Profile', optional: true

  date_time_attribute :date

end
